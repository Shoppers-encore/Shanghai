package handler;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import databean.ImageInfoDataBean;
import databean.ProductDataBean;
import databean.TagDataBean;
import databean.UserDataBean;
import db.ProductDao;
import db.TagDao;
import db.UserDao;
import etc.HandlerHelper;

@Controller
public class AdminFormHandler {
	@Resource
	private UserDao userDao;
	@Resource
	private ProductDao productDao;
	@Resource
	private TagDao tagDao;
	

	public ModelAndView admLoginForm(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("adm/form/admLoginForm");
	}
	@RequestMapping("/admMain")
	public ModelAndView admMain(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("id");
		if(id == null) {
			return admLoginForm(request, response);
		}
		UserDataBean userDto = userDao.getUser(id);
		if(userDto.getUserLevel()!=9) {
			return admLoginForm(request, response);
		}
		request.setAttribute( "id", id );
		request.setAttribute( "userDto", userDto );
		return new ModelAndView("adm/form/admMain");
	}
	
	@RequestMapping("/admModifyView")
	public ModelAndView admModifyView(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("id");
		if(id == null) return admLoginForm(request, response);
		UserDataBean userDto = userDao.getUser(id);
		if(userDto.getUserLevel() != 9) return admLoginForm(request, response);
		request.setAttribute( "id", id );
		request.setAttribute( "userDto", userDto );
		return new ModelAndView("adm/form/admModifyView");
	}
	@RequestMapping("/productInputForm")
	public ModelAndView productInputPro (HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("id");
		if(id == null) return admLoginForm(request, response);
		UserDataBean userDto = userDao.getUser(id);
		if(userDto.getUserLevel() != 9) return admLoginForm(request, response);
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
		String id = (String)request.getSession().getAttribute("id");
		if(id == null) return admLoginForm(request, response);
		UserDataBean userDto = userDao.getUser(id);
		if(userDto.getUserLevel() != 9) return admLoginForm(request, response);
		if( userDto.getUserLevel() == 9 ) {
			int ref = Integer.parseInt( request.getParameter("ref") );
			List<ProductDataBean> list = productDao.getProductDetail( ref );
			Map<String,Integer> colorMap = new HashMap<String,Integer>();
			Map<String,Integer> sizeMap = new HashMap<String, Integer>();
			HandlerHelper hh = new HandlerHelper();
			int[] colors = hh.decodeColorCode(list);
			int[] sizes = hh.decodeSizeCode(list);
			for(int i=0;i<colors.length;i++) {
				colorMap.put("col"+new Integer(colors[i]).toString(), colors[i]);
			}
			for(int i = 0 ; i<sizes.length;i++) {
				sizeMap.put("siz"+new Integer(sizes[i]).toString(), sizes[i]);
			}
			List<ImageInfoDataBean> imageList = productDao.getImgDetail(ref);
			TagDao tagDao = new TagDao();
			List <TagDataBean> tags = tagDao.getTags();
			List<Integer> checkedTags = tagDao.getProductTagId(ref);
			request.setAttribute("imageList",imageList);
			request.setAttribute("allTags", tags);
			request.setAttribute("colorMap", colorMap);
			request.setAttribute("sizeMap", sizeMap);
			request.setAttribute("checkedTags", checkedTags);
			request.setAttribute("products", list);
			return new ModelAndView("adm/form/productModifyForm");
		} else {
			return new ModelAndView("user/view/userMain");
		}
	}

}