package model.dto;

public class UserInfoDTO {
	private int userId;
	private String userName;
	private int bjCount;
	private int winCount;
	private int loseCount;
	private int drawCount;
	private int chip;
	
	public UserInfoDTO(int userId, String userName, int bjCount, 
			int winCount, int loseCount, int drawCount, int chip){
		this.userId = userId;
		this.userName = userName;
		this.bjCount = bjCount;
		this.winCount = winCount;
		this.loseCount = loseCount;
		this.drawCount = drawCount;
		this.chip = chip;
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

	public int getBjCount() {
		return bjCount;
	}
	
	public void setBjCount(int bjCount) {
		this.bjCount = bjCount;
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
	
	public int getChip() {
		return chip;
	}
	
	public void setChip(int chip) {
		this.chip = chip;
	}

}
