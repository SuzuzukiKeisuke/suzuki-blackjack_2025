<%@ page import="model.dto.UserAccountDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/blackjack.css">
<title>ベット画面</title>
</head>
<body class="m-3">
	<%
	UserAccountDTO loginUser = (UserAccountDTO) session.getAttribute("loginUser");
	if (loginUser == null) {
	    response.sendRedirect("login.jsp");
	    return;
	}
	%>
	<header class="d-flex justify-content-end align-items-end me-3">
		<form action="MainMenuController" method="get" align="right"class="me-3">
			<input type="submit" value="ログアウト" class="btn btn-outline-light btn-sm" />
		</form>
		<div class="me-3"><%=loginUser.getUserName()%></div>
	</header>
		<hr>
	<img src="img/BLACKJACK_cropped.png" class="titleimage">
	<h2>払い戻し倍率</h2>
	<p>BlackJack ×2.5</p>
	<p>WIN       ×2</p>
	<p>DRAW      ×1</p>
	<P>LOSE      ×0</P>

	<h2>何枚賭けますか？</h2>
	<form action="BJStartController" method="post">
		<label for="inputBet">何枚賭けますか？</label>
		<input type="hidden" name="action" value="bet">
		<input type="number" id="inputBet" name="betNum" min="1" max="10"/>
		<input type="submit" class="btn btn-primary" value="決定">
	</form>
	<form action="BJStartController" method="post">
		<input type="hidden" name="action" value="back">
		<input type="submit" class="btn btn-secondary" value="メインメニューに戻る"
	</form>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
	</script>
</body>
</html>