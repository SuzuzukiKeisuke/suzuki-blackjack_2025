package model.entity;

public enum ResultCode{
	BLACKJACK(3),
	PLAYERDRAW(2),
	PLAYERWIN(1),
	PLAYERLOSE(0);
	
	private final int code;
	
	ResultCode(int code){
		this.code = code;
	}
	
	public int getResultCode() {
		return code;
	}
	
	
}
