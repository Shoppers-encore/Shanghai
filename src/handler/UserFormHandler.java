package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserFormHandler {
	@RequestMapping("/userInputForm")
	public ModelAndView userInputForm(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("user/form/userInputForm");
	}
	@RequestMapping("/userLoginForm")
	public ModelAndView userLoginForm(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("user/form/userLoginForm");
	}
	@RequestMapping( "/confirmId" )
	public ModelAndView confirmId (HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView ( "user/form/confirmId" );
	}
	@RequestMapping( "/userModifyForm" )
	public ModelAndView userModifyForm (HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView( "user/form/userModifyFrom" );
	}
	@RequestMapping( "/reviewWriteForm" )
	public ModelAndView reviewWriteForm (HttpServletRequest request, HttpServletResponse response) throws Exception {
		return new ModelAndView( "user/form/reviewWriteForm" );
	}
	@RequestMapping( "/reviewModifyForm" )
	public ModelAndView reviewModifyForm (HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("user/form/reviewModifyForm");
	}
	@RequestMapping("/orderInputForm")
	public ModelAndView orderInputForm(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("user/form/orderInputForm");
	}
}
