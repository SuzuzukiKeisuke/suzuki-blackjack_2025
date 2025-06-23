package model.dto;

public class UserAccountDTO {
	private int userId;
	private String userName;
	private boolean userIsAdmin;
	private int userChip;
	
	public UserAccountDTO(int userId, String userName, boolean userIsAdmin, int userChip) {
		this.userId = userId;
		this.userName = userName;
		this.userIsAdmin = userIsAdmin;
		this.userChip = userChip;
		}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public boolean isUserIsAdmin() {
		return userIsAdmin;
	}
	public String showIsAdmin() {
		if(this.userIsAdmin) {
			return "T";
		}else {
			return "F";
		}
	}
	public void setUserIsAdmin(boolean userIsAdmin) {
		this.userIsAdmin = userIsAdmin;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public int getUserChip() {
		return userChip;
	}
	
	public void setUserChip(int userChip) {
		this.userChip = userChip;
	}
}
