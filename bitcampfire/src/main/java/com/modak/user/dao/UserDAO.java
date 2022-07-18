package com.modak.user.dao;


import java.util.HashMap;

import java.util.List;

import java.util.Map;

import com.modak.user.bean.ClassDTO;
import com.modak.user.bean.UserAllDTO;
import com.modak.user.bean.UserDTO;

public interface UserDAO {

	//공통 영역 : 시작 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


	//공통 영역 : 끝 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	//연수 : 시작(220706) ====================================
		public UserAllDTO getUser(String user_email);
		
		public List<ClassDTO> classList();
	    
		public UserAllDTO userUpdate_nicknameCheck(String user_nickname);

		public UserAllDTO userUpdate_emailCheck(String user_email);
		
		public void update_userImg(UserAllDTO userAllDTO);
		
		public void update_userInfo(UserAllDTO userAllDTO);

		public void update_userEmail(Map<String, String> map);

		public UserDTO checkPwd(String user_email);

		public void pwdChangeComplete(Map<String, String> map);

		public void delete(String user_email);		
		
		public void updateBykakao(HashMap<String, Object> userInfo);
		
	//연수 : 끝시작(220706) ====================================
	
	//유진 : 시작 0706 ====================================
		public void user_register(UserAllDTO userAllDTO);

		public UserAllDTO userSignup_emailCheck(String user_email);
		
		public UserAllDTO userSignup_nicknameCheck(String user_nickname);
		
		public UserDTO getUserInformation(String user_email);
		
		public void pwdFindChangeComplete(Map<String, String> map);
		
		public UserAllDTO findkakao(HashMap<String, Object> userInfo);

		public void kakaoinsert(HashMap<String, Object> userInfo);

		public UserAllDTO getUserClass_Class(int class_id);
	//유진 : 끝 0706====================================
	

	// 기진 : 시작  @@@@@@@@@@@@@@@@@@@@ 
		
		public UserAllDTO login(String user_email);

		public UserDTO getUserInfo(String user_id);

		public String getUserEmailByUserId(String user_id);
	// 기진 : 끝 @@@@@@@@@@@@@@@@@@@@@@@

	// 풍혁 : 시작 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		//풍혁 220708 : 글 작성하고 리스트에서 유저 이름 or 닉네임 표시하기 위해 만들었습니다. 
		public int getUserIdByEmail(String session_email);		

		public String getUserNameByUserId(int board_uid);

		public String getUserImgByUserid(int user_id);
	// 풍혁 : 끝 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	

		public String getUserNameByUserIdClass(int board_uid);

		public String getUserClassImgByUserid(int user_id);

		public int getUserIdByEmailClass(String session_email);





		





		








}
