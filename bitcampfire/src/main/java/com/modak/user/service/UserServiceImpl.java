package com.modak.user.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modak.user.bean.UserAllDTO;
import com.modak.user.bean.UserDTO;
import com.modak.user.dao.UserDAO;

@Service
public class UserServiceImpl implements UserService {
	//공통 영역 : 시작 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		@Autowired
		UserDAO userDAO;
		
	//공통 영역 : 끝 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	//연수 : 시작(220706) ====================================
		@Override
		public UserAllDTO getUser(String user_email) {
			return userDAO.getUser(user_email);
		}

		public void update(UserDTO userDTO) {
			userDAO.update(userDTO);		
		}

		@Override
		public UserDTO checkPwd(String user_email) {
			return userDAO.checkPwd(user_email);
		}

		@Override
		public void pwdChangeComplete(Map<String, String> map) {
			userDAO.pwdChangeComplete(map);	
		}
		
		@Override
		public void delete(String user_email) {
			userDAO.delete(user_email);
			
		}
	//연수 : 끝(220706) ====================================
	
	//유진 : 시작 ====================================
	
	//유진 : 끝 ====================================
	

	// 기진 : 시작  @@@@@@@@@@@@@@@@@@@@ 
	
	// 기진 : 끝 @@@@@@@@@@@@@@@@@@@@@@@
}
