package model.entity;

public class User {
	private int userId;
	private String userName;
	// private String userPassword;
	private boolean userIsAdmin;
	private int userChip;
	
	public User() {}
	
	public User(int userId, String userName, boolean userIsAdmin, int userChip) {
		this.userId = userId;
		this.userName = userName;
		this.userIsAdmin = userIsAdmin;
		this.userChip = userChip;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
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

	public void setUserIsAdmin(boolean userIsAdmin) {
		this.userIsAdmin = userIsAdmin;
	}
	
	public int getUserChip() {
		return userChip;
	}
	
	public void setUserChip(int userChip) {
		this.userChip = userChip;
	}
	
}
