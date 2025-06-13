package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.entity.Result;
import util.DatabaseUtil;

public class ResultDAO {
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	// 対戦結果をresultsテーブルに保存
	public int InsertResultById(Result result) {
		int num = 0;
		System.out.println("DB接続@ResultDAO/InsertResultById");
		try {
			con = DatabaseUtil.getConnection();
			// そのラウンドで勝ったチップ情報も含めた
			String sql = "INSERT INTO results (user_id, result_code, result_win) VALUES (?, ?, ?)";
			ps = con.prepareStatement(sql);
			
			// そのラウンドで勝ったチップ情報も含めた
			ps.setInt(1, result.getUserId());
			ps.setInt(2, result.getResultCode());
			ps.setInt(3, result.getResultWin());
			num = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DatabaseUtil.close(rs, ps, con);
			System.out.println("DB切断@ResultDAO/InsertResultById");
		}
		return num;
	}
}
