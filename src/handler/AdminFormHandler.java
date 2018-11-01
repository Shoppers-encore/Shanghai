package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class AdminFormHandler {
	@RequestMapping("admMain")
	public ModelAndView admMain(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("adm/form/admLoginForm");
	}
	@RequestMapping("/admModifyView")
	public ModelAndView admModifyView(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("adm/form/admModifyView");
	}
	@RequestMapping("/productInputForm")
	public ModelAndView productInputPro (HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("adm/form/productInputForm");
	}
	@RequestMapping("/tagInputForm")
	public ModelAndView tagInputForm(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("adm/form/tagInputForm");
	}
	@RequestMapping("/productModifyForm")
	public ModelAndView productModifyForm(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("adm/form/tagInputForm");
	}
}