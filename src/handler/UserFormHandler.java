package handler;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import databean.BasketDataBean;
import databean.ProductDataBean;
import databean.ReviewDataBean;
import databean.UserDataBean;
import db.BasketDao;
import db.BoardDao;
import db.ProductDao;
import db.UserDao;

@Controller
public class UserFormHandler {
	@Resource
	private BoardDao boardDao;
	@Resource
	private BasketDao basketDao;
	@Resource
	private UserDao userDao;
	@Resource
	private ProductDao productDao;

	// User
	@RequestMapping("/userInputForm")
	public ModelAndView userInputForm(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("user/form/userInputForm");
	}

	@RequestMapping("/userLoginForm")
	public ModelAndView userLoginForm(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("user/form/userLoginForm");
	}

	@RequestMapping("/confirmId")
	public ModelAndView confirmId(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("user/form/confirmId");
	}

	@RequestMapping("/userModifyForm")
	public ModelAndView userModifyForm(HttpServletRequest request, HttpServletResponse response) {
		String id = (String) request.getSession().getAttribute("id");
		UserDataBean userDto = userDao.getUser(id);
		if (id == null) { // redirect non-member in member-only page
			ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/userLoginForm.jk");
			return mav;
		}
		request.setAttribute("userDto", userDto);
		return new ModelAndView("user/form/userModifyForm");
	}

	// Review
	@RequestMapping("/reviewWriteForm")
	public ModelAndView reviewWriteForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = (String) request.getSession().getAttribute("id");
		if (id == null) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/userLoginForm.jk");
			return mav;
		} else {
			String productCode = request.getParameter("productCode");
			String productName = new ProductDao().getProductName(productCode);
			String orderCode = request.getParameter("orderCode");
			request.setAttribute("productName", productName);
			request.setAttribute("productCode", productCode);
			request.setAttribute("orderCode", orderCode);
		}
		int reviewNo = 0;

		if (request.getParameter("reviewNo") != null) {
			reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		}
		request.setAttribute("reviewNo", reviewNo);
		return new ModelAndView("user/form/reviewWriteForm");
	}

	@RequestMapping("/reviewModifyForm")
	public ModelAndView reviewModifyForm(HttpServletRequest request, HttpServletResponse response) {
		String id = (String) request.getSession().getAttribute("id");

		if (id == null) { // redirect non-member in member-only page
			ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/userLoginForm.jk");
			return mav;
		}

		int num = Integer.parseInt(request.getParameter("reviewNo"));
		String pageNum = request.getParameter("pageNum");
		request.setAttribute("pageNum", pageNum);
		ReviewDataBean reviewDto = boardDao.get(num);
		if (reviewDto.getId().equals(id)) {
			request.setAttribute("reviewDto", reviewDto);
			String productName = new ProductDao().getProductName(reviewDto.getProductCode());
			request.setAttribute("productName", productName);
			request.setAttribute("num", num);
		}
		return new ModelAndView("user/form/reviewModifyForm");
	}

	// Order
	@RequestMapping("/orderInputForm")
	public ModelAndView orderInputForm(HttpServletRequest request, HttpServletResponse response) {

		String id = (String) request.getSession().getAttribute("id");
		if (id == null) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/userLoginForm.jk");
			return mav;
		}

		UserDataBean userInfo = userDao.getUser(id);
		request.setAttribute("userInfo", userInfo);

		/*
		 * If this page is accessed from basketList, identifier=1; else identifier=null
		 * || identifier=""
		 */
		String identifier = request.getParameter("identifier");

		if ("".equals(identifier) || identifier == null) {
			identifier = "0"; // this page is redirected from productDetail

			if (request.getParameter("productCode") != null || !"".equals(request.getParameter("productCode"))) {
				String productCode = request.getParameter("productCode");
				int basketQuantity = Integer.parseInt(request.getParameter("quantity"));

				BasketDataBean basketItem = new BasketDataBean();
				basketItem.setProductCode(productCode);
				basketItem.setBasketQuantity(basketQuantity);

				ProductDataBean product = productDao.getProductDetailsByProductCode(productCode);

				request.setAttribute("product", product);
				request.setAttribute("identifier", identifier);
				request.setAttribute("basket", basketItem);
			} else {
				identifier = "2"; // if for some reason productCode is missing
				request.setAttribute("identifier", identifier);
			}

		} else if (identifier.equals("1")) { // this page is redirected from basket
			List<BasketDataBean> basketList = basketDao.getBasketList(id);

			String checked = (String) request.getSession().getAttribute("checkedItems");
			JsonObject checkedItems = new JsonParser().parse(checked).getAsJsonObject();

			List<BasketDataBean> basket = new ArrayList<BasketDataBean>();

			for (BasketDataBean basketItem : basketList) {
				for (int i = 0; i < checkedItems.size(); i++) {
					String checkedItemWithQuotes = checkedItems.get(String.valueOf(i)).toString();
					String checkedItem = checkedItemWithQuotes.substring(1, checkedItemWithQuotes.length() - 1);

					if (basketItem.getProductCode().equals(checkedItem)) {
						BasketDataBean item = new BasketDataBean();
						item.setProductCode(basketItem.getProductCode());
						item.setBasketQuantity(basketItem.getBasketQuantity());
						item.setProductName(basketItem.getProductName());
						item.setThumbnail(basketItem.getThumbnail());
						item.setProductPrice(basketItem.getProductPrice());
						item.setProductQuantity(basketItem.getProductQuantity());
						item.setDiscount(basketItem.getDiscount());

						basket.add(item);
					}
				}
			}
			request.setAttribute("identifier", identifier);
			request.setAttribute("basket", basket);
		}
		return new ModelAndView("user/form/orderInputForm");
	}
	
	//findId & Password
	@RequestMapping("/findId")
	public ModelAndView findId(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("user/form/findId");
	}
	@RequestMapping("/findPassword")
	public ModelAndView findPassword(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("user/form/findPassword");
	}
}
