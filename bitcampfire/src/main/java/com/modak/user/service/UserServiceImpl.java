package com.modak.user.service;


import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import java.util.List;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;


import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import com.modak.user.bean.ClassDTO;

import com.modak.user.bean.UserAllDTO;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.modak.user.bean.UserDTO;
import com.modak.user.controller.UserSignupController;
import com.modak.user.dao.UserDAO;

@Service
public class UserServiceImpl implements UserService {
	//공통 영역 : 시작 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		@Autowired
		private UserDAO userDAO;	
		//풍혁 220707 : session객체를 공통역역으로 이동시켰습니다.
		@Autowired
		private HttpSession session;		
		@Autowired
		private BCryptPasswordEncoder passwordEncoder;
		
		private static final Logger logger = LoggerFactory.getLogger(UserSignupController.class);
		

	//공통 영역 : 끝 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	//연수 : 시작(220706) ====================================

		@Override
		public UserAllDTO getUser(String user_email) {
			return userDAO.getUser(user_email);
		}
		
		@Override
		public List<ClassDTO> classList() {			
			return userDAO.classList();
		}
		
		@Override
		public UserAllDTO userUpdate_nicknameCheck(String user_nickname) {
			return userDAO.userUpdate_nicknameCheck(user_nickname);			
		}

		@Override
		public UserAllDTO userUpdate_emailCheck(String user_email) {
			return userDAO.userUpdate_emailCheck(user_email);	
		}
		
		@Override
		public void update_userImg(UserAllDTO userAllDTO) {
			userDAO.update_userImg(userAllDTO);			
		}
		
		@Override
		public void update_userInfo(UserAllDTO userAllDTO) {
			userDAO.update_userInfo(userAllDTO);			
		}		
		
		@Override
		public void update_userEmail(Map<String, String> map) {
			userDAO.update_userEmail(map);
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
		
		@Override
		public void kakaoLogout(String access_Token) {			
			String reqURL = "https://kapi.kakao.com/v1/user/logout";
			try {
				URL url = new URL(reqURL);
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("POST");
				conn.setRequestProperty("Authorization", "Bearer " + access_Token);
				
				int responseCode = conn.getResponseCode();
				//System.out.println("responseCode : " + responseCode);
				
				if(responseCode ==400)
					throw new RuntimeException("카카오 로그아웃 도중 오류 발생");
				
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				
				String result = "";
				String line = "";
				
				while ((line = br.readLine()) != null) {
					result += line;
				}
				//System.out.println(result);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		@Override
		public void kakaoUnlink(String access_Token) {
			String reqURL = "https://kapi.kakao.com/v1/user/unlink";
			try {
				URL url = new URL(reqURL);
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("POST");
				conn.setRequestProperty("Authorization", "Bearer " + access_Token);
				
				int responseCode = conn.getResponseCode();
				//System.out.println("responseCode : " + responseCode);
				
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				
				String result = "";
				String line = "";
				
				while ((line = br.readLine()) != null) {
					result += line;
				}
				//System.out.println(result);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
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
		public String userSignup_nicknameCheck(String user_nickname) {
			UserAllDTO userAllDTO = userDAO.userSignup_nicknameCheck(user_nickname);
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
		
		@Override
		public void pwdFindChangeComplete(Map<String, String> map) {
			userDAO.pwdFindChangeComplete(map);
			
		}
		
		@Override
		public String getAccessToken(String code) {
			String access_Token = "";
			String refresh_Token = "";
			String reqURL = "https://kauth.kakao.com/oauth/token";
			
			try {
				URL url = new URL(reqURL);
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				
				conn.setRequestMethod("POST");
				conn.setDoOutput(true);
				
				BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
				StringBuilder sb = new StringBuilder();
				sb.append("grant_type=authorization_code");
				sb.append("&client_id=99d19c4d787174d74fec051d2035c26e"); //본인이 발급받은 key
				sb.append("&redirect_uri=http://localhost:8080/semiproject/user/userKakaoLoginForm"); // 본인이 설정한 주소
				sb.append("&code=" + code);
				bw.write(sb.toString());
				bw.flush();
				
				//겨로가 코드가 200이면 성공
				int responseCode = conn.getResponseCode();
				//System.out.println("responseCode : " + responseCode);
				
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				String line = "";
				String result = "";
				
				
				while ((line = br.readLine()) != null) {
					result += line;
				}
				//System.out.println("response body : " + result);
				
				//Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
				JsonParser parser = new JsonParser();
				JsonElement element = parser.parse(result);
				
				
				access_Token = element.getAsJsonObject().get("access_token").getAsString();
				refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
				
				
				//System.out.println("access_token : " + access_Token);
				//System.out.println("refresh_token : " + refresh_Token);
				
				
				br.close();
				bw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return access_Token;
		}		
		
		@Override
		public UserAllDTO getUserInfo(String access_Token) {
			HashMap<String, Object> userInfo = new HashMap<String, Object>();
			
			String reqURL = "https://kapi.kakao.com/v2/user/me";
			
			 //access_token을 이용하여 사용자 정보 조회
			try {
				URL url = new URL(reqURL);
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				
				conn.setRequestMethod("POST");
			    conn.setDoOutput(true);
				conn.setRequestProperty("Authorization", "Bearer " + access_Token);
				
				//결과 코드가 200이라면 성공
				int responseCode = conn.getResponseCode();
			//	System.out.println("responseCode : " + responseCode);
				
				//요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				String line = "";
				String result = "";
				
				while ((line = br.readLine()) != null) {
					result += line;
				}
				
				//System.out.println("response body : " + result);
				
				//Gson 라이브러리로 JSON파싱
				JsonParser parser = new JsonParser();
				JsonElement element = parser.parse(result);
				
				JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
				JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
				
				//########## 연수 : name은 개인정보 기본 제공항목에 해당하지 않아 닉네임이 네임으로 대체됨(220713)
				String nickname = properties.getAsJsonObject().get("nickname").getAsString();
				String email = kakao_account.getAsJsonObject().get("email").getAsString();				
				
				userInfo.put("nickname", nickname);
				userInfo.put("email", email);
				
			} catch (IOException e) {
				e.printStackTrace();
			}			

			UserAllDTO result = userDAO.findkakao(userInfo);
			//String user_social = result.getUser_social(); //연수 추가
			// 위 코드는 먼저 정보가 저장되있는지 확인하는 코드.
			
		//	System.out.println("S:" + result);
			
			//@@@@@@@@@@@ 연수 : 기존 이메일 가입 여부에 따른 카카오 연동 가입 회원 정보 입력 방식 변경(220713) @@@@@@@@@@@
			//미가입자 : 카카오에서 받아온 정보를 넣는다
			if(result==null) {
				// result가 null이면 정보가 저장이 안되있는거므로 정보를 저장.
				userDAO.kakaoinsert(userInfo);
				// 위 코드가 정보를 저장하기 위해 Repository로 보내는 코드임.
				return userDAO.findkakao(userInfo);
				// 위 코드는 정보 저장 후 컨트롤러에 정보를 보내는 코드임.
				// result를 리턴으로 보내면 null이 리턴되므로 위 코드를 사용.
				//기존 이메일 가입자 : 기존 정보를 업데이트(id 유지)
			}else if(result!=null && result.getUser_social().equals("X") ){
				userDAO.updateBykakao(userInfo); //update or delete+insert
				return userDAO.findkakao(userInfo);	
				//기존 이메일 가입자&1회 소셜 로그인 성공 후 정보 변경이 완료된 자
			}else {	
				// 정보가 이미 있기 때문에 result를 리턴함.
				return result;				
			}
			
		}		
		
	//유진 : 끝 ====================================

	// 기진 : 시작  @@@@@@@@@@@@@@@@@@@@ 

		@Override
		public String login(Map<String, String> map) {
			String inputPwd = map.get("user_pwd");
			UserAllDTO userAllDTO = userDAO.login(map.get("user_email"));
			
			if(userAllDTO != null && passwordEncoder.matches(inputPwd, userAllDTO.getUser_pwd())){
				session.setAttribute("memId", userAllDTO.getUser_id());
				session.setAttribute("memEmail", userAllDTO.getUser_email());
				session.setAttribute("memNickname", userAllDTO.getUser_nickname());
				session.setAttribute("memName", userAllDTO.getUser_name()); //연수추가(220713)
				session.setAttribute("memImg", userAllDTO.getUser_img());				
				session.setAttribute("memSocial", userAllDTO.getUser_social()); //연수추가(220713)
				
				return "ok";
				
			}else {
				
				return "fail";
			}
		}
	
		//로그아웃(이메일 로그인 및 카카오 연동로그인 포함)
		@Override
		public void userLogout() {
			session.invalidate();
			
		}
		
		
		@Override
		public UserDTO getUserInfo2(String user_id) {
			UserDTO userDTO = userDAO.getUserInfo(user_id);
			System.out.println("userService getUserInfo DTO : " + userDTO);
			return userDTO;
		}


	// 기진 : 끝 @@@@@@@@@@@@@@@@@@@@@@@

	// 풍혁 : 시작 &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& 
		@Override
		public int getUserIdByEmail(String session_email) {
			
			return userDAO.getUserIdByEmail(session_email);
		}
		
		@Override
		public String getUserNameByUserId(int board_uid) {
			
			return userDAO.getUserNameByUserId(board_uid);
		}
		
		@Override
		public String getUserImgByUserid(int user_id) {
			
			return userDAO.getUserImgByUserid(user_id);
		}
	// 풍혁 : 끝 &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

}
