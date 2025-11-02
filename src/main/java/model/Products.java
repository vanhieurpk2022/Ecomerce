package model;

import java.math.BigDecimal;

public class Products {
	private Integer productID;
	private String productName;
	private Integer categoryID;
	private BigDecimal price;
	private Integer quanity;
	private Integer stock;
	private String status;
	private String img;
	private String description;
	public Products(Integer productID, String productName, Integer categoryID, BigDecimal price, Integer quanity,
			Integer stock, String status, String img, String description) {
		super();
		this.productID = productID;
		this.productName = productName;
		this.categoryID = categoryID;
		this.price = price;
		this.quanity = quanity;
		this.stock = stock;
		this.status = status;
		this.img = img;
		this.description = description;
	}
	public Integer getProductID() {
		return productID;
	}
	public void setProductID(Integer productID) {
		this.productID = productID;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Integer getCategoryID() {
		return categoryID;
	}
	public void setCategoryID(Integer categoryID) {
		this.categoryID = categoryID;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public Integer getQuanity() {
		return quanity;
	}
	public void setQuanity(Integer quanity) {
		this.quanity = quanity;
	}
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	
}
