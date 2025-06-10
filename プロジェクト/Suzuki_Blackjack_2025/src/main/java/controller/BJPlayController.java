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
import model.entity.Result;
import service.AccountService;

@WebServlet("/BJPlayController")
public class BJPlayController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		try {
			// ゲームロジックの処理

			// ヒットの処理を書く
			

			// オブジェクトの受け取り
			HttpSession session = request.getSession();
			Object userObj = session.getAttribute("loginUser");
			String action = "";
			action = request.getParameter("action");

			if (userObj != null) {// ログインチェック
				Table table;
				Object obj = session.getAttribute("table");

				if (obj != null) {// ヌルチェック
					table = (Table) obj;
					if ("stand".equals(action)) {
						// ディーラーの動作
						table.doHit(table.getDealer());
						request.setAttribute("table", table);// 表示用データ

						// 戦績をDBに記録
						UserAccountDTO loginUser = (UserAccountDTO) userObj;
						AccountService as = new AccountService();
						as.updateStatsAndResult(new Result(loginUser.getUserId(), table.doJudge()));

						// jspに情報を送る
						System.out.println("debug1");
						request.setAttribute("resultcode", table.doJudge());
						System.out.println("debug2");
						rd = request.getRequestDispatcher("blackjack-result.jsp");
						System.out.println("debug3");

					} else if (table.doHit(table.getPlayer())) {// バーストしている場合

						// ディーラーの動作
						table.doHit(table.getDealer());
						request.setAttribute("table", table);// 表示用データ

						// 戦績をDBに記録
						UserAccountDTO loginUser = (UserAccountDTO) userObj;
						AccountService as = new AccountService();
						as.updateStatsAndResult(new Result(loginUser.getUserId(), table.doJudge()));

						// jspに情報を送る
						request.setAttribute("resultcode", table.doJudge());
						rd = request.getRequestDispatcher("blackjack-result.jsp");

					} else {// バーストしてない場合

						request.setAttribute("table", table);
						session.setAttribute("table", table);
						rd = request.getRequestDispatcher("blackjack-playing.jsp");

					}
				} else {
					System.out.println("エラー!BJPlayControllerでTableが正常に渡りませんでした");
					rd = request.getRequestDispatcher("main-menu.jsp");

				}
			} else {
				request.setAttribute("message", "ログインしてください");
				rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);

			}
			} catch (Exception e) {
				e.printStackTrace(); // サーバーのコンソールにエラーメッセージを表示
				response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "エラーが発生しました。");
				rd = request.getRequestDispatcher("login.jsp");
				
			}finally {
				rd.forward(request, response);
			}
			
				
				
				
				
				
	

	
	}

}
