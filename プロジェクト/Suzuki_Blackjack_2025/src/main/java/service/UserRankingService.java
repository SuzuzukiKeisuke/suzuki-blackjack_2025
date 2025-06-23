package service;

import java.util.ArrayList;
import java.util.List;

import model.dao.UserDAO;
import model.dto.UserAccountDTO;
import model.dto.UserInfoDTO;
import model.entity.UserStats;
import util.UserConverter;

public class UserRankingService {
	UserDAO uDAO = new UserDAO();
	
	// ユーザ一人分のデータを取得
	public UserInfoDTO getUserInfo(int userId) {
		
		// dbアクセス
		return UserConverter.toUserInfoDTO(uDAO.getUserStatsById(userId));
		
	}
	
	// 全アカウントリスト取得
	public List<UserAccountDTO> getUserList(){
		List<UserAccountDTO> userList = new ArrayList<UserAccountDTO>();
		uDAO.getUserList().forEach(user -> userList.add(UserConverter.toUserAccountDTO(user)));
		return userList;
	}
	
	
	
	
	// 勝率上位五人のリストを取得
	public List<UserInfoDTO> getUserRanking(){
		// usersテーブルのDAO
		
		
		// 返り値用
		List<UserInfoDTO> userInfoList = new ArrayList<UserInfoDTO>();
		
		// 勝率トップ5を取得する
		List<UserStats> userStatsList = uDAO.getUserChipRanking();
		
		// データの移し替え
		userStatsList.forEach(stats -> userInfoList.add(UserConverter.toUserInfoDTO(stats)));
		
		return userInfoList;
	}
}
