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
<link
	href="css/title.css"
	rel="stylesheet">
<title>ユーザー登録</title>
</head>


<body class="m-3">
	<img src="img/BLACKJACK_cropped.png" class="titleimage">
	<h2 class="text-center">新規ユーザー登録</h2>

	<div class="d-flex justify-content-center">

		<div class="text-start">
		<%
			String message = (String)request.getAttribute("message");
			if(message!=null){
%>
			<p><%= message %></p>
<%		
			}
%>
			<form action="SignInController" method="post">
				<label for=inputUserName class="form-label">ユーザー名</label></br> 
				<input type="text" class="form-control" id="inputUserName" name="userName" class="mb-3" required></br>
				<labal for="inputUserPassword" class="form-label">パスワード</labal></br> 
				<input type="password" class="form-control" id="inputPassword" name="userPassword" class="mb-3" required></br>
				<input type="submit" value="新規登録" class="btn btn-primary mb-3">
			</form>
			<a href="SignInController">ログイン画面に戻る</a>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>