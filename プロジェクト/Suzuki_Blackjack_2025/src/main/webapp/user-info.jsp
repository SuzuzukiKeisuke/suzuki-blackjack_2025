<%@ page import="model.dto.UserAccountDTO" %>
<%@ page import="model.dto.UserInfoDTO" %>
<%@ page import="java.util.List" %>
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
<title>ユーザー情報</title>
</head>
<body>
<%
	UserAccountDTO loginUser = (UserAccountDTO)session.getAttribute("loginUser"); 
%>
	<header>
		<form action="MainMenuController" method="get" align="right">
			<input type="submit" value="ログアウト"><%=loginUser.getUserName() %>
		</form>
	</header>
	<hr>
	<h1>ユーザー情報</h1>
	<div class="row">
		<div class="col-8">
			<!--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX-->
			<!--左側の要素-->
			<%	// コントローラからオブジェクトを受け取る
				UserInfoDTO userInfo = request.getAttribute("userInfo");
				List<UserInfoDTO> userRanking = request.getAttribute("userRanking");
			%>
			
			<h2>あなたの戦績</h2>
			<table>
				<thead>
					<tr>
					<!-- 2025/06/04 夕会後 ここから実装 -->
						<th>ユーザー名</th>
						<th>勝ち</th>
						<th>負け</th>
						<th>引き分け</th>
						<th>勝率</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><%=userInfo.getUserName() %></td>
						<td><%=userInfo.getWinCount() %></td>
						<td><%=userinfo.getLoseCount() %></td>
						<td><%=userInfo.getDrawCount() %></td>
						<td><%=userInfo.getWinRate() %></td>
					</tr>
				</tbody>
			</table>
			<form action="UserInfoController" method="post">
				<input type="submit" value="アカウント設定へ">
			</form>
		</div>

		<div class="col-4">
			<!--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX-->
			<!--右側の要素-->
			<h2>勝率ランキング</h2>
			<table>
				<thead>
					<tr>
						<th>ユーザー名</th>
						<th>勝率</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>たかはし</td>
						<td>82.4%</td>
					</tr>
					<tr>
						<td>すずき</td>
						<td>75.0%</td>
					</tr>
					<tr>
						<td>さとう</td>
						<td>74.3%</td>
					</tr>
					<tr>
						<td>たなか</td>
						<td>72.8%</td>
					</tr>
					<tr>
						<td>わたなべ</td>
						<td>70.6%</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>