package model;

import java.math.BigDecimal;


public class CartItems {
	private int variantID;
	private int quantity;

	// thông tin để hiển thị
	private ProductVariants variant;
	private Products products;

	public CartItems() {
	}
	public int getQuanity() {
		return quantity;
	}

	public void setQuanity(int quanity) {
		this.quantity = quanity;
	}

	public CartItems(int variantID, int quanity) {
		super();
		this.variantID = variantID;

		this.quantity = quanity;
	}

	 public BigDecimal getSubtotal() {
	        // Tránh NPE khi variant/products chưa nạp được
	        if (variant == null || products == null) {
	            return BigDecimal.ZERO;
	        }
	        BigDecimal base = products.getPrice() != null ? products.getPrice() : BigDecimal.ZERO;
	        BigDecimal finalPrice = variant.getFinalPrice(base);
	        if (finalPrice == null) finalPrice = base;
	        return finalPrice.multiply(BigDecimal.valueOf(quantity));
	    }

	public ProductVariants getVariant() {
		return variant;
	}
	public void setVariant(ProductVariants variant) {
		this.variant = variant;
	}
	public Products getProducts() {
		return products;
	}
	public void setProducts(Products products) {
		this.products = products;
	}
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getVariantID() {
		return variantID;
	}

	public void setVariantID(int variantID) {
		this.variantID = variantID;
	}


	

}
