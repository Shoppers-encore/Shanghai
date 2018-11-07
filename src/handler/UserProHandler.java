package handler;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
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
import etc.SendMail;
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

	
	//////////////////// User /////////////////////	
	/*Join Member*/
	@RequestMapping( "/userInputPro" )
	public ModelAndView userInputPro (HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		UserDataBean userDto = new UserDataBean();
		//inputData-id varchar2(NN), password varchar2(NN), name varchar2(NN), birthday date(NN), tel varchar2(NN), email varchar2(NN), gender number, 
		//userLevel=default 1(NN), height number(3,0), weight number(3,0), address varchar2(NN), addressDetail varchar2(NN), zipcode varchar2(NN)
		userDto.setId(request.getParameter("id"));
		userDto.setPassword(request.getParameter("password"));
		userDto.setName(request.getParameter("name"));
		userDto.setBirthday(request.getParameter("birthday"));
		userDto.setTel(request.getParameter("tel"));
		userDto.setEmail(request.getParameter("email"));	
		int gender = Integer.parseInt(request.getParameter("gender"));
		userDto.setGender(gender);
		int height = Integer.parseInt(request.getParameter("height"));
		userDto.setHeight(height);
		int weight = Integer.parseInt(request.getParameter("weight"));
		userDto.setWeight(weight);
		userDto.setZipcode(request.getParameter("zipcode"));
		userDto.setAddress(request.getParameter("address"));
		userDto.setAddressDetail(request.getParameter("addressDetail"));	
		
		//insertUser
		int result = userDao.insertUser(userDto);
		request.setAttribute("result", result);
		request.setAttribute("userDto", userDto);
		
		return new ModelAndView("user/pro/userInputPro");
	}

	//Ajax User-ConfirmId 
	@RequestMapping(value = "/confirmId.jk", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public Map<Object, Object> idCheck(@RequestBody String id) {
		id = id.split("=")[0];
		int countId = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();

		countId = userDao.check(id);
		map.put("countId", countId);

		return map;
	}
	
	// SMTP - Simple Mail Transfer Protocol
	@RequestMapping( "/userMailCheck" )
	public ModelAndView userMailCheck (HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");  
        String number = null; 										//Variable for authentication-key 
        try {														//Create authentication-key
           StringBuffer num = new StringBuffer();
           for(int i =0;i<6;i++) {
              num.append((int)(Math.random()*10));
           }
           number = num.toString();									//End-of-creation: set StringBuffer to String 
           Map<String, String> info = new HashMap<String,String>(); //parameter for SendMail.java
           info.put("sender", "hkk9331@gmail.com");
           info.put("receiver", email);
           info.put("subject", "Shanghai 쇼핑몰 가입인증 메일입니다.");
           info.put("content", "인증번호 : "+ "[" + number + "]");
           new SendMail().sendMail(info);
        } catch (IOException e) {
           e.printStackTrace();
        }
        request.setAttribute("num", number);						//set to confirm match authentication key			
		return new ModelAndView( "user/view/userMailCheck" );
	}	
	
	/*Log-in process*/	
	@RequestMapping( "/userLoginPro" )
	public ModelAndView userLoginPro ( HttpServletRequest request, HttpServletResponse response ) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		UserDataBean userDto = userDao.getUser(id);
		
		int result = userDao.check(id, password);
		request.setAttribute("result", result);
		request.setAttribute("id", id);
		if (result == 1) {	//bring userLevel to check member status in userLoginPro
			int userLevel = userDao.getUserLevel(id);
			request.setAttribute("userLevel", userLevel);
		}
		if (result != -1) {
			request.setAttribute("userDto", userDto);
		}
		return new ModelAndView("user/pro/userLoginPro");
	}

	
//	@RequestMapping( "/findId" )
//	public ModelAndView idFindProcess(HttpServletRequest request, HttpServletResponse response) {
//		return new ModelAndView("user/pro/findIdResult");
//	}
//	@RequestMapping( "/findPassword" )
//	public ModelAndView passwordFindProcess(HttpServletRequest request, HttpServletResponse response) {
//		return new ModelAndView("user/pro/findPasswordResult");
//	}
	
	@RequestMapping( "/userModifyPro" )
	public String userModifyPro (HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("id");
		UserDataBean user = new UserDataBean();
		user.setId(id);
		user.setPassword(request.getParameter("password"));
		user.setTel(request.getParameter("tel"));
		user.setEmail(request.getParameter("email"));
		user.setAddress(request.getParameter("address"));
		user.setAddressDetail(request.getParameter("addressDetail"));
		int height = 0;
		if(request.getParameter("height") !=null || !"".equals(request.getParameter("height"))) {
			height=Integer.parseInt(request.getParameter("height"));
		}
		user.setHeight(height);
		int weight = 0;
		if(request.getParameter("weight") != null || !"".equals(request.getParameter("weight"))) {
			weight = Integer.parseInt(request.getParameter("weight"));
		}
		user.setWeight(weight);
		userDao.modifyUser(user);
		return "redirect:userMyPage.jk";
	}
	@RequestMapping( "/userDeletePro" )
	public ModelAndView userDeletePro (HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("id");
		int result = userDao.deleteUser(id);
		if(result == 1) {
			request.getSession().setAttribute("id", null);
		}
		request.setAttribute("result", result);
		return new ModelAndView("user/pro/userDeletePro");
	}
	
	
	// Logout
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().setAttribute("id", null);
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
		int count = basketDao.getDupicateCheck(basket);
		int result = 0;
		if(count == 0) {
			result = basketDao.inputBasket(basket);
		}else {
			result = basketDao.increaseBasketItem(basket);
		}
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
		public ModelAndView reviewWritePro (HttpServletRequest request, HttpServletResponse response) throws IOException {
			try {
				request.setCharacterEncoding("utf-8");
			} catch ( UnsupportedEncodingException e ) {
				e.printStackTrace();
			}
			ReviewDataBean reviewDto = new ReviewDataBean();
			String path = request.getSession().getServletContext().getRealPath("/save");
			MultipartRequest multi = null;
			if(-1 < request.getContentType().indexOf("multipart/form-data")) 
		         multi = new MultipartRequest( request, path, 1024*1024*5, "UTF-8", new DefaultFileRenamePolicy() );
			String systemName=null;
			String[] photos = {null,null};
			int i = 0;
			Enumeration<?> e = multi.getFileNames();
			while(e.hasMoreElements()) {
				String inputName = (String) e.nextElement();
				systemName = multi.getFilesystemName(inputName);
				if( systemName != null ) {
					String sname = path+"\\"+systemName;
					RenderedOp op = JAI.create("fileload", sname);
					BufferedImage sbuffer = op.getAsBufferedImage();
					int SIZE = 3;
					int width = sbuffer.getWidth()/SIZE;
					int height = sbuffer.getHeight()/SIZE;
					BufferedImage tbuffer = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
					Graphics g = tbuffer.getGraphics();
					g.drawImage(sbuffer, 0, 0, width,height,null);
	
					photos[i] = systemName; 
					i++;
				}
			}
				reviewDto.setPhoto1( photos[0] );
				reviewDto.setPhoto2( photos[1] );

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
	public String reviewModifyPro (HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		ReviewDataBean reviewDto = new ReviewDataBean();
		
		//photos
		String path = request.getSession().getServletContext().getRealPath("/save");
		MultipartRequest multi = null;
		if(-1 < request.getContentType().indexOf("multipart/form-data")) 
	         multi = new MultipartRequest( request, path, 1024*1024*5, "UTF-8", new DefaultFileRenamePolicy() );
	
		String photo1 = multi.getParameter( "p1" );
		String photo2 = multi.getParameter( "p2" );
		String systemName=null;
		String[] photos = {photo1, photo2};
		int i = 0;
		Enumeration<?> e = multi.getFileNames();
		while(e.hasMoreElements()) {
			String inputName = (String) e.nextElement();
			systemName = multi.getFilesystemName(inputName);
			if( systemName != null ) {
				String sname = path+"\\"+systemName;
				RenderedOp op = JAI.create("fileload", sname);
				BufferedImage sbuffer = op.getAsBufferedImage();
				int SIZE = 3;
				int width = sbuffer.getWidth()/SIZE;
				int height = sbuffer.getHeight()/SIZE;
				BufferedImage tbuffer = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
				Graphics g = tbuffer.getGraphics();
				g.drawImage(sbuffer, 0, 0, width,height,null);
				
				if( photos[i] != systemName ) {
					photos[i] = systemName;
				} else {
					photos[i] ="";
				}
				i++;
			}
		}
			reviewDto.setPhoto1( photos[0] );
			reviewDto.setPhoto2( photos[1] );
		reviewDto.setReviewNo( Integer.parseInt( multi.getParameter( "reviewNo" ) ) );
		reviewDto.setTitle( multi.getParameter( "title" ) );
		reviewDto.setReviewContent( multi.getParameter( "reviewContent" ) );
		reviewDto.setId( (String)request.getSession().getAttribute("id"));
		reviewDto.setProductCode( multi.getParameter( "productCode" ) );
		reviewDto.setRating( Double.parseDouble( multi.getParameter( "rating" ) ) );
	
		String pageNum = multi.getParameter( "pageNum" );
		
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
		boardDao.deleteRvComment(num);
		boardDao.deleteReviewLikes(num);
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
		int count = basketDao.getDupicateCheck(basket);
		if(count == 0) {
			basketDao.inputBasket(basket);
		}else {
			basketDao.increaseBasketItem(basket);
		}
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
	//productDetail - productQuantity
	@RequestMapping(value="/howManyQuantity", method=RequestMethod.POST, produces="application/json")
	@ResponseBody
	public Map<Object, Object> howManyQuantity(HttpServletRequest request, HttpServletResponse response) {
		String productList = request.getParameter("productCode");
		Map<Object, Object> map = new HashMap<Object, Object>();
		int count = productDao.getProductQuantityCount(productList);
		map.put("count", count);
		if(count == 0) {
			return map;
		}else {
			int quantity = productDao.getProductQuantity(productList);
			map.put("quantity", quantity);
			return map;
		}
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
