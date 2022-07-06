package com.modak.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class UserDAOMyBatis implements UserDAO {
	//공통 영역 : 시작 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		@Autowired
		private SqlSession session;
		
		private final String namespace = "userSQL.";
		
		@Override
		public int count(){
			System.out.print("UserDaoImpl..test..count..");
			return session.selectOne(namespace+"userCount");
		}
	//공통 영역 : 끝 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	//연수 : 시작 ====================================
	
	//연수 : 끝 ====================================
	
	//유진 : 시작 ====================================
	
	//유진 : 끝 ====================================
	

	// 기진 : 시작  @@@@@@@@@@@@@@@@@@@@ 
	
	// 기진 : 끝 @@@@@@@@@@@@@@@@@@@@@@@
	
	
}
