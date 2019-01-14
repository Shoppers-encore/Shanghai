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

import databean.ProductDataBean;
import databean.TagDataBean;
import db.TagDao;



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
		String product_codes[] = new String[ (colors.length * sizes.length)+1 ];
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
		return sizes;
	}
	
	public List <TagDataBean> tagList() {
		TagDao tagDao = new TagDao();
		List <TagDataBean> tags = tagDao.getTags();
		return tags;
	}

	public int[] removeDuplicate(int[] numbers){
		List<Integer> resultList = new ArrayList<Integer>();
		for(int i=0; i<numbers.length ; i++) {
			if(!resultList.contains(new Integer(numbers[i]))){
				resultList.add(numbers[i]);
			}
		}
		int[] result = new int[resultList.size()];
		for(int i=0; i<resultList.size(); i++) {
			result[i] = resultList.get(i);
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
					sizes[i]=tmp[j];
				}
			}
		}
		return sizes;
	}

	public void fileWriter(String sql) {
        File file = new File("C:/ExpertJava/insertSQL.txt");

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
	public int categoryDetail(int price, int category) {
		int categoryDetail = 0;
		if(category==1) {
			int maxPrice=130000;
			int gap = 16250;
			categoryDetail = category(price, category, maxPrice, gap);
		}else if(category==2) {
			int maxPrice=249000;
			int gap = 37500;
			categoryDetail = category(price, category, maxPrice, gap);
		}else if(category==3) {
			int maxPrice=55000;
			int gap = 7500;
			categoryDetail = category(price, category, maxPrice, gap);
		}else if(category==4) {
			int maxPrice=110000;
			int gap = 19750;
			categoryDetail = category(price, category, maxPrice, gap);
		}else if(category==5) {
			int maxPrice=50000;
			int gap = 7500;
			categoryDetail = category(price, category, maxPrice, gap);
		}else if(category==6) {
			int maxPrice=50000;
			int gap = 7500;
			categoryDetail = category(price, category, maxPrice, gap);
		}else if(category==7) {
			int maxPrice=30000;
			int gap = 5000;
			categoryDetail = category(price, category, maxPrice, gap);
		}else if(category==8) {
			int maxPrice=45000;
			int gap = 6250;
			categoryDetail = category(price, category, maxPrice, gap);
		}else if(category==9) {
			int maxPrice=60000;
			int gap = 7500;
			categoryDetail = category(price, category, maxPrice, gap);
		}else if(category==10) {
			int maxPrice=60000;
			int gap = 12500;
			categoryDetail = category(price, category, maxPrice, gap);
		}else if(category==11) {
			int maxPrice=75000;
			int gap = 11250;
			categoryDetail = category(price, category, maxPrice, gap);
		}else if(category==12) {
			int maxPrice=30000;
			int gap = 5000;
			categoryDetail = category(price, category, maxPrice, gap);
		}else if(category==13) {
			int maxPrice=19000;
			int gap = 4000;
			categoryDetail = category(price, category, maxPrice, gap);
		}else {
		}
		return categoryDetail;
	}
	public int category(int price, int category, int maxPrice, int gap) {
		int categoryDetail=0;
		if(price>maxPrice-gap) {
			categoryDetail = (category-1)*4+1;
		}else if(price>maxPrice-(gap*2)) {
			categoryDetail = (category-1)*4+2;
		}else if(price>maxPrice-(gap*3)) {
			categoryDetail = (category-1)*4+3;
		}else {
			categoryDetail = (category-1)*4+4;
		}
		return categoryDetail;
	}
}
