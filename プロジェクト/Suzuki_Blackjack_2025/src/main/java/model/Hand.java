package model;

import java.util.ArrayList;
import java.util.List;

import model.entity.Card;

public class Hand {
	private List<Card> cards;	// 手札
	public Hand() {
		cards = new ArrayList<Card>();
	}
	public Hand(List<Card> cards) {
		this.cards = cards;
	}
	public int getCardCount() {// 枚数
		return cards.size();
	}
	public List<Card> getCards() {
		return cards;
	}
	public void setCards(List<Card> cards) {
		this.cards = cards;
	}
	
	// 手札の合計値
	public int getHandValue() {
		int handValue = 0;
		for(Card card:cards) {
			handValue += card.getCardValue();
		}
		return handValue;
	}
	// バーストしているか
	public boolean isBurst() {
		return getHandValue() > 21;
	}

}
