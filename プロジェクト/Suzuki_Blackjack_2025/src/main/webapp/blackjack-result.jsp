<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Object obj1 = request.getAttribute("playerhand");
Object obj2 = request.getAttribute("dealerhand");
if (obj1 != null && obj2 != null) {
	// カード取得処理をここに書く
}

// 仮置きのカード
int dealercardCount = 2;
int[] dealercard = { 3, 7 };

int playercardCount = 2;
int[] playercard = { 10, 2 };
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
			<% if(/* プレイヤーの勝ち*/ true){ %>
				YOU WIN!
			<% }else if(/*ディーラーの勝ち*/ true){%>
				YOU LOSE...
			<% }else{ /*引き分け*/%>
				DRAW
			<% } %>
		</h1>

		<!-- ディーラー -->
		<h2 class="text-center">ディーラー:<%= 20 /*合計*/ %></h2>
		<div class="d-flex justify-content-center gap-2 mb-4">
			<%
			for (int i = 0; i < dealercardCount; i++) {
			%>
			<div class="card"><%=dealercard[i]%></div>
			<%
			}
			%>
		</div>

		<!-- プレイヤー -->
		<h2 class="text-center">あなた:<%= 21 /*合計*/ %></h2>
		<div class="d-flex justify-content-center gap-2 mb-4">
			<%
			for (int i = 0; i < playercardCount; i++) {
			%>
			<div class="card"><%=playercard[i]%></div>
			<%
			}
			%>
		</div>

		<!-- ボタン -->
		<div class="text-center">
			<form method="get" action="BJStartController">
				<button type="submit" name="playagain" value="playagain"
					class="btn btn-primary">もう一度遊ぶ</button>
			</form>
			<form method="post" action="blackjack.jsp">
				<button type="submit" name="backtomenu" value="backtomeu"
					class="btn btn-secondary">メニューに戻る</button>

			</form>
			
		</div>

	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>