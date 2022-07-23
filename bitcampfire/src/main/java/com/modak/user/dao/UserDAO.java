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
		
		//@@@ 연수 : UserAdminController에서 요청한 서비스 
		//@@@ 어드민 페이지를 위한 유저 리스트 가져오기(220715)	
		public List<UserAllDTO> getUserAllList(Map<String, Integer> map);
		//@@@ 어드민 페이지> 유저 리스트 > 학원명 한글로 바꾸기	
		public UserAllDTO getUserClass(String user_classid);
		//@@@ 회원 선택 삭제 기능(220715)	
		public void adminUserDelete_select(Map<String, String[]> map);
		//@@@ 총 유저 수 구하기: 어드민 userlist for 페이징 처리(220717)	
		public int getUserTotalA();
		//@@@ 서치된 총 유저 수 구하기: 어드민 userlist for 서치용 페이징 처리(220717)	
		public int getUserTotalSearchA(Map<String, String> map);
		//@@@ 서치된 유저 정보 가져오기: 어드민 userlist by 서치(220717)
		public List<UserAllDTO> getUserSearchList(Map<String, String> map);

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


		





}
