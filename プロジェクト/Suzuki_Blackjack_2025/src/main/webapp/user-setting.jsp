<%@ page import="model.dto.UserAccountDTO" %>
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
<title>Insert title here</title>
</head>
<body>
	<%
	UserAccountDTO loginUser = (UserAccountDTO)session.getAttribute("loginUser");
	Object sobj = request.getAttribute("message");
	%>
	<header>
		<form action="MainMenuController" method="get" align="right">
			<input type="submit" value="ログアウト"><%=loginUser.getUserName()%>
		</form>
	</header>
	<h1>ユーザー設定画面</h1>
	<h2>アカウント名の更新</h2>
	<% if(sobj != null){ %>
	<p><%=(String)sobj %></p>
	<% } %>
	<form action="UserSettingController" method="post">
	<input type="hidden" name="dowhat" value="update">
		<dl class="row">
			<dt class="col-sm-3">
				<label for="inputUserName" required>新しいユーザー名</label>
			</dt>
			<dd class="col-sm-9">
				<input type="text" id="inputUserName" name="userName" value=<%=loginUser.getUserName()%> required>
					
			</dd>
			<dt class="col-sm-3">
				<label for="inputUserPassword">パスワード</label>
			</dt>
			<dd class="col-sm-9">
				<input type="password" id="inputUserPassword" name="userPassword">
			</dd>
		</dl>
		<input type="submit" class="btn btn-primary" value="更新">
	</form>
	<form action="UserSettingController" method="get">
		<input type="submit" class="btn btn-light" value="戻る">
	</form>
	<hr>
	<h2>アカウント削除</h2>
	<form action="UserSettingController" method="post">
		<input type="hidden" name="dowhat" value="delete">
		<input type="submit" value="アカウント削除" class="btn btn-danger">
	</form>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>