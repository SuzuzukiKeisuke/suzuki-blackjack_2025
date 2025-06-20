package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/BJBetController")
public class BJBetController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// セッションを取得
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser")==null) {
			request.setAttribute("message", "ログインしてください");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
		RequestDispatcher rd = request.getRequestDispatcher("blackjack-bet.jsp");
		rd.forward(request, response);
	}

}
