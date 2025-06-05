package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dto.UserAccountDTO;
import service.UserRankingService;


@WebServlet("/MainMenuController")
public class MainMenuController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// ログイン画面表示用
		request.setAttribute("message", "ログアウトしました");
		
		// セッションの情報(ログイン中のアカウント情報)を消去する
		HttpSession session = request.getSession();
		session.invalidate();
		
		// ログイン画面へ
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// ログイン中のユーザー情報を得る
		HttpSession session = request.getSession();
		UserAccountDTO loginUser = (UserAccountDTO) session.getAttribute("loginUser");
		
		// ユーザの戦績/ランキングの表示用
		UserRankingService urs = new UserRankingService();
		request.setAttribute("userInfo", urs.getUserInfo(loginUser.getUserId()));
		request.setAttribute("userRanking", urs.getUserRanking());
		
		// ユーザ情報画面へ
		RequestDispatcher rd = request.getRequestDispatcher("user-info.jsp");
		rd.forward(request, response);
	}

}
