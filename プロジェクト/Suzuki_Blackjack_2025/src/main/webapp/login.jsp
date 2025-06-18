<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link
	href="css/title.css"
	rel="stylesheet">
<title>ログイン画面</title>
</head>


<body class="m-3">
	<img src="img/BLACKJACK_cropped.png" class="titleimage">
	<h2 class="text-center text">ログイン</h2>
	<div class="d-flex justify-content-center text">
<!--		要素全体を中央揃え-->
			<div class="text-start">
<!--			テキストを左揃え-->
<%
			String message = (String)request.getAttribute("message");
			if(message!=null){
%>
			<p><%= message %></p>
<%		
			}
%>
			<form action="LoginController" method="post">
				<label for=inputUserName>ユーザー名</label></br>
				<input type="text" id="inputUserName" name="userName" class="mb-3" required></br>
				<labal for="inputUserPassword">パスワード</labal></br> 
				<input type="password" id="inputPassword" name="userPassword" class="mb-3" required></br> 
				<input type="submit" value="ログイン"class="btn btn-primary mb-3">
			</form>
			<a href="LoginController">新規ユーザー登録画面へ</a>
		</div>
	</div>

	
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
	</script>
</body>
</html>