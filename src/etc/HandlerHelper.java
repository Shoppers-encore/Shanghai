package etc;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import databean.ImageInfoDataBean;
import databean.ProductDataBean;
import db.ProductDao;



public class HandlerHelper {
	public Map<String, String> makeCount(int count, HttpServletRequest request) {
		int pageSize = 12;
		int pageBlock = 5;
		int start = 0;
		int end = 0;
		String pageNum = null;
		int currentPage = 0;
		int number = 0;
		int startPage = 0;
		int endPage = 0;
		int pageCount = 0;
		pageNum = request.getParameter("pageNum");
		if(pageNum == null || pageNum.equals("")) {
			pageNum="1";
		}
		currentPage = Integer.parseInt(pageNum);
		pageCount = (int)(count/pageSize)+(count%pageSize>0?1:0);
		if(currentPage>pageCount)currentPage = pageCount;
		start = (currentPage-1)*pageSize+1;
		end=start+pageSize-1;
		if(end>count) end=count;
		number=count-(currentPage-1)*pageSize;
		System.out.println(start + " , " + end);
		startPage=(currentPage/pageBlock)*pageBlock+1;
		if(currentPage%pageBlock==0)startPage-=pageBlock;
		endPage=startPage+pageBlock-1;
		if(endPage>pageCount)endPage=pageCount;
		request.setAttribute("count", count);
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage",currentPage);
		request.setAttribute("number", number);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		Map<String, String> map = new HashMap<String, String>();
		map.put("start", new Integer(start).toString());
		map.put("end", new Integer(end).toString());
		return map;
	}

	public String[] makeProductCode( int[] colors, int[] sizes ,int ref) {

		System.out.println(colors.length);
		System.out.println(ref);
		System.out.println(sizes.length);
		String product_codes[] = new String[ (colors.length * sizes.length)+1 ];
		System.out.println(product_codes.length);
		String color[] = { "WH", "BK", "RD", "OR", "YL", "GN", "BL", "SK",  "NV", "PP", "BR", "GR", "BG", "PK" };
		String size[] = { "SS", "MM", "LL", "XL", "FR" };
		
		
		
		product_codes[0] = new Integer(ref).toString();
		for(int i = 0; i<colors.length ; i++) {
			for(int j = 0; j<sizes.length ; j++) {
				product_codes[j+(i*sizes.length)+1] =
						color[colors[i]] + new Integer(ref).toString() + size[sizes[j]];
			}
		}
		
		return product_codes;
	}
	public String[] colorArr() {
		String[] color = { "WH", "BK", "RD", "OR", "YL", "GN", "BL", "SK", "NV", "PP", "BR", "GR", "BG", "PK" };
		return color;
	}

	public int[] decodeColorCode(List<ProductDataBean> productList) {
		int[] results = new int[productList.size()];
		String[] color = colorArr();
		for(int i = 0 ; i<productList.size() ; i++) {
			for(int j=0; j < color.length ; j++) {
				if(productList.get(i).getProductCode().contains(color[j])) {
					results[i]=j;
					break;
				}
			}
		}
		int[] colors = removeDuplicate(results);
		for(int i=0; i <colors.length ; i++)
		System.out.println("color : "+colors[i]);
		return colors;
	}

	public int[] decodeSizeCode(List<ProductDataBean> productList) {
		int[] results = new int[productList.size()];
		String[] size = { "SS", "MM", "LL", "XL", "FR" };
		for(int i = 0 ; i<productList.size(); i++) {
			for(int j=0;j< size.length;j++) {
				if(productList.get(i).getProductCode().contains(size[j])) {
					results[i]=j;
					break;
				}
			}
		}
		int[] sizes = removeDuplicate(results);
		for(int i = 0 ; i<sizes.length;i++)
		System.out.println("size : " +sizes[i]);
		return sizes;
	}
	
	public int[] removeDuplicate(int[] numbers){
		List<Integer> resultList = new ArrayList<Integer>();
		for(int i=0; i<numbers.length ; i++) {
			if(!resultList.contains(new Integer(numbers[i])) && i!=0){
				resultList.add(numbers[i]);
				System.out.println("duplev "+numbers[i]);
			}
		}
		int[] result = new int[resultList.size()];
		for(int i=0; i<resultList.size(); i++) {
			result[i] = resultList.get(i);
			System.out.println("duple2 "+result[i]);
		}
		return result;
	}
	public String[] whatColor(int[] color) {
		String[] tmp = new String[]{ "WH", "BK", "RD", "OR", "YL", "GN", "BL", "SK", "NV", "PP", "BR", "GR", "BG", "PK" };
		String[] colors = new String[color.length];
		for(int i=0; i<color.length;i++) {
			for(int j=0;j<tmp.length;j++) {
				if(color[i] == j)
					colors[i]=tmp[j];
				System.out.println(color[i]);
			}
		}
		return colors;
	}
	public String[] whatSize(int[] size) {
		String[] tmp = new String[] { "SS", "MM", "LL", "XL", "FR" };
		String[] sizes = new String[size.length];
		for(int i=0; i<size.length;i++) {
			for(int j=0; j<tmp.length;j++) {
				if(size[i]==j) {
					System.out.println(size[i]);
					sizes[i]=tmp[j];
				}
			}
		}
		return sizes;
	}
	//////////////////////////////////////////// ### 1 FROM HERE /////////////////////////////////////////////////////

	public void getGoodImage(HttpServletRequest request, String searchWord) {	// OVERRIDNG METHOD FOR PRODUCT NAME SEARCH
		ProductDao  productDao= new ProductDao();
		int count = productDao.getSearchCount(searchWord);
		Map<String,String> map = makeCount(count,request);
		map.put("searchWord", searchWord);
		List<ProductDataBean> productList = productDao.getNameSearch(map);
		List<ImageInfoDataBean> imgList = new ArrayList<ImageInfoDataBean>();
		for(int i = 0 ; i<productList.size(); i++) {	
			int ref = productList.get(i).getRef();		
			List<ImageInfoDataBean> data = productDao.getImage(ref);
			imgList.addAll(data);
		}
		request.setAttribute("goods", productList);
		request.setAttribute("imageList", imgList);
	}

	public void getGoodImage(HttpServletRequest request, String searchWord, String selectedColors) {	// OVERRIDNG METHOD FOR PRODUCT NAME + COLOR SEARCH
		ProductDao dao = new ProductDao();
		
		int count = dao.getColorSearchCount(searchWord, selectedColors);
		Map<String, String> map = makeCount(count,request);
		map.put("searchWord", searchWord);
		map.put("selectedColors", selectedColors);


		List<ProductDataBean> productList = dao.getColorSearchList(map);
		List<ImageInfoDataBean> imgList = new ArrayList<ImageInfoDataBean>();
		for(int i = 0 ; i<productList.size(); i++) {	
			int ref = productList.get(i).getRef();		
			List<ImageInfoDataBean> data = dao.getImage(ref);
			imgList.addAll(data);
		}
		request.setAttribute("goods", productList);
		request.setAttribute("imageList",imgList);
	}

	//////////////////////////////////////////// ### 1 TO HERE /////////////////////////////////////////////////////

	public void fileWriter(String sql) {
        File file = new File("C:/ExpertJava/start.txt");

        FileWriter fw;
		try {
			fw = new FileWriter(file, true);
			PrintWriter pw = new PrintWriter( fw, true );
        	pw.println(sql);
	        pw.flush();
	        pw.close();
	        fw.close();
	        } catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
