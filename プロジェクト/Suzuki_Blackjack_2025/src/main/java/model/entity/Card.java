package model.entity;

public class Card {
	private int cardNum; // 1~13
	private int cardMark; // 1~4 スペード ダイヤ クローバー ハート
	private String cardLabel; // A~K
	private int cardValue; // 1~10
	
	public Card(int cardNum, int cardMark) {
		this.cardNum = cardNum;
		this.cardMark = cardMark;
		cardLabel = (cardNum == 1) ? "A" :
					(cardNum == 11) ? "J" :
					(cardNum == 12) ? "Q" :
					(cardNum == 13) ? "K" : 
				   String.valueOf(cardNum);
		cardValue = (cardNum > 10) ? 10 : cardNum;
	}

	public int getCardNum() {
		return cardNum;
	}

	public void setCardNum(int cardNum) {
		this.cardNum = cardNum;
	}

	public int getCardMark() {
		return cardMark;
	}

	public void setCardMark(int cardMark) {
		this.cardMark = cardMark;
	}

	public String getCardLabel() {
		return cardLabel;
	}

	public void setCardLabel(String cardLabel) {
		this.cardLabel = cardLabel;
	}

	public int getCardValue() {
		return cardValue;
	}

	public void setCardValue(int cardValue) {
		this.cardValue = cardValue;
	}
	
}