package databean;

import java.sql.Timestamp;

public class ReviewDataBean {
	private int	orderCode;
	private int reviewNo;
	private String title;
	private String reviewContent;
	private Timestamp reviewDate;
	private String id;
	private String productCode;
	private String productName;
	private double rating;
	private String photo1;
	private String photo2;
	private int reviewScoreSum;
	private boolean checkedme;
	private int productLevel;
	public int getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}
	public int getReviewScoreSum() {
		return reviewScoreSum;
	}
	public void setReviewScoreSum(int reviewScoreSum) {
		this.reviewScoreSum = reviewScoreSum;
	}
	public boolean isCheckedme() {
		return checkedme;
	}
	public void setCheckedme(boolean checkedme) {
		this.checkedme = checkedme;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public Timestamp getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Timestamp reviewDate) {
		this.reviewDate = reviewDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public String getPhoto1() {
		return photo1;
	}
	public void setPhoto1(String photo1) {
		this.photo1 = photo1;
	}
	public String getPhoto2() {
		return photo2;
	}
	public void setPhoto2(String photo2) {
		this.photo2 = photo2;
	}
	public int getProductLevel() {
		return productLevel;
	}
	public void setProductLevel(int productLevel) {
		this.productLevel = productLevel;
	}
}
