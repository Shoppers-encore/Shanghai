package handler;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
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

import databean.BasketDataBean;
import databean.ChatDataBean;
import databean.ImageInfoDataBean;
import databean.OrderListDataBean;
import databean.ProductDataBean;
import databean.RecDataBean;
import db.BasketDao;
import databean.ReviewDataBean;
import databean.UserDataBean;
import db.BoardDao;
import db.ChatDao;
import db.OrderDao;
import db.ProductDao;
import db.RecDao;
import db.UserDao;
import etc.HandlerHelper;

@Controller
public class UserViewHandler {
	@Resource
	private ProductDao productDao;
	@Resource
	private BasketDao basketDao;
	@Resource
	private BoardDao boardDao;
	@Resource
	private OrderDao orderDao;
	@Resource
	private ChatDao chatDao;
	@Resource
	private UserDao userDao;
	@Resource
	private RecDao recDao;

	// Main
	@RequestMapping("/main")
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String category = request.getParameter("category");
		Map<String, String> map = new HashMap<String, String>();
		map.put("category", category);
		int count = productDao.getProductNoSearchCount(map);
		map = new HandlerHelper().makeCount(count, request);
		map.put("category", category);
		List<ProductDataBean> productList = productDao.getNoSearchProductList(map);
		
		String id = (String) request.getSession().getAttribute("id");
		
		int everOrdered;	
		if(id==null) {
			everOrdered=0;
		} else {
			everOrdered=recDao.getClusterCount(id);
		}
		
		if(everOrdered==0) {
			List<Integer> ref = productDao.getBestProduct();
			List<ProductDataBean> bpList = new ArrayList<ProductDataBean>();
			int num = ref.size();
			if (ref.size() > 12) {
				num = 12;
			}
			for (int i = 0; i < num; i++) {
				bpList.addAll(productDao.getBestList(ref.get(i)));
			}
			
			request.setAttribute("bpCount", num);
			request.setAttribute("bpList", bpList);					
			
		} else {
			List<RecDataBean> recCategories=recDao.getRecCategories(id);
			
			int recCount=recCategories.size();
			
			List<ProductDataBean> recList=new ArrayList<ProductDataBean>();
			for(RecDataBean recCategory:recCategories) {
				ProductDataBean product=productDao.getBestProductByCategoryDetail(recCategory.getCategoryDetail());
				
				if(product==null) {
					product=productDao.getOneProductByCategoryDetail(recCategory.getCategoryDetail());
					recList.add(product);
				} else {
					recList.add(product);
				}
			}
			
			request.setAttribute("recCount", recCount);
			request.setAttribute("recList", recList);
		}
		
		request.setAttribute("everOrdered", everOrdered);
		request.setAttribute("productList", productList);
		request.setAttribute("productCount", count);
		return new ModelAndView("user/view/userMain");
	}

	@RequestMapping("/userMyPage")
	public ModelAndView userMypage(HttpServletRequest request, HttpServletResponse response) {
		String id = (String) request.getSession().getAttribute("id");
		if (id != null) {
			UserDataBean userDto = userDao.getUser(id);
			request.setAttribute("userDto", userDto);
		} else { // redirect non-member in member-only page
			ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/userLoginForm.jk");
			return mav;
		}
		return new ModelAndView("user/view/userMyPage");
	}

	// Basket
	@RequestMapping("/basketList")
	public ModelAndView basketList(HttpServletRequest request, HttpServletResponse response) {

		String id = (String) request.getSession().getAttribute("id");
		if (id == null) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/userLoginForm.jk");
			return mav;
		}

		/* Get items from jk_basket using id */
		List<BasketDataBean> basketList = basketDao.getBasketList(id);

		/* Total number of items in the basket */
		int basketCount = basketDao.getBasketCount(id);

		/*
		 * Create HashMaps that can hold color and size options for each item in the
		 * basket
		 */
		Map<String, HashSet<String>> prodColors = new HashMap<String, HashSet<String>>();
		Map<String, HashSet<String>> prodSizes = new HashMap<String, HashSet<String>>();

		/* For each item in the basket: */
		for (BasketDataBean product : basketList) {
			HashSet<String> colors = new HashSet<String>();
			HashSet<String> sizes = new HashSet<String>();

			// 1-1) Get its productCode and reference number
			String productCode = product.getProductCode();
			String ref;
			// 1-2) Check if productCode=ref (=options not selected)
			if (productCode.length() < 6) {
				ref = productCode;
			} else {
				ref = productCode.substring(2, productCode.length() - 2);
			}

			// 2) Get productCodes with the same reference number
			List<ProductDataBean> prodCodesFromRef = productDao.getProductCodesByRef(ref);

			// 3) Get color and size options using the productCodes
			for (ProductDataBean prodCode : prodCodesFromRef) {
				String code = prodCode.getProductCode();
				String color = code.substring(0, 2);
				colors.add(color);

				String size = code.substring(code.length() - 2, code.length());
				sizes.add(size);
			}

			// 4) Add color and size options for each item to prodOptions
			prodColors.put(productCode, colors);
			prodSizes.put(productCode, sizes);
		}

		String prodColorOptions = new Gson().toJson(prodColors);
		String prodSizeOptions = new Gson().toJson(prodSizes);

		request.setAttribute("colorOptions", prodColorOptions);
		request.setAttribute("sizeOptions", prodSizeOptions);
		request.setAttribute("basketList", basketList);
		request.setAttribute("basketCount", basketCount);

		return new ModelAndView("/user/view/basketList");
	}

	// Product
	@RequestMapping("/userProductList")
	public ModelAndView userProductList(HttpServletRequest request, HttpServletResponse response) {
		String category = request.getParameter("category");
		Map<String, String> map = new HashMap<String, String>();
		map.put("category", category);
		int count = productDao.getProductNoSearchCount(map);
		map = new HandlerHelper().makeCount(count, request);
		map.put("category", category);
		List<ProductDataBean> productList = productDao.getNoSearchProductList(map);
		request.setAttribute("productCount", count);
		request.setAttribute("productList", productList);
		request.setAttribute("category", category);
		return new ModelAndView("user/view/userProductList");
	}

	@RequestMapping("/userProductOuterList")
	public ModelAndView userProductOuterList(HttpServletRequest request, HttpServletResponse response) {
		String category = request.getParameter("category");
		if (category == null || category == "") {
			category = "OUTER";
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("category", category);
		int count = productDao.getProductNoSearchCount(map);
		map = new HandlerHelper().makeCount(count, request);
		map.put("category", category);
		List<ProductDataBean> productList = productDao.getNoSearchProductList(map);
		request.setAttribute("productCount", count);
		request.setAttribute("productList", productList);
		request.setAttribute("category", category);
		return new ModelAndView("/user/view/userProductOuterList");
	}

	@RequestMapping("/userProductShirtsList")
	public ModelAndView userProductShirtsList(HttpServletRequest request, HttpServletResponse response) {
		String category = request.getParameter("category");
		if (category == null || category == "") {
			category = "BLnSHIRTS";
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("category", category);
		int count = productDao.getProductNoSearchCount(map);
		map = new HandlerHelper().makeCount(count, request);
		map.put("category", category);
		List<ProductDataBean> productList = productDao.getNoSearchProductList(map);
		request.setAttribute("productCount", count);
		request.setAttribute("productList", productList);
		request.setAttribute("category", category);
		return new ModelAndView("/user/view/userProductShirtsList");
	}

	@RequestMapping("/userProductTopList")
	public ModelAndView userProductTopList(HttpServletRequest request, HttpServletResponse response) {
		String category = request.getParameter("category");
		if (category == null || category == "") {
			category = "TnTOP";
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("category", category);
		int count = productDao.getProductNoSearchCount(map);
		map = new HandlerHelper().makeCount(count, request);
		map.put("category", category);
		List<ProductDataBean> productList = productDao.getNoSearchProductList(map);
		request.setAttribute("productCount", count);
		request.setAttribute("productList", productList);
		request.setAttribute("category", category);
		return new ModelAndView("/user/view/userProductTopList");
	}

	@RequestMapping("/userProductDetail")
	public ModelAndView userProductDetail(HttpServletRequest request, HttpServletResponse response) {
		int ref = Integer.parseInt(request.getParameter("ref"));
		List<ProductDataBean> list = productDao.getProductDetail(ref);
		List<ImageInfoDataBean> imageList = productDao.getImgDetail(ref);
		String[] colors = new HandlerHelper().whatColor(new HandlerHelper().decodeColorCode(list));
		String[] sizes = new HandlerHelper().whatSize(new HandlerHelper().decodeSizeCode(list));
		request.setAttribute("imageList", imageList);
		request.setAttribute("productList", list);
		request.setAttribute("colors", colors);
		request.setAttribute("sizes", sizes);
		return new ModelAndView("user/view/userProductDetail");
	}

	@RequestMapping("/userSearchProduct")
	public ModelAndView userSearchProduct(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		int count = 0;
		String searchWord = request.getParameter("searchWord");
		String[] selectedColors_temp = request.getParameterValues("color");
		String selectedColors = "";
		if((searchWord == null || "".equals(searchWord)) && selectedColors_temp==null) {
			searchWord ="None";
			selectedColors = "None";
		}else {
			if (searchWord == null || "".equals(searchWord))
				searchWord = "";
			if (selectedColors_temp != null)
				for (int i = 0; i < selectedColors_temp.length; i++) {
					selectedColors += selectedColors_temp[i] + " ";
			}
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchWord", searchWord);
		map.put("selectedColors", selectedColors);
		count = productDao.getProductCount(map);
		if (count == 0) {
			request.setAttribute("searchWord", searchWord);
			request.setAttribute("count", count);
			return new ModelAndView("user/view/userSearchProduct");
		} else {
			HandlerHelper hh = new HandlerHelper();
			count = productDao.getProductCount(map);
			map = hh.makeCount(count, request);
			map.put("searchWord", searchWord);
			map.put("selectedColors", selectedColors);
			count = productDao.getProductCount(map);
			Map<String, String> cmap = hh.makeCount(count, request);
			cmap.put("searchWord", searchWord);
			cmap.put("selectedColors", selectedColors);
			List<ProductDataBean> productList = productDao.getProductList(cmap);
			request.setAttribute("searchWord", searchWord);
			request.setAttribute("selectedColors", selectedColors);
			request.setAttribute("productList", productList);
			return new ModelAndView("user/view/userSearchProduct");

		}
	}

	// Order
	@RequestMapping("/userOrderDetail")
	public ModelAndView userOrderDetail(HttpServletRequest request, HttpServletResponse response) {

		String id = (String) request.getSession().getAttribute("id");
		if (id == null) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/userLoginForm.jk");
			return mav;
		}

		String orderDate = request.getParameter("orderDate");

		int orderCode = Integer.parseInt(request.getParameter("orderCode"));
		List<OrderListDataBean> orderListByOrderCode = orderDao.getOrderListByOrderCode(orderCode);
		List<ReviewDataBean> checkReviewWritten=boardDao.checkReviewWritten(orderCode);
		
		if(!checkReviewWritten.isEmpty()) {
			Map<String, String> reviewedItems=new HashMap<String, String>();
			for (ReviewDataBean item:checkReviewWritten) {
				reviewedItems.put(item.getProductCode(), item.getProductCode());
			}
			String reviewed = new Gson().toJson(reviewedItems);
			request.setAttribute("reviewedItems", reviewed);
		}
		
		request.setAttribute("orderDate", orderDate);
		request.setAttribute("orderCode", orderCode);
		request.setAttribute("orderListByOrderCode", orderListByOrderCode);
		
		return new ModelAndView("user/view/userOrderDetail");
	}

	@RequestMapping("/userOrderList")
	public ModelAndView userOrderList(HttpServletRequest request, HttpServletResponse response) {

		String id = (String) request.getSession().getAttribute("id");
		if (id == null) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/userLoginForm.jk");
			return mav;
		}

		/* Number of Order History Per Page */
		int pageSize = 12;
		int pageBlock = 5;

		int count = 0;
		int start = 0;
		int end = 0;

		String pageNum = null;
		int currentPage = 0;
		int number = 0;

		int startPage = 0;
		int endPage = 0;
		int pageCount = 0;

		count = orderDao.getDistinctOrderCountById(id);
		pageNum = request.getParameter("pageNum");

		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}

		currentPage = Integer.parseInt(pageNum);
		pageCount = count / pageSize + (count % pageSize > 0 ? 1 : 0);

		if (currentPage > pageCount) {
			currentPage = pageCount;
		}

		start = (currentPage - 1) * pageSize + 1;
		end = start + pageSize - 1;

		if (end > count) {
			end = count;
		}

		number = count - (currentPage - 1) * pageSize;
		startPage = (currentPage / pageBlock) * pageBlock + 1;

		if (currentPage % pageBlock == 0) {
			startPage -= pageBlock;
		}

		endPage = startPage + pageBlock - 1;

		if (endPage > pageCount) {
			endPage = pageCount;
		}

		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("number", number);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);

		if (count > 0) {
			Map<String, String> selectReferences = new HashMap<String, String>();
			String startNum = String.valueOf(start);
			String endNum = String.valueOf(end);

			selectReferences.put("id", id);
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
		return new ModelAndView("user/view/userOrderList");
	}

	// Review
	@RequestMapping("/reviewList")
	public ModelAndView reviewList(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String searchWord = request.getParameter("searchWord");
		String searchType = request.getParameter("searchType");

		int count = 0;
		if (searchWord == "" || searchWord == null) {
			// No query
			count = boardDao.getReviewCount();
			if (count > 0) {
				Map<String, String> map = new HandlerHelper().makeCount(count, request);
				List<ReviewDataBean> articles = boardDao.getRvList(map);
				for (int i = 0; i < articles.size(); i++) {
					String productName = new ProductDao().getProductName(articles.get(i).getProductCode());
					articles.get(i).setProductName(productName);
					articles.get(i).setProductLevel(productDao.getProductLevel(articles.get(i).getProductCode()));
				}
				request.setAttribute("reviewLists", articles);
			}
		} else {
			// Yes query
			Map<String, String> search = new HashMap<String, String>();
			search.put("searchType", searchType);
			search.put("searchWord", searchWord);
			count = boardDao.getReviewSearchCount(search);

			Map<String, String> map = new HandlerHelper().makeCount(count, request);
			map.put("searchType", searchType);
			map.put("searchWord", searchWord);
			List<ReviewDataBean> articles = boardDao.getRvSearchList(map);
			request.setAttribute("searchWord", searchWord);
			request.setAttribute("reviewLists", articles);
		}
		return new ModelAndView("user/view/reviewList");
	}

	@RequestMapping("/reviewDetail")
	public ModelAndView reviewDetail(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("reviewNo"));
		String pageNum = request.getParameter("pageNum");
		String number = request.getParameter("number");

		ReviewDataBean reviewDto = boardDao.get(num);
		reviewDto.setReviewScoreSum(boardDao.getReviewLikes(num));
		String id = (String) request.getSession().getAttribute("id");

		if (id != null) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("reviewNo", new Integer(num).toString());
			map.put("id", id);
			int me = boardDao.getReviewLike(map);
			if (me > 0) {
				reviewDto.setCheckedme(true);
			}
		}
		reviewDto.setProductName(new ProductDao().getProductName(reviewDto.getProductCode()));

		request.setAttribute("number", number);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("reviewDto", reviewDto);

		return new ModelAndView("user/view/reviewDetail");
	}

	@RequestMapping("/like")
	public String reviewLike(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("reviewNo", request.getParameter("reviewNo"));
		map.put("id", (String) request.getSession().getAttribute("id"));
		boardDao.insertReviewLike(map);
		return "redirect:reviewDetail.jk?reviewNo=" + request.getParameter("reviewNo") + "&pageNum="
				+ request.getParameter("pageNum");
	}

	@RequestMapping("/cancelLike")
	public String reviewLikeCancel(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("reviewNo", request.getParameter("reviewNo"));
		map.put("id", (String) request.getSession().getAttribute("id"));
		boardDao.deleteReviewLike(map);
		return "redirect:reviewDetail.jk?reviewNo=" + request.getParameter("reviewNo") + "&pageNum="
				+ request.getParameter("pageNum");
	}

	// chatting open url
	@RequestMapping("/chatView")
	public ModelAndView chat(HttpServletRequest request, HttpServletResponse response) {
		String id = (String) request.getSession().getAttribute("id");
		List<ChatDataBean> chatdata = chatDao.getList(id);
		request.setAttribute("chatData", chatdata);
		return new ModelAndView("user/view/chatView");
	}

	@RequestMapping("/chat")
	@ResponseBody
	public List<ChatDataBean> chatView(HttpServletRequest request, HttpServletResponse response) {
		String id = (String) request.getSession().getAttribute("id");
		List<ChatDataBean> chatdata = chatDao.getList(id);
		for(int i = 0 ; i<chatdata.size();i++) {
			if(chatdata.get(i).getIsUser()==0) {
				chatdata.get(i).setSender("admin");
			}else {
				chatdata.get(i).setSender(chatdata.get(i).getId());
			}
		}
		request.setAttribute("chatData", chatdata);
		return chatdata;
	}

	@RequestMapping("/userBestProductList")
	public ModelAndView userBestProductList(HttpServletRequest request, HttpServletResponse response) {
		int count = productDao.getProdCount();
		new HandlerHelper().makeCount(count, request);

		List<Integer> ref = productDao.getBestProduct();
		List<ProductDataBean> productList = new ArrayList<ProductDataBean>();
		int num = ref.size();
		if (ref.size() > 12) {
			num = 12;
		}
		for (int i = 0; i < num; i++) {
			productList.addAll(productDao.getBestList(ref.get(i)));
		}

		request.setAttribute("productCount", count);
		request.setAttribute("productList", productList);
		return new ModelAndView("user/view/userBestProductList");
	}
}