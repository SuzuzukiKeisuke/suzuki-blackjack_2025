package model.dto;

import java.util.List;

import model.entity.Card;

public class CardDTO {
	private int cardCount;
	private List<Card> cards;
	private int cardsValue;
	public CardDTO(int cardCount, List<Card> cards, int cardsValue) {
		this.cardCount = cardCount;
		this.cards = cards;
		this.cardsValue = cardsValue;
	}
	public int getCardCount() {
		return cardCount;
	}
	public void setCardCount(int cardCount) {
		this.cardCount = cardCount;
	}
	public List<Card> getCards() {
		return cards;
	}
	public void setCards(List<Card> cards) {
		this.cards = cards;
	}
	public int getCardsValue() {
		return cardsValue;
	}
	public void setCardsValue(int cardsValue) {
		this.cardsValue = cardsValue;
	}
}
