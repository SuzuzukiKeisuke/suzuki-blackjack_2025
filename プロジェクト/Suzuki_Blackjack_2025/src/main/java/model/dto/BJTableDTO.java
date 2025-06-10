package model.dto;

import java.util.List;

public class BJTableDTO {

	private List<Card> dealerHand;
	private List<Card> playerHand;


	public BJTableDTO(List<Card> dealerHand, List<Card> playerHand) {
		this.dealerHand = dealerHand;
		this.playerHand = playerHand;

	}

	public List<Card> getDealerHand() {
		return dealerHand;
	}

	public List<Card> getPlayerHand() {
		return playerHand;
	}

}
