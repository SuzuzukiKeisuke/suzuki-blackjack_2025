package model;

public class Table {
	private Deck deck;
	private PlayerBase dealer;
	private PlayerBase player;

	// Hand, Deckをまとめて管理するテーブルモデル
	// 主にサービスから呼び出され、ゲームの進行により紐付いた動作を担当する。

	public Table() {
		deck = new Deck(); // 手札の準備
		dealer = new Dealer();
		player = new Player();
		for (int i = 0; i < 4; i++) {
			if (i % 2 == 0) {
				dealer.dealCard(deck.getCard());
			} else {
				player.dealCard(deck.getCard());
			}
		}
	}

	public Table(Deck deck, PlayerBase dealer, PlayerBase player) {
		this.deck = deck;
		this.dealer = dealer;
		this.player = player;
	}
	
	
	public Deck getDeck() {
		return deck;
	}
	
	public PlayerBase getPlayer() {
		return player;
	}
	
	public PlayerBase getDealer() {
		return dealer;
	}
	// ゲームの進行にかかわるメソッド
	// ヒット、スタンド、場のカードの取得などが可能

	public boolean doHit(PlayerBase activePlayer) {
		// Player -> 一度に一枚引く
		// Dealer -> 17以上になるまで引く
		deck = activePlayer.hit(deck);
		if(activePlayer.isBurst()) {
			return true; // BurstしたらTRUEを返す
		}else {
			return false;
		}
	}
	
	public int doJudge() {
		if(player.isBurst()) {
			// ディーラーの勝ち
			return 0;
		}else if(dealer.isBurst()) {
			// プレイヤーの勝ち
			return 1;
		}else if(player.getHandValue() > dealer.getHandValue()) {
			// 点数で比べる
			return 1;
		}else if(player.getHandValue() < dealer.getHandValue()) {
			// 点数で比べる
			return 0;
		}else {
			// 引き分け
			return 2;
		}
	}
}
