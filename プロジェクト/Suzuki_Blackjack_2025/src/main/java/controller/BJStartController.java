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
import model.dto.UserAccountDTO;
import service.AccountService;

@WebServlet("/BJStartController")
public class BJStartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// セッションを取得
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser")!=null) {
			UserAccountDTO loginUser = (UserAccountDTO)session.getAttribute("loginUser");
			String action = request.getParameter("action");
			if(action==null) {
				request.setAttribute("message", "BJStartControllerでエラーが発生しました");
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
			if("bet".equals(action)) {
				int bet = Integer.parseInt(request.getParameter("betNum"));
				// BJ情報を宣言
				Table table = new Table(bet);
				System.out.println(table.getBet() + "枚betされました");
				AccountService as = new AccountService();
				
				// bet後のチップの動き
				as.updateChipById(loginUser.getUserId(), loginUser.getUserChip()-bet);
				session.setAttribute("loginUser", as.getUserById(loginUser.getUserId()));
				request.setAttribute("table", table);	// 画面に送る用		
				session.setAttribute("table", table);	// 盤面記録用
				// BJプレイ画面をフォワード
				RequestDispatcher rd = request.getRequestDispatcher("blackjack-playing.jsp");
				rd.forward(request, response);
			}else if("back".equals(action)) {
				RequestDispatcher rd = request.getRequestDispatcher("main-menu.jsp");
				rd.forward(request, response);
			}else {
				request.setAttribute("message", "BJStartControllerでエラーが発生しました");
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
			
		}else {// ログインされていない
			request.setAttribute("message", "ログインしてください");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
		
	}

}
