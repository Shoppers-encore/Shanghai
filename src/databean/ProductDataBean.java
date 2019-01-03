package databean;

import java.sql.Timestamp;

public class ProductDataBean {
	private int ref;
	private String productCode;
	private String productName;
	private String productContent;
	private int discount;
	private int productPrice;
	private Timestamp productRegDate;
	private int productQuantity;
	private int productCategory;
	private String thumbnail;
	private int productLevel;
	private int categoryDetail;
	
	
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductContent() {
		return productContent;
	}
	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public Timestamp getProductRegDate() {
		return productRegDate;
	}
	public void setProductRegDate(Timestamp productRegDate) {
		this.productRegDate = productRegDate;
	}
	public int getProductQuantity() {
		return productQuantity;
	}
	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}
	public int getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(int productCategory) {
		this.productCategory = productCategory;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public int getProductLevel() {
		return productLevel;
	}
	public void setProductLevel(int productLevel) {
		this.productLevel = productLevel;
	}
	public int getCategoryDetail() {
		return categoryDetail;
	}
	public void setCategoryDetail(int categoryDetail) {
		this.categoryDetail = categoryDetail;
	}
}
