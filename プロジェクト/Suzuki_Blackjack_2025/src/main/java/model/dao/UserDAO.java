package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.User;
import util.DatabaseUtil;

public class UserDAO {
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	// user_nameとuser_passwordを参照してレコードを検索
	public User getUserByNameAndPassword(String name, String password) {
		User user = new User();
		System.out.println("DB接続@UserDAO/getUserByNameAndPassword");
		try {
			con = DatabaseUtil.getConnection();
			String sql = "SELECT * FROM users WHERE user_name = ? AND user_password = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, password);
			rs = ps.executeQuery();
			while(rs.next()) {
				user.setUserId(rs.getInt("user_id"));
				user.setUserName(rs.getString("user_name"));
				user.setUserPassword(rs.getString("user_password"));
				user.setUserIsAdmin(rs.getBoolean("userisAdmin"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DatabaseUtil.close(rs, ps, con);
			System.out.println("DB切断@UserDAO/getUserByNameAndPassword");
		}
		
		return user;		
	}
	
	// 同じユーザー名が存在しないかをチェックする
	public boolean userNameValidator(String name) {
		return true;
	}
	
	// user_nameとuser_passwordからusersにレコードを作成
	public void createUserByNameAndPassword(String name, String password) {
		
	}
}

// getUserByName
// getUserList
// 