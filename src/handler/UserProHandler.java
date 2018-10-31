package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import databean.UserDataBean;
import db.UserDao;

@Controller
public class UserProHandler {
	@RequestMapping( "/userInputPro" )
	public ModelAndView userInputPro (HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("user/pro/userInputPro");
	}
	@RequestMapping( "/userLoginPro" )
	public ModelAndView userLoginPro ( HttpServletRequest request, HttpServletResponse response ) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		UserDataBean userDto = UserDao.getUser(id);
		
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
