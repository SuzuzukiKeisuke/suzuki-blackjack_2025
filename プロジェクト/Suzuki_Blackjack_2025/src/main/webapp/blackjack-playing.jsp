<%@ page import="model.dto.Card" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.PlayerBase" %>
<%@ page import="model.Table" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Object obj = request.getAttribute("table");
Table table;
if(obj!=null){
	table = (Table)obj;
}else{
	System.out.println("エラー！tableがblackjack-playingに正常に送られてきていない");
	table = new Table();
}

PlayerBase player = table.getPlayer();
PlayerBase dealer = table.getDealer();

//
//
//Object objPH = request.getAttribute("playerhand");
//Object objDH = request.getAttribute("dealerhand");
//Object objD  = request.getAttribute("deck")
//List<Card> playerHand;
//List<Card> dealerHand;
//if (obj1 != null && obj2 != null) {
//	// カード取得処理をここに書く
//	playerHand = (List<Card>) obj1;
//	dealerHand = (List<Card>) obj2;
//}else{
//	playerHand = new ArrayList<>();
//	dealerHand = new ArrayList<>();
//}
//
// 仮置きのカード
//int dealercardCount = playerHand.size();
//int[] dealercard = { 3, 7 };
//
//int playercardCount = 2;
//int[] playercard = { 10, 2 };
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
	<style>
body {
	background-color: #e6f2e6;
}

.card {
	width: 50px;
	height: 75px;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: white;
}

.card.back {
	background-color: black;
	color: white;
}
</style>
<title>ブラックジャック</title>
</head>
<body>


	<div class="container py-4">



		<h1 class="text-center mb-4">ブラックジャックプレイ画面</h1>

		<!-- ディーラー -->
		<h2 class="text-center">ディーラー : <%=dealer.getCards().get(0).getCardValue()%></h2>
		<div class="d-flex justify-content-center gap-2 mb-4">
			<%
			for (int i = 0; i < dealer.getCards().size(); i++) {
				if (i == 1) {
			%>
			<div class="card back">?</div>
			<%
				} else {
			%>
			<div class="card"><%=dealer.getCards().get(i).getCardLabel()%></div>
			<%
				}
			}
			%>
		</div>

		<!-- プレイヤー -->
		<h2 class="text-center">あなた : <%=player.getHandValue()%></h2>
		<div class="d-flex justify-content-center gap-2 mb-4">
			<%
			for (int i = 0; i < player.getCards().size(); i++) {
			%>
			<div class="card"><%=player.getCards().get(i).getCardLabel()%></div>
			<%
			}
			%>
		</div>

		<!-- ボタン -->
		<div class="text-center">
			<form method="post" action="BJPlayController">
			<input type="hidden" name="action" value="stand">
				<button type="submit" name="stand" value="stand"
					class="btn btn-primary">スタンド</button>
			</form>
			<form method="post" action="BJPlayController">
				<button type="submit" name="hit" value="hit" class="btn btn-success">もう一枚引く</button>
			</form>
		</div>

	</div>
	

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

</body>
</html>
