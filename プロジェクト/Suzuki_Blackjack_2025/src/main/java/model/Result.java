package model;

public class Result {
	private int resultId;
	private int userId;
	private int resultCode;
	public Result(int resultId, int userId, int resultCode) {
		this.resultId = resultId;
		this.userId = userId;
		this.resultCode = resultCode;
	}
	public int getResultId() {
		return resultId;
	}
	public void setResultId(int resultId) {
		this.resultId = resultId;
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
