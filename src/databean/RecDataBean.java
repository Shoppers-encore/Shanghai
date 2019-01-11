package databean;

public class RecDataBean {
	private String id;
	private int clusterId;
	private int categoryDetail;
	private int prediction;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getClusterId() {
		return clusterId;
	}
	public void setClusterId(int clusterId) {
		this.clusterId = clusterId;
	}
	public int getCategoryDetail() {
		return categoryDetail;
	}
	public void setCategoryDetail(int categoryDetail) {
		this.categoryDetail = categoryDetail;
	}
	public int getPrediction() {
		return prediction;
	}
	public void setPrediction(int prediction) {
		this.prediction = prediction;
	}
}
