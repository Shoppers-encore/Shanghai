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

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import databean.BasketDataBean;
import databean.ReviewDataBean;
import db.UserDao;
import db.BasketDao;
import db.BoardDao;
import db.OrderDao;
import db.ProductDao;
import db.ChatDao;
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
	
	//////////////////// User /////////////////////
	@RequestMapping( "/userInputPro" )
	public ModelAndView userInputPro (HttpServletRequest request, HttpServletResponse response) {
		UserDataBean userDto = new UserDataBean();
		//inputData-id(NN), password(NN), name(NN), birthday(NN), tel(NN), email(NN), gender, 
		//userLevel=default 1(NN), height(3,0), weight(3,0), address(NN), addressDetail(NN), zipcode(NN)
		userDto.setId(request.getParameter("id"));
		userDto.setPassword(request.getParameter("password"));
		userDto.setName(request.getParameter("name"));
		userDto.setEmail(request.getParameter("email"));
		int gender = Integer.parseInt(request.getParameter("gender"));
		userDto.setGender(gender);
		//birthday
		//
		
		//insertUser
		//int result = userDao.insertUser(userDto);
		
		
		return new ModelAndView("user/pro/userInputPro");
	}

	////////////////Ajax User-ConfirmId 
	@RequestMapping(value = "/idCheck.go", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public Map<Object, Object> idCheck(@RequestBody String id) {
		id = id.split("=")[0];
		int countId = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();

		countId = userDao.confirmId(id);
		map.put("countId", countId);

		return map;
	}
	////////////////
	
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
		System.out.println("  1  ");
		List<BasketDataBean> baskets = basketDao.getBasketList((String)request.getSession().getAttribute("id"));
		for(int i = 0 ; i<baskets.size(); i++) {
			baskets.get(i).setThumbnail(productDao.getThumbnail(baskets.get(i).getProductCode()));
		}
		request.setAttribute("count", baskets.size());
		return baskets;
	}
}
