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
<body class="m-3">
<%
	UserAccountDTO loginUser = (UserAccountDTO)session.getAttribute("loginUser"); 
%>
	<header class="d-flex justify-content-end">
		<form action="MainMenuController" method="get" align="right">
			<input type="submit" value="ログアウト" class="btn btn-outline-primary btn-sm">
			<%= loginUser.getUserName()%>
		</form>
	<hr>
	</header>
	<hr>
	<h1 class="mb-3">ユーザー情報</h1>
	<div class="row">
		<div class="col-8 ">
			<!--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX-->
			<!--左側の要素-->
			<%	// コントローラからオブジェクトを受け取る
			UserInfoDTO userInfo = null;
			List<UserInfoDTO> userRanking = null;
			Object obj1 = request.getAttribute("userInfo");
			Object obj2 = request.getAttribute("userRanking");
			if(obj1!=null){userInfo = (UserInfoDTO)obj1;}
			if(obj2!=null){userRanking = (List<UserInfoDTO>)obj2;}
			%>
			
			<h2>あなたの戦績</h2>
			<table>
				<thead>
					<tr>
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
						<td><%=userInfo.getLoseCount() %></td>
						<td><%=userInfo.getDrawCount() %></td>
						<td><%=userInfo.getWinRate() %></td>
					</tr>
				</tbody>
			</table>
			<form action="UserInfoController" method="post">
				<input type="submit" value="ユーザー設定へ" class="btn btn-primary mb-1">
			</form>
			<form action="UserInfoController" method="get">
				<input type="submit" value="メニューに戻る" class="btn btn-secondary">
			</form>
		</div>

		<div class="col-4">
			<!--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX-->
			<!--右側の要素-->
			<h2>勝率ランキング</h2>
			<table>
				<thead>
					<tr>
						<th>ランク</th>
						<th>ユーザー名</th>
						<th>勝率</th>
					</tr>
				</thead>
				<tbody>
<%
					UserInfoDTO uiDTO;
					for(int i=0; i<userRanking.size(); i++){
						uiDTO = userRanking.get(i);
						
%>
					<tr>
						<td><%=i+1 %></td>
						<td><%=uiDTO.getUserName()%></td>
						<td><%=String.format("%.2f", uiDTO.getWinRate())%>%</td>
					</tr>
<%
					}
%>

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