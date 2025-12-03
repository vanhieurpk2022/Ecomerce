package model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.IDao;
import dao.ProductsDao;

public class Cart {
	private List<CartItems> items = new ArrayList<>();

	// Cộng dồn số lượng nếu sản phẩm đã có, không thì thêm mới
	public void addItem(int productsID, int quantity) {
		for (CartItems item : items) {
			if (item.getProductsID() == (productsID)) {
				item.setQuanity(quantity + item.getQuanity());
				return;
			}
		}
		// Nếu chưa có sản phẩm này, thêm mới vào giỏ
		items.add(new CartItems(productsID, quantity));
	}

	public List<CartItems> getItems() {
		return items;
	}
	public void removeItems(int productId) {
		for(int i =0;i<items.size();i++) {
			if(items.get(i).getProductsID() == productId) {
				items.remove(i);
			}
		}
	}
	public void changeQuanity(int productId,int quanity) {
		for (CartItems cartItems : items) {
			if(productId == cartItems.getProductsID()) {
				cartItems.setQuanity(quanity);
			}
		}
	}

	public int getSize() {
		return items.size();
	}

	public BigDecimal getPrice() {
		BigDecimal sum = new BigDecimal(0);
		for (CartItems cartItems : items) {
			sum =sum.add(cartItems.getSubtotal());
		}
		return sum;
	}
}
