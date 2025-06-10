package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Table;

@WebServlet("/BJStartController")
public class BJStartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// セッションを取得
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser")!=null) {
			
			// BJ情報を宣言
			Table table = new Table();
			
			request.setAttribute("table", table);	// 画面に送る用		
			session.setAttribute("table", table);			
			// BJプレイ画面をフォワード
			RequestDispatcher rd = request.getRequestDispatcher("blackjack-playing.jsp");
			rd.forward(request, response);
		}else {// ログインされていない
			request.setAttribute("message", "ログインしてください");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
		
	}

}
