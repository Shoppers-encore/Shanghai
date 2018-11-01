package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import databean.UserDataBean;
import db.UserDao;

@Controller
public class AdminProHandler {
	@Resource
	private UserDao userDao;
	public static final int USERLEVEL=9;
	
	@RequestMapping("/admLoginPro")
	public ModelAndView admLoginPro ( HttpServletRequest request, HttpServletResponse response ) {
		String id = request.getParameter( "id" );
		System.out.println(id);
		String password = request.getParameter( "password" );
		System.out.println(password);
		UserDataBean userDto = userDao.getUser(id);
		int result = 0;
		if( userDto.getUserLevel() == USERLEVEL && 
				userDto.getPassword().equals( password ) ) {
			result = 1; 
		}
		request.setAttribute( "result", result );
		request.getSession().setAttribute("memid", id);
		return new ModelAndView ("adm/pro/admLoginPro");
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
