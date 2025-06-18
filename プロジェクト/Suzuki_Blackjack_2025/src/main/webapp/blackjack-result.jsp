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
<link rel="stylesheet" href="css/blackjack.css">
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
			<div class="card">
				<div class="align-self-start ps-2"><%=dealer.getCards().get(i).getCardLabel()%></div>
				<div class="align-self-center"><img src=<%=links[dealer.getCards().get(i).getCardMark() - 1] %>></div>
				<div class="align-self-end upside-down ps-2"><%=dealer.getCards().get(i).getCardLabel()%></div>
			</div>			
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
			<form method="post" action="BJResultController">
			<input type="hidden" name="action" value="playagain">
				<button type="submit" name="playagain" value="playagain" class="btn btn-primary mb-1">もう一度遊ぶ</button>
			</form>
			<form method="post" action="BJResultController">
			<input type="hidden" name="action" value="mainmenu">
				<button type="submit" name="backtomenu" value="backtomenu" class="btn btn-secondary ">メニューに戻る</button>

			</form>
			
		</div>

	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>