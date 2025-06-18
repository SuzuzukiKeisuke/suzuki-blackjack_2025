<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
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
	<link rel="stylesheet" href="css/setting.css">
<title>管理者画面</title>
</head>
<body>
	<%
	// Controllerからユーザーリストを受け取る
	List<UserAccountDTO> userList = new ArrayList<UserAccountDTO>();
	Object obj = request.getAttribute("userlist");
	Object sobj = request.getAttribute("message");
	if (obj != null) {
		userList = (ArrayList<UserAccountDTO>) obj;
	}
	%>
	<h1 class="text-center my-3">管理者画面</h1>
	<%
	if (sobj != null) {
	%>
	<p><%=(String) sobj%></p>
	<%
	}
	%>
	<table class="table-list mx-auto mb-3">
		<thead>
			<tr>
				<th>userId</th>
				<th>userName</th>
				<th>userIdAdmin</th>
				<th>アカウント設定へ</th>
			</tr>
		</thead>
		<tbody>
			<%
			// ArrayListで渡されたuserDTOの内容を一覧できるようにする
			for (UserAccountDTO user : userList) {
			%>
			<tr  class="text-center">
				<td><%=user.getUserId()%></td>
				<td><%=user.getUserName()%></td>
				<td><%=user.showIsAdmin()%></td>
				<td><form action="AdminOptionController" method="post">
						<input type="hidden" value=<%=user.getUserId()%> name="userId">
						<input type="submit" class="btn btn-primary ms-1" value="設定">
					</form></td>
			</tr>
			<%
			}
			%>



		</tbody>
	</table>
	<form action="AdminMenuController" method="get" class="d-flex justify-content-center" >
		<input type="submit" class="btn btn-secondary" value="メインメニューに戻る">
	</form>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>