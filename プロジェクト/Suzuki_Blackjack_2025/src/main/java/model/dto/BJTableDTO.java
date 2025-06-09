package model.dto;

import java.util.List;

import model.entity.Card;

public class BJTableDTO {

	private List<Card> dealerHand;
	private List<Card> playerHand;
	private int dealerScore;
	private int playerScore;

	public BJTableDTO(List<Card> dealerHand, List<Card> playerHand, int dealerScore, int playerScore) {
		this.dealerHand = dealerHand;
		this.playerHand = playerHand;
		this.dealerScore = dealerScore;
		this.playerScore = playerScore;
	}

	public List<Card> getDealerHand() {
		return dealerHand;
	}

	public List<Card> getPlayerHand() {
		return playerHand;
	}

	public int getDealerScore() {
		return dealerScore;
	}

	public int getPlayerScore() {
		return playerScore;
	}

}
