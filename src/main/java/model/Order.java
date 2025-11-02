package model;

import java.sql.Date;

public class Order {
	private Integer orderID;
	private Integer productsID;
	private Date orderDate;
	private String status;
	public Order(Integer orderID, Integer productsID, Date orderDate, String status) {
		super();
		this.orderID = orderID;
		this.productsID = productsID;
		this.orderDate = orderDate;
		this.status = status;
	}
	public Integer getOrderID() {
		return orderID;
	}
	public void setOrderID(Integer orderID) {
		this.orderID = orderID;
	}
	public Integer getProductsID() {
		return productsID;
	}
	public void setProductsID(Integer productsID) {
		this.productsID = productsID;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	

}
