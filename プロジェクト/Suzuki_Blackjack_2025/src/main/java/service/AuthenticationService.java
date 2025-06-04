package service;

import model.dao.UserDAO;
import model.dto.UserAccountDTO;
import model.entity.User;
import util.UserConverter;
// ユーザ認証全般を担当する
public class AuthenticationService {
	
	// usersテーブルのDAO
	UserDAO uDAO = new UserDAO();
	
	// ログイン認証
	public UserAccountDTO loginAuth(String name, String password) {

		// dbからアカウント情報を取得
		User user = uDAO.getUserByNameAndPassword(name, password);
		
		// nullチェック
		if(user!=null) { 
			return UserConverter.toUserAccountDTO(user);	
		}else { // 認証失敗
			return null;
		}
	}
	
	
	// サインアップ
	public UserAccountDTO signUpAuth(String name, String password) {
		
		// ユーザ名の妥当性を調査
		// TRUE  -> 使用できる
		// FALSE -> 使用できない
		if(uDAO.userNameValidator(name)) {// ユーザー名が使用可か
			int num = uDAO.createUserByNameAndPassword(name, password);	// アカウント作成
			System.out.println(num + "件処理しました");
			User user = uDAO.getUserByNameAndPassword(name, password);	// アカウント取得
			return UserConverter.toUserAccountDTO(user);			
		}else { // 空のUserAccountDTOを返す
			return null;
		}
	}
}
