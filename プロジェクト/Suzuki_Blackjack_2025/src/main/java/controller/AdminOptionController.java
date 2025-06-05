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


@WebServlet("/AdminOptionController")
public class AdminOptionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 選択されたユーザのID
		String userId = request.getParameter("userId");
		
		// ユーザー情報を得る
		AccountService as = new AccountService();
		UserAccountDTO user = as.getUserById(Integer.parseInt(userId));
		
		request.setAttribute("user", user);
		
		RequestDispatcher rd = request.getRequestDispatcher("admin-option.jsp");
		rd.forward(request, response);
	}

}
