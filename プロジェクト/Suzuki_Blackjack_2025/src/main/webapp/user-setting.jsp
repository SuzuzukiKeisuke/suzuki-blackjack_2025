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
<link rel="stylesheet" href="css/setting.css">
<title>ユーザー設定画面</title>
</head>
<body class="m-3">
	<%
	Object sobj = request.getAttribute("message");
	UserAccountDTO loginUser = (UserAccountDTO) session.getAttribute("loginUser");
	if (loginUser == null) {
	    response.sendRedirect("login.jsp");
	    return;
	}
	%>
	<header class="d-flex justify-content-between align-items-end mb-3">
		<div class="fw-bold ms-3">所持チップ <%=loginUser.getUserChip()%>枚</div>
		<div class="fw-bold fs-3">ユーザー設定</div>
		<div class="d-flex align-items-end me-3">
			<form action="MainMenuController" method="get" align="right"class="me-3">
				<input type="submit" value="ログアウト" class="btn btn-outline-light btn-sm" />
			</form>
			<div><%=loginUser.getUserName()%></div>
		</div>
		
	</header>
	<hr>
	<h1 align="center" class="mb-3">アカウント名の更新</h1>

	<div class="d-flex flex-column align-items-center">
		<%
		if (sobj != null) {
		%>
		<p><%=(String) sobj%></p>
		<%
		}
		%>
		<form action="UserSettingController" method="post">
			<div class="d-flex flex-column align-items-center">
				<input type="hidden" name="dowhat" value="update">
				<div class="d-flex flex-column">
					<label for="inputUserName" required>新しいユーザー名</label> <input
						type="text" id="inputUserName" class="mb-3" name="userName"
						value=<%=loginUser.getUserName()%> required>
				</div>
				<div class="d-flex flex-column">
					<label for="inputUserPassword">パスワード</label> <input type="password"
						id="inputUserPassword" class="mb-5" name="userPassword">
				</div>
				<input type="submit" class="btn btn-primary mb-3 px-4" value="更新">
		</form>
		<form action="UserSettingController" method="get">
			<input type="submit" class="btn btn-secondary mb-5 px-4" value="戻る">
		</form>
	</div>
	</div>
	<hr>
	<div class="d-flex flex-column align-items-center">
		<h2 class="mb-5">アカウント削除</h2>
		<form action="UserSettingController" method="post">
			<input type="hidden" name="dowhat" value="delete"> <input
				type="submit" value="アカウント削除" class="btn btn-danger">
		</form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>