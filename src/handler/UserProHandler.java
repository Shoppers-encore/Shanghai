package handler;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.Enumeration;

import java.util.HashMap;
import java.util.Map;
import java.util.List;

import javax.annotation.Resource;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import databean.BasketDataBean;
import databean.ChatDataBean;
import databean.ReviewDataBean;
import db.UserDao;
import db.BasketDao;
import db.BoardDao;
import db.OrderDao;
import db.ProductDao;
import db.ChatDao;
import databean.CommentDataBean;
import db.TagDao;

import databean.UserDataBean;

@Controller
public class UserProHandler {
	@Resource
	private UserDao userDao;

	@Resource
	private BoardDao boardDao;
	
	@Resource
	private BasketDao basketDao;

	@Resource
	private ProductDao productDao;
	@Resource
	private ChatDao chatDao;

	// User 
	@RequestMapping( "/userInputPro" )
	public ModelAndView userInputPro (HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("user/pro/userInputPro");
	}
	@RequestMapping( "/userLoginPro" )
	public ModelAndView userLoginPro ( HttpServletRequest request, HttpServletResponse response ) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		UserDataBean userDto = userDao.getUser(id);
		
		int result = userDao.check(id, password);
		request.setAttribute("result", result);
		request.setAttribute("id", id);
		
		if (result != -1) {
			request.setAttribute("userDto", userDto);
		}
		return new ModelAndView("user/pro/userLoginPro");
	}
	@RequestMapping( "/userModifyPro" )
	public String userModifyPro (HttpServletRequest request, HttpServletResponse response) {
		return "redirect:userModifyView.jk";
	}
	@RequestMapping( "/userDeletePro" )
	public ModelAndView userDeletePro (HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("user/pro/userDeletePro");
	}
	
	
	// LogIn
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		return "redirect:main.jk";
	}
	
	
	// Basket
	@RequestMapping( "/basketInput" )
	public ModelAndView basketInput ( HttpServletRequest request, HttpServletResponse response ) {
		String id = (String)request.getSession().getAttribute("id");
		if(id == null) {
			return new ModelAndView("user/form/userLoginForm");
		}
		String productCode = request.getParameter("productCode");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		BasketDataBean basket = new BasketDataBean();
		basket.setId((String)request.getSession().getAttribute("id"));
		basket.setBasketQuantity(quantity);
		basket.setProductCode(productCode);
		int result = basketDao.inputBasket(basket);
		request.setAttribute("result", result);
		request.setAttribute("ref", request.getParameter("ref"));
		return new ModelAndView("user/pro/basketInput");
	}
	@RequestMapping( "/basketModify" )
	public ModelAndView basketModify ( HttpServletRequest request, HttpServletResponse response ) {
		return new ModelAndView( "user/pro/basketModify" );
	}
	
	@RequestMapping( "/basketDelete" )
	public ModelAndView basketDelete ( HttpServletRequest request, HttpServletResponse response ) {
		return new ModelAndView( "user/pro/basketDelete" );
	}
	
	@RequestMapping(value="/deleteBasketItemAjax", method=RequestMethod.GET)
	@ResponseBody
	public String deleteBasketItemAjax(HttpServletRequest request, HttpServletResponse response) {
		
		// 1) Get id from session
		/*String id=(String)request.getSession().getAttribute("id");*/
		// For now, id is directly set here
		String id="aaa";
		
		// 2) Get productCode from Ajax data
		String productCode=request.getParameter("productCode");
		
		// 3) Add id and productCode to BasketDataBean
		BasketDataBean deleteReferences=new BasketDataBean();
		deleteReferences.setId(id);
		deleteReferences.setProductCode(productCode);
		
		// 4) Delete the item and get the result
		int deleteResult=basketDao.deleteBasketItem(deleteReferences);
		
		// 5) If the result returns 1, the item is deleted from jk_basket
		String itemDeleted;
		if(deleteResult==1) {
			itemDeleted="true";
		} else {
			itemDeleted="false";
		}
		
		// 6) Convert Java String to JSON and return
		String isItemDeleted=new Gson().toJson(itemDeleted);
		return isItemDeleted;
	}
	
	// Review
	@RequestMapping( "/reviewWritePro" )
		public ModelAndView reviewWritePro (HttpServletRequest request, HttpServletResponse response) {
			try {
				request.setCharacterEncoding("utf-8");
			} catch ( UnsupportedEncodingException e ) {
				e.printStackTrace();
			}
			ReviewDataBean reviewDto = new ReviewDataBean();
			String path = request.getSession().getServletContext().getRealPath("/save");
			MultipartRequest multi = null;
			if(-1< request.getContentType().indexOf("multipart/form-data"))
				try {
					multi = new MultipartRequest(request, path, 1024*1024*5, "UTF-8", new DefaultFileRenamePolicy());
				} catch (IOException e1) {
					e1.printStackTrace();
				}
			//Need to change for 2images
			String systemName=null;
			Enumeration<?> e = multi.getFileNames();
			while(e.hasMoreElements()) {
				String inputName = (String) e.nextElement();
				systemName = multi.getFilesystemName(inputName);
				String sname = path+"\\"+systemName;
				RenderedOp op = JAI.create("fileload", sname);
				BufferedImage sbuffer = op.getAsBufferedImage();
				int SIZE = 3;
				int width = sbuffer.getWidth()/SIZE;
				int height = sbuffer.getHeight()/SIZE;
				BufferedImage tbuffer = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
				Graphics g = tbuffer.getGraphics();
				g.drawImage(sbuffer, 0, 0, width,height,null);

				reviewDto.setPhoto1( systemName );
			}
			
			int count = boardDao.getReviewCount();
			int reviewNo = 1;
			if(count >0) {
				reviewNo = boardDao.getMaxReview()+1;
			}
			reviewDto.setReviewNo( reviewNo );
			reviewDto.setTitle( multi.getParameter( "title" ) );
			reviewDto.setReviewContent( multi.getParameter( "reviewContent" ) );
			reviewDto.setReviewDate( new Timestamp( System.currentTimeMillis() ) );
			reviewDto.setId( (String)request.getSession().getAttribute("id") );
			reviewDto.setProductCode( multi.getParameter( "productCode" ) );
			reviewDto.setRating( Double.parseDouble( multi.getParameter( "rating" ) ) );
			reviewDto.setReviewScoreSum( 0 );
		
			int result = boardDao.insert( reviewDto );
			request.setAttribute( "result", result );	
			
		return new ModelAndView( "user/pro/reviewWritePro" );
	}
	
	@RequestMapping( "/reviewModifyPro" )
	public String reviewModifyPro (HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		ReviewDataBean reviewDto = new ReviewDataBean();
		reviewDto.setReviewNo( Integer.parseInt( request.getParameter( "reviewNo" ) ) );
		reviewDto.setTitle( request.getParameter( "title" ) );
		reviewDto.setReviewContent( request.getParameter( "reviewContent" ) );
		reviewDto.setId( (String)request.getSession().getAttribute("id"));
		reviewDto.setProductCode( request.getParameter( "productCode" ) );
		reviewDto.setRating( Double.parseDouble( request.getParameter( "rating" ) ) );
		String pageNum = request.getParameter( "pageNum" );
		
		int result = boardDao.modify( reviewDto );
	
		request.setAttribute( "result", result );
		request.setAttribute( "pageNum", pageNum );
	
		return "redirect:reviewDetail.jk?reviewNo="+reviewDto.getReviewNo();
	}
	
	@RequestMapping( "/reviewDeletePro" )
	public ModelAndView reviewDeletePro (HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("reviewNo"));
		String pageNum = request.getParameter("pageNum");
		String id = (String)request.getSession().getAttribute("id");
		if(id != null ) {
			if(id.length()>5) {
				if(id.equals(boardDao.get(num).getId())) {
					int result = boardDao.delete( num );
					request.setAttribute( "result", result );
				
				}else {
					int result = 0;
					request.setAttribute("result", result);
				}
			}else {
				int result = boardDao.delete( num );
				request.setAttribute( "result", result );
			}
		}
		request.setAttribute( "pageNum", pageNum );
		return new ModelAndView( "user/pro/reviewDeletePro" );
	}
	
	// Review Comment
	@RequestMapping(value = "/commentInsert.jk", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public void commentInsertProcess(HttpServletRequest request, HttpSession session){
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String id = (String) session.getAttribute("id");
		String commentContent= request.getParameter("commentContent");
		CommentDataBean cmtDto = new CommentDataBean();
		if(commentContent != null) {
		cmtDto.setId(id);
		cmtDto.setReviewNo(Integer.parseInt(request.getParameter("reviewNo")));
		cmtDto.setCommentContent(commentContent);
		
		boardDao.insertComment(cmtDto);
		}
	}

	@RequestMapping(value = "/commentSelect.jk", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<CommentDataBean> commentSelectProcess(HttpServletRequest request, HttpServletResponse response){
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		List<CommentDataBean> comment = boardDao.getComment(reviewNo);

		request.setAttribute("comment", comment);
		return comment;
	}

	@RequestMapping(value = "/commentUpdate.jk", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	private void commentUpdateProcess(HttpServletRequest request, HttpServletResponse response){
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		CommentDataBean cmtDto = new CommentDataBean();
		cmtDto.setCommentNo(Integer.parseInt(request.getParameter("commentNo")));
		cmtDto.setCommentContent(request.getParameter("commentContent"));
		boardDao.updateComment(cmtDto);
	}

	@RequestMapping(value = "/commentDelete.jk", method = RequestMethod.POST)
	@ResponseBody
	private void commentDeleteProcess(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		boardDao.deleteComment(commentNo);
	}
	
	
	// Order
	@RequestMapping("/orderInputPro")
	public ModelAndView orderInputPro(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("user/pro/orderInputPro");
	}
	
	//Cart Ajax
	@RequestMapping("/cartInsert")
	@ResponseBody
	public void cartInsert(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("id");
		String productCode=request.getParameter("productCode");
		int quantity = Integer.parseInt(request.getParameter("var"));
		BasketDataBean basket = new BasketDataBean();
		basket.setId(id);
		basket.setProductCode(productCode);
		basket.setBasketQuantity(quantity);
		basketDao.inputBasket(basket);
	}
	
	@RequestMapping(value="/viewCart", produces="application/json", method=RequestMethod.POST)
	@ResponseBody
	public List<BasketDataBean> viewCart(HttpServletRequest request, HttpServletResponse response){
		List<BasketDataBean> baskets = basketDao.getBasketList((String)request.getSession().getAttribute("id"));
		for(int i = 0 ; i<baskets.size(); i++) {
			baskets.get(i).setThumbnail(productDao.getThumbnail(baskets.get(i).getProductCode()));
		}
		request.setAttribute("baskets", baskets);
		return baskets;
	}
	@RequestMapping("/cartDelete")
	@ResponseBody
	public void cartDelete(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("id");
		String productCode=request.getParameter("productCode");
		BasketDataBean basket = new BasketDataBean();
		basket.setId(id);
		basket.setProductCode(productCode);
		basketDao.deleteBasketItem(basket);
	}
	
	//chat ajax
	@RequestMapping("/userChatInput")
	@ResponseBody
	public void chatInput(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("id");
		String chatContent = request.getParameter("message");
		ChatDataBean chat = new ChatDataBean();
		chat.setSender(id);
		chat.setChatContent(chatContent);
		chat.setReceiver("admin");
		chatDao.chatInput(chat);
	}
}
