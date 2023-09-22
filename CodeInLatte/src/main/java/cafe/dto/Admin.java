package cafe.dto;

import java.io.Serializable;

public class Admin implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	// 관리자
	private int mangerNo;
	private String mangerId;
	private String managerPw;
	
	// 쿠폰
	private int userNo;
	private int couponNo;
	private String couponName;
	private String couponDate;
	private String couponImg;
	private int couponCheck;
	
	// 주문
	private int orderNo;
	private String userTel;
	private String orderName;
	private int orderCnt;
	private int orderPrice;
	private String orderDate;
	
	public Admin() {

	}

	public int getMangerNo() {
		return mangerNo;
	}

	public void setMangerNo(int mangerNo) {
		this.mangerNo = mangerNo;
	}

	public String getMangerId() {
		return mangerId;
	}

	public void setMangerId(String mangerId) {
		this.mangerId = mangerId;
	}

	public String getManaerPw() {
		return managerPw;
	}

	public void setManaerPw(String managerPw) {
		this.managerPw = managerPw;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getCouponNo() {
		return couponNo;
	}

	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	public String getCouponDate() {
		return couponDate;
	}

	public void setCouponDate(String couponDate) {
		this.couponDate = couponDate;
	}

	public String getCouponImg() {
		return couponImg;
	}

	public void setCouponImg(String couponImg) {
		this.couponImg = couponImg;
	}

	public int getCouponCheck() {
		return couponCheck;
	}

	public void setCouponCheck(int couponCheck) {
		this.couponCheck = couponCheck;
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

	@Override
	public String toString() {
		return "Admin [mangerNo=" + mangerNo + ", mangerId=" + mangerId + ", managerPw=" + managerPw + ", userNo="
				+ userNo + ", couponNo=" + couponNo + ", couponName=" + couponName + ", couponDate=" + couponDate
				+ ", couponImg=" + couponImg + ", couponCheck=" + couponCheck + ", orderNo=" + orderNo + ", userTel="
				+ userTel + ", orderName=" + orderName + ", orderCnt=" + orderCnt + ", orderPrice=" + orderPrice
				+ ", orderDate=" + orderDate + "]";
	}

}