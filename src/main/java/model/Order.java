package model;

import java.sql.Date;

public class Order {
	private Integer orderID;
	private Integer userID;
	private Date orderDate;
	private String status;
	public Order(Integer orderID, Integer userID, Date orderDate, String status) {
		super();
		this.orderID = orderID;
		this.userID = userID;
		this.orderDate = orderDate;
		this.status = status;
	}
	public Integer getOrderID() {
		return orderID;
	}
	public void setOrderID(Integer orderID) {
		this.orderID = orderID;
	}
	
	public Integer getUserID() {
		return userID;
	}
	public void setUserID(Integer userID) {
		this.userID = userID;
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
