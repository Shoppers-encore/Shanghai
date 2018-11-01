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

import board.Review_Like_DataBean;
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
		int num = Integer.parseInt( request.getParameter( "review_no" ) );
		String pageNum = request.getParameter( "pageNum" );
		String number = request.getParameter( "number" );
		
		ReviewDataBean reviewDto = boardDao.get( num );
		reviewDto.setLikes(boardDao.getReviewLikes(num));
		String id=(String)request.getSession().getAttribute("memid");

		if(id !=null) {
			Map<String, String> map = new HashMap<String,String>();
			map.put("review_no", new Integer(num).toString());
			map.put("id", id);
			int me = boardDao.getReviewLike(map);
			if(me>0) {
				reviewDto.setMe(id);
			}
		}
		reviewDto.setGood_name(new ProductDao().getGoodName(reviewDto.getGood_code()));
		if(id == null || ! ((String)request.getSession().getAttribute( "memid" )).equals(reviewDto.getId() ) )
			boardDao.addCount(num);
		
		request.setAttribute( "number", number );
		request.setAttribute( "pageNum", pageNum );
		request.setAttribute( "reviewDto", reviewDto );
		
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
