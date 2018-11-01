package handler;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import databean.BasketDataBean;
import databean.ProductDataBean;
import db.BasketDao;
import databean.ReviewDataBean;
import db.BoardDao;
import db.ProductDao;
import etc.HandlerHelper;


@Controller
public class UserViewHandler {
	@Resource
	private ProductDao productDao;
	@Resource
	private BasketDao basketDao;
  @Resource
	private BoardDao boardDao;
  
	@RequestMapping( "/userMailCheck" )
	public ModelAndView userMailCheck (HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView( "user/view/userMailCheck" );
	}
	
	@RequestMapping( "/basketList" )
	public ModelAndView basketList ( HttpServletRequest request, HttpServletResponse response ) {
		String id=(String)request.getSession().getAttribute("id");
		System.out.println("MAV/basketList: "+id);
		List<BasketDataBean> basketList=basketDao.getBasketList(id);
		int basketCount=basketDao.getBasketCount(id);
		
		request.setAttribute("basketList", basketList);
		request.setAttribute("basketCount", basketCount);
		
		return new ModelAndView( "/user/view/basketList" );
	}
	
	@RequestMapping( "/reviewDetail" )
	public ModelAndView reviewDetail (HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView( "user/view/reviewDetail" );
	}
	@RequestMapping("/reviewList")
	public ModelAndView userReviewList(HttpServletRequest request, HttpServletResponse response) {
		int count = boardDao.getReviewCount();	

		if( count > 0 ) {
			Map<String, String> map = new HandlerHelper().makeCount( count, request );
			List <ReviewDataBean> articles = boardDao.getReviewList( map );
			request.setAttribute( "reviewLists", articles );
		}
		return new ModelAndView("user/view/reviewList");
	}
	@RequestMapping("/main")
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int count = productDao.getProductCount();
		Map<String, String> map = new HandlerHelper().makeCount(count, request);
		List<ProductDataBean> productList = productDao.getProductList(map);
		request.setAttribute("productList", productList);
		request.setAttribute("productCount", count);
		return new ModelAndView("user/view/userMain");
	}
	@RequestMapping ( "/userProductList" )
	public ModelAndView userProductList ( HttpServletRequest request, HttpServletResponse response ) {
		return new ModelAndView ( "user/userMain" );
	}
	
	@RequestMapping("/userProductDetail")
	public ModelAndView userProductDetail(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("user/view/userProductDetail");
	}
	@RequestMapping("/userSearchProduct")
	public ModelAndView userSearchProduct(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("user/view/userSearchProduct");
	}
	@RequestMapping("/userMypage")
	public ModelAndView userMypage(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("user/view/userMypage");
	}
	@RequestMapping("/userOrderDetail")
	public ModelAndView userOrderDetail(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("user/view/userOrderDetail");
	}
	@RequestMapping("/userOrderList")
	public ModelAndView userOrderList(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("user/view/userOrderList");
	}
}
