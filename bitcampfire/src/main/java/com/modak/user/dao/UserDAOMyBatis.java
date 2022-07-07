package com.modak.user.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import com.modak.user.bean.UserAllDTO;
import com.modak.user.bean.UserDTO;

@Repository
@Transactional
public class UserDAOMyBatis implements UserDAO {
	//공통 영역 : 시작 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		@Autowired
		private SqlSession sqlSession;	

	//공통 영역 : 끝 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	//연수 : 시작(220706) ====================================
		@Override
		public UserAllDTO getUser(String user_email) {
			return sqlSession.selectOne("userSQL.getUser", user_email);
		}


		@Override
		public void update(UserDTO userDTO) {
			sqlSession.update("userSQL.update", userDTO);		
		}

		@Override
		public UserDTO checkPwd(String user_email) {
			return sqlSession.selectOne("userSQL.checkPwd", user_email);
		}

		@Override
		public void pwdChangeComplete(Map<String, String> map) {
			sqlSession.update("userSQL.pwdChangeComplete", map);
			
		}
		
		@Override
		public void delete(String user_email) {
			sqlSession.delete("userSQL.delete", user_email);		
		}
	//연수 : 끝(220706)====================================

	
	//유진 : 시작 0706====================================
		@Override
		public void user_register(UserAllDTO userAllDTO) {
			sqlSession.insert("userSQL.user_register",userAllDTO);		
		}

		@Override
		public UserAllDTO userSignup_emailCheck(String user_email) {
			return sqlSession.selectOne("userSQL.userSignup_emailCheck",user_email);
		}
		
		@Override
		public UserDTO getUserInformation(String user_email) {
			return sqlSession.selectOne("userSQL.getUserInformation", user_email);
		}
	//유진 : 끝 0706====================================
	

	// 기진 : 시작  @@@@@@@@@@@@@@@@@@@@ 
	
		@Override
		public UserDTO checkIdPw(Map<String, String> map) {
			// TODO Auto-generated method stub
			return sqlSession.selectOne("userSQL.checkIdPw", map);
		}


		
		
		
	// 기진 : 끝 @@@@@@@@@@@@@@@@@@@@@@@
	
	
}
