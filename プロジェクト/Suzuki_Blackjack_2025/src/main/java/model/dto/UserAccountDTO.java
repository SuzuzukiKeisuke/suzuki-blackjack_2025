package model.dto;

public class UserAccountDTO {
	private int userId;
	private String userName;
	private String userPassword;
	private boolean userIsAdmin;
	
	public UserAccountDTO(int userId, String userName, String userPassword, boolean userIsAdmin) {
		this.userId = userId;
		this.userName = userName;
		this.userPassword = userPassword;
		this.userIsAdmin = userIsAdmin;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public boolean isUserIsAdmin() {
		return userIsAdmin;
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
	
	
}
