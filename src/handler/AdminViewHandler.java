package handler;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
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

import com.google.gson.Gson;

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
	@Resource
	private OrderDao orderDao;

   @RequestMapping("/admReviewList")
   public ModelAndView admReviewList(HttpServletRequest request, HttpServletResponse response) {
	   try {
	         request.setCharacterEncoding("utf-8");
	      } catch ( UnsupportedEncodingException e ) {
	         e.printStackTrace();
	      }
	  BoardDao boardDao = new BoardDao();
	  String id = (String)request.getSession().getAttribute("id");
		if(id == null) return new AdminFormHandler().admLoginForm(request, response);
		UserDataBean userDto = userDao.getUser(id);
		if(userDto.getUserLevel() != 9) return new AdminFormHandler().admLoginForm(request, response);
      request.setAttribute( "id", id );
      request.setAttribute( "userDto", userDto );
      
      String searchWord = request.getParameter("searchWord");
      String searchType = request.getParameter("searchType");
      int count = 0;
      if( searchWord == "" || searchWord == null ) {
          // No query
    	  count = boardDao.getReviewCount();
          if( count > 0 ) {
             Map<String, String> map = new HandlerHelper().makeCount( count, request );
             List <ReviewDataBean> reviewList = boardDao.getRvList( map );
             request.setAttribute( "reviewList", reviewList );
          }
      } else {
    	  // Yes query
          Map<String,String> search = new HashMap<String,String>();
          search.put("searchType", searchType);
          search.put("searchWord", searchWord);
          count = boardDao.getReviewSearchCount(search);
          //System.out.println("getReviewSearchCount : " + count);

          Map<String, String> map = new HandlerHelper().makeCount(count, request);
          map.put("searchType", searchType);
          map.put("searchWord", searchWord);
		  List <ReviewDataBean> review = boardDao.getRvSearchList( map );
		  //request.setAttribute("searchType", searchType);
		  request.setAttribute("searchWord", searchWord);
		  request.setAttribute( "reviewList", review );
      }
      return new ModelAndView("adm/view/admReviewList");
   }
   
   @RequestMapping("/admReviewDetail")
	public ModelAndView admReviewDetail(HttpServletRequest request, HttpServletResponse response) {
		int reviewNo = Integer.parseInt( request.getParameter( "reviewNo" ) );
		String pageNum = request.getParameter( "pageNum" );
		// System.out.println(pageNum);
		String number = request.getParameter( "number" );
		String productCode = request.getParameter( "productCode" );
		ProductDao productDao = new ProductDao();
		String productName = productDao.getProdName( productCode );

			String id = (String)request.getSession().getAttribute("id");
			if(id == null) return new AdminFormHandler().admLoginForm(request, response);
			UserDataBean userDto = userDao.getUser(id);
			if(userDto.getUserLevel() != 9) return new AdminFormHandler().admLoginForm(request, response);
	      request.setAttribute( "id", id );
	      request.setAttribute( "userDto", userDto );
		
		ReviewDataBean reviewDto = boardDao.get( reviewNo );
		if(id !=null) {
			Map<String, String> map = new HashMap<String,String>();
			map.put("reviewNo", new Integer(reviewNo).toString());
			map.put("id", id);
		}
		request.setAttribute( "productName", productName );
		request.setAttribute( "number", number );
		request.setAttribute( "pageNum", pageNum );
		request.setAttribute( "reviewDto", reviewDto );
		return new ModelAndView("adm/view/admReviewDetail");
	}

	@RequestMapping("/tagList")
	public ModelAndView tagList(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("id");
		if(id == null) return new AdminFormHandler().admLoginForm(request, response);
		UserDataBean userDto = userDao.getUser(id);
		if(userDto.getUserLevel() != 9) return new AdminFormHandler().admLoginForm(request, response);
	   request.setAttribute( "id", id );
	   request.setAttribute( "userDto", userDto );
	   TagDao tagDao = new TagDao();
	   List <TagDataBean> tags = tagDao.getTags();
	   request.setAttribute("tags", tags);
	   return new ModelAndView("adm/view/tagList");
	}

	@RequestMapping("/userList")
	public ModelAndView userList(HttpServletRequest request, HttpServletResponse response) {		
		String id = (String)request.getSession().getAttribute("id");
		if(id == null) return new AdminFormHandler().admLoginForm(request, response);
		UserDataBean userDto = userDao.getUser(id);
		if(userDto.getUserLevel() != 9) return new AdminFormHandler().admLoginForm(request, response);
		int count = userDao.getUserListCount();
		Map<String, String> map = new HandlerHelper().makeCount(count, request);
		List<UserDataBean> members = userDao.getList(100, map);
		request.setAttribute("count", count);
		request.setAttribute("members", members);
		request.setAttribute("userDto", userDto);
		return new ModelAndView("adm/view/userList");
	}
	@RequestMapping("/admChatView")
	   public ModelAndView admChatView(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("id");
		if(id == null) return new AdminFormHandler().admLoginForm(request, response);
		UserDataBean userDto = userDao.getUser(id);
		if(userDto.getUserLevel() != 9) return new AdminFormHandler().admLoginForm(request, response);
		request.setAttribute( "id", id );
		request.setAttribute( "userDto", userDto );
	      return new ModelAndView("adm/view/admChatView");
	}
	@RequestMapping("/admProductView")
	public ModelAndView admProductView( HttpServletRequest request, HttpServletResponse response ) {
		String id = (String)request.getSession().getAttribute("id");
		if(id == null) return new AdminFormHandler().admLoginForm(request, response);
		UserDataBean userDto = userDao.getUser(id);
		if(userDto.getUserLevel() != 9) return new AdminFormHandler().admLoginForm(request, response);
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
			count = productDao.getSearchCount(searchWord);	
			if( count == 0 ) {
				request.setAttribute("searchWord", searchWord);
				request.setAttribute("count", count);
				return new ModelAndView("adm/view/admProductView");
			} else {		
				map = hh.makeCount(count, request);
				map.put("searchWord", searchWord);
				Map<String, String> cmap = hh.makeCount(count, request);
				cmap.put("searchWord", searchWord);
				List<ProductDataBean> productList = productDao.getNameSearch(cmap);		
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
			if(id == null) return new AdminFormHandler().admLoginForm(request, response);
			UserDataBean userDto = userDao.getUser(id);
			if(userDto.getUserLevel() != 9) return new AdminFormHandler().admLoginForm(request, response);
			request.setAttribute( "id", id );
			request.setAttribute( "userDto", userDto );
			   try {
			         request.setCharacterEncoding("utf-8");
			      } catch ( UnsupportedEncodingException e ) {
			         e.printStackTrace();
			      }
			String searchWord = request.getParameter("searchWord");
			if( "".equals(searchWord) || searchWord == null ) {
				// NO QUERY
				int count = productDao.getProdCount();
				Map<String,String> map = new HandlerHelper().makeCount(count, request);
				List <ProductDataBean> products = productDao.getProdList(map);
				request.setAttribute("products", products);
				request.setAttribute("count", count);
			} else {
				// YES QUERY
				int count = productDao.getProductDetailSearchCount(searchWord);
				// System.out.println(count);
				Map<String,String> map = new HandlerHelper().makeCount(count, request);
				map.put("searchWord", searchWord);
				List<ProductDataBean> products = productDao.getProductDetailSearchList(map);
				request.setAttribute("searchWord", searchWord);
				request.setAttribute("products", products);
				request.setAttribute("count", count);
			}
			return new ModelAndView("adm/view/admProductList");
		}
	
	@RequestMapping ( "/admProductDetail" )
	public ModelAndView productDetail ( HttpServletRequest request, HttpServletResponse response ) {
		String id = (String)request.getSession().getAttribute("id");
		if(id == null) return new AdminFormHandler().admLoginForm(request, response);
		UserDataBean userDto = userDao.getUser(id);
		if(userDto.getUserLevel() != 9) return new AdminFormHandler().admLoginForm(request, response);
		request.setAttribute( "id", id );
		request.setAttribute( "userDto", userDto );
		int ref = Integer.parseInt(request.getParameter("ref"));
		List<ProductDataBean> list =productDao.getProductDetail( ref );
		for(int i = 0 ; i<list.size();i++) {
			// System.out.println(list.get(i).getProductCode());
		}
		List<ImageInfoDataBean> imageList = productDao.getImgDetail( ref );
		String[] colors = new HandlerHelper().whatColor(new HandlerHelper().decodeColorCode(list));
		for(int i = 0 ; i<colors.length;i++){
			// System.out.println(colors[i]);
		}
		String[] sizes = new HandlerHelper().whatSize(new HandlerHelper().decodeSizeCode(list));
		request.setAttribute("productList", list);
		request.setAttribute("imageList", imageList);
		request.setAttribute("colors", colors);
		request.setAttribute("sizes", sizes);
		return new ModelAndView ( "adm/view/admProductDetail" );
	}
	@RequestMapping("/admOrderDetail")
	public ModelAndView admOrderDetail(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("id");
		if(id == null) return new AdminFormHandler().admLoginForm(request, response);
		UserDataBean userDto = userDao.getUser(id);
		if(userDto.getUserLevel() != 9) return new AdminFormHandler().admLoginForm(request, response);
		request.setAttribute( "id", id );
		request.setAttribute( "userDto", userDto );
		
		int orderCode=Integer.parseInt(request.getParameter("orderCode"));
		int count = orderDao.prodFromOrder(orderCode);
		List<OrderListDataBean> orderDetailList=orderDao.getOrderDetail(orderCode);
		new HandlerHelper().makeCount(count, request);
		List<OrderListDataBean> prods = orderDao.getOrderListByOrderCode(orderCode);
		/* Set Maps for OrderDate and OrderCount */
		Map<String, String> prodNameMap = new HashMap<String, String>();
		for (OrderListDataBean prod : prods) {
			String prodCode = String.valueOf(prod.getProductCode());
			String prodName = String.valueOf(productDao.getProductName(prodCode));
			prodNameMap.put(prodCode, prodName);
		}
		String prodNameJson = new Gson().toJson(prodNameMap);
		request.setAttribute("prodNames", prodNameJson);
		request.setAttribute("orderCode", orderCode);
		request.setAttribute("count", count);
		request.setAttribute("orderDetailList", orderDetailList);
		return new ModelAndView("adm/view/admOrderDetail");
	}
	
	@RequestMapping("/admOrderList")
	public ModelAndView admOrderList(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("id");
		if(id == null) return new AdminFormHandler().admLoginForm(request, response);
		UserDataBean userDto = userDao.getUser(id);
		if(userDto.getUserLevel() != 9) return new AdminFormHandler().admLoginForm(request, response);
		request.setAttribute( "id", id );
		request.setAttribute( "userDto", userDto );
		
		OrderDao orderDao = new OrderDao();
		int count = orderDao.getOrderCount();
		Map<String, String> map = new HandlerHelper().makeCount(count, request);
		List<OrderListDataBean> orders = orderDao.getOrderList(map);

		/* Set Maps for OrderSum */
		Map<String, String> orderSumMap = new HashMap<String, String>();
		for (OrderListDataBean order : orders) {
			String orderCode = String.valueOf(order.getOrderCode());
			String orderSum = String.valueOf(orderDao.getSumOfItemsOrdered(order.getOrderCode()));
			orderSumMap.put(orderCode, orderSum);
		
		}
		
		String orderSumJson = new Gson().toJson(orderSumMap);
		request.setAttribute("orderSum", orderSumJson);
		
		request.setAttribute("orders", orders);
		request.setAttribute("count", count);
		return new ModelAndView("adm/view/admOrderList");
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
//	   String userid = request.getParameter("id");			// 1211 JH tried...
//     request.setAttribute("userid", userid);
       return new ModelAndView("adm/view/admChatting");
   }
   
   @RequestMapping("/admChatInput")
   @ResponseBody
   public void admChatInput(HttpServletRequest request, HttpServletResponse response) {
      String id = request.getParameter("id");
      String chatContent = request.getParameter("chatContent");
      ChatDataBean chat = new ChatDataBean();
//      chat.setSender("admin");
//      chat.setReceiver(id);
      chat.setIsUser(0);
      chat.setId(id);
      chat.setChatContent(chatContent);
      chatDao.chatInput(chat);
   }
   @RequestMapping("/admChat")
   @ResponseBody
   public List<ChatDataBean> admChat(HttpServletRequest request, HttpServletResponse response){
      String id = request.getParameter("id");		// id = admin
      List<ChatDataBean> chatData = chatDao.getList(id);
      for(int i=0; i<chatData.size(); i++) {
    	  if(chatData.get(i).getIsUser()==0) {
    		  chatData.get(i).setSender("admin");
    	  }else {
    		  chatData.get(i).setSender(chatData.get(i).getId());
    	  }
      }
//      String userid = (String) request.getAttribute("userid");	// 1211 JH tried..
//      System.out.println(userid);
//      List<ChatDataBean> chatData = chatDao.getList(userid);
      request.setAttribute("chatData", chatData);
      return chatData;
   }
	@RequestMapping("/admUserOrderList")
	public ModelAndView admUserOrderList(HttpServletRequest request, HttpServletResponse response) {		
		String adminid = (String)request.getSession().getAttribute("id");
		if(adminid == null) return new AdminFormHandler().admLoginForm(request, response);
		UserDataBean userDto = userDao.getUser(adminid);
		if(userDto.getUserLevel() != 9) return new AdminFormHandler().admLoginForm(request, response);
		UserDataBean adminDto = userDao.getUser(adminid);
		String userid = (String)request.getParameter("userid");
		//UserDataBean userDto = userDao.getUser(userid);
		int count = orderDao.getDistinctOrderCountById(userid);
		Map<String, String> map = new HandlerHelper().makeCount(count, request);
		if (count > 0) {
			Map<String, String> selectReferences = new HashMap<String, String>();
			String startNum = String.valueOf(map.get("start"));
			String endNum = String.valueOf(map.get("end"));
			map.put("userid", userid);
			selectReferences.put("id", map.get("userid"));
			selectReferences.put("start", startNum);
			selectReferences.put("end", endNum);

			/* Change the time format */
			SimpleDateFormat newDateFormat = new SimpleDateFormat("yyyy-MM-dd");

			/* Set Maps for OrderDate and OrderCount */
			Map<String, String> orderDateMap = new HashMap<String, String>();
			Map<String, String> orderCountMap = new HashMap<String, String>();

			List<OrderListDataBean> distinctOrderList = orderDao.getDistinctOrderListById(selectReferences);
			for (OrderListDataBean orderList : distinctOrderList) {
				String orderCode = String.valueOf(orderList.getOrderCode());
				String orderDate = newDateFormat.format(orderList.getOrderDate());
				String orderCount = String.valueOf(orderDao.getCountOfItemsOrdered(orderList.getOrderCode()));

				orderDateMap.put(orderCode, orderDate);
				orderCountMap.put(orderCode, orderCount);
			}

			String orderDateJson = new Gson().toJson(orderDateMap);
			String orderCountJson = new Gson().toJson(orderCountMap);

			request.setAttribute("orderDate", orderDateJson);
			request.setAttribute("orderCount", orderCountJson);
			request.setAttribute("distinctOrderList", distinctOrderList);
		}
		request.setAttribute("count", count);
		request.setAttribute("userid", userid);
		request.setAttribute("userDto", adminDto);
		return new ModelAndView("adm/view/admUserOrderList");
	}
}