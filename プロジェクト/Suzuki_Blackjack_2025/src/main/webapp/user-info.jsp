<%@ page import="model.dto.UserAccountDTO"%>
<%@ page import="model.dto.UserInfoDTO"%>
<%@ page import="java.util.List"%>
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
<title>ユーザー情報</title>
</head>
<body class="m-3">
	<%
	UserAccountDTO loginUser = (UserAccountDTO) session.getAttribute("loginUser");
	if (loginUser == null) {
	    response.sendRedirect("login.jsp");
	    return;
	}
	%>
	<header class="d-flex justify-content-between align-items-end mb-3">
		<div class="fw-bold ms-3">所持チップ <%=loginUser.getUserChip()%>枚</div>
		<div class="fw-bold fs-3">ユーザー情報</div>
		<div class="d-flex align-items-end me-3">
			<form action="MainMenuController" method="get" align="right"class="me-3">
				<input type="submit" value="ログアウト" class="btn btn-outline-light btn-sm" />
			</form>
			<div><%=loginUser.getUserName()%></div>
		</div>
		
	</header>
	<hr>
	<div class="row">
		<div class="col-6">
		<div class="ms-5">
			<!--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX-->
			<!--左側の要素-->
			<h1 class="mb-3">ユーザー情報</h1>
			<%
			// コントローラからオブジェクトを受け取る
			UserInfoDTO userInfo = null;
			List<UserInfoDTO> userRanking = null;
			Object obj1 = request.getAttribute("userInfo");
			Object obj2 = request.getAttribute("userRanking");
			if (obj1 != null) {
				userInfo = (UserInfoDTO) obj1;
			}
			if (obj2 != null) {
				userRanking = (List<UserInfoDTO>) obj2;
			}
			%>

			<table class="table-format mb-5">
				<thead>
					<tr>
						<th>ユーザー名</th>
						<th>勝ち</th>
						<th>負け</th>
						<th>引き分け</th>
						<th>チップ</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="bold-character"><%=userInfo.getUserName()%></td>
						<td><%=userInfo.getWinCount()%></td>
						<td><%=userInfo.getLoseCount()%></td>
						<td><%=userInfo.getDrawCount()%></td>
						<td><%=userInfo.getChip()%></td>
					</tr>
				</tbody>
			</table>
			<form action="UserInfoController" method="post">
				<input type="submit" value="ユーザー設定へ" class="btn btn-primary mb-3">
			</form>
			<form action="UserInfoController" method="get">
				<input type="submit" value="メニューに戻る" class="btn btn-secondary">
			</form>
		</div>
		</div>
		<div class="col-6">
			<!--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX-->
			<!--右側の要素-->
			<h2>所持チップランキング</h2>
			<table class="table-list">
				<thead>
					<tr>
						<th>ランク</th>
						<th>ユーザー名</th>
						<th>チップ</th>
					</tr>
				</thead>
				<tbody>
					<%
					UserInfoDTO uiDTO;
					for (int i = 0; i < userRanking.size(); i++) {
						uiDTO = userRanking.get(i);
					%>
					<tr>
						<td><%=i + 1%></td>
						<td><%=uiDTO.getUserName()%></td>
						<td><%=uiDTO.getChip()%></td>
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