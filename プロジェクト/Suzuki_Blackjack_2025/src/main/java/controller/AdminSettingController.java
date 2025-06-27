package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.UserAccountDTO;
import service.AccountService;
import service.UserRankingService;

@WebServlet("/AdminSettingController")
public class AdminSettingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		if ("update".equals(action)) {
			AccountService as = new AccountService();

			String userName = request.getParameter("userName");
			String userPassward = request.getParameter("userPassword");
			String newUserName = request.getParameter("newUserName");
			// 新しいユーザ入力情報を更新
			UserAccountDTO user = as.changeUserName(userName, userPassward, newUserName);
			if(user != null) {
				// 画面の更新
				request.setAttribute("message", "アカウント名を更新しました");
			}else {
				request.setAttribute("message", "ユーザー名更新に失敗しました");
			}

		}

		UserRankingService urs = new UserRankingService();
		request.setAttribute("userlist", urs.getUserList());

		RequestDispatcher rd1 = request.getRequestDispatcher("admin-menu.jsp");
		rd1.forward(request, response);

	}

}
