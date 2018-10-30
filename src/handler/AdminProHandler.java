package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminProHandler {
	@RequestMapping( "/admLoginPro" )
	public ModelAndView admLoginPro ( HttpServletRequest request, HttpServletResponse response ) {
		return new ModelAndView("adm/pro/admLoginPro");
	}
	@RequestMapping ( "/productInputPro" )
	   public ModelAndView productInputPro ( HttpServletRequest request, HttpServletResponse response ) {
	      return new ModelAndView ( "adm/pro/productInputPro" );
	   }
	@RequestMapping ( "/productModifyPro" )
	public String productModifyPro ( HttpServletRequest request, HttpServletResponse response ) {
		return "redirect:productDetail.jk";
	}
	@RequestMapping("/productDeletePro")
	public ModelAndView productDeletePro(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("adm/pro/productDeletePro");
	}
	@RequestMapping("/orderStatusChange")
	public String orderStatusChange(HttpServletRequest request, HttpServletResponse response) {
		return "redirect:admOrderList.jk";
	}
	@RequestMapping("/admReviewDelete")
	public ModelAndView admReviewDelete(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("adm/pro/admReviewDelete");
	}
	@RequestMapping("/tagInputPro")
	public ModelAndView tagInputPro(HttpServletRequest requset, HttpServletResponse response) {
		return new ModelAndView("adm/pro/tagInputPro");
	}
	@RequestMapping("/tagDeletePro")
	public ModelAndView tagDeletePro(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("adm/pro/tagDeletePro");
	}
	@RequestMapping("/tagModifyPro")
	public String tagModifyPro(HttpServletRequest request, HttpServletResponse response) {
		return "redirect:tagList.jk";
	}
}
