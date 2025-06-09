package model;

import java.util.List;

import model.entity.Card;

public class Dealer extends PlayerBase {
	// コンストラクタ
	public Dealer() {
		super();
	}

	public Dealer(List<Card> cards) {
		super(cards);
	}
	
	// getCardCount
	// getCards
	// getHandValue
	// isBurst
	// dealCard

	// 点数が17以上になるまで引き続ける
	// 引き終えたらバースト判定
	public Deck hit(Deck deck) {
		while(getCardCount()<17) {
			dealCard(deck.getCard());
		}
		return deck;
		
		
	}


}
