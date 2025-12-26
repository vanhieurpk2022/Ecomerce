package model;

import java.math.BigDecimal;


import dao.ProductVariantsDao;
import dao.ProductsDao;

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

	public ProductVariants getVariant() {
		if(variant == null) {
			ProductVariantsDao dao = new ProductVariantsDao();
			variant = dao.SelectByProductVariantID(variantID);
		}
		
		return variant;
	}
	public Products getProducts() {
		if(products ==null) {
			ProductVariantsDao dao = new ProductVariantsDao();
			products = dao.getProductFromVariant(variantID);
		}
		
		return products;
	}
	public BigDecimal getSubtotal() {
		BigDecimal quan = new BigDecimal(quantity);
		return getFinalPriceCart().multiply(quan);
	}

	public BigDecimal getFinalPriceCart() {
		  Products prod = getProducts();
	        ProductVariants var = getVariant();
	        
	        if (prod == null || var == null) {
	            return BigDecimal.ZERO;
	        }
	        
	        return var.getFinalPrice(prod.getPrice());
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
