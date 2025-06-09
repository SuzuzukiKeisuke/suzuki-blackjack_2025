<%@ page import="model.dto.UserAccountDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>メインメニュー</title>
</head>
<body>
<%
	UserAccountDTO loginUser = (UserAccountDTO)session.getAttribute("loginUser"); 
%>
<header>
	<form action="MainMenuController" method="get" align="right">
		<input type="submit" value="ログアウト"><%= loginUser.getUserName()%>
	</form>
	<hr>
</header>
<h1>メインメニュー</h1>
<form action="BJStartController" method="post">
	<input type="submit" value="ブラックジャックをプレイ">
</form>
<form action="MainMenuController" method="post">
	<input type="submit" value="ユーザー情報">
</form>
<% if(loginUser.isUserIsAdmin()){ %>
	<form action="AdminMenuController" method="post">
		<input type="submit" value="管理者メニュー">
	</form>
<% } %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>