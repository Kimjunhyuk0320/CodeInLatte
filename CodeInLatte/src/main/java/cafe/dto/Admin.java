package cafe.dto;

import java.io.Serializable;

public class Admin implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private int managerNo;
	private String managerId;
	private String managerPW;
		
	public Admin() {

	}

	public int getManagerNo() {
		return managerNo;
	}

	public void setManagerNo(int managerNo) {
		this.managerNo = managerNo;
	}

	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}

	public String getManagerPW() {
		return managerPW;
	}

	public void setManagerPW(String managerPW) {
		this.managerPW = managerPW;
	}

	@Override
	public String toString() {
		return "Admin [managerNo=" + managerNo + ", managerId=" + managerId + ", managerPW=" + managerPW + "]";
	}
}