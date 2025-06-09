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
import model.dto.BJTableDTO;

@WebServlet("/BJStartCotroller")
public class BJStartCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// セッションを取得
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser")!=null) {
			
			// BJ情報を宣言
			Table table = new Table();
			BJTableDTO bjDTO = 
					new BJTableDTO(table.getDealer().getCards(),
							table.getPlayer().getCards(),
							table.getDealer().getHandValue(),
							table.getPlayer().getHandValue()
					);
			request.setAttribute("tabledata", bjDTO);	// 画面に表示するデータ
			session.setAttribute("deckdata", table.getDeck());	// 山札の情報
			RequestDispatcher rd = request.getRequestDispatcher("blackjack-playing.java");
			rd.forward(request, response);
		}else {// ログインされていない
			request.setAttribute("message", "ログインしてください");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
		
	}

}
