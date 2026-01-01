package model;

import java.math.BigDecimal;
import java.math.BigInteger;

public class Products {
	private Integer productID;
	private String productName;
	private Integer categoryID;
	private BigDecimal price;

	private String status;
	private String img;
	private String description;
	
	private BigDecimal avg_rating;
	private Integer review_count;

	public Products(Integer productID, String productName, Integer categoryID, BigDecimal price, String status,
			String img, String description) {
		super();
		this.productID = productID;
		this.productName = productName;
		this.categoryID = categoryID;
		this.price = price;
		this.status = status;
		this.img = img;
		this.description = description;
	}

	public Products() {
		super();
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

	@Override
	public String toString() {
		return "Products [productID=" + productID + ", productName=" + productName + ", categoryID=" + categoryID
				+ ", price=" + price + ", status=" + status + ", img=" + img + ", description=" + description + "]";
	}


	public BigDecimal getAvg_rating() {
		return avg_rating;
	}

	public void setAvg_rating(BigDecimal avg_rating) {
		this.avg_rating = avg_rating;
	}

	public Integer getReview_count() {
		return review_count;
	}

	public void setReview_count(Integer review_count) {
		this.review_count = review_count;
	}

}
