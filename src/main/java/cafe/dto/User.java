package cafe.dto;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable { 
	 
	private static final long serialVersionUID = 1L;
	
	private int userNo;
	private String userId;
	private String userPW;
	private String userName;
	private String userBirth;
	private String userAddress;
	private String userTel;
	private String userRegdate;
	private int userStamp;
	
	public User() {
		
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPW() {
		return userPW;
	}

	public void setUserPW(String userPW) {
		this.userPW = userPW;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	public String getUserRegdate() {
		return userRegdate;
	}

	public void setUserRegdate(String userRegdate) {
		this.userRegdate = userRegdate;
	}

	public int getUserStamp() {
		return userStamp;
	}

	public void setUserStamp(int userStamp) {
		this.userStamp = userStamp;
	}

	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", userId=" + userId + ", userPW=" + userPW + ", userName=" + userName
				+ ", userBirth=" + userBirth + ", userAddress=" + userAddress + ", userTel=" + userTel
				+ ", userRegdate=" + userRegdate + ", userStamp=" + userStamp + "]";
	}

}