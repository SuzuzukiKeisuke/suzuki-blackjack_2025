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
import service.AuthenticationService;


@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("sign-up.jsp");
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ユーザー名とパスワードを受け取る
		String userName = request.getParameter("userName");
		String userPassword = request.getParameter("userPassword");
		
		// アカウント認証
		AuthenticationService as = new AuthenticationService();
		UserAccountDTO uaDTO = as.loginAuth(userName, userPassword);
		
		RequestDispatcher rd;
		if(uaDTO != null) {// ログイン成功
			// セッションを取得
			HttpSession session = request.getSession();
			
			// セッションにログイン情報を保存
			session.setAttribute("loginUser", uaDTO);
			
			// メインメニューへの遷移
			rd = request.getRequestDispatcher("main-menu.jsp");
		
		}else {// ログイン失敗
			request.setAttribute("message", "ログイン認証に失敗しました");
			rd = request.getRequestDispatcher("login.jsp");
		}
		rd.forward(request, response);
		
	}

}
