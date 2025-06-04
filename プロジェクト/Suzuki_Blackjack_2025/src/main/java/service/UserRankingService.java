package service;

import java.util.ArrayList;
import java.util.List;

import model.dao.UserDAO;
import model.dto.UserInfoDTO;
import model.entity.UserStats;
import util.UserConverter;

public class UserRankingService {
	
	public UserInfoDTO getUserInfo(int userId) {
		// dbアクセス
		UserDAO uDAO = new UserDAO();
		return UserConverter.toUserInfoDTO(uDAO.getUserStatsById(userId));
		
	}
	
	
	public List<UserInfoDTO> getUserRanking(){
		// usersテーブルのDAO
		UserDAO uDAO = new UserDAO();
		
		// 返り値用
		List<UserInfoDTO> userInfoList = new ArrayList<UserInfoDTO>();
		
		// 勝率トップ5を取得する
		List<UserStats> userStatsList = uDAO.getUserStatsList();
		
		// データの移し替え
		userStatsList.forEach(stats -> userInfoList.add(UserConverter.toUserInfoDTO(stats)));
		
		return userInfoList;
	}
}
