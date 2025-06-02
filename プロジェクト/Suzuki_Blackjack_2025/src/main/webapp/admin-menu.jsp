<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>管理者画面</title>
</head>
<body>
	<h1>管理者画面</h1>
	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>ユーザー名</th>
				<th>勝ち</th>
				<th>負け</th>
				<th>引き分け</th>
			</tr>
		</thead>
		<tbody>
			<%
			// ArrayListで渡されたuserDTOの内容を一覧できるようにする
			%>
			<tr>
				<td>1</td>
				<td>すずき</td>
				<td>15</td>
				<td>5</td>
				<td>0</td>
				<td>
					<form action="AdminOptionController" method="post">
						<input type="hidden" value=""<% // userID %> name="userID">
						<input type="submit" value="設定">
					</form>
					
				</td>
			</tr>
			<tr>
				<td>2</td>
				<td>たかはし</td>
				<td>20</td>
				<td>4</td>
				<td>1</td>
				<td>
					<form action="AdminOptionController" method="post">
						<input type="hidden" value=""<% // userID %> name="userID">
						<input type="submit" value="設定">
					</form>
				</td>
			</tr>
		</tbody>
	</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>