package handler;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import databean.BasketDataBean;
import databean.ReviewDataBean;
import databean.UserDataBean;
import db.BasketDao;
import db.BoardDao;
import db.ProductDao;
import db.UserDao;

@Controller
public class UserFormHandler {
	@Resource
	private BoardDao boardDao;
	@Resource
	private BasketDao basketDao;
	@Resource
	private UserDao userDao;
	
	// User
	@RequestMapping("/userInputForm")
	public ModelAndView userInputForm(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("user/form/userInputForm");
	}
	@RequestMapping("/userLoginForm")
	public ModelAndView userLoginForm(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("user/form/userLoginForm");
	}
	@RequestMapping( "/confirmId" )
	public ModelAndView confirmId (HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView ( "user/form/confirmId" );
	}
	@RequestMapping( "/userModifyForm" )
	public ModelAndView userModifyForm (HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("id");
		UserDataBean user = userDao.getUser(id);
		request.setAttribute("user", user);
		return new ModelAndView( "user/form/userModifyFrom" );
	}
	
	
	// Review
	@RequestMapping( "/reviewWriteForm" )
	public ModelAndView reviewWriteForm (HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id= (String)request.getSession().getAttribute("id");
		if(id==null) {
			return new UserViewHandler().main(request,response);
		}else if(id.length()<=5) {
			//admin?
		}else {
			String productCode = request.getParameter("chk");
			String productName = new ProductDao().getProductName(productCode);
			request.setAttribute("productName", productName);
			request.setAttribute("productCode", productCode);
		}
		int reviewNo = 0;	
		
		if( request.getParameter("reviewNo") != null ) {
			reviewNo = Integer.parseInt( request.getParameter("reviewNo") );
		}
		request.setAttribute( "reviewNo", reviewNo );
		return new ModelAndView( "user/form/reviewWriteForm" );
	}
	
	@RequestMapping( "/reviewModifyForm" )
	public ModelAndView reviewModifyForm (HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("id");
		int num = Integer.parseInt( request.getParameter( "reviewNo" ) );
		String pageNum = request.getParameter( "pageNum" );
		request.setAttribute("pageNum", pageNum);
		ReviewDataBean reviewDto = boardDao.get( num );
		if(reviewDto.getId().equals(id)) {
			request.setAttribute( "reviewDto", reviewDto );
			String productName = new ProductDao().getProductName(reviewDto.getProductCode());
			request.setAttribute("productName", productName);
			request.setAttribute("num",num);
			return new ModelAndView("user/form/reviewModifyForm");
		}else {
			//failed to load?
			return new ModelAndView("#");
		}
	}
	
	// Order
	@RequestMapping("/orderInputForm")
	public ModelAndView orderInputForm(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("id");
		
		 /*If this page is accessed from basketList, identifier=1; else identifier=null || identifier=""*/ 
		String identifier=request.getParameter("identifier");
		
		if(identifier.equals("1")) {
			List<BasketDataBean> basketList=basketDao.getBasketList(id);
			request.setAttribute("basketList", basketList);
			
		} else {
			if(request.getParameter("productCode")!=null || "".equals(request.getParameter("productCode"))) {
				String productCode = request.getParameter("productCode");
				int basketQuantity = Integer.parseInt(request.getParameter("quantity"));
				
				BasketDataBean basketItem=new BasketDataBean();
				
			}
		}
		return new ModelAndView("user/form/orderInputForm");
	}
}
