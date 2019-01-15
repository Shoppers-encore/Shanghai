package handler;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import databean.BasketDataBean;
import databean.ChatDataBean;
import databean.ReviewDataBean;
import db.UserDao;
import etc.HandlerHelper;
import etc.SendMail;
import db.BasketDao;
import db.BoardDao;
import db.OrderDao;
import db.ProductDao;
import db.ChatDao;
import databean.CommentDataBean;
import databean.OrderListDataBean;
import databean.ProductDataBean;

import databean.UserDataBean;

@Controller
public class UserProHandler {
	@Resource
	private UserDao userDao;

	@Resource
	private BoardDao boardDao;

	@Resource
	private BasketDao basketDao;

	@Resource
	private ProductDao productDao;

	@Resource
	private ChatDao chatDao;

	@Resource
	private OrderDao orderDao;

	//////////////////// User /////////////////////
	/* Join Member */
	@RequestMapping("/userInputPro")
	public ModelAndView userInputPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		UserDataBean userDto = new UserDataBean();
		// inputData-id varchar2(NN), password varchar2(NN), name varchar2(NN), birthday
		// date(NN), tel varchar2(NN), email varchar2(NN), gender number,
		// userLevel=default 1(NN), height number(3,0), weight number(3,0), address
		// varchar2(NN), addressDetail varchar2(NN), zipcode varchar2(NN)
		userDto.setId(request.getParameter("id"));
		userDto.setPassword(request.getParameter("password"));
		userDto.setName(request.getParameter("name"));
		userDto.setBirthday(request.getParameter("birthday"));
		userDto.setTel(request.getParameter("tel"));
		userDto.setEmail(request.getParameter("email"));

		String genderValue = request.getParameter("gender");
		if (!genderValue.equals("")) {
			int gender = Integer.parseInt(genderValue);
			userDto.setGender(gender);
		}
		String heightValue = request.getParameter("height");
		if (!heightValue.equals("")) {
			int height = Integer.parseInt(heightValue);
			userDto.setHeight(height);
		}
		String weightValue = request.getParameter("weight");
		if (!weightValue.equals("")) {
			int weight = Integer.parseInt(weightValue);
			userDto.setWeight(weight);
		}

		userDto.setZipcode(request.getParameter("zipcode"));
		userDto.setAddress(request.getParameter("address"));
		userDto.setAddressDetail(request.getParameter("addressDetail"));

		// insertUser
		int result = userDao.insertUser(userDto);
		String sql = "insert into jk_user values('"+userDto.getId()+"', '"+userDto.getPassword()+"', '"+userDto.getName()+"', '"+userDto.getBirthday()+"', '"+userDto.getTel()+"','"+userDto.getEmail()+"', "+userDto.getGender()+", 1, "+userDto.getHeight()+", "+userDto.getWeight()+", '"+userDto.getAddress()+"', '"+userDto.getAddressDetail()+"', '"+userDto.getZipcode()+"');";
		new HandlerHelper().fileWriter(sql);
		request.setAttribute("result", result);
		request.setAttribute("userDto", userDto);

		return new ModelAndView("user/pro/userInputPro");
	}

	// Ajax User-ConfirmId
	@RequestMapping(value = "/confirmId.jk", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public Map<Object, Object> idCheck(@RequestBody String id) {
		id = id.split("=")[0];
		int countId = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();

		countId = userDao.check(id);
		map.put("countId", countId);

		return map;
	}

	// SMTP - Simple Mail Transfer Protocol
	@RequestMapping("/userMailCheck")
	public ModelAndView userMailCheck(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		String number = null; // Variable for authentication-key
		try { // Create authentication-key
			StringBuffer num = new StringBuffer();
			for (int i = 0; i < 6; i++) {
				num.append((int) (Math.random() * 10));
			}
			number = num.toString(); // End-of-creation: set StringBuffer to String
			Map<String, String> info = new HashMap<String, String>(); // parameter for SendMail.java
			info.put("sender", "hkk9331@gmail.com");
			info.put("receiver", email);
			info.put("subject", "'지금, 그대.' 쇼핑몰 가입인증 메일입니다.");
			info.put("content", "인증번호 : " + "[" + number + "]");
			new SendMail().sendMail(info);
		} catch (IOException e) {
			e.printStackTrace();
		}
		request.setAttribute("num", number); // set to confirm match authentication key
		return new ModelAndView("user/view/userMailCheck");
	}

	/* Log-in process */
	@RequestMapping("/userLoginPro")
	public ModelAndView userLoginPro(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		UserDataBean userDto = userDao.getUser(id);

		int result = userDao.check(id, password);
		request.setAttribute("result", result);
		request.setAttribute("id", id);
		if (result == 1) { // bring userLevel to check member status in userLoginPro
			int userLevel = userDao.getUserLevel(id);
			request.setAttribute("userLevel", userLevel);
		}
		if (result != -1) {
			request.setAttribute("userDto", userDto);
		}
		return new ModelAndView("user/pro/userLoginPro");
	}

	@RequestMapping("/userModifyPro")
	public String userModifyPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String id = (String) request.getSession().getAttribute("id");
		if (id == null) { // redirect non-member in member-only page
			return "redirect:/userLoginForm.jk";
		}
		UserDataBean userDto = new UserDataBean();
		userDto.setId(id);
		userDto.setPassword(request.getParameter("password"));
		userDto.setTel(request.getParameter("tel"));
		userDto.setEmail(request.getParameter("email"));
		userDto.setZipcode(request.getParameter("zipcode"));
		userDto.setAddress(request.getParameter("address"));
		userDto.setAddressDetail(request.getParameter("addressDetail"));
		String heightValue = request.getParameter("height");
		if (!heightValue.equals("")) {
			int height = Integer.parseInt(heightValue);
			userDto.setHeight(height);
		}
		String weightValue = request.getParameter("weight");
		if (!weightValue.equals("")) {
			int weight = Integer.parseInt(weightValue);
			userDto.setWeight(weight);
		}

		userDao.modifyUser(userDto);
		return "redirect:userMyPage.jk";
	}

	@RequestMapping("/userDeletePro")
	public ModelAndView userDeletePro(HttpServletRequest request, HttpServletResponse response) {
		String id = (String) request.getSession().getAttribute("id");
		int result = userDao.deleteUser(id);
		if (result == 1) {
			request.getSession().setAttribute("id", null);
		}
		request.setAttribute("result", result);
		return new ModelAndView("user/pro/userDeletePro");
	}

	// Logout
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().setAttribute("id", null);
		return "redirect:main.jk";
	}

	// Basket
	@RequestMapping("/basketInput")
	public ModelAndView basketInput(HttpServletRequest request, HttpServletResponse response) {
		String id = (String) request.getSession().getAttribute("id");
		if (id == null) {
			return new ModelAndView("user/form/userLoginForm");
		}
		String productCode = request.getParameter("productCode");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		BasketDataBean basket = new BasketDataBean();
		basket.setId((String) request.getSession().getAttribute("id"));
		basket.setBasketQuantity(quantity);
		basket.setProductCode(productCode);
		int count = basketDao.getDupicateCheck(basket);
		int result = 0;
		if (count == 0) {
			result = basketDao.inputBasket(basket);
		} else {
			result = basketDao.increaseBasketItem(basket);
		}
		request.setAttribute("result", result);
		request.setAttribute("ref", request.getParameter("ref"));
		return new ModelAndView("user/pro/basketInput");
	}

	@RequestMapping("/basketModify")
	public ModelAndView basketModify(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("user/pro/basketModify");
	}

	@RequestMapping("/basketDelete")
	public ModelAndView basketDelete(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("user/pro/basketDelete");
	}

	@RequestMapping(value = "/deleteBasketItemAjax", method = RequestMethod.GET)
	@ResponseBody
	public String deleteBasketItemAjax(HttpServletRequest request, HttpServletResponse response) {

		/* Get id from session */
		String id = (String) request.getSession().getAttribute("id");

		/* Get productCode from Ajax data */
		String productCode = request.getParameter("productCode");

		/* Add id and productCode to BasketDataBean */
		BasketDataBean deleteReferences = new BasketDataBean();
		deleteReferences.setId(id);
		deleteReferences.setProductCode(productCode);

		/* Delete the item and get the result */
		int deleteResult = basketDao.deleteBasketItem(deleteReferences);

		/* If the result returns 1, the item is deleted from jk_basket */
		String itemDeleted;
		if (deleteResult == 1) {
			itemDeleted = "true";
		} else {
			itemDeleted = "false";
		}

		/* Convert Java String to JSON and return */
		String isItemDeleted = new Gson().toJson(itemDeleted);
		return isItemDeleted;
	}

	@RequestMapping(value = "/getProductQuantityAjax", method = RequestMethod.GET)
	@ResponseBody
	public String getProductQuantityAjax(HttpServletRequest request, HttpServletResponse response) {

		/* Get productCode from Ajax data */
		String productCode = request.getParameter("productCode");

		/* Get Product Quantity */
		int productQty = productDao.getProdQuantity(productCode);

		/* Convert Java String to JSON and return */
		String prodQty = new Gson().toJson(String.valueOf(productQty));
		return prodQty;
	}

	@RequestMapping("/basketListPro")
	public ModelAndView basketListPro(HttpServletRequest request, HttpServletResponse response) {

		String id = (String) request.getSession().getAttribute("id");
		if (id == null) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/userLoginForm.jk");
			return mav;
		}

		String[] checkedItems = request.getParameterValues("itemChecked");

		/* Get items from jk_basket using id */
		List<BasketDataBean> basketList = basketDao.getBasketList(id);
		List<Integer> resultSet = new ArrayList<Integer>();

		int i = 0;
		Map<Integer, String> itemsToOrder = new HashMap<Integer, String>();

		for (String item : checkedItems) {

			for (BasketDataBean basketItem : basketList) {
				if (item.equals(basketItem.getProductCode())) {
					String productCode = item;

					int basketQuantity = Integer.parseInt(request.getParameter("basketQuantity_" + productCode));
					String colorSelected = request.getParameter("selectColorOptions_" + productCode);
					String sizeSelected = request.getParameter("selectSizeOptions_" + productCode);

					String ref;
					if (productCode.length() > 5) {
						ref = productCode.substring(2, productCode.length() - 2);
					} else {
						ref = productCode;
					}

					String newProductCode = colorSelected + ref + sizeSelected;

					itemsToOrder.put(i, newProductCode);
					i++;

					/*
					 * Make a map (can't use BasketDataBean because the productCode must be updated
					 * with a new one)
					 */
					/* Map<String, Object> so we can put both String and int */
					Map<String, Object> updateReferences = new HashMap<String, Object>();
					updateReferences.put("newProductCode", newProductCode);
					updateReferences.put("basketQuantity", basketQuantity);
					updateReferences.put("id", id);
					updateReferences.put("productCode", productCode);

					/* Get the result in int; result=1 when successfully updated */
					int result = basketDao.updateBasketList(updateReferences);

					/* Add the int result to the array list */
					resultSet.add(result);
				}
			}
		}

		/* Convert Java String to JSON */
		String itemsChecked = new Gson().toJson(itemsToOrder);

		request.setAttribute("checkedItems", itemsChecked);
		request.setAttribute("results", resultSet);
		return new ModelAndView("user/pro/basketListPro");
	}

	// Review

	@RequestMapping("/reviewWritePro")
	public ModelAndView reviewWritePro(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		ReviewDataBean reviewDto = new ReviewDataBean();
		Map<String, String> search = new HashMap<String, String>();
		search.put("searchType", request.getParameter("searchType"));
		search.put("searchWord", request.getParameter("searchWord"));
		int count = boardDao.getReviewCount(search);
		int reviewNo = 1;
		if (count > 0) {
			reviewNo = boardDao.getMaxReview() + 1;
		}
		String path = request.getSession().getServletContext().getRealPath("\\save");
		MultipartRequest multi = null;
		if (-1 < request.getContentType().indexOf("multipart/form-data"))
			multi = new MultipartRequest(request, path, 1024 * 1024 * 5, "UTF-8", new DefaultFileRenamePolicy());
		String systemName = null;
		String[] photos = { null, null };
		int i = 0;
		Enumeration<?> e = multi.getFileNames();
		while (e.hasMoreElements()) {
			String inputName = (String) e.nextElement();
			systemName = multi.getFilesystemName(inputName);
			if (systemName != null) {
				String sname = path + "\\" + systemName;
				String tname = null;
				new File(path+"\\review-"+reviewNo).mkdir();
				tname = "review-"+reviewNo+"\\"+reviewNo+"-"+i+"-"+systemName;
				File f = new File(sname);
				boolean a = f.renameTo(new File(path+"/"+tname));
				photos[i] = tname;
				i++;
			}
		}
		reviewDto.setPhoto1(photos[0]);
		reviewDto.setPhoto2(photos[1]);

		
		
		reviewDto.setReviewNo(reviewNo);
		reviewDto.setTitle(multi.getParameter("title"));
		reviewDto.setReviewContent(multi.getParameter("reviewContent"));
		reviewDto.setReviewDate(new Timestamp(System.currentTimeMillis()));
		reviewDto.setId((String) request.getSession().getAttribute("id"));
		reviewDto.setProductCode(multi.getParameter("productCode"));
		reviewDto.setOrderCode(Integer.parseInt(multi.getParameter("orderCode")));
		reviewDto.setRating(Double.parseDouble(multi.getParameter("rating")));
		reviewDto.setReviewScoreSum(0);

		int result = boardDao.insert(reviewDto);
		request.setAttribute("result", result);

		return new ModelAndView("user/pro/reviewWritePro");
	}

	@RequestMapping("/reviewModifyPro")
	public String reviewModifyPro(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		ReviewDataBean reviewDto = new ReviewDataBean();

		// photos
		String path = request.getSession().getServletContext().getRealPath("/save");
		MultipartRequest multi = null;
		if (-1 < request.getContentType().indexOf("multipart/form-data"))
			multi = new MultipartRequest(request, path, 1024 * 1024 * 5, "UTF-8", new DefaultFileRenamePolicy());

		String photo1 = multi.getParameter("p1");
		String photo2 = multi.getParameter("p2");
		String systemName = null;
		String[] photos = { photo1, photo2 };
		int i = 0;
		Enumeration<?> e = multi.getFileNames();
		while (e.hasMoreElements()) {
			String inputName = (String) e.nextElement();
			systemName = multi.getFilesystemName(inputName);
			if (systemName != null) {
				String sname = path + "\\" + systemName;
				RenderedOp op = JAI.create("fileload", sname);
				BufferedImage sbuffer = op.getAsBufferedImage();
				int SIZE = 3;
				int width = sbuffer.getWidth() / SIZE;
				int height = sbuffer.getHeight() / SIZE;
				BufferedImage tbuffer = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
				Graphics g = tbuffer.getGraphics();
				g.drawImage(sbuffer, 0, 0, width, height, null);

				if (photos[i] != systemName) {
					photos[i] = systemName;
				} else {
					photos[i] = "";
				}
				i++;
			}
		}
		reviewDto.setPhoto1(photos[0]);
		reviewDto.setPhoto2(photos[1]);
		reviewDto.setReviewNo(Integer.parseInt(multi.getParameter("reviewNo")));
		reviewDto.setTitle(multi.getParameter("title"));
		reviewDto.setReviewContent(multi.getParameter("reviewContent"));
		reviewDto.setId((String) request.getSession().getAttribute("id"));
		reviewDto.setProductCode(multi.getParameter("productCode"));
		reviewDto.setRating(Double.parseDouble(multi.getParameter("rating")));

		String pageNum = multi.getParameter("pageNum");

		int result = boardDao.modify(reviewDto);

		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);

		return "redirect:reviewDetail.jk?reviewNo=" + reviewDto.getReviewNo();
	}

	@RequestMapping("/reviewDeletePro")
	public ModelAndView reviewDeletePro(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("reviewNo"));
		String pageNum = request.getParameter("pageNum");
		String id = (String) request.getSession().getAttribute("id");
		if (id != null) {
			if (id.equals(boardDao.get(num).getId())) {
				ReviewDataBean rdb = boardDao.get(num);
				String[] fileName = new String[2];
				fileName[0]=rdb.getPhoto1();
				fileName[1]=rdb.getPhoto2();
				for(int i = 0 ; i<fileName.length;i++) {
					String path =  request.getSession().getServletContext().getRealPath( "/save" );
					File f = new File(path+fileName[i]);
					if(f.exists()) f.delete();
					f = new File(path);
					if(f.exists()) f.delete();
				}
				int result = boardDao.delete(num);
				request.setAttribute("result", result);
			} else {
				int result = 0;
				request.setAttribute("result", result);
			}
		}
		boardDao.deleteRvComment(num);
		boardDao.deleteReviewLikes(num);
		request.setAttribute("pageNum", pageNum);
		return new ModelAndView("user/pro/reviewDeletePro");
	}

	// Review Comment
	@RequestMapping(value = "/commentInsert.jk", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public void commentInsertProcess(HttpServletRequest request, HttpSession session) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String id = (String) session.getAttribute("id");
		String commentContent = request.getParameter("commentContent");
		CommentDataBean cmtDto = new CommentDataBean();
		if (commentContent != null) {
			cmtDto.setId(id);
			cmtDto.setReviewNo(Integer.parseInt(request.getParameter("reviewNo")));
			cmtDto.setCommentContent(commentContent);

			boardDao.insertComment(cmtDto);
		}
	}

	@RequestMapping(value = "/commentSelect.jk", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<CommentDataBean> commentSelectProcess(HttpServletRequest request, HttpServletResponse response) {
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		List<CommentDataBean> comment = boardDao.getComment(reviewNo);

		request.setAttribute("comment", comment);
		return comment;
	}

	@RequestMapping(value = "/commentUpdate.jk", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	private void commentUpdateProcess(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		CommentDataBean cmtDto = new CommentDataBean();
		cmtDto.setCommentNo(Integer.parseInt(request.getParameter("commentNo")));
		cmtDto.setCommentContent(request.getParameter("commentContent"));
		boardDao.updateComment(cmtDto);
	}

	@RequestMapping(value = "/commentDelete.jk", method = RequestMethod.POST)
	@ResponseBody
	private void commentDeleteProcess(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		boardDao.deleteComment(commentNo);
	}

	// Order
	@RequestMapping("/orderInputPro")
	public ModelAndView orderInputPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String id = (String) request.getSession().getAttribute("id");
		if (id == null) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/userLoginForm.jk");
			return mav;
		}

		String identifier = request.getParameter("identifier");

		int orderNo = orderDao.getMaxOrderCode();

		if (identifier.equals("0")) {
			int orderCode = orderNo + 1;
			String productCode = request.getParameter("productCode");
			int ref = Integer.parseInt(productCode.substring(2, productCode.length() - 2));
			String orderZipcode = request.getParameter("orderZipcode");
			String orderAddress1 = request.getParameter("orderAddress1");
			String orderAddress2 = request.getParameter("orderAddress2");
			int orderQuantity = Integer.parseInt(request.getParameter("orderQuantity"));
			int orderPrice = Integer.parseInt(request.getParameter("orderPrice"));

			OrderListDataBean order = new OrderListDataBean();
			order.setOrderCode(orderCode);
			order.setProductCode(productCode);
			order.setRef(ref);
			order.setId(id);
			order.setOrderDate(new Timestamp(Calendar.getInstance().getTimeInMillis()));
			order.setOrderZipcode(orderZipcode);
			order.setOrderAddress1(orderAddress1);
			order.setOrderAddress2(orderAddress2);
			order.setOrderQuantity(orderQuantity);
			order.setOrderPrice(orderPrice);

			ProductDataBean productDto = new ProductDataBean();
			int newProductQuantity = productDao.getProdQuantity(productCode) - orderQuantity;
			productDto.setProductQuantity(newProductQuantity);
			productDto.setProductCode(productCode);
			int orderListInsertResult=orderDao.insertOrder(order);
			int productQuantityUpdateResult=productDao.changeQuantity(productDto);
			//LogWriter
			String path =  request.getSession().getServletContext().getRealPath( "/data" );
			Calendar cal = GregorianCalendar.getInstance();
			ProductDataBean product = productDao.getProductDetailsByProductCode(order.getProductCode());
			String orderList = order.getOrderCode()+"#"+order.getProductCode()+"#"+order.getRef()+"#"+order.getId()+"#"+order.getOrderZipcode()+"#"+order.getOrderAddress1()+"#"+order.getOrderAddress2()+"#"+order.getOrderDate()+"#"+order.getOrderStatus()+"#"+order.getOrderQuantity()+"#"+order.getOrderPrice();
			String productList = product.getRef()+"#"+product.getProductCode()+"#"+product.getProductName()+"#"+product.getProductCategory()+"#"+product.getProductContent()+"#"+product.getDiscount()+"#"+product.getProductPrice()+"#"+product.getProductRegDate();
			orderLog(path,orderList, cal);
			productLog(path,productList, cal);
			request.setAttribute("orderListInsertResult", orderListInsertResult);
			// request.setAttribute("basketDeleteResult", basketDeleteResult);
			request.setAttribute("productQuantityUpdateResult", productQuantityUpdateResult);

		} else if (identifier.equals("1")) {
			List<BasketDataBean> basketList = basketDao.getBasketList(id);

			String checked = (String) request.getSession().getAttribute("checkedItems");
			JsonObject checkedItems = new JsonParser().parse(checked).getAsJsonObject();

			for (BasketDataBean basketItem : basketList) {
				for (int i = 0; i < checkedItems.size(); i++) {
					String checkedItemWithQuotes = checkedItems.get(String.valueOf(i)).toString();
					String checkedItem = checkedItemWithQuotes.substring(1, checkedItemWithQuotes.length() - 1);

					if (basketItem.getProductCode().equals(checkedItem)) {
						int orderCode = orderNo + 1;
						String productCode = checkedItem;
						int ref = Integer.parseInt(productCode.substring(2, productCode.length() - 2));
						String orderZipcode = request.getParameter("orderZipcode");
						String orderAddress1 = request.getParameter("orderAddress1");
						String orderAddress2 = request.getParameter("orderAddress2");
						int orderQuantity = basketItem.getBasketQuantity();

						String priceTag = "orderPrice_" + productCode;

						int orderPrice = Integer.parseInt(request.getParameter(priceTag));

						OrderListDataBean order = new OrderListDataBean();
						order.setOrderCode(orderCode);
						order.setProductCode(productCode);
						order.setRef(ref);
						order.setId(id);
						order.setOrderDate(new Timestamp(Calendar.getInstance().getTimeInMillis()));
						order.setOrderZipcode(orderZipcode);
						order.setOrderAddress1(orderAddress1);
						order.setOrderAddress2(orderAddress2);
						order.setOrderQuantity(orderQuantity);
						order.setOrderPrice(orderPrice);

						BasketDataBean deleteReferences = new BasketDataBean();
						deleteReferences.setId(id);
						deleteReferences.setProductCode(productCode);

						ProductDataBean productDto = new ProductDataBean();
						int newProductQuantity = productDao.getProdQuantity(productCode) - orderQuantity;
						productDto.setProductQuantity(newProductQuantity);
						productDto.setProductCode(productCode);
						int orderListInsertResult=orderDao.insertOrder(order);
						int basketDeleteResult=basketDao.deleteBasketItem(deleteReferences);
						int productQuantityUpdateResult=productDao.changeQuantity(productDto);
						//LogWriter
						String path =  request.getSession().getServletContext().getRealPath( "/data" );
						Calendar cal = GregorianCalendar.getInstance();
						ProductDataBean product = productDao.getProductDetailsByProductCode(order.getProductCode());
						String orderList = order.getOrderCode()+"#"+order.getProductCode()+"#"+order.getRef()+"#"+order.getId()+"#"+order.getOrderZipcode()+"#"+order.getOrderAddress1()+"#"+order.getOrderAddress2()+"#"+order.getOrderDate()+"#"+order.getOrderStatus()+"#"+order.getOrderQuantity()+"#"+order.getOrderPrice();
						String productList = product.getRef()+"#"+product.getProductCode()+"#"+product.getProductName()+"#"+product.getProductCategory()+"#"+product.getProductContent()+"#"+product.getDiscount()+"#"+product.getProductPrice()+"#"+product.getProductRegDate();
						orderLog(path,orderList, cal);
						productLog(path,productList, cal);
						request.setAttribute("orderListInsertResult", orderListInsertResult);
						request.setAttribute("basketDeleteResult", basketDeleteResult);
						request.setAttribute("productQuantityUpdateResult", productQuantityUpdateResult);
					}
				}
			}
		}
		return new ModelAndView("user/pro/orderInputPro");
	}

	// Cart Ajax
	@RequestMapping("/cartInsert")
	@ResponseBody
	public void cartInsert(HttpServletRequest request, HttpServletResponse response) {
		String id = (String) request.getSession().getAttribute("id");
		String productCode = request.getParameter("productCode");
		int quantity = Integer.parseInt(request.getParameter("var"));
		BasketDataBean basket = new BasketDataBean();
		basket.setId(id);
		basket.setProductCode(productCode);
		basket.setBasketQuantity(quantity);
		int count = basketDao.getDupicateCheck(basket);
		if (count == 0) {
			basketDao.inputBasket(basket);
		} else {
			basketDao.increaseBasketItem(basket);
		}
	}

	@RequestMapping(value = "/viewCart", produces = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public List<BasketDataBean> viewCart(HttpServletRequest request, HttpServletResponse response) {
		List<BasketDataBean> baskets = basketDao.getBasketList((String) request.getSession().getAttribute("id"));
		for (int i = 0; i < baskets.size(); i++) {
			baskets.get(i).setThumbnail(productDao.getThumbnail(baskets.get(i).getProductCode()));
		}
		request.setAttribute("baskets", baskets);
		return baskets;
	}

	@RequestMapping("/cartDelete")
	@ResponseBody
	public void cartDelete(HttpServletRequest request, HttpServletResponse response) {
		String id = (String) request.getSession().getAttribute("id");
		String productCode = request.getParameter("productCode");
		BasketDataBean basket = new BasketDataBean();
		basket.setId(id);
		basket.setProductCode(productCode);
		basketDao.deleteBasketItem(basket);
	}

	// productDetail - productQuantity
	@RequestMapping(value = "/howManyQuantity", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public Map<Object, Object> howManyQuantity(HttpServletRequest request, HttpServletResponse response) {
		String productList = request.getParameter("productCode");
		Map<Object, Object> map = new HashMap<Object, Object>();
		int count = productDao.getProductQuantityCount(productList);
		map.put("count", count);
		if (count == 0) {
			return map;
		} else {
			int quantity = productDao.getProductQuantity(productList);
			map.put("quantity", quantity);
			return map;
		}
	}
	//userInput MailCheck
	@RequestMapping("isMail")
	@ResponseBody
	public Map<Object, Object> isMail(HttpServletRequest request, HttpServletResponse response) {
		String mailAddress = request.getParameter("email");
		int result = userDao.getMailCount(mailAddress);
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("result", result);
		return map;
	}
	
	// chat ajax
	@RequestMapping("/userChatInput")
	@ResponseBody
	public void chatInput(HttpServletRequest request, HttpServletResponse response) {
		String id = (String) request.getSession().getAttribute("id");
		String chatContent = request.getParameter("message");
		ChatDataBean chat = new ChatDataBean();
		chat.setChatContent(chatContent);
		chat.setId(id);
		chat.setIsUser(1);
		chatDao.chatInput(chat);
	}
	private void orderLog(String path, String log, Calendar cal) {
		File file = new File(path+"/orderList-"+cal.get(Calendar.YEAR)+"-"+(cal.get(Calendar.MONTH))+"-"+cal.get(Calendar.DAY_OF_MONTH)+".txt");
		try {
			FileWriter fw = new FileWriter(file, true);
			fw.write(log);
			fw.flush();
			if(fw!=null) fw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	private void productLog(String path, String log, Calendar cal) {
		File file = new File(path+"/product-"+cal.get(Calendar.YEAR)+"-"+(cal.get(Calendar.MONTH)+1)+"-"+cal.get(Calendar.DAY_OF_MONTH)+".txt");
		try {
			FileWriter fw = new FileWriter(file, true);
			fw.write(log);
			fw.flush();
			if(fw!=null) fw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//findId & find Password
	@RequestMapping("/findIdPro")
	@ResponseBody
	public Map<Object, Object> findIdPro(HttpServletRequest request, HttpServletResponse response){
		Map<Object, Object> map = new HashMap<Object, Object>();
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		UserDataBean user = new UserDataBean();
		user.setName(name);
		user.setEmail(email);
		int count = userDao.getIdCount(user);
		map.put("result", count);
		if(count>0) {
			String id = userDao.getId(user);
			map.put("id", id);
			request.setAttribute("id", id);
		}
		request.setAttribute("result", count);
		return map;
	}
	@RequestMapping("/findPasswordPro")
	public ModelAndView findPasswordPro(HttpServletRequest request, HttpServletResponse response){
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String name=request.getParameter("name");
		String email = request.getParameter("email");
		UserDataBean user = new UserDataBean();
		user.setName(name);
		user.setEmail(email);
		int count=userDao.getIdCount(user);
		int result = 0;
		if(count>0) {
			String id = request.getParameter("id");
			if(id.equals(userDao.getId(user))) {
				Random r = new Random();
				StringBuffer sb = new StringBuffer();
				for(int i=0;i<8+r.nextInt(5);i++) {
					int rnum = r.nextInt(65);
					if(rnum<10) {
						sb.append(rnum);
					}else if(rnum<36) {
						sb.append((char)(rnum+55));
					}else if(rnum<62) {
						sb.append((char)(rnum+61));
					}else {
						if(rnum==62) {
							sb.append('!');
						}else if(rnum==63) {
							sb.append('$');
						}else if(rnum==64) {
							sb.append('@');
						}
					}
				}
				String pw=sb.toString();
				user.setId(id);
				user.setPassword(pw);
				result = userDao.setPassword(user);
				if(result >0) {
					Map<String, String> mail = new HashMap<String, String>();
					mail.put("sender", "hkk9331@gmail.com");
					mail.put("receiver", email);
					mail.put("subject", "'지금, 그대.' 쇼핑몰 임시비밀번호 메일입니다.");
					mail.put("content", "임시 비밀번호 : "+pw);
					try {
						new SendMail().sendMail(mail);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		request.setAttribute("result", result);
		
		return new ModelAndView("user/form/findPassword");
	}
}
