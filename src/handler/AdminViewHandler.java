package handler;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import databean.ChatDataBean;
import databean.ImageInfoDataBean;
import databean.OrderListDataBean;
import databean.ProductDataBean;
import databean.ReviewDataBean;
import databean.TagDataBean;
import databean.UserDataBean;
import db.BoardDao;
import db.ChatDao;
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
	private BoardDao boardDao;
	@Resource
	private ProductDao productDao;
	@Resource
	private ChatDao chatDao;

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
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch ( UnsupportedEncodingException e ) {
			e.printStackTrace();
		}
		
		String searchWord = request.getParameter("searchWord");
		HandlerHelper hh = new HandlerHelper();
		Map<String, String> map = new HashMap<String,String>();
		int count = 0;
		if(searchWord != null && searchWord != "") {	// IF there IS an input for searchWord
			map.put("searchWord", searchWord);
			count = productDao.getProductCount(map);
			if( count == 0 ) {
				request.setAttribute("searchWord", searchWord);
				request.setAttribute("count", count);
				return new ModelAndView("adm/view/admProductView");
			} else {		
				map = hh.makeCount(count, request);
				map.put("searchWord", searchWord);
				Map<String, String> cmap = hh.makeCount(count, request);
				cmap.put("searchWord", searchWord);
				List<ProductDataBean> productList = productDao.getProductList(cmap);
				request.setAttribute("searchWord", searchWord);
				request.setAttribute("productList", productList);
				return new ModelAndView("adm/view/admProductView");
			}
		} else {										// IF there is NO input for searchWord
			count = productDao.getProductNoSearchCount(map);
			map = hh.makeCount(count, request);
			List<ProductDataBean> productList = productDao.getNoSearchProductList(map);
			request.setAttribute("productCount", count);
			request.setAttribute("productList", productList);
			return new ModelAndView("adm/view/admProductView");
		}
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
	
	//chat ajax
	@RequestMapping("/admChatList")
	@ResponseBody
	public List<ChatDataBean> admChatList(HttpServletRequest request,HttpServletResponse response){
		int count = chatDao.getChatListCount();
		List<ChatDataBean> chatList = null;
		if(count > 0) {
			chatList = chatDao.getChatList();
			request.setAttribute("chatList", chatList);
		}
		return chatList;
	}

	@RequestMapping("/admChatting")
	public ModelAndView admChatting(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		return new ModelAndView("adm/view/admChatting");
	}
	
	@RequestMapping("/admChatInput")
	@ResponseBody
	public void admChatInput(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String chatContent = request.getParameter("chatContent");
		ChatDataBean chat = new ChatDataBean();
		chat.setSender("admin");
		chat.setReceiver(id);
		chat.setChatContent(chatContent);
		chatDao.chatInput(chat);
	}
	@RequestMapping("/admChat")
	@ResponseBody
	public List<ChatDataBean> admChat(HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		List<ChatDataBean> chatData = chatDao.getList(id);
		request.setAttribute("chatData", chatData);
		return chatData;
	}
}
