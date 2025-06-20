package model;

public class Table {
	private Deck deck;
	private PlayerBase dealer;
	private PlayerBase player;
	private int bet;

	// Hand, Deckをまとめて管理するテーブルモデル
	// 主にサービスから呼び出され、ゲームの進行により紐付いた動作を担当する。

	public Table(int bet) {
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
		this.bet = bet;
	}

	public Table(Deck deck, PlayerBase dealer, PlayerBase player, int bet) {
		this.deck = deck;
		this.dealer = dealer;
		this.player = player;
		this.bet = bet;
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
	
	public int getBet() {
		return bet;
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
	//勝敗判定
	
	
	public int doJudge() {
		if(player.isBurst()) {
			// ディーラーの勝ち
			return 0;		
		}else if(dealer.isBurst()) {
			if(player.getCardCount() == 2 && player.getHandValue() == 21) {
				// ブラックジャック
				return 3;
			}
			// プレイヤーの勝ち
			return 1;
		}else if(player.getHandValue() > dealer.getHandValue()) {
			if(player.getCardCount() == 2 && player.getHandValue() == 21) {
				// ブラックジャック
				return 3;
			}
			return 1;
		}else if(player.getHandValue() < dealer.getHandValue()) {
			// 点数で比べる
			return 0;
		}else {
			// 引き分け
			return 2;
		}
	}
	
	public int getWin(int judge) {
		switch(judge) {
		case 3: // BlackJack
			return (int)(this.bet * 2.5);
		
		case 1: // Player Win
			return this.bet * 2;
			
		case 2: // DRAW
			return this.bet;
			
		case 0:
			return 0;
		default:
			return 0;
		}
		
	}
}
