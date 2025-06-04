package model.dto;

public class UserInfoDTO {
	private int userId;
	private String userName;
	private int winCount;
	private int loseCount;
	private int drawCount;
	private float winRate;
	
	public UserInfoDTO(int userId, String userName, int winCount, int loseCount, int drawCount){
		this.userId = userId;
		this.userName = userName;
		this.winCount = winCount;
		this.loseCount = loseCount;
		this.drawCount = drawCount;
		int total = winCount + loseCount + drawCount;
		this.winRate = (total == 0 ? 0 : ((float)winCount / total * 100));
		
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

	public int getWinCount() {
		return winCount;
	}

	public void setWinCount(int winCount) {
		this.winCount = winCount;
	}

	public int getLoseCount() {
		return loseCount;
	}

	public void setLoseCount(int loseCount) {
		this.loseCount = loseCount;
	}

	public int getDrawCount() {
		return drawCount;
	}

	public void setDrawCount(int drawCount) {
		this.drawCount = drawCount;
	}
	
	public float getWinRate() {
		return winRate;
	}
	
	// setWinRate()はあえて作成しない
}
