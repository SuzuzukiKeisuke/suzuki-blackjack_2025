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
<link rel="stylesheet" href="css/menu.css">

<title>メインメニュー</title>
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
		<div class="fw-bold fs-3">メインメニュー</div>
		<div class="d-flex align-items-end me-3">
			<form action="MainMenuController" method="get" align="right"class="me-3">
				<input type="submit" value="ログアウト" class="btn btn-outline-light btn-sm" />
			</form>
			<div><%=loginUser.getUserName()%></div>
		</div>
		
	</header>
	<hr>

	<img src="img/BLACKJACK_cropped.png" class="titleimage">
	<div class="d-flex flex-column justify-content-center align-items-center">
		
		<form action="BJBetController" method="post"
			class="play-start-button my-3">
			<input type="submit" value="ブラックジャックをプレイ" class="btn btn-primary">
		</form>
		<form action="MainMenuController" method="post">
			<input type="submit" value="ユーザー情報" class="btn btn-secondary mb-3">
		</form>

		<%
		if (loginUser.isUserIsAdmin()) {
		%>
		<form action="AdminMenuController" method="post">
			<input type="submit" value="管理者メニュー" class="btn btn-outline-warning">
		</form>
		<%
		}
		%>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>