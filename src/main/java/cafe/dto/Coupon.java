package cafe.dto;

import java.io.Serializable;

public class Coupon implements Serializable {
	    
	private static final long serialVersionUID = 1L;
	
	private int userNo;
	private int couponNo;
	private String couponName;
	private String couponDate;
	private String couponDueDate;
	private String couponImg;
	private int couponCheck;
	private int count;
	public Coupon() {
		
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

	public String getCouponDueDate() {
		return couponDueDate;
	}

	public void setCouponDueDate(String couponDueDate) {
		this.couponDueDate = couponDueDate;
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

	
	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "Coupon [userNo=" + userNo + ", couponNo=" + couponNo + ", couponName=" + couponName + ", couponDate="
				+ couponDate + ", couponDueDate=" + couponDueDate + ", couponImg=" + couponImg + ", couponCheck="
				+ couponCheck + ", count=" + count + "]";
	}

	

}