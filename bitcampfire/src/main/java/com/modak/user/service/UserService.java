package com.modak.user.service;

import java.util.HashMap;

import java.util.List;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.modak.user.bean.ClassDTO;
import com.modak.user.bean.UserAdminPaging;
import com.modak.user.bean.UserAllDTO;
import com.modak.user.bean.UserDTO;


public interface UserService {


	//공통 영역 : 시작 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		
	//공통 영역 : 끝 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


	//연수 : 시작(220706) ====================================
	    public UserAllDTO getUser(String user_email);

	    //@@@ 연수 : 학원 검색 기능 수정중(0711) @@@
	    public List<ClassDTO> classList();

	    public UserAllDTO userUpdate_nicknameCheck(String user_nickname);
	    
	    public UserAllDTO userUpdate_emailCheck(String user_email);

	    public void update_userImg(UserAllDTO userAllDTO);

	    public void update_userInfo(UserAllDTO userAllDTO);

	    public void update_userEmail(Map<String, String> map);
	
	    public UserDTO checkPwd(String user_email);
	
	    public void pwdChangeComplete(Map<String, String> map);
	
	    public void delete(String user_email);
	    
    	//@@@ 연수 카카오 로그아웃 추가(220712)
		public void kakaoLogout(String access_Token);
		
		public void kakaoUnlink(String access_Token);
		
		//@@@ 연수 : UserAdminController에서 요청한 서비스 
		//@@@ 어드민 페이지를 위한 유저 리스트 가져오기(220715)
		public Map<String, Object> getUserAllList(String pg);
		//@@@ 페이징 처리(220717)
		public UserAdminPaging getUserAdminPaging(String pg);
		//@@@ 카카오 회원 어드민 삭제 처리 기능(220716)
		public void kakaoUnlink_admin(Long user_kakaoId);
		//@@@ 회원 선택삭제 기능(220716)
		public void adminUserDelete_select(String[] check);		
		//@@@ 회원 검색 기능(220717)
		public Map<String, Object> adminUserSearch(Map<String, String> map);
		
	//연수 : 끝(220706) ====================================

	
    //유진 : 시작 0706====================================
    	public void user_register(UserAllDTO userAllDTO);

    	public String userSignup_emailCheck(String user_email);    	
    	
    	public String userSignup_nicknameCheck(String user_nickname);   
    	
    	public UserDTO getUserInformation(String user_email);
    	
    	public void pwdFindChangeComplete(Map<String, String> map);
    	
    	public String getAccessToken(String code);

		//public HashMap<String, Object> getUserInfo(String access_Token);
    	public UserAllDTO getUserInfo(String access_Token);
    	
    	
    	public UserAllDTO getUserClass_Class(int class_id);
  	//유진 : 끝 0706====================================
	

	// 기진 : 시작  @@@@@@@@@@@@@@@@@@@@ 
          
    	public String login(Map<String, String> map);    

    	public void userLogout();

    	public UserDTO getUserInfo2(String user_id);
    	
//    	public String getUserEmailByUserId(String user_id);
    	
    // 기진 : 끝 @@@@@@@@@@@@@@@@@@@@@@@


    // 풍혁 : 시작 &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
    	public int getUserIdByEmail(String session_email);
    	
    	public String getUserNameByUserId(int board_uid);
    	
    	//풍혁0714 : board_uid로 user_img를 받아가려고 만들었습니다. 
    	public String getUserImgByUserid(int user_id);

    
    // 풍혁 : 끝 &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&



		


		


		
}
