package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DatabaseUtil;

public class ResultDAO {
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	// user_nameとuser_passwordを参照してレコードを検索
	public int InsertResultById(int userId, int resultCode) {
		int num = 0;
		System.out.println("DB接続@ResultDAO/InsertResultById");
		try {
			con = DatabaseUtil.getConnection();
			String sql = "INSERT INTO results (user_id, result_code)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setInt(2, resultCode);
			num = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DatabaseUtil.close(rs, ps, con);
			System.out.println("DB切断@UserDAO/getUserByNameAndPassword");
		}
		return num;
	}
}
