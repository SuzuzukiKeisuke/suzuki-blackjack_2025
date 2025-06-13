package model.entity;

public class Result {
	private int userId;
	private int resultCode;
	private int resultWin; // 勝ったチップ数
	public Result(int userId, int resultCode ) {
		this.userId = userId;
		this.resultCode = resultCode;
	}
	
	public Result(int userId, int resultCode, int resultWin) {
		this.userId = userId;
		this.resultCode = resultCode;
		this.resultWin = resultWin;
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
	public int getResultWin() {
		return resultWin;
	}
	public void setResultWin(int resultWin) {
		this.resultWin = resultWin;
	}
	
}
