package handler;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import databean.ImageInfoDataBean;
import databean.ProductDataBean;
import databean.ProductTagDataBean;
import databean.UserDataBean;
import db.BoardDao;
import db.OrderDao;
import db.ProductDao;
import db.TagDao;
import db.UserDao;
import etc.HandlerHelper;

@Controller
public class AdminProHandler {
	@Resource
	private UserDao userDao;
	@Resource
	private TagDao tagDao;
	public static final int USERLEVEL=9;
	@Resource
	private ProductDao productDao;
	@Resource
	private BoardDao boardDao;
	
	private HandlerHelper hh = new HandlerHelper();
	@RequestMapping("/admLoginPro")
	public ModelAndView admLoginPro ( HttpServletRequest request, HttpServletResponse response ) {
		String id = request.getParameter( "id" );
		String password = request.getParameter( "password" );
		UserDataBean userDto = userDao.getUser(id);
		int result = 0;
		if(userDto == null) {
			result = 0;
		}else if(userDto.getUserLevel() != USERLEVEL) {
			result = -9;
		} else if( userDto.getPassword().equals( password ) ) {
			result = 1; 
		} else if ( userDto.getPassword() != password ) {
			result = -1;
		}
		request.setAttribute( "result", result );
		if(result == 1) request.getSession().setAttribute("id", id);
		return new ModelAndView ("adm/pro/admLoginPro");
	}
	

	@RequestMapping ( "/productInputPro" )
	public ModelAndView productInputPro ( HttpServletRequest request, HttpServletResponse response ) throws IOException {
		ProductDao productDao = new ProductDao(); 
		ImageInfoDataBean imgDto = new ImageInfoDataBean();
		ProductTagDataBean productTagDto = new ProductTagDataBean();
		String path =  request.getSession().getServletContext().getRealPath( "/save" );
		MultipartRequest multi = null;
		new File( path ).mkdir();      // IF folder already exist -> Don't create / IF folder does not exist -> create
		if(-1 < request.getContentType().indexOf("multipart/form-data")) 
			multi = new MultipartRequest( request, path, 1024*1024*10, "UTF-8", new DefaultFileRenamePolicy() );
		int ref = Integer.parseInt( multi.getParameter( "product_code" ) ); 
		String thumbnail = null;
		String systemName = null;
		List<String> imageList = new ArrayList<String>();
		Enumeration<?> e = multi.getFileNames();
		while( e.hasMoreElements() ) {
			String inputName = (String) e.nextElement();
			systemName = multi.getFilesystemName( inputName );
			if(systemName==null) {
				for(int i = 0 ; i<imageList.size();i++) {
					File f = new File(imageList.get(i));
					if(f.exists()) f.delete();
				}
				request.setAttribute("result", -99);
				return new ModelAndView("adm/pro/productInputPro");
			}
			String sname = path + "\\" + systemName;
			String tname = null;
			new File(path+"\\"+ref).mkdir();
			int imageNo = 0;
			if(inputName.equals("thumb")) {
				tname = ref+"\\thumbnail"+ref+"-"+systemName;
			}else {
				imageNo = productDao.getImgNo()+1;
				tname = ref+"\\"+ref+"-"+imageNo+"-"+systemName;
			}
			File f = new File(sname);
			boolean a = f.renameTo(new File(path+"/"+tname));
			imageList.add(path+"/"+systemName);
			if(inputName.equals("thumb")) {
				thumbnail = tname;
			}else {
				imgDto.setImageNo(imageNo);
				imgDto.setRef( ref );
				imgDto.setImageAddress(tname);
				int result = productDao.insertImgInfo(imgDto);
				if( result == 1 ) {
					String sql = "INSERT INTO jk_imageInfo (imageno, ref, imageAddress)"+ "VALUES ("+imageNo+", "+ ref+", '"+imgDto.getImageAddress()+"' );";
					hh.fileWriter(sql);
				}
			}
//			File f = new File(path+sname);
//			if(f.exists()) f.delete();
			request.setAttribute( "systemName", systemName );
		}      
		String col[] = multi.getParameterValues( "color" );
		int colors[] = null;
		if( col != null ) {
			colors = new int[ col.length ];
			for( int i=0;i<col.length; i++ ) {
				colors[i] = Integer.parseInt( col[i] );
			}
		}
		String siz[] = multi.getParameterValues( "size" );
		int sizes[] = null;
		if( siz != null ) {
			sizes = new int[ siz.length ];
			for( int i=0;i<siz.length; i++ ) {
				sizes[i] = Integer.parseInt( siz[i] );
			}
		}
		String tag[] = multi.getParameterValues( "tag" );
		int tags[] = null;
		if( tag != null ) {
			tags = new int[ tag.length ];
			for( int i=0; i<tag.length; i++ ) {
				tags[i] = Integer.parseInt( tag[i] );
				productTagDto.setRef( ref );
				productTagDto.setTagid(  tags[i] );	
				int tagId = tags[i];
				int result1 = tagDao.insertProdTag(productTagDto);
				if( result1 == 1 ) {
					String sql = "INSERT INTO jk_ProductTag (ref, tagId) VALUES ("+ ref + ", " + tagId + ");";
					hh.fileWriter(sql);
				}
			}
		}
		//yint ref = Integer.parseInt( multi.getParameter( "product_code" ) ); 
		ProductDataBean productDto = new ProductDataBean();
		String[] product_codes = hh.makeProductCode(colors, sizes, ref);
		for( int i=0; i<product_codes.length; i++ ) {
			ref = Integer.parseInt( multi.getParameter( "product_code" ) ); 
			String product_name = multi.getParameter( "product_name" );
			int quantity = 0;
			int category = Integer.parseInt( multi.getParameter("category"));
			String good_content = multi.getParameter("good_content");
			int sale=0;
			int price = Integer.parseInt( multi.getParameter( "price" ) );
			try {
				sale=Integer.parseInt(multi.getParameter("sale"));
			}catch(NumberFormatException | NullPointerException e1) {
				sale = 0;
			}
			productDto.setRef( ref );
			productDto.setProductCode( product_codes[i] );
			productDto.setProductName( product_name ); 
			productDto.setProductContent( good_content );
			productDto.setProductPrice( price );
			productDto.setProductRegDate( new Timestamp( System.currentTimeMillis() ) );
//			productDto.setProductRegDate(new Timestamp(Long.parseLong("1544799600120")));
			productDto.setProductCategory( category );
			productDto.setProductQuantity( quantity );
			productDto.setThumbnail( thumbnail );   
			productDto.setDiscount( sale );
			productDto.setProductLevel( 1 );
			productDto.setCategoryDetail(hh.categoryDetail(price, category));
			int result2 = productDao.input( productDto );
			productDao.getProdCount();
			if( result2 >= 1 ) {
				String sql = "INSERT INTO jk_product (ref, productCode, productName, productContent, discount, productPrice, productRegDate, productQuantity, thumbnail, productCategory, productLevel,categoryDetail) "+ "VALUES (" + ref + ", '" + product_codes[i] +"', '" + product_name + "', '" + good_content + "', " + sale + ", " + price +  ", '"+productDto.getProductRegDate()+"', " + quantity + ", '" + thumbnail + "', " + category + ", 1, "+productDto.getCategoryDetail()+");";
				hh.fileWriter(sql);
			}
			request.setAttribute( "result", result2 );
		}  
		return new ModelAndView ( "adm/pro/productInputPro" );
	}
	   
	@RequestMapping ( "/productModifyPro" )
	public String productModifyPro ( HttpServletRequest request, HttpServletResponse response ) throws IOException {
		String path =  request.getSession().getServletContext().getRealPath( "/save" );
	    MultipartRequest multi = null;
	    new File( path ).mkdir();      // IF folder already exist -> Don't create / IF folder does not exist -> create
	    if(-1 < request.getContentType().indexOf("multipart/form-data")) 
	    	multi = new MultipartRequest( request, path, 1024*1024*10, "UTF-8", new DefaultFileRenamePolicy() );
	    int ref = Integer.parseInt( multi.getParameter( "product_code" ) );
	    String[] deleteFiles = multi.getParameterValues("delImg");
	    if(deleteFiles!=null) {
	    	for(int i = 0 ; i <deleteFiles.length;i++) {
	    		int deleteImageNo = Integer.parseInt(deleteFiles[i]);
	    		File f = new File(path+"/"+productDao.getDeleteImageAddress(deleteImageNo));
	    		System.out.println(f.exists() +" : " + deleteFiles[i]);
	    		if(f.exists()) {
	    			f.delete();
	    			productDao.deleteImage(deleteImageNo);
	    		}
	    	}
	    }
	    String systemName = null;
		Enumeration<?> e = multi.getFileNames();
		while( e.hasMoreElements() ) {
			String inputName = (String) e.nextElement();
			systemName = multi.getFilesystemName( inputName );
			String sname = path + "\\" + systemName;
			String tname = null;
			new File(path+"\\"+ref).mkdir();
			int imageNo = 0;
			if(inputName.equals("thumb")) {
				tname = ref+"\\thumbnail-"+ref+"-"+systemName;
			}else {
				imageNo = productDao.getImgNo()+1;
				tname = ref+"\\"+ref+"-"+imageNo+"-"+systemName;
			}
			File f = new File(sname);
			f.renameTo(new File(path+"/"+tname));
			if(inputName.equals("thumb")) {
			}else {
				ImageInfoDataBean imgDto = new ImageInfoDataBean();
				imgDto.setImageNo(imageNo);
				imgDto.setRef( ref );
				imgDto.setImageAddress(tname);
				int result = productDao.insertImgInfo(imgDto);
				if( result == 1 ) {
					String sql = "INSERT INTO jk_imageInfo (imageno, ref, imageAddress)"+ "VALUES ("+imageNo+", "+ ref+", '"+imgDto.getImageAddress()+"' );";
					hh.fileWriter(sql);
				}
			}
			
//			File f = new File(sname);
//			if(f.exists()) f.delete();
			request.setAttribute( "systemName", systemName );
		}  
		String[] color = multi.getParameterValues("color");
		String[] size = multi.getParameterValues("size");
		int[] colors = new int[color.length];
		for(int i = 0 ; i<color.length;i++) {
			colors[i] = Integer.parseInt(color[i]);
		}
		int[] sizes = new int[size.length];
		for(int i = 0 ; i<size.length;i++) {
			sizes[i]=Integer.parseInt(size[i]);
		}
		List<String> list = productDao.getProductCodeList(ref);
		String[] productCodes = hh.makeProductCode(colors, sizes, ref);
		for(int i = 0 ; i<productCodes.length ; i++) {
			ProductDataBean product = new ProductDataBean();
			product.setProductCode(productCodes[i]);
			product.setRef(ref);
			product.setProductName(multi.getParameter("product_name"));
			product.setProductContent(multi.getParameter("productContent"));
			product.setProductPrice(Integer.parseInt(multi.getParameter("price")));
			if(multi.getParameter("sale") !=null) {
				product.setDiscount(Integer.parseInt(multi.getParameter("sale")));
			}
			product.setProductCategory(Integer.parseInt(multi.getParameter("category")));
			product.setCategoryDetail(hh.categoryDetail(Integer.parseInt(multi.getParameter("price")), Integer.parseInt(multi.getParameter("sale"))));
			int result =productDao.modifyProduct(product);
			if(result ==1) {
				list.remove(productCodes[i]);
			}
		}
		for(int i = 0 ; i<list.size(); i++) {
			productDao.deleteProduct(list.get(i));
		}

		List<Integer> oldTagList = tagDao.getProductTagId(ref);
		String tag[] = multi.getParameterValues( "tag" );
		List<Integer> newTagList = new ArrayList<Integer>();
		for(int i=0; i<tag.length; i++) {
			newTagList.add( Integer.parseInt( tag[i] ) );
		}
		for(int i=0; i<newTagList.size(); i++) {
			int n = newTagList.get(i);
			for(int j=0; j<oldTagList.size(); j++) {
				int o = oldTagList.get(j);
				if( !oldTagList.contains( n ) ) {		// when oldTagList does not contain an element of newTagList => INSERT the new one
					ProductTagDataBean productTagDto = new ProductTagDataBean();
					productTagDto.setRef( ref );
					productTagDto.setTagid( n );	
					tagDao.insertProdTag(productTagDto);
				}
				if( !newTagList.contains(o) ) {		// when newTagList does not contain an element of oldTagList => DELETE the old one
					ProductTagDataBean productTagDto = new ProductTagDataBean();
					productTagDto.setRef( ref );
					productTagDto.setTagid( o );	
					tagDao.deleteProdTag(productTagDto);
				}
			}
		}
		
		return "redirect:admProductDetail.jk?ref="+ref;
	}
	@RequestMapping("/productDeletePro")
	public ModelAndView productDeletePro(HttpServletRequest request, HttpServletResponse response) {
		int ref = Integer.parseInt( request.getParameter("ref") );
		List<ProductDataBean> product =productDao.getProdDetail(ref);
		List<ImageInfoDataBean> images = productDao.getImgDetail(ref);
		String path =  request.getSession().getServletContext().getRealPath( "/save" );
		for(int i = 0; i<images.size()+1 ; i++) {
			File f = null;
			if(i==images.size()) {
				f=new File(path+product.get(0).getThumbnail());
				if(f.exists()) f.delete();
			}else {
				f=new File(path+images.get(i).getImageAddress());
				if(f.exists()) f.delete();
			}
		}
		productDao.deleteImg( ref );
		int result = productDao.deleteProd( ref );
		request.setAttribute( "result", result );
		return new ModelAndView("adm/pro/productDeletePro");
	}
	@RequestMapping("/orderStatusChange")
	public String orderStatusChange(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter( "id" );
		OrderDao orderDao = new OrderDao();
		String orderCode=request.getParameter("orderCode");
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("orderCode", orderCode);
		orderDao.changeStatus(map);
		return "redirect:admOrderList.jk";
	}
	@RequestMapping("/admReviewDelete")
	public ModelAndView admReviewDelete(HttpServletRequest request, HttpServletResponse response) {
		
		int reviewNo = Integer.parseInt( request.getParameter( "reviewNo" ) );
		int result = boardDao.reviewDelete( reviewNo );
		
		request.setAttribute( "result", result );
		return new ModelAndView("adm/pro/admReviewDelete");
	}
	@RequestMapping("/tagInputPro")
	public ModelAndView tagInputPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch ( UnsupportedEncodingException e ) {
			e.printStackTrace();
		}
		String newTag = request.getParameter( "newTag" );
		if ( newTag == null || newTag == "" ) {
			return new ModelAndView("adm/form/tagInputForm");
		} else {
			int result = tagDao.insertTag(newTag);
			String sql = "INSERT INTO jk_tag VALUES (tagIdSeq.NEXTVAL, '"+newTag+"');";
			hh.fileWriter(sql);
			request.setAttribute( "result", result );
			return new ModelAndView("adm/pro/tagInputPro");
		}
	}
	@RequestMapping("/tagDeletePro")
	public ModelAndView tagDeletePro(HttpServletRequest request, HttpServletResponse response) {
		String checked[] = request.getParameterValues("tag");
		int result = 0;
		for(int i=0; i<checked.length; i++) {
			result = tagDao.deleteTag( Integer.parseInt(checked[i]) );
		}
		request.setAttribute("result", result);
		return new ModelAndView("adm/pro/tagDeletePro");
	}
/*	@RequestMapping("/tagModifyPro")
	public String tagModifyPro(HttpServletRequest request, HttpServletResponse response) {
		return "redirect:tagList.jk";
	}*/
	@RequestMapping("/admModifyPro")
	public ModelAndView admModifyPro ( HttpServletRequest request, HttpServletResponse response ) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch ( UnsupportedEncodingException e ) {
			e.printStackTrace();
		}
		UserDataBean dto = new UserDataBean();
		dto.setId((String)request.getSession().getAttribute("id"));
		dto.setPassword(request.getParameter("passwd"));
		System.out.println(request.getParameter("passwd"));		// 1219 ONGOING BY JH
		dto.setName(request.getParameter("name"));
		dto.setTel(request.getParameter("tel"));
		dto.setEmail(request.getParameter("email"));
		int result = 0;
		result = userDao.admModify(dto);
		request.setAttribute("result", result);
		return new ModelAndView ("adm/pro/admModifyPro");
	}
	@RequestMapping("/admLogoutPro")
	public String admLogoutPro(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().setAttribute("id",null);
		return "redirect:admMain.jk";
	}

	@RequestMapping("/changeQuantity")
	 public String changeQuantity(HttpServletRequest request, HttpServletResponse response) {
	      String[] productCodes = request.getParameterValues("productCode");
	      String[] quantityCheck = request.getParameterValues("quantityMod");
	      ProductDataBean productDto = new ProductDataBean();
	         for(int i=0; i<productCodes.length; i ++) {
	            	int [] quantity = new int[quantityCheck.length];
	        		for(i=0; i<quantityCheck.length; i++) {
	        		quantity[i] = Integer.parseInt( quantityCheck[i] );
	        		int quan = 0;
	        	   if( quantity[i] > 0  ) {
	        		   quan = productDao.getProdQuantity( productCodes[i] ) + quantity[i];
	        	   } else { 
	        		   quan = productDao.getProdQuantity( productCodes[i] );
	        	   }
	        	   productDto.setProductQuantity( quan ); 
	        	   productDto.setProductCode( productCodes[i] );
	        	   
	        	   productDao.changeQuantity( productDto );
	        		}    
	         }
	         return "redirect:admProductList.jk";
	   }
	
}