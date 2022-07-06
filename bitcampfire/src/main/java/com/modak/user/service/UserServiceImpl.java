package com.modak.user.service;

import java.util.Map;

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
		
		@Autowired
		private HttpSession session;
		
		@Override
		public int getCount() {
			System.out.print("userServiceImpl...test..getCount..");
			return userDAO.count();
		}
	//공통 영역 : 끝 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


	//연수 : 시작 ====================================
	
	//연수 : 끝 ====================================
	
	//유진 : 시작 ====================================
	
	//유진 : 끝 ====================================
	

	// 기진 : 시작  @@@@@@@@@@@@@@@@@@@@ 
	
		@Override
		public String checkIdPw(Map<String, String> map) {
			//DB
			UserDTO userDto = userDAO.checkIdPw(map);

			if(userDto != null) {
				session.setAttribute("userEmail", userDto.getUser_email());
				session.setAttribute("userPwd", userDto.getUser_pwd());
				session.setAttribute("userNickname", userDto.getUser_nickname());
				
				System.out.println(userDto);
				return "index";	
				
			}else {
				
				return "/user/userLoginFail";
			}
		}
		
		
	// 기진 : 끝 @@@@@@@@@@@@@@@@@@@@@@@
}
