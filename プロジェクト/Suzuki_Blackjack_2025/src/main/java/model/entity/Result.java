package model.entity;

public class Result {
	private int userId;
	private int resultCode;
	public Result(int userId, int resultCode) {
		this.userId = userId;
		this.resultCode = resultCode;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getResultCode() {
		return resultCode;
	}
	public void setResultCode(int resultCode) {
		this.resultCode = resultCode;
	}
	
	
}
