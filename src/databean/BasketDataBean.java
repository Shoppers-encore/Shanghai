package databean;

public class BasketDataBean {
	private String id;
	private String productCode;
	private int basketQuantity;
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
	public int getBasketQuantity() {
		return basketQuantity;
	}
	public void setBasketQuantity(int basketQuantity) {
		this.basketQuantity = basketQuantity;
	}
}
