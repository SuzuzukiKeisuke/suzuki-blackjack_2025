package service;

import model.User;
import model.dao.UserDAO;
import model.dto.UserAccountDTO;
// アカウント認証全般を担当する
public class AuthenticationService {
	
	// usersテーブルのDAO
	UserDAO uDAO = new UserDAO();
	
	// ログイン認証
	UserAccountDTO loginAuth(String name, String password) {
		
		// dbからアカウント情報を取得
		User user = uDAO.getUserByNameAndPassword(name, password);
		
		// entityからDTOにデータを移し替える
		UserAccountDTO uaDTO = new UserAccountDTO(
				user.getUserId(),
				user.getUserName(),
				user.getUserPassword(),
				user.isUserIsAdmin()
				);
		return uaDTO;
	}
	// サインイン
	UserAccountDTO signInAuth(String name, String password) {
		
		// ユーザ名の妥当性を調査
		if(uDAO.userNameValidator(name)) {
			// レコード生成
			//　レコード返す
		}else {
			// 空のUserAccountDTOを返す
		}
	}
}
