package com.modak.user.dao;

import java.util.HashMap;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.modak.user.bean.ClassDTO;
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
		public List<ClassDTO> classList() {	
			return sqlSession.selectList("userSQL.classList");
		}
		
	    @Override
		public UserAllDTO userUpdate_nicknameCheck(String user_nickname) {			
			return sqlSession.selectOne("userSQL.userUpdate_nicknameCheck", user_nickname);
		}

		@Override
		public UserAllDTO userUpdate_emailCheck(String user_email) {
			return sqlSession.selectOne("userSQL.userUpdate_emailCheck", user_email);
		}
	
		@Override
		public void update_userImg(UserAllDTO userAllDTO) {
			sqlSession.update("userSQL.update_userImg", userAllDTO);
			
		}
		
		@Override
		public void update_userInfo(UserAllDTO userAllDTO) {
			sqlSession.update("userSQL.update_userInfo", userAllDTO);			
		}

		@Override
		public void update_userEmail(Map<String, String> map) {
			sqlSession.update("userSQL.update_userEmail", map);
			
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
		
		@Override
		public void updateBykakao(HashMap<String, Object> userInfo) {
			sqlSession.update("userSQL.updateBykakao", userInfo);				
		}

		//@@@@@@@@@ 연수 : UserAdminController에서 요청한 서비스 @@@@@@@@@ 
		//@@@ 어드민 페이지를 위한 유저 리스트 가져오기(220715)
		@Override
		public List<UserAllDTO> getUserAllList(Map<String, Integer> map) {
			return sqlSession.selectList("userSQL.getUserAllList", map);
		}
		//@@@ 회원 선택 삭제 기능(220715)
		@Override
		public void adminUserDelete_select(Map<String, String[]> map) {
			sqlSession.delete("userSQL.adminUserDelete_select", map);	
			
		}
		//@@@ 총 유저 수 구하기: 어드민 userlist for 페이징 처리(220717)	
		@Override
		public int getUserTotalA() {		
			return sqlSession.selectOne("userSQL.getUserTotalA");
		}
		
		//@@@ 서치된 총 유저 수 구하기: 어드민 userlist for 서치용 페이징 처리(220717)	
		@Override
		public int getUserTotalSearchA(Map<String, String> map) {
			return sqlSession.selectOne("userSQL.getUserTotalSearchA", map);
		}
		//@@@ 서치된 유저 정보 가져오기: 어드민 userlist by 서치(220717)
		@Override
		public List<UserAllDTO> getUserSearchList(Map<String, String> map) {
			return sqlSession.selectList("userSQL.getUserSearchList", map);
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
		public UserAllDTO userSignup_nicknameCheck(String user_nickname) {		
			return sqlSession.selectOne("userSQL.userSignup_nicknameCheck", user_nickname);
		}

		@Override
		public UserDTO getUserInformation(String user_email) {
			return sqlSession.selectOne("userSQL.getUserInformation", user_email);
		}
		
		@Override
		public void pwdFindChangeComplete(Map<String, String> map) {
			sqlSession.update("userSQL.pwdFindChangeComplete", map);
			
		}
		
		@Override
		public UserAllDTO findkakao(HashMap<String, Object> userInfo) {
			System.out.println("RN:"+userInfo.get("nickname"));
			System.out.println("RE:"+userInfo.get("email"));
			return sqlSession.selectOne("userSQL.findKakao", userInfo);
		}

		@Override
		public void kakaoinsert(HashMap<String, Object> userInfo) {
			sqlSession.insert("userSQL.kakaoInsert",userInfo);
		}
		
		@Override
		public UserAllDTO getUserClass_Class(int class_id) {
			return sqlSession.selectOne("userSQL.getUserClass_Class",class_id);
		}
		
	//유진 : 끝 0706====================================
	

	// 기진 : 시작  @@@@@@@@@@@@@@@@@@@@
		@Override
		public UserAllDTO login(String user_email) {
			return sqlSession.selectOne("userSQL.login", user_email);
		}
		
		@Override
		public UserDTO getUserInfo(String user_id) {
			
			return sqlSession.selectOne("userSQL.getUserInfo", user_id);
		}

		@Override
		public String getUserEmailByUserId(String user_id) {
			String artical_id = sqlSession.selectOne("userSQL.getUserInfo", user_id);
			return artical_id;
		}

		// 기진 : 끝 @@@@@@@@@@@@@@@@@@@@@@@
	
	//풍혁 : 시작 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
		@Override
		public int getUserIdByEmail(String session_email) {
			
			return sqlSession.selectOne("userSQL.getUserIdByEmail", session_email);
		}
		
		@Override
		public String getUserNameByUserId(int board_uid) {
			
			System.out.println("\n @LOG@ myBatis.. getUserNameByUserId... user_id : " + board_uid);
			String user_nickname = sqlSession.selectOne("userSQL.getUserNameByUserId", board_uid);
			System.out.println("user_nickname : " + user_nickname);
			return user_nickname;
		}
		
		@Override
		public String getUserImgByUserid(int user_id) {
			
			return sqlSession.selectOne("userSQL.getUserImgByUserid", user_id);
		}
	//풍혁 : 끝 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	



}
