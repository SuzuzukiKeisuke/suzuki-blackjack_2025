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
import service.AccountService;
import service.UserRankingService;

@WebServlet("/UserSettingController")
public class UserSettingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dowhat = request.getParameter("dowhat");
		// ログイン中のユーザー情報を得る
		HttpSession session = request.getSession();
		UserAccountDTO loginUser = (UserAccountDTO) session.getAttribute("loginUser");
		AccountService as = new AccountService();
		switch (dowhat) {
		case "update": // ユーザの情報更新
			// 入力を受け取る
			String newUserName = request.getParameter("userName");
			String userPassward = request.getParameter("userPassword");

			// 新しいユーザ入力情報を検索
			loginUser = as.changeUserName(loginUser.getUserName(), userPassward, newUserName);
			if(loginUser != null) {
				session.setAttribute("loginUser", loginUser);
				// 画面の更新
				request.setAttribute("message", "アカウント名を更新しました");
				RequestDispatcher rd1 = request.getRequestDispatcher("user-setting.jsp");
				rd1.forward(request, response);
			}else {
				request.setAttribute("message", "ユーザー認証に失敗しました");
				RequestDispatcher rd2 = request.getRequestDispatcher("user-setting.jsp");
				rd2.forward(request, response);
			}



			break;

		case "delete": // ユーザのレコード消去
			if (as.deleteUser(loginUser.getUserId())) {

				// ログイン画面表示用
				request.setAttribute("message", "アカウントを消去しました");

				// セッションの情報(ログイン中のアカウント情報)を消去する
				session.invalidate();

				// ログイン画面へ
				RequestDispatcher rd2 = request.getRequestDispatcher("login.jsp");
				rd2.forward(request, response);
			}
			break;

		default:
			System.out.println("UserSettingController/String doWhatのswitch文エラー");
			RequestDispatcher rd3 = request.getRequestDispatcher("user-setting.jsp");
			rd3.forward(request, response);
		}
	}

}
