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
<title>管理者画面-アカウント設定</title>
</head>
<body>
	<%
	UserAccountDTO loginUser = (UserAccountDTO) session.getAttribute("loginUser");
	UserAccountDTO user = (UserAccountDTO) request.getAttribute("user");
	%>
	<header class="d-flex justify-content-end">
	<form action="MainMenuController" method="get" align="right">
		<input type="submit" value="ログアウト" class="btn btn-outline-secondary btn-sm"/>
		<%= loginUser.getUserName()%>
	</form>
	<hr>
</header>

	<h1>管理者-アカウント設定</h1>
	<dl class="row">
		<form action="AdminSettingController" method="post">
			<dl class="row">
				<dt class="col-sm-3">
					<label for="inputUserName" required>新しいユーザー名</label>
				</dt>
				<dd class="col-sm-9">
					<input type="text" id="inputUserName" name="newUserName"
						value=<%=user.getUserName()%> required> <input
						type="hidden" name="userName" value=<%=user.getUserName()%>
				</dd>
				<dt class="col-sm-3">
					<label for="inputUserPassword">パスワード</label>
				</dt>
				<dd class="col-sm-9">
					<input type="password" id="inputUserPassword" name="userPassword">
				</dd>
			</dl>
			<input type="hidden" name="action" value="update">
			<input type="submit" class="btn btn-primary mb-1" value="更新">
		</form>
		<form action="AdminSettingController" method="post">
			<input type="submit" class="btn btn-secondary mb-1" value="戻る">
		</form>
		<hr>
	</dl>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>