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
		String id=(String)request.getSession().getAttribute("id");
		UserDataBean userDto = userDao.getUser(id);
		int ref = Integer.parseInt( request.getParameter("ref") );
		if( userDto.getUserLevel() == 9 ) {
			List<ProductDataBean> list = productDao.getProductDetail( ref );
			Map<String,Integer> colorMap = new HashMap<String,Integer>();
			Map<String,Integer> sizeMap = new HashMap<String, Integer>();
			HandlerHelper hh = new HandlerHelper();
			int[] colors = hh.decodeColorCode(list);
			int[] sizes = hh.decodeSizeCode(list);
			for(int i=0;i<colors.length;i++) {
				System.out.println("color" + colors[i]);
				colorMap.put("col"+new Integer(colors[i]).toString(), colors[i]);
			}
			for(int i = 0 ; i<sizes.length;i++) {
				System.out.println("size"+sizes[i]);
				sizeMap.put("siz"+new Integer(sizes[i]).toString(), sizes[i]);
			}
			request.setAttribute("ref", ref);
			request.setAttribute("colorMap", colorMap);
			request.setAttribute("sizeMap", sizeMap);
			request.setAttribute("colors", hh.colorArr());
			request.setAttribute("sizes", new String[]{"SS", "MM", "LL", "XL", "FR"});
			request.setAttribute("goods", list);
			//request.setAttribute("admin", new LogonDBBean().getAdm(id));
			return new ModelAndView("admGood/goodModifyForm");
		} else {
			return new ModelAndView("user/view/userMain");
		}
	}
}