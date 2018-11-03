package handler;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
		String id=(String)request.getSession().getAttribute("id");
		
		// 2) Get productCode from Ajax data
		String productCode=request.getParameter("productCode");
		
		// 3) Make a map containing id and productCode
		Map<String, String> deleteReferences=new HashMap<String, String>();
		deleteReferences.put("id", id);
		deleteReferences.put("productCode", productCode);
		
		// 4) Delete the item and get the result
		int deleteResult=basketDao.deleteBasketItem(deleteReferences);
		
		// 5) If the result returns 1, the item is deleted from jk_basket
		if(deleteResult=='1') {
			String itemDeleted="true";
			
			// 6) Convert Java String to JSON and return
			String isItemDeleted=new Gson().toJson(itemDeleted);
			return isItemDeleted;
		} else {
			String itemDeleted="false";
			// 6) Convert Java String to JSON and return
			String isItemDeleted=new Gson().toJson(itemDeleted);
			return isItemDeleted;
		}
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
			reviewDto.setReviewContent( multi.getParameter( "content" ) );
			reviewDto.setReviewDate( new Timestamp( System.currentTimeMillis() ) );
			reviewDto.setId( (String)request.getSession().getAttribute("memid") );
			reviewDto.setProductCode( multi.getParameter( "productCode" ) );
			reviewDto.setRating( Double.parseDouble( multi.getParameter( "rating" ) ) );
			reviewDto.setReviewScoreSum( 0 );
		
			int result = boardDao.insert( reviewDto );

			request.setAttribute( "result", result );	
			
		return new ModelAndView( "user/pro/reviewWritePro" );
	}
	
	@RequestMapping( "/reviewModifyPro" )
	public String reviewModifyPro (HttpServletRequest request, HttpServletResponse response) {
		return "redirect:reviewContent.jk";
	}
	
	@RequestMapping( "/reviewDeletePro" )
	public ModelAndView reviewDeletePro (HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("reviewNo"));
		String pageNum = request.getParameter("pageNum");
		String id = (String)request.getSession().getAttribute("memid");
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
		return new ModelAndView( "user/pro/reviewDeletePro" );
	}
	
	
	// Order
	@RequestMapping("/orderInputPro")
	public ModelAndView orderInputPro(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("user/pro/orderInputPro");
	}
}
