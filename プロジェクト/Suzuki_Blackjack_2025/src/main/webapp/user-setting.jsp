<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
<h1>ユーザー設定画面</h1>
<form action="UserSettingController" method="post">


<dl ckass="row">
  <dt class="col-sm-3">
 	<label for="inputUserName">新しいユーザー名</label>
  </dt>
  <dd class="col-sm-9">
 	<input type="text" id="inputUserName" name="userName">
  </dd>
  
  
  <dt class="col-sm-3">
  	<label for="inputUserPassword">現パスワード</label>
  </dt>
  <dd class="col-sm-9">
  	<input type="password" id="inputUserPassword" name="userPassword">
  </dd>
  
  
  <dt class="col-sm-3">
  	<label for="inputNewUserPassword">新しいパスワード</label>
  <dd class="col-sm-9">
  	<input type="password" id="inputNewUserPassword" name="newUserPassword">
  </dd>
  
  
  <dt class="col-sm-3">
  	<label for="configureInputUserPassword">新しいパスワード(確認)</label>
  </dt>
  <dd class="col-sm-9">
  	<input type="password" id="configureInputUserPassword" name="configureInputUserPassword">
  </dd>
  
  </form>
</dl>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>