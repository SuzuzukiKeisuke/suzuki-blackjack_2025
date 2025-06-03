package util;

import model.dto.UserAccountDTO;
import model.dto.UserInfoDTO;
import model.entity.User;

public class UserConverter {
	 // User
	 // UserAccountDTO
	 // UserInfoDto
	public static UserAccountDTO toUserAccountDTO(User user) {
		return new UserAccountDTO(
						user.getUserId(),
						user.getUserName(),
						user.getUserPassword(),
						user.isUserIsAdmin());
	}
	
	
	public static UserInfoDTO toUserInfoDTO(User user) {
		// あとでつくる
		return null;
	}
}
