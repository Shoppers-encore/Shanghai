package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import db.UserDao;
import db.BasketDao;
import db.BoardDao;
import db.OrderDao;
import db.ProductDao;
import db.ChatDao;
import db.TagDao;

import databean.UserDataBean;

@Controller
public class UserProHandler {
	@Resource
	private UserDao userDao;
	
	@RequestMapping( "/userInputPro" )
	public ModelAndView userInputPro (HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("user/pro/userInputPro");
	}
	@RequestMapping( "/userLoginPro" )
	public ModelAndView userLoginPro ( HttpServletRequest request, HttpServletResponse response ) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		UserDataBean userDto = userDao.getUser(id);
		
		int result = userDao.check(id, password);
		request.setAttribute("result", result);
		request.setAttribute("id", id);
		
		if (result != -1) {
			request.setAttribute("userDto", userDto);
		}
		return new ModelAndView("user/pro/userLoginPro");
	}
	@RequestMapping( "/userModifyPro" )
	public String userModifyPro (HttpServletRequest request, HttpServletResponse response) {
		return "redirect:userModifyView.jk";
	}
	@RequestMapping( "/userDeletePro" )
	public ModelAndView userDeletePro (HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("user/pro/userDeletePro");
	}
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		return "redirect:main.jk";
	}
	@RequestMapping( "/basketInput" )
	public ModelAndView basketInput ( HttpServletRequest request, HttpServletResponse response ) {
		String id = (String)request.getSeesion().getAttribute("memid");
		return new ModelAndView("user/pro/basketInput");
	}
	@RequestMapping( "/basketModify" )
	public ModelAndView basketModify ( HttpServletRequest request, HttpServletResponse response ) {
		return new ModelAndView( "user/pro/basketModify" );
	}
	
	@RequestMapping( "/basketDelete" )
	public ModelAndView basketDelete ( HttpServletRequest request, HttpServletResponse response ) {
		return new ModelAndView( "user/pro/basketDelete" );
	}
	@RequestMapping( "/reviewWritePro" )
	public ModelAndView reviewWritePro (HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView( "user/pro/reviewWritePro" );
	}
	@RequestMapping( "/reviewModifyPro" )
	public String reviewModifyPro (HttpServletRequest request, HttpServletResponse response) {
		return "redirect:reviewContent.jk";
	}
	@RequestMapping( "/reviewDeletePro" )
	public ModelAndView reviewDeletePro (HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView( "user/pro/reviewDeletePro" );
	}
	@RequestMapping("/orderInputPro")
	public ModelAndView orderInputPro(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("user/pro/orderInputPro");
	}
}
