package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.AccountService;
import service.UserRankingService;

@WebServlet("/AdminSettingController")
public class AdminSettingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserRankingService urs = new UserRankingService();
		request.setAttribute("userlist", urs.getUserList());
		
		RequestDispatcher rd = request.getRequestDispatcher("admin-menu.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AccountService as = new AccountService();

		String userName = request.getParameter("userName");
		String userPassward = request.getParameter("userPassword");
		String newUserName = request.getParameter("newUserName");

		// 新しいユーザ入力情報を更新
		as.changeUserName(userName, userPassward, newUserName);
		UserRankingService urs = new UserRankingService();
		request.setAttribute("userlist", urs.getUserList());
		
		// 画面の更新
		request.setAttribute("message", "アカウント名を更新しました");
		RequestDispatcher rd1 = request.getRequestDispatcher("admin-menu.jsp");
		rd1.forward(request, response);

	}

}
