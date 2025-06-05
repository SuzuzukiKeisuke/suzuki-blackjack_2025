package service;

import model.dao.UserDAO;
import model.dto.UserAccountDTO;
import model.entity.User;
import util.UserConverter;

// アカウント操作全般を担当する
public class AccountService {
	
	// usersテーブルのDAO
	UserDAO uDAO = new UserDAO();
	
	// idからUserAccountDTOを得る
	public UserAccountDTO getUserById(int userId) {
		return UserConverter.toUserAccountDTO(uDAO.getUserById(userId)); 
	}

	// アカウント名変更
	public UserAccountDTO changeUserName(String userName, String userPassword, String newUserName) {
		
		// ユーザ名とパスワードでアカウントを探す
		User user = uDAO.getUserByNameAndPassword(userName, userPassword);

		
		// Idを参照してアカウント名を変更
		int num = uDAO.updateUsernameById(user.getUserId(), newUserName);
		System.out.println(num + "件処理しました");
		
		// アカウントの情報を返す
		user = uDAO.getUserById(user.getUserId());
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

}
