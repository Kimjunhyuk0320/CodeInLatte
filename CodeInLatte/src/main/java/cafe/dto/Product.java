package cafe.dto;

import java.io.Serializable;

public class Product implements Serializable {
	    
	
	
	private int productNo;
	private String productName;
	private String productCat;
	private int productPrice;
	private String productCon;
	private String productImg;
	private String productRegdate;
	private int quantity;
	private int cartNo;
	private int userNo;
	private int cartCnt;

	public Product() {
		
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductCat() {
		return productCat;
	}

	public void setProductCat(String productCat) {
		this.productCat = productCat;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductCon() {
		return productCon;
	}

	public void setProductCon(String productCon) {
		this.productCon = productCon;
	}

	public String getProductImg() {
		return productImg;
	}

	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}

	public String getProductRegdate() {
		return productRegdate;
	}

	public void setProductRegdate(String productRegdate) {
		this.productRegdate = productRegdate;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	
	public int getCartCnt() {
		return cartCnt;
	}

	public void setCartCnt(int cartCnt) {
		this.cartCnt = cartCnt;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", productName=" + productName + ", productCat=" + productCat
				+ ", productPrice=" + productPrice + ", productCon=" + productCon + ", productImg=" + productImg
				+ ", productRegdate=" + productRegdate + ", quantity=" + quantity + ", cartNo=" + cartNo + ", cartCnt="
				+ cartCnt + ", userNo=" + userNo + "]";
	}

	
}
