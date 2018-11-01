package handler;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import databean.UserDataBean;
import db.UserDao;
import logon.Adm_LogonDataBean;
import logon.LogonDBBean;

@Controller
public class AdminFormHandler {
	@RequestMapping("/admLoginForm")
	public ModelAndView admLoginForm(HttpServletRequest request, HttpServletResponse response) {
		String id = (String) request.getSession().getAttribute("memid");
		if(id != null) {
			if(id.length() <= 5) {
				UserDataBean admin = new UserDao().getAdm(id);
				request.setAttribute("admin", admin);
				}		
			}
		return new ModelAndView("admin/form/admLoginForm");
		}
	@RequestMapping("/admMain")
	public ModelAndView admMain(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("adm/form/admMain");
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
}