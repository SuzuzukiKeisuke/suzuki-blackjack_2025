package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.entity.User;
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
				user.setUserIsAdmin(rs.getBoolean("user_isadmin"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DatabaseUtil.close(rs, ps, con);
			System.out.println("DB切断@UserDAO/getUserByNameAndPassword");
		}
		return user;		
	}
	
	// idを参照してレコードを検索
		public User getUserById(int userId) {
			User user = new User();
			System.out.println("DB接続@UserDAO/getUserById");
			try {
				con = DatabaseUtil.getConnection();
				String sql = "SELECT * FROM users WHERE user_id = ?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, userId);
				rs = ps.executeQuery();
				while(rs.next()) {
					user.setUserId(rs.getInt("user_id"));
					user.setUserName(rs.getString("user_name"));
					user.setUserPassword(rs.getString("user_password"));
					user.setUserIsAdmin(rs.getBoolean("user_isadmin"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DatabaseUtil.close(rs, ps, con);
				System.out.println("DB切断@UserDAO/getUserById");
			}
			return user;		
		}
	
	// usersのリストを取得する
	public List<User> getUserList(){
		User user = new User();
		List<User> userList = new ArrayList<User>();
		System.out.println("DB接続@UserDAO/getUserList");
		try {
			con = DatabaseUtil.getConnection();
			String sql = "SELECT * FROM users ORDER BY user_id";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				user.setUserId(rs.getInt("user_id"));
				user.setUserName(rs.getString("user_name"));
				user.setUserPassword(rs.getString("user_password"));
				user.setUserIsAdmin(rs.getBoolean("user_isadmin"));
				userList.add(user);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			DatabaseUtil.close(rs, ps, con);
			System.out.println("DB切断@UserDAO/getUserList");
		}
		return userList;
	}
	
	
	
	// 同じユーザー名が存在しないかをチェックする
	public boolean userNameValidator(String name) {
		boolean flag = false;
		
		System.out.println("DB接続@UserDAO/userNameValidator");
		try {
			con = DatabaseUtil.getConnection();
			String sql = "SELECT * FROM users WHERE user_name = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();
			flag = rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DatabaseUtil.close(rs, ps, con);
			System.out.println("DB切断@UserDAO/userNameValidator");
		}
				
		return !flag;
		// 以下を反転して返す
		// true -> このuser_nameを使用しているレコードが存在する 
		// false -> このuser_nameはまだ使用されていない
	}
	
	// user_nameとuser_passwordからusersにレコードを作成
	public int createUserByNameAndPassword(String name, String password) {
		int num = 0;
		System.out.println("DB接続@UserDAO/createUserByNameAndPassword");
		try {
			con = DatabaseUtil.getConnection();
			String sql = "INSERT INTO users (user_name, user_password) VALUES (?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, password);
			num = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DatabaseUtil.close(rs, ps, con);
			System.out.println("DB切断@UserDAO/createUserByNameAndPassword");
		}
		return num;		
	}
	
	
	
	// idを参照してアカウント名を変更する
	public int updateUsernameById(int userId, String newUserName) {
		int num = 0;
		System.out.println("DB接続@UserDAO/updateUserById");
		try {
			con = DatabaseUtil.getConnection();
			String sql = "UPDATE users SET user_name = ? WHERE user_id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, newUserName);
			ps.setInt(2, userId);
			num = ps.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DatabaseUtil.close(rs, ps, con);
			System.out.println("DB切断@UserDAO/createUserByNameAndPassword");
		}
		return num;
	}
	
	// idを参照してアカウントを削除する
	public int deleteUserById(int userId) {
		int num = 0;
		System.out.println("DB接続@UserDAO/deleteUserById");
		try {
			con = DatabaseUtil.getConnection();
			String sql = "DELETE FROM users WHERE user_id = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			num = ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DatabaseUtil.close(rs, ps, con);
			System.out.println("DB切断@UserDAO/deleteUserById");
		}
		return num;
	}
	
}
