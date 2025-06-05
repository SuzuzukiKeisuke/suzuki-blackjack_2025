<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	object obj1 = request.getAttribute("playerhand");
	object obj2 = request.getAttribute("dealerhand");
	if(obj1!=null && obj2!=null){
		// 06/06 ここから
	}
    int dealercardCount = 2;
    int[] dealercard = {3, 7};

    int playercardCount = 2;
    int[] playercard = {10, 2};
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ブラックジャック</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #e6f2e6;
        }

        .card-display {
            width: 60px;
            height: 90px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: white;
        }

        .card-back {
            background-color: #000000;
        }

        .hand-box {
            padding: 15px;
            margin-bottom: 30px;
            border-radius: 10px;
        }
    </style>
</head>
<body>
<div class="container py-4">

    <h1 class="text-center mb-4">ブラックジャック</h1>

    <!-- ディーラーの手札 -->
    <h4 class="text-center">ディーラーの手札</h2>
    <div class="hand-box text-center">
        <div class="d-flex justify-content-center gap-3">
            <% for (int i = 0; i < dealercardCount; i++) {
                   if (i == 1) { %>
                <div class="card-display card-back">?</div>
            <% } else { %>
                <div class="card-display"><%= dealercard[i] %></div>
            <% } } %>
        </div>
    </div>

    <!-- プレイヤーの手札 -->
    <h2 class="text-center">あなたの手札</h2>
    <div class="hand-box text-center">
        <div class="d-flex justify-content-center gap-3">
            <% for (int i = 0; i < playercardCount; i++) { %>
                <div class="card-display"><%= playercard[i] %></div>
            <% } %>
        </div>
    </div>

    <!--  -->
    <div class="text-center">
        <form method="post" action="blackjack.jsp">
            <button type="submit" name="stand" value="stand" class="btn btn-success me-3">スタンド</button>
            <button type="submit" name="hit" value="hit" class="btn btn-primary">もう一枚引く</button>
        </form>
    </div>

</div>
</body>
</html>
