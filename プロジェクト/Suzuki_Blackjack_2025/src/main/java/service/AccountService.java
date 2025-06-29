package service;

import model.dao.ResultDAO;
import model.dao.UserDAO;
import model.dto.UserAccountDTO;
import model.entity.Result;
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
		
		
		if(user==null) {
			System.out.println("アカウントが見つかりませんでした");
			return null;
		}

		if(uDAO.userNameValidator(newUserName)) {
			// Idを参照してアカウント名を変更
			int num = uDAO.updateUsernameById(user.getUserId(), newUserName);
			System.out.println(num + "件処理しました");
			
			// アカウントの情報を返す
			user = uDAO.getUserById(user.getUserId());
			return UserConverter.toUserAccountDTO(user);
		}else {
			System.out.println("アカウント名が重複しています");
			return null;
		}
		
		
			
		
	
		
		
	}
	
	
	// アカウント消去
	public boolean deleteUser(int userId) {
		if(uDAO.deleteUserById(userId) == 1) { // アカウント消去
			return true;
		}else { // アカウントが存在しなかったか、アカウントが複数消去された0
			return false;
		}
	}
	
	// 戦績更新
	public void updateStatsAndResult(Result result) {
		ResultDAO rDAO = new ResultDAO();
		int num = 0;
		num = rDAO.InsertResultById(result);
		System.out.println(num+"件処理しました");
		num = uDAO.updateUserStatsById(result);
		System.out.println(num+"件処理しました");
	}
	
	public void updateChipById(int userId, int userChip) {
		int num = uDAO.updateChipById(userId, userChip);
		System.out.println(num + "件処理しました");
	}

}
