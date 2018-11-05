package handler;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.servlet.ModelAndView;

import databean.ProductDataBean;
import databean.TagDataBean;
import databean.UserDataBean;
import db.ProductDao;
import db.TagDao;
import db.UserDao;

@Controller
public class AdminFormHandler {
	@Resource 
	private UserDao userDao;
	
	@RequestMapping("/admLoginForm")
	public ModelAndView admLoginForm(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("adm/form/admLoginForm");
	}
	@RequestMapping("/admMain")
	public ModelAndView admMain(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("id");
		UserDataBean userDto = userDao.getUser(id);
		request.setAttribute( "id", id );
		request.setAttribute( "userDto", userDto );
		return new ModelAndView("adm/form/admMain");
	}
	
	@RequestMapping("/admModifyView")
	public ModelAndView admModifyView(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("id");
		UserDataBean userDto = userDao.getUser(id);
		request.setAttribute( "id", id );
		request.setAttribute( "userDto", userDto );
		return new ModelAndView("adm/form/admModifyView");
	}
	@RequestMapping("/productInputForm")
	public ModelAndView productInputPro (HttpServletRequest request, HttpServletResponse response) {
		ProductDao productDao = new ProductDao();
		int ref = new ProductDataBean().getRef();
		if( ref > -1 ) {
			if(productDao.getProdCount() > 0) {
				ref = 1+productDao.getRef();
			}else {
				ref = 1;
			}
		}
		request.setAttribute("ref", ref);

		TagDao tagDao = new TagDao();
		List <TagDataBean> tags = tagDao.getTags();
		request.setAttribute("tags", tags);

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