package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.UserRankingService;


@WebServlet("/AdminMenuController")
public class AdminMenuController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser")!=null) {
			RequestDispatcher rd = request.getRequestDispatcher("main-menu.jsp");
			rd.forward(request, response);
		}else {// ログインされていない
			request.setAttribute("message", "ログインしてください");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserRankingService urs = new UserRankingService();
		request.setAttribute("userlist", urs.getUserList());
		
		RequestDispatcher rd = request.getRequestDispatcher("admin-menu.jsp");
		rd.forward(request, response);
	}

}
