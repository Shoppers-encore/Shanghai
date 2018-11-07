package handler;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import databean.CommentDataBean;
import databean.ImageInfoDataBean;
import databean.ProductDataBean;
import databean.ProductTagDataBean;
import databean.TagDataBean;
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
	
	@RequestMapping("/admLoginPro")
	public ModelAndView admLoginPro ( HttpServletRequest request, HttpServletResponse response ) {
		String id = request.getParameter( "id" );
		String password = request.getParameter( "password" );
		UserDataBean userDto = userDao.getUser(id);
		int result = 0;
		if(userDto.getUserLevel() != USERLEVEL) {
			result = -9;
		} else if( userDto.getPassword().equals( password ) ) {
			result = 1; 
		} else if ( userDto.getPassword() != password ) {
			result = -1;
		}
		request.setAttribute( "result", result );
		request.getSession().setAttribute("id", id);
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
	         multi = new MultipartRequest( request, path, 1024*1024*5, "UTF-8", new DefaultFileRenamePolicy() );
	      int ref = Integer.parseInt( multi.getParameter( "product_code" ) ); 
	         
	      String systemName = null;
	      Enumeration<?> e = multi.getFileNames();
	      
	      while( e.hasMoreElements() ) {
	         String inputName = (String) e.nextElement();
	         //String originName = multi.getOriginalFileName( inputName );
	          systemName = multi.getFilesystemName( inputName );
	         
	         String sname = path + "\\" + systemName;            // love5.png
	         String tname = path + "\\t" + systemName;         // tlove5.png
	         RenderedOp op = JAI.create("fileload", sname);
	         BufferedImage sbuffer = op.getAsBufferedImage();
	         
	         int SIZE = 3;
	         int width = sbuffer.getWidth() / SIZE;
	         int height = sbuffer.getHeight() / SIZE;
	         
	         BufferedImage tbuffer = new BufferedImage( width, height, BufferedImage.TYPE_INT_RGB );
	         Graphics g = tbuffer.getGraphics();
	         g.drawImage(sbuffer, 0, 0, width, height, null );   
	   
	            ImageIO.write( tbuffer, "jpg", new File( tname ) );   
	            ImageIO.write( tbuffer, "png", new File( tname ) );
	            ImageIO.write( tbuffer, "gif", new File( tname ) );
	        
	           
	          int imageNo = productDao.getImgNo()+1;
	  	      imgDto.setImageNo(imageNo);
	  	      imgDto.setRef( ref );
	  	      imgDto.setImageAddress(systemName);
	  	      int result = productDao.insertImgInfo(imgDto);
	  	      
		  	   if( result == 1 ) {
		  		   String sql = "INSERT INTO jk_imageInfo (imageno, ref, imageAddress)"
		               		+ "VALUES ("+imageNo+", "+ ref+", '"+systemName+"' );";
	              new HandlerHelper().fileWriter(sql);
		  	   }
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
		  		   String sql = "INSERT INTO jk_ProductTag (ref, tagId)"
		               		+ "VALUES (" + ref + "," + tagId + " );";
	              new HandlerHelper().fileWriter(sql);
		  	   }
	      	}
	      }
	     //yint ref = Integer.parseInt( multi.getParameter( "product_code" ) ); 
	      ProductDataBean productDto = new ProductDataBean();
	      String[] product_codes = new HandlerHelper().makeProductCode(colors, sizes, ref);
	      //String product_code[] = this.makeProductCode( int colors[], int sizes[] );
	      
	      for( int i=0; i<product_codes.length; i++ ) {
	    	  
	    	 ref = Integer.parseInt( multi.getParameter( "product_code" ) ); 
	    	 String product_name = multi.getParameter( "product_name" );
	    	 int quantity = Integer.parseInt( multi.getParameter( "quantity" ) );
	    	 int category = Integer.parseInt( multi.getParameter("category"));
	    	 String good_content = multi.getParameter("good_content");	    	
	    	 String saleCheck = multi.getParameter( "sale" );
	    	 int sale;
	    	 
	    	 if( saleCheck == null || saleCheck.equals("") ) {
	    		 productDto.setDiscount( 0 );
	    		 sale = 0;
	    	 } else {
	    		 sale = Integer.parseInt( saleCheck );
	    		 productDto.setDiscount( sale );
	    	 }
	    	 
	    	 int price = Integer.parseInt( multi.getParameter( "price" ) );
		     String thumbnail = productDao.getImgAddress( ref );
		     // System.out.println( thumbnail );
	         productDto.setRef( ref );
	         productDto.setProductCode( product_codes[i] );
	         productDto.setProductName( product_name ); 
	         productDto.setProductContent( good_content );
	         productDto.setProductPrice( price );
	         productDto.setProductRegDate( new Timestamp( System.currentTimeMillis() ) );
	         productDto.setProductCategory( category );
	         productDto.setProductQuantity( quantity );
	         productDto.setThumbnail( thumbnail );         
	         
	        int result2 = productDao.input( productDto );
	         
	        productDao.getProdCount();

	         if( result2 >= 1 ) {
	               String sql = "INSERT INTO jk_product (ref, productCode, productName, productContent, discount, productPrice, productRegDate, productQuantity, thumbnail, productCategory) "
		               		+ "VALUES (" + ref + ", '" + product_codes[i] +"', " + product_name + ", '" + good_content + "', " + sale + ", " + price +  ", sysdate, " + quantity + "," + category + ", '" + thumbnail + "');";
	               new HandlerHelper().fileWriter(sql);
	         }
	         
	         request.setAttribute( "result", result2 );
	      }  
		return new ModelAndView ( "adm/pro/productInputPro" );
	   }
	   
	@RequestMapping ( "/productModifyPro" )
	public String productModifyPro ( HttpServletRequest request, HttpServletResponse response ) {
		return "redirect:productDetail.jk";
	}
	@RequestMapping("/productDeletePro")
	public ModelAndView productDeletePro(HttpServletRequest request, HttpServletResponse response) {
		int ref = Integer.parseInt( request.getParameter("ref") );
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
	@RequestMapping("/tagModifyPro")
	public String tagModifyPro(HttpServletRequest request, HttpServletResponse response) {
		return "redirect:tagList.jk";
	}
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
		dto.setName(request.getParameter("name"));
		dto.setTel(request.getParameter("tel"));
		dto.setEmail(request.getParameter("email"));
		int result = userDao.admModify(dto);
		request.setAttribute("result", result);
		return new ModelAndView ("adm/pro/admModifyPro");
	}
	@RequestMapping("/admLogoutPro")
	public String admLogoutPro(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().setAttribute("memid",null);
		return "redirect:admLoginForm.jk";
	}
	
	@RequestMapping("/changeQuantity")
	public ModelAndView changeQuantity(HttpServletRequest request, HttpServletResponse response) {
		String[] productCodes = request.getParameterValues("productCode");
		String[] quantityMod = request.getParameterValues("quantityMod");
			for(int i=0; i<productCodes.length; i ++) {
				if( quantityMod[i] != null ) {
					ProductDataBean productDto = new ProductDataBean();
					productDto.setProductCode( productCodes[i] );
					int [] quantity = new int[quantityMod.length];
					quantity[i] = Integer.parseUnsignedInt( quantityMod[i] );
					productDto.setProductQuantity( quantity[i] );
					productDao.changeQuantity( productDto );
			}
		}
			return new ModelAndView ("adm/pro/changeQuantity");
	}
	
	
	
}
		/*
		String[] productCodes = request.getParameterValues("productCode");
		String[] quantityMod = request.getParameterValues("quantityMod");
			for(int i=0; i<productCodes.length; i ++) {
				if( quantityMod[i] != null ) {
					productDao.changeQuantity(productCodes[i]);
			}
		}*/
