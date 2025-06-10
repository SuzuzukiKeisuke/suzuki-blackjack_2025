package model;

import java.util.List;

import model.dto.Card;

public class Player extends PlayerBase {
	// コンストラクタ
	public Player() {
		super();
	}
	public Player(List<Card> cards) {
		super(cards);
	}
	
	// getCardCount
	// getCards
	// getHandValue
	// isBurst
	// dealCard
	
	
	// 一枚だけカードを引く
	// ヒットを選択して一枚カードを引いた
	// バーストしたらTRUEが返る
	public Deck hit(Deck deck) {
		dealCard(deck.getCard());
		return deck;
	}

}

