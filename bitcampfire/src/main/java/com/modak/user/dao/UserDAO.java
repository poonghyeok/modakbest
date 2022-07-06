package com.modak.user.dao;

import java.util.Map;


import com.modak.user.bean.UserAllDTO;
import com.modak.user.bean.UserDTO;

public interface UserDAO {

	//공통 영역 : 시작 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


	//공통 영역 : 끝 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	//연수 : 시작(220706) ====================================
		public UserAllDTO getUser(String user_email);

		public void update(UserDTO userDTO);

		public UserDTO checkPwd(String user_email);

		public void pwdChangeComplete(Map<String, String> map);

		public void delete(String user_email);
	//연수 : 끝시작(220706) ====================================
	
	//유진 : 시작 ====================================
	
	//유진 : 끝 ====================================
	

	// 기진 : 시작  @@@@@@@@@@@@@@@@@@@@ 
	
		public UserDTO checkIdPw(Map<String, String> map);
		
		
	// 기진 : 끝 @@@@@@@@@@@@@@@@@@@@@@@

}
