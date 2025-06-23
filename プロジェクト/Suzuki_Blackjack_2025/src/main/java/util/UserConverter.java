package util;

import model.dto.UserAccountDTO;
import model.dto.UserInfoDTO;
import model.entity.User;
import model.entity.UserStats;

public class UserConverter {
	 // User
	 // UserAccountDTO
	 // UserInfoDto
	public static UserAccountDTO toUserAccountDTO(User user) {
		return new UserAccountDTO(
						user.getUserId(),
						user.getUserName(),
//						user.getUserPassword(),
						user.isUserIsAdmin(),
						user.getUserChip());
	}
	
	
	public static UserInfoDTO toUserInfoDTO(UserStats stats) {
		return new UserInfoDTO(
						stats.getUserId(),
						stats.getUserName(),
						stats.getBjCount(),
						stats.getWinCount(),
						stats.getLoseCount(),
						stats.getDrawCount(),
						stats.getChip());
	}
}
