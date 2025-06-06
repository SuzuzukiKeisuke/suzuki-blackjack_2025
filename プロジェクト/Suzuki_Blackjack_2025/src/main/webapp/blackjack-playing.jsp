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
<title>ブラックジャック</title>
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
</head>
<body>
	<div class="container py-4">

		<h1 class="text-center mb-4">ブラックジャックプレイ画面</h1>

		<!-- ディーラー -->
		<h2 class="text-center">ディーラー</h2>
		<div class="d-flex justify-content-center gap-2 mb-4">
			<%
			for (int i = 0; i < dealercardCount; i++) {
				if (i == 1) {
			%>
			<div class="card back">?</div>
			<%
			} else {
			%>
			<div class="card"><%=dealercard[i]%></div>
			<%
			}
			}
			%>
		</div>

		<!-- プレイヤー -->
		<h2 class="text-center">あなた</h2>
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
			<form method="post" action="BJPlayController">
				<button type="submit" name="stand" value="stand"
					class="btn btn-success">スタンド</button>

			</form>
			<form method="post" action="BJResultController">
				<button type="submit" name="hit" value="hit" class="btn btn-primary">もう一枚引く</button>
			</form>
		</div>

	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

</body>
</html>
