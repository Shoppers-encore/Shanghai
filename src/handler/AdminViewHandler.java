package handler;

import java.io.UnsupportedEncodingException;
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
		String id = (String)request.getSession().getAttribute("memid");
		int count = userDao.getUserListCount();
		Map<String, String> map = new HandlerHelper().makeCount(count, request);
		List<UserDataBean> members = userDao.getList(100, map);
		UserDataBean userDto = userDao.getUser(id);
		request.setAttribute("members", members);
		request.setAttribute("admin", userDto);

		return new ModelAndView("adm/view/userList");
	}
	@RequestMapping("/admChatView")
	   public ModelAndView admChatView(HttpServletRequest request, HttpServletResponse response) {
	      return new ModelAndView("adm/view/admChatView");
	}
	
	@RequestMapping("/admProductView")
	public ModelAndView admProductView(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding( "utf-8" );
			} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			}
		
			/*int count = 0;
			String searchWord = request.getParameter("searchWord");
			
			HandlerHelper hh = new HandlerHelper();
			
			if(searchWord != null || searchWord != "") {	
	
			count = productDao.getSearchCount(searchWord);	
			System.out.println(count);
			/*if( count == 0 ) {							
			request.setAttribute("searchWord", searchWord);
			request.setAttribute("count", count);
			return new ModelAndView("admGood/goodList");
			}*/
			/*hh = new HandlerHelper();
			Map<String, String> map = hh.makeCount(count, request);
			map.put("searchWord", searchWord);
			System.out.println("검색결과 개수 : " + count);
			request.setAttribute("searchWord", searchWord);
			hh.getGoodImage(request, searchWord);	*/
			
		return new ModelAndView("adm/view/admProductView");
	}
	@RequestMapping ( "/admProductDetail" )
	public ModelAndView productDetail ( HttpServletRequest request, HttpServletResponse response ) {
		return new ModelAndView ( "adm/view/admProductDetail" );
	}
	@RequestMapping ( "/admProductList" )
	public ModelAndView admProductList( HttpServletRequest request, HttpServletResponse response ) {
		ProductDao productDao = new ProductDao();
		int count = productDao.getProdCount();
		System.out.println( count );
		Map<String,String> map = new HandlerHelper().makeCount(count, request);
		List <ProductDataBean> products = productDao.getProdList(map);
		request.setAttribute("products", products);
		request.setAttribute("count", count);
		
		return new ModelAndView("adm/view/admProductList");
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
		System.out.println( count );
	
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
