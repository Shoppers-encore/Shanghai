package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminViewHandler {
	@RequestMapping("/userList")
	public ModelAndView userList(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("adm/view/userList");
	}
	@RequestMapping("/admChatting")
	   public ModelAndView chatting(HttpServletRequest request, HttpServletResponse response) {
	      return new ModelAndView("adm/view/admChatting");
	}
	@RequestMapping("/admProductList")
	public ModelAndView admProductList(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("adm/view/admProductList");
	}
	@RequestMapping ( "/admProductDetail" )
	public ModelAndView productDetail ( HttpServletRequest request, HttpServletResponse response ) {
		return new ModelAndView ( "adm/view/admProductDetail" );
	}
	@RequestMapping ( "/admSearchProduct" )
	public ModelAndView searchProduct( HttpServletRequest request, HttpServletResponse response ) {
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
		return new ModelAndView("adm/view/admOrderList");
	}
	@RequestMapping("/productModifyForm")
	public ModelAndView productModifyForm(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("adm/view/productModifyForm");
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
