package model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import model.dto.Card;

public class Deck {
	private List<Card> cards;
	private int index;
	public Deck() {
		// 山札を初期化
		cards = new ArrayList<Card>();
		for(int i=1; i<=13; i++) {
			for(int j=1; j<=4; j++) {
				cards.add(new Card(i, j));
			}
		}
		// 山札をシャッフル
		Collections.shuffle(cards);
		index = 0;
	}
	
	// カードの山札から一枚取り出す
	public Card getCard() {
		return cards.get(index++);
	}
}
