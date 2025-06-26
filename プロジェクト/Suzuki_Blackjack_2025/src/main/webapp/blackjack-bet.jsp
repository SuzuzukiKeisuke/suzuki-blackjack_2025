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
	<header class="d-flex justify-content-between align-items-end mb-3">
		<div class="fw-bold ms-3">所持チップ <%=loginUser.getUserChip()%>枚</div>
		<div class="fw-bold fs-3">ブラックジャック</div>
		<div class="d-flex align-items-end me-3">
			<form action="MainMenuController" method="get" align="right"class="me-3">
				<input type="submit" value="ログアウト" class="btn btn-outline-light btn-sm" />
			</form>
			<div><%=loginUser.getUserName()%></div>
		</div>
		
	</header>
	<hr>
	<img src="img/BLACKJACK_cropped.png" class="titleimage">
	<div class="kanban mx-auto p-1 mb-3">
	<h2>払い戻し倍率</h2>
	BlackJack ×2.5</br>
	WIN       ×2</br>
	DRAW      ×1</br>
	LOSE      ×0</br>
	</div>
	
	
	<form action="BJStartController" method="post">
	<div class="d-flex flex-column justify-content-center align-items-center">
		<label for="inputBet"><h2>何枚賭けますか？</h2></label>
		<div class="d-flex flex-row align-items-end mb-5">
			<input type="hidden" name="action" value="bet">
			<input type="number" id="inputBet" name="betNum" min="1" max="10" required/>枚
			<input type="submit" class="btn btn-primary ms-1" value="決定">
		</div>
	</div>
	</form>
	<form action="BJStartController" method="post">
		<input type="hidden" name="action" value="back">
		<div class="d-flex justify-content-center">
			<input type="submit" class="btn btn-secondary text-center" value="メインメニューに戻る">
		</div>
	</form>
	

	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
	</script>
</body>
</html>