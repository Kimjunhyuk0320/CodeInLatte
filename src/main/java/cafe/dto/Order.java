package cafe.dto;

import java.io.Serializable;

public class Order implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int orderNo;
	private String userTel;
	private String orderName;
	private int orderCnt;
	private int orderPrice;
	private String orderDate;
	private String orderNumber;
	
	public Order() {
		
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public int getOrderCnt() {
		return orderCnt;
	}

	public void setOrderCnt(int orderCnt) {
		this.orderCnt = orderCnt;
	}

	public int getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", userTel=" + userTel + ", orderName=" + orderName + ", orderCnt="
				+ orderCnt + ", orderPrice=" + orderPrice + ", orderDate=" + orderDate + ", orderNumber=" + orderNumber
				+ "]";
	}

}