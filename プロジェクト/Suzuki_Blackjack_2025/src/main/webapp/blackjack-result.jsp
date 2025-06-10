<%@ page import="model.dto.Card" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.PlayerBase" %>
<%@ page import="model.Table" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%


Object resultObj = request.getAttribute("resultcode");
int resultCode = -1;
if(resultObj!=null){
	resultCode = (int)resultObj;
}

Object tableObj = request.getAttribute("table");
Table table;
if(tableObj!=null){
	table = (Table)tableObj;
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



// Object obj1 = request.getAttribute("playerhand");
// Object obj2 = request.getAttribute("dealerhand");
// if (obj1 != null && obj2 != null) {
//	// カード取得処理をここに書く
//}
//
// 仮置きのカード
//int dealercardCount = 2;
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
<title>ブラックジャック結果表示</title>
</head>
<body>
	<div class="container py-4">

		<h1 class="text-center mb-4">
			<% if(resultCode == 1){ %>
				YOU WIN!
			<% }else if(resultCode == 0){%>
				YOU LOSE...
			<% }else if(resultCode == 2){ /*引き分け*/%>
				DRAW
			<% }else{ %>
				resultCodeにエラーがあります resultCode=<%=resultCode %>
			<% }%>
		</h1>

		<!-- ディーラー -->
		<h2 class="text-center">ディーラー : <%=dealer.getHandValue()%></h2>
		<div class="d-flex justify-content-center gap-2 mb-4">
			<%
			for (int i = 0; i < dealer.getCards().size(); i++) {
			%>
			<div class="card"><%=dealer.getCards().get(i).getCardLabel()%></div>
			<%
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
			<form method="post" action="BJResultController">
			<input type="hidden" name="action" value="playagain">
				<button type="submit" name="playagain" value="playagain"
					class="btn btn-primary">もう一度遊ぶ</button>
			</form>
			<form method="post" action="BJResultController">
			<input type="hidden" name="action" value="mainmenu">
				<button type="submit" name="backtomenu" value="backtomenu"
					class="btn btn-secondary">メニューに戻る</button>

			</form>
			
		</div>

	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>