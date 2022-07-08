package com.modak.user.service;

import java.util.Map;

import com.modak.user.bean.UserAllDTO;
import com.modak.user.bean.UserDTO;


public interface UserService {


	//공통 영역 : 시작 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		
	//공통 영역 : 끝 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


	//연수 : 시작(220706) ====================================
	    public UserAllDTO getUser(String user_email);
	
	    public void update(UserAllDTO userAllDTO);
	
	    public UserDTO checkPwd(String user_email);
	
	    public void pwdChangeComplete(Map<String, String> map);
	
	    public void delete(String user_email);
	//연수 : 끝(220706) ====================================

	
    //유진 : 시작 0706====================================
    	public void user_register(UserAllDTO userAllDTO);

    	public String userSignup_emailCheck(String user_email);
    	
    	//@@@@ 연수 닉네임 중복검사 추가(220708) @@@@	
    	public String userSignup_nicknameCheck(String user_nickname);
    	//@@@@ 연수 닉네임 중복검사 추가(220708) @@@@
    	
    	public UserDTO getUserInformation(String user_email);
    	
  	//유진 : 끝 0706====================================
	

	// 기진 : 시작  @@@@@@@@@@@@@@@@@@@@ 
    	//@@@@ 연수 수정(220708)  @@@@///      
    	public String login(Map<String, String> map);
    
    	// 기진 : 끝 @@@@@@@@@@@@@@@@@@@@@@@

		public void userLogout();


		
}
