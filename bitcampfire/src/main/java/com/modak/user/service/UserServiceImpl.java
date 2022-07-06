package com.modak.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modak.user.dao.UserDAO;

@Service
public class UserServiceImpl implements UserService {
	//공통 영역 : 시작 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		@Autowired
		UserDAO userDAO;
		
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
	
	// 기진 : 끝 @@@@@@@@@@@@@@@@@@@@@@@
}
