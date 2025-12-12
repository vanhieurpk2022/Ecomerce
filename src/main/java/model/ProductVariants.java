package model;

import java.math.BigDecimal;

public class ProductVariants {
	private Integer variantID;
	private Integer productID;
	private String size;
	private String color;
	private String sku;
	private BigDecimal priceAdjustment;
	private Integer stock;
	private String status;

	public ProductVariants() {
	}

	public ProductVariants(Integer variantID, Integer productID, String size, String color, String sku,
			BigDecimal priceAdjustment, Integer stock, String status) {
		this.variantID = variantID;
		this.productID = productID;
		this.size = size;
		this.color = color;
		this.sku = sku;
		this.priceAdjustment = priceAdjustment;
		this.stock = stock;
		this.status = status;
	}



	// Method tính giá cuối cùng
	public BigDecimal getFinalPrice(BigDecimal basePrice) {
		if (basePrice != null && priceAdjustment != null) {
			return basePrice.add(priceAdjustment);
		}
		return basePrice;
	}

	// Getters and Setters
	public Integer getVariantID() {
		return variantID;
	}

	public void setVariantID(Integer variantID) {
		this.variantID = variantID;
	}

	public Integer getProductID() {
		return productID;
	}

	public void setProductID(Integer productID) {
		this.productID = productID;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getSku() {
		return sku;
	}

	public void setSku(String sku) {
		this.sku = sku;
	}

	public BigDecimal getPriceAdjustment() {
		return priceAdjustment;
	}

	public void setPriceAdjustment(BigDecimal priceAdjustment) {
		this.priceAdjustment = priceAdjustment;
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

	@Override
	public String toString() {
		return "ProductVariants [variantID=" + variantID + ", productID=" + productID + ", size=" + size + ", color="
				+ color + ", sku=" + sku + ", priceAdjustment=" + priceAdjustment + ", stock=" + stock + ", status="
				+ status + "]";
	}
	
}