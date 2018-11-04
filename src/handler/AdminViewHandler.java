package handler;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import databean.OrderListDataBean;
import databean.ProductDataBean;
import databean.UserDataBean;
import db.OrderDao;
import db.ProductDao;
import db.UserDao;
import etc.HandlerHelper;



@Controller
public class AdminViewHandler {
	@Resource
	private UserDao userDao;

	@RequestMapping("/userList")
	public ModelAndView userList(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("adm/view/userList");
	}
	@RequestMapping("/admChatting")
	   public ModelAndView chatting(HttpServletRequest request, HttpServletResponse response) {
	      return new ModelAndView("adm/view/admChatting");
	}
	@RequestMapping("/admProductList")
	public ModelAndView admProductList( HttpServletRequest request, HttpServletResponse response ) {
		ProductDao productDao = new ProductDao();
		int count = productDao.getProdCount();
		Map<String,String> map = new HandlerHelper().makeCount(count, request);
		List <ProductDataBean> products = productDao.getProdList(map);
		request.setAttribute("products", products);
		request.setAttribute("count", count);
		return new ModelAndView("adm/view/admProductList");
	}
	@RequestMapping ( "/admProductDetail" )
	public ModelAndView productDetail ( HttpServletRequest request, HttpServletResponse response ) {
		return new ModelAndView ( "adm/view/admProductDetail" );
	}
	@RequestMapping ( "/admSearchProduct" )
	public ModelAndView searchProduct( HttpServletRequest request, HttpServletResponse response ) {
		return new ModelAndView ( "adm/view/admSearchProduct" );
	}
	
	@RequestMapping("/admMypage")
	public ModelAndView admMypage(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("adm/view/admMypage");
	}
	@RequestMapping("/admOrderDetail")
	public ModelAndView admOrderDetail(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("adm/view/admOrderDetail");
	}
	
	@RequestMapping("/admOrderList")
	public ModelAndView admOrderList(HttpServletRequest request, HttpServletResponse response) {
		OrderDao orderDao = new OrderDao();
		int count = orderDao.getOrderCount();
	
		String id=(String) request.getSession().getAttribute("memid");
				
		Map<String, String> map = new HandlerHelper().makeCount(count, request);
		List<OrderListDataBean> orders = orderDao.getOrderList(map);
		
		request.setAttribute("orders", orders);
		request.setAttribute("count", count);
		return new ModelAndView("adm/view/admOrderList");
	}	
	
	@RequestMapping("/admReviewDetail")
	public ModelAndView admReviewDetail(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("adm/view/admReviewDetail");
	}
	@RequestMapping("/admReviewList")
	public ModelAndView admReviewList(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("adm/view/admReviewList");
	}
	@RequestMapping("/tagList")
	public ModelAndView tagList(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("adm/view/tagList");
	}
}
