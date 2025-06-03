package service;

import model.dao.UserDAO;
import model.dto.UserAccountDTO;
import model.entity.User;
import util.UserConverter;

// アカウント操作全般を担当する
public class AccountService {
	
	// usersテーブルのDAO
	UserDAO uDAO = new UserDAO();

	// アカウント名変更
	public UserAccountDTO changeUserName(int userId, String newUserName) {
		
		// Idを参照してアカウント名を変更
		int num = uDAO.updateUsernameById(userId, newUserName);
		System.out.println(num + "件処理しました");
		
		// アカウントの情報を返す
		User user = uDAO.getUserById(userId);
		return UserConverter.toUserAccountDTO(user);
	}
	
	
	// アカウント消去
	public boolean deleteUser(int userId) {
		if(uDAO.deleteUserById(userId) == 1) { // アカウント消去
			return true;
		}else { // アカウントが存在しなかったか、アカウントが複数消去された0
			return false;
		}
	}
	
	// RankingServiceの作成
	// UserInfoDTOの生成クラスを作成
}
