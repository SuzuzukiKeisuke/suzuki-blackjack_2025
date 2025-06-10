package model;

import java.util.ArrayList;
import java.util.List;

import model.dto.Card;

public abstract class PlayerBase {
	private List<Card> cards;	// 手札
	
	public PlayerBase() {
		cards = new ArrayList<Card>();
	}
	public PlayerBase(List<Card> cards) {
		this.cards = cards;
	}
	public int getCardCount() {// 枚数
		return cards.size();
	}
	public List<Card> getCards() {
		return cards;
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

	// 手札に一枚足す
	public void dealCard(Card card) {
		cards.add(card);
	}
	public abstract Deck hit(Deck deck);

}
