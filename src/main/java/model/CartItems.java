package model;

import java.math.BigDecimal;

import dao.IDao;
import dao.ProductsDao;

public class CartItems {
	private int productsID;
	private int quanity;
	private Products product;

	public CartItems() {

	}

	public int getProductsID() {
		return productsID;
	}

	public void setProductsID(int productsID) {
		this.productsID = productsID;
	}

	public int getQuanity() {
		return quanity;
	}

	public void setQuanity(int quanity) {
		this.quanity = quanity;
	}

	public CartItems(int productsID, int quanity) {
		super();
		this.productsID = productsID;
		this.quanity = quanity;
	}

	public Products getProduct() {
		return product;
	}

	public void setProduct(Products product) {
		this.product = product;
	}

	public Products getProducts() {
		if (product == null) {
			IDao dao = new ProductsDao();
			product = dao.SelectByProductID(this.productsID);
		}
		return product;
	}
	public BigDecimal getSubtotal() {
		BigDecimal tmp = new BigDecimal(quanity);
	    return getProduct().getPrice().multiply(tmp);
	}
}
