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

import databean.ImageInfoDataBean;
import databean.OrderListDataBean;
import databean.ProductDataBean;
import databean.ReviewDataBean;
import databean.TagDataBean;
import databean.UserDataBean;
import db.OrderDao;
import db.ProductDao;
import db.TagDao;
import db.UserDao;
import etc.HandlerHelper;



@Controller
public class AdminViewHandler {
	@Resource
	private UserDao userDao;
	@Resource
	private db.BoardDao boardDao;
	@Resource
	private ProductDao productDao;

	@RequestMapping("/userList")
	public ModelAndView userList(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("id");
		UserDataBean userDto = userDao.getUser(id);
		request.setAttribute( "id", id );
		request.setAttribute( "userDto", userDto );
		return new ModelAndView("adm/view/userList");
	}
	@RequestMapping("/admChatView")
	   public ModelAndView admChatView(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("id");
		UserDataBean userDto = userDao.getUser(id);
		request.setAttribute( "id", id );
		request.setAttribute( "userDto", userDto );
	      return new ModelAndView("adm/view/admChatView");
	}
	@RequestMapping("/admProductView")
	public ModelAndView admProductView( HttpServletRequest request, HttpServletResponse response ) {
		String id = (String)request.getSession().getAttribute("id");
		UserDataBean userDto = userDao.getUser(id);
		request.setAttribute( "id", id );
		request.setAttribute( "userDto", userDto );
		String category = request.getParameter("category");
		Map<String, String> map = new HashMap<String,String>();
		map.put("category",  category);
		int count = productDao.getProductNoSearchCount(map);
		map = new HandlerHelper().makeCount(count, request);
		map.put("category", category);
		List<ProductDataBean> productList = productDao.getNoSearchProductList(map);
		request.setAttribute("productCount", count);
		request.setAttribute("productList", productList);
		request.setAttribute("category", category);
		return new ModelAndView("adm/view/admProductView");
	}
	@RequestMapping("/admProductList")
	public ModelAndView admProductList( HttpServletRequest request, HttpServletResponse response ) {
		String id = (String)request.getSession().getAttribute("id");
		UserDataBean userDto = userDao.getUser(id);
		request.setAttribute( "id", id );
		request.setAttribute( "userDto", userDto );
		
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
		String id = (String)request.getSession().getAttribute("id");
		UserDataBean userDto = userDao.getUser(id);
		request.setAttribute( "id", id );
		request.setAttribute( "userDto", userDto );
		int ref = Integer.parseInt(request.getParameter("ref"));
		List<ProductDataBean> list =productDao.getProdDetail( ref );
		List<ImageInfoDataBean> imageList = productDao.getImgDetail( ref );
		String[] colors = new HandlerHelper().whatColor(new HandlerHelper().decodeColorCode(list));
		String[] sizes = new HandlerHelper().whatSize(new HandlerHelper().decodeSizeCode(list));
		//request.setAttribute("ref", ref);
		request.setAttribute("productList", list);
		request.setAttribute("imageList", imageList);
		request.setAttribute("colors", colors);
		request.setAttribute("sizes", sizes);
		return new ModelAndView ( "adm/view/admProductDetail" );
	}
	/*@RequestMapping ( "/admSearchProduct" )
	public ModelAndView searchProduct( HttpServletRequest request, HttpServletResponse response ) {
		return new ModelAndView ( "adm/view/admSearchProduct" );
	}*/
	
	/*@RequestMapping("/admMypage")
	public ModelAndView admMypage(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("id");
		UserDataBean userDto = userDao.getUser(id);
		request.setAttribute( "id", id );
		request.setAttribute( "userDto", userDto );
		return new ModelAndView("adm/view/admMypage");
	}*/
	@RequestMapping("/admOrderDetail")
	public ModelAndView admOrderDetail(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("id");
		UserDataBean userDto = userDao.getUser(id);
		request.setAttribute( "id", id );
		request.setAttribute( "userDto", userDto );
		return new ModelAndView("adm/view/admOrderDetail");
	}
	
	@RequestMapping("/admOrderList")
	public ModelAndView admOrderList(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("id");
		UserDataBean userDto = userDao.getUser(id);
		request.setAttribute( "id", id );
		request.setAttribute( "userDto", userDto );
		
		OrderDao orderDao = new OrderDao();
		int count = orderDao.getOrderCount();
				
		Map<String, String> map = new HandlerHelper().makeCount(count, request);
		List<OrderListDataBean> orders = orderDao.getOrderList(map);
		
		request.setAttribute("orders", orders);
		request.setAttribute("count", count);
		return new ModelAndView("adm/view/admOrderList");
	}	
	

	
	@RequestMapping("/admReviewDetail")
	public ModelAndView admReviewDetail(HttpServletRequest request, HttpServletResponse response) {
		/*String id = (String)request.getSession().getAttribute("id");
		UserDataBean userDto = userDao.getUser(id);
		request.setAttribute( "id", id );
		request.setAttribute( "userDto", userDto );*/
		
		int num = Integer.parseInt( request.getParameter( "reviewNo" ) );
		String pageNum = request.getParameter( "pageNum" );
		String number = request.getParameter( "number" );
		
		ReviewDataBean reviewDto = boardDao.get( num );
		reviewDto.setReviewScoreSum( boardDao.getReviewLikes(num) );
		String id = (String)request.getSession().getAttribute("id");
		if(id !=null) {
			Map<String, String> map = new HashMap<String,String>();
			map.put("reviewNo", new Integer(num).toString());
			map.put("id", id);
			int me = boardDao.getReviewLike(map);
			if(me>0) {
				reviewDto.setCheckedme( true );
			}
		}
		reviewDto.setProductName(new ProductDao().getProductName(reviewDto.getProductCode()));
		
		request.setAttribute( "number", number );
		request.setAttribute( "pageNum", pageNum );
		request.setAttribute( "reviewDto", reviewDto );
		return new ModelAndView("adm/view/admReviewDetail");
	}
	@RequestMapping("/admReviewList")
	public ModelAndView admReviewList(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("id");
		UserDataBean userDto = userDao.getUser(id);
		request.setAttribute( "id", id );
		request.setAttribute( "userDto", userDto );
		Map<String,String> search = new HashMap<String,String>();
		search.put("searchType", request.getParameter("searchType"));
		search.put("searchWord", request.getParameter("searchWord"));
		
		int count = boardDao.getReviewCount();
		
		if( count > 0 ) {
			Map<String, String> map = new HandlerHelper().makeCount( count, request );
			List <ReviewDataBean> articles = boardDao.getReviewList( map );
			request.setAttribute( "reviewLists", articles );
		}
		return new ModelAndView("adm/view/admReviewList");
	}
	@RequestMapping("/tagList")
	public ModelAndView tagList(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("id");
		UserDataBean userDto = userDao.getUser(id);
		request.setAttribute( "id", id );
		request.setAttribute( "userDto", userDto );
		TagDao tagDao = new TagDao();
		List <TagDataBean> tags = tagDao.getTags();
		request.setAttribute("tags", tags);
		return new ModelAndView("adm/view/tagList");
	}
}
