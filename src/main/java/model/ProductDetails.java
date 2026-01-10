package model;

public class ProductDetails {
	private Integer productID;
    private String material;
    private String fabricWeight;
    private String colors;
    private String fit;
    private String care;
	public ProductDetails(Integer productID, String material, String fabricWeight, String colors, String fit,
			String care) {
		super();
		this.productID = productID;
		this.material = material;
		this.fabricWeight = fabricWeight;
		this.colors = colors;
		this.fit = fit;
		this.care = care;
	}
	public ProductDetails() {
		super();
	}
	public Integer getProductID() {
		return productID;
	}
	public void setProductID(Integer productID) {
		this.productID = productID;
	}
	public String getMaterial() {
		return material;
	}
	public void setMaterial(String material) {
		this.material = material;
	}
	public String getFabricWeight() {
		return fabricWeight;
	}
	public void setFabricWeight(String fabricWeight) {
		this.fabricWeight = fabricWeight;
	}
	public String getColors() {
		return colors;
	}
	public void setColors(String colors) {
		this.colors = colors;
	}
	public String getFit() {
		return fit;
	}
	public void setFit(String fit) {
		this.fit = fit;
	}
	public String getCare() {
		return care;
	}
	public void setCare(String care) {
		this.care = care;
	}
    

}
