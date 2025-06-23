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
	response.sendRedirect("main-menu.jsp");
    return;
}

PlayerBase player = table.getPlayer();
PlayerBase dealer = table.getDealer();

// トランプマーク用
String[] links = {"img/spade.png","img/diamond.png","img/clover.png","img/heart.png"};
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="css/blackjack.css"
	rel="stylesheet">
<title>ブラックジャック</title>
</head>
<body>
	<div class="container py-4">



		<h1 class="text-center mb-4">あなたの手番です</h1>

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
			<div class="card">
				<div class="align-self-start ps-2"><%=dealer.getCards().get(i).getCardLabel()%></div>
				<div class="align-self-center"><img src=<%=links[dealer.getCards().get(i).getCardMark() - 1] %>></div>
				<div class="align-self-end upside-down ps-2"><%=dealer.getCards().get(i).getCardLabel()%></div>
			</div>
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
			<div class="card">
				<div class="align-self-start ps-2"><%=player.getCards().get(i).getCardLabel()%></div>
				<div class="align-self-center"><img src=<%=links[player.getCards().get(i).getCardMark() - 1] %>></div>
				<div class="align-self-end upside-down ps-2"><%=player.getCards().get(i).getCardLabel()%></div>
			</div>
			<%
			}
			%>
		</div>

		<!-- ボタン -->
		<div class="text-center">
			<p class="h4">ベット: <%=table.getBet()%>枚</p>
			<form method="post" action="BJPlayController">
			<input type="hidden" name="action" value="stand">
				<button type="submit" name="stand" value="stand" class="btn btn-primary mb-1">スタンド</button>
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
