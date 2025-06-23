package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;




public class DatabaseUtil {
    
    // 接続用定数
    private static final String URL = "jdbc:mysql://localhost:3306/blackjack?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    // **静的ブロックでドライバをロード**
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("MySQL JDBCドライバが見つかりません", e);
        }
    }
    
    // データベース接続を取得
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // 接続を閉じる
    public static void close(AutoCloseable... resources) {
        for (AutoCloseable r : resources) {
            if (r != null) {
                try {
                    r.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
//public class DatabaseUtil {
//	
//	// 接続用定数
//	private static final String URL = "jdbc:mysql://localhost/blackjack";
//	private static final String USER = "root";
//	private static final String PASSWORD = "";
//    Class.forName("com.mysql.cj.jdbc.Driver");
//	
//	// データベース接続を取得
//	public static Connection getConnection() throws SQLException{
//		return DriverManager.getConnection(URL, USER, PASSWORD);
//	}
//
//
//    // 接続を閉じる
//    public static void close(AutoCloseable... resource) {
//        for(AutoCloseable r : resource) {
//        	if(r != null) {
//        		try { // 例外
//                    r.close();
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//        	}
//        }
//    }
//}
