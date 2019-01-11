package db;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;
import databean.ImageInfoDataBean;
import databean.ProductDataBean;


public class ProductDao{
	private SqlSession session = SqlMapClient.getSession();

	public int getProductCount(Map<String, String> map) {
		return session.selectOne("User.getProductColorSearchCount", map);
	}
	
	public List<ProductDataBean> getProductList(Map<String, String> map) {
		return session.selectList("User.getProductColorSearchList", map);
	}
	
	public String getProductName(String productCode) {
		return session.selectOne("User.getProductName", productCode);
	}

	public List<ProductDataBean> getProductDetail(int ref) {
		return session.selectList("User.getProductDetail",ref);
	}

	public List<ProductDataBean> getProductCodesByRef(String ref) {
		return session.selectList("User.getProductCodesByRef", ref);
	}

	public int getSearchCount(String searchWord) {	
		return session.selectOne("Admin.getSearchCount", searchWord);
	}
	
	public List<ProductDataBean> getNameSearch(Map<String,String> map){
		return session.selectList("Admin.getProductSearchList", map);
	}
	
	public int getProdCount() {
		return session.selectOne("Admin.getProdCount");
	}
	
	public List<ProductDataBean> getProdList(Map<String, String> map){
		List<ProductDataBean> productList = null;
		productList = session.selectList("Admin.getProdList", map);
			return productList;
	}
	
	public int getRef() {
		return session.selectOne("Admin.getRef");
		// used when adding new product, by returning max(ref)
	}
	public int getRefNo() {
		return session.selectOne("Admin.getRefNo");
		// used when extracting ref number from productCode
	}
	
	public int input(ProductDataBean productDto) {
		return session.insert("Admin.input", productDto);
	}
	
	public int getImgNo() {
		int num = 0;
		if(session.selectOne("Admin.maxImg") == null) {
			num = 0;
		}else {
			num = session.selectOne("Admin.maxImg");
		}
		return num;
	}
	
	public int insertImgInfo(ImageInfoDataBean imgDto) {
		return session.insert("Admin.insertImg", imgDto);
	}

	//For basket's Thumbnail use
	public String getThumbnail(String productCode) {
		return session.selectOne("User.getProductThumbnail", productCode);
	}

	public String getImgAddress( int ref ) {
		return session.selectOne("Admin.getImgAddress", ref);
	}
	
	public int getTagNo() {
		int num = 0;
		if(session.selectOne("Admin.maxTag") == null) {
			num = 0;
		}else {
			num = session.selectOne("Admin.maxTag");
		}
		return num;
	}
	public int getProductNoSearchCount(Map<String, String> map) {
		return session.selectOne("User.getProductNoSearch", map);
	}

	public List<ProductDataBean> getNoSearchProductList(Map<String, String> map) {
		return session.selectList("User.getProductNoSearchList", map);
	}
	public int getProductQuantityCount(String productList) {
		return session.selectOne("User.getProductQuantityCount", productList);
	}

	public int getProductQuantity(String productList) {
		return session.selectOne("User.getProductQuantity", productList);
	}
	public List<ProductDataBean> getProdDetail(int ref) {
		return session.selectList("Admin.getProdDetail", ref);
	}
	
	public List<ImageInfoDataBean> getImgDetail(int ref) {
		return session.selectList("Admin.getImgDetail", ref);
	}
	
	public int deleteImg(int ref) {
		return session.delete("Admin.deleteImg", ref);
	}
	
	public int deleteProd(int ref) {
		return session.delete("Admin.deleteProd", ref);
	}
	
	public ProductDataBean getProductDetailsByProductCode(String productCode) {
		return session.selectOne("User.getProductDetailsByProductCode", productCode);
	}
	
	public String getProdName(String productCode) {
		return session.selectOne("Admin.getProdName", productCode);
	}
	
	public int changeQuantity(ProductDataBean productDto) {
		return session.update("Admin.changeQuantity", productDto);
	}
	
	public int getProdQuantity(String productCode) {
		return session.selectOne("Admin.getProdQuantity", productCode);
	}

	public List<String> getProductCodeList(int ref) {
		return session.selectList("Admin.getProductCodeList",ref);
	}

	public int modifyProduct(ProductDataBean product) {
		return session.update("Admin.modifyProduct", product);
	}

	public int deleteProduct(String product) {
		return session.delete("Admin.deleteProduct", product);
	}

	public List<String> getProdCode() {
		return session.selectList("User.getProdCode");
	}
	
	public List<Integer> getProdRef() {
		return session.selectList("User.getProdRef");
	}

	public List<Integer> getBestProduct() {
		return session.selectList("User.getBestProduct");
	}
	
	public List<ProductDataBean> getBestList(int ref) {
		return session.selectList("User.getBestList", ref);
	}
	
	public int getProductDetailSearchCount(String searchWord) {
		return session.selectOne("Admin.getProductDetailSearchCount", searchWord);
	}
	public List<ProductDataBean> getProductDetailSearchList(Map<String, String> map) {
		return session.selectList("Admin.getProductDetailSearchList", map);
	}

	public int deleteImage(int imageNo) {
		return session.delete("Admin.deleteImage", imageNo);
	}

	public String getDeleteImageAddress(int deleteImageNo) {
		return session.selectOne("Admin.getDeleteImageAddress", deleteImageNo);
	}

	public int getProductLevel(String productCode) {
		return session.selectOne("User.getProductLevel", productCode);
	}
	
	public ProductDataBean getBestProductByCategoryDetail(int categoryDetail) {
		return session.selectOne("User.getBestProductByCategoryDetail", categoryDetail);
	}
	
	public ProductDataBean getOneProductByCategoryDetail(int categoryDetail) {
		return session.selectOne("User.getOneProductByCategoryDetail", categoryDetail);
	}
}
