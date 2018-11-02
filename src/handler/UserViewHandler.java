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
		/*String id=(String)request.getSession().getAttribute("id");*/
		String id="aaa";
		System.out.println("MAV/basketList: "+id);
		List<BasketDataBean> basketList=basketDao.getBasketList(id);
		int basketCount=basketDao.getBasketCount(id);
		
		for(BasketDataBean product:basketList) {
			List<String> color;
			List<String> size;
			
			String productCode=product.getProductCode();
			if(productCode.substring(0,2).equals("XX")) {
				
			}
		}
		
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
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchWord", "");
		map.put("selectedColors", "");
		int count = productDao.getProductCount(map);
		map = new HandlerHelper().makeCount(count, request);
		map.put("searchWord", "");
		map.put("selectedColors", "");
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
		int ref = Integer.parseInt(request.getParameter("ref"));
		List<ProductDataBean> list =productDao.getProductDetail(ref);
		String[] colors = new HandlerHelper().whatColor(new HandlerHelper().decodeColorCode(list));
		String[] sizes = new HandlerHelper().whatSize(new HandlerHelper().decodeSizeCode(list));
		request.setAttribute("productList", list);
		request.setAttribute("colors", colors);
		request.setAttribute("sizes", sizes);
		return new ModelAndView("user/view/userProductDetail");
	}
	@RequestMapping("/userSearchProduct")
	public ModelAndView userSearchProduct(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String> map = new HashMap<String, String>();
		StringBuffer color = new StringBuffer();
		int count = 0;
		if(request.getParameterValues("color") != null || request.getParameter("searchWord")!=null) {
			map.put("searchWord", request.getParameter("searchWord"));
			String[] colors = request.getParameterValues("color");
			if(colors !=null) {
				for(int i = 0 ; i<colors.length ;i++) {
					color.append(colors[i]+" ");
				}
			}
			map.put("selectedColors", color.toString());
			count = productDao.getProductCount(map);
		}
		map = new HandlerHelper().makeCount(count, request);
		List<ProductDataBean> productList = null;
		if(request.getParameterValues("color") != null || request.getParameter("searchWord")!=null) {
			map.put("searchWord", request.getParameter("searchWord"));
			map.put("selectedColors",color.toString());
			productList = productDao.getProductList(map);
		}
		request.setAttribute("productCount", count);
		request.setAttribute("productList", productList);
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
