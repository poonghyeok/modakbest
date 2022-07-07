package com.modak.user.service;

import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modak.user.bean.UserAllDTO;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.modak.user.bean.UserDTO;
import com.modak.user.dao.UserDAO;

@Service
public class UserServiceImpl implements UserService {
	//공통 영역 : 시작 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		@Autowired
		UserDAO userDAO;
		

	//공통 영역 : 끝 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	//연수 : 시작(220706) ====================================

		@Autowired
		private HttpSession session;
		

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
		@Override
		public void user_register(UserAllDTO userAllDTO) {
			userDAO.user_register(userAllDTO);
		}

		@Override
		public String userSignup_emailCheck(String user_email) {
			UserAllDTO userAllDTO = userDAO.userSignup_emailCheck(user_email);
			if(userAllDTO == null) {
				return "non exist";
			}else {
				return "exist";
			}
		}
		
		@Override
		public UserDTO getUserInformation(String user_email) {
			return userDAO.getUserInformation(user_email);
		}
		//유진 : 끝 ====================================
	

	// 기진 : 시작  @@@@@@@@@@@@@@@@@@@@ 
		@Override
		public String login(Map<String, String> map) {
			//DB
			UserDTO userDTO = userDAO.login(map);
			
			if(userDTO != null) {
				//session.setAttribute("memEmail", userDTO.getUser_email());
				//session.setAttribute("memPwd", userDTO.getUser_pwd());
				//session.setAttribute("memNickname", userDTO.getUser_nickname());
				
				return "ok";
				
			}else{			
				return "fail";
			}
		}
	
		@Override
		public String checkIdPw(Map<String, String> map) {
			//DB
			UserDTO userDTO = userDAO.checkIdPw(map);

			if(userDTO != null) {
				session.setAttribute("userEmail", userDTO.getUser_email());
				session.setAttribute("userPwd", userDTO.getUser_pwd());
				session.setAttribute("userNickname", userDTO.getUser_nickname());
				

				System.out.println("userServiceImpl" + userDTO);
				return "home";	

				
			}else {
				
				return "/user/userLoginFail";
			}
		}


		
		
		
	// 기진 : 끝 @@@@@@@@@@@@@@@@@@@@@@@
}
