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
<title>管理者画面-アカウント設定</title>
</head>
<body class="m-3">
	<%
	UserAccountDTO loginUser = (UserAccountDTO) session.getAttribute("loginUser");
	UserAccountDTO user = (UserAccountDTO) request.getAttribute("user");
	%>
	<header class="d-flex justify-content-end me-3">
		<form action="MainMenuController" method="get" align="right"
			class="me-3">
			<input type="submit" value="ログアウト"
				class="btn btn-outline-light btn-sm" />
		</form>
		<%=loginUser.getUserName()%>
	</header>

	<hr>
	<h1 align="center" class="mb-3">管理者 - アカウント設定</h1>

	<div class="d-flex flex-column align-items-center">
		<form action="AdminSettingController" method="post">
			<div class="d-flex flex-column align-items-center">
				<input type="hidden" name="action" value="update">
				<div class="d-flex flex-column">
					<label for="inputUserName" required>新しいユーザー名</label> <input
						type="text" id="inputUserName" class="mb-3" name="newUserName"
						value="<%=user.getUserName()%>" required> <input
						type="hidden" name="userName" value="<%=user.getUserName()%>">
				</div>
				<div class="d-flex flex-column">
					<label for="inputUserPassword">パスワード</label> <input type="password"
						id="inputUserPassword" class="mb-5" name="userPassword">
				</div>
				<input type="submit" class="btn btn-primary mb-3 px-4" value="更新">
		</form>

		<form action="AdminSettingController" method="post">
			<input type="submit" class="btn btn-secondary mb-5 px-4" value="戻る">
		</form>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>