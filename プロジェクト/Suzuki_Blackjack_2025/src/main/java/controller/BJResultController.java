package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/BJResultController")
public class BJResultController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action.equals("playagain")){
			// セッションを取得
			HttpSession session = request.getSession();
			if(session.getAttribute("loginUser")!=null) {			
				// BJベット画面をフォワード
				RequestDispatcher rd = request.getRequestDispatcher("blackjack-bet.jsp");
				rd.forward(request, response);
			}else {// ログインされていない
				request.setAttribute("message", "ログインしてください");
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
		}else if(action.equals("mainmenu")) {
			RequestDispatcher rd = request.getRequestDispatcher("main-menu.jsp");
			rd.forward(request, response);
		}else {
			request.setAttribute("message", "BJResultControllerでエラー");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
	}

}
