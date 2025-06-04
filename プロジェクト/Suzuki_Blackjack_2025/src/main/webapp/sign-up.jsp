<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>ユーザー登録</title>
</head>
<body>
	<h1>BLACKJACK</h1>
	<h2>新規ユーザー登録</h2>
	<form action="SignInController" method="post">
		<label for=inputUserName>ユーザー名</label></br>
		<input type="text" id="inputUserName" name="userName" required></br>
		<labal for="inputUserPassword">パスワード</labal></br>
		<input type	="password" id="inputPassword" name="userPassword" required></br>
		<input type="submit" value="新規登録">
	</form>
	<a href="SignInController">ログイン画面に戻る</a>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	</body>
</html>