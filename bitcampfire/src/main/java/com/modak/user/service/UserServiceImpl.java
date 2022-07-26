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

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.modak.user.bean.ClassDTO;
import com.modak.user.bean.UserAdminPaging;
import com.modak.user.bean.UserAllDTO;
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
		@Autowired
		private JavaMailSender mailSender4;
		

	//공통 영역 : 끝 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	//연수 : 시작(220706) ====================================		
		//연수 : userAdminController에서 사용할 페이징처리 임포트
		@Autowired
		private UserAdminPaging userAdminPaging;
		
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
		
		//@@@ 연수 : UserAdminController에서 요청한 서비스 
		//@@@ 어드민 페이지 > 전체유저 리스트 가져오기(220715)	
		@Override
		public Map<String, Object> getUserAllList(String pg) {		
			int endNum = Integer.parseInt(pg) * 10;
			int startNum = endNum - 9;
			
			//DB - 1페이지 당 10걔씩
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("startNum", startNum);
			map.put("endNum", endNum);
			
			List<UserAllDTO> list = userDAO.getUserAllList(map);
			
			//페이징 처리
			userAdminPaging = this.getUserAdminPaging(pg);		
			
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("list", list);
			sendMap.put("userAdminPaging", userAdminPaging);
			
			return sendMap;		
		}
		//@@@ 어드민 페이지 > 유저 리스트> 학원명 가져오기	(0723)
		@Override
		public UserAllDTO getUserClass(String user_classid) {
			return userDAO.getUserClass(user_classid);
		}
		
		//@@@ 어드민 페이지 > 유저 리스트 페이징 처리 (220717)
		@Override
		public UserAdminPaging getUserAdminPaging(String pg) {			
			int totalA = userDAO.getUserTotalA(); //총 유저 수 
			
			userAdminPaging.setCurrentPage(Integer.parseInt(pg));
			userAdminPaging.setPageBlock(10);
			userAdminPaging.setPageSize(10);
			userAdminPaging.setTotalA(totalA);
			userAdminPaging.makePagingHTML(); //실제 페이지를 만드는 역할
			
			return userAdminPaging;
		}
		
		///@@@ 어드민 페이지 > 유저 검색 리스트 (220717)	
		@Override
		public Map<String, Object> adminUserSearch(Map<String, String> map) {
			int endNum = Integer.parseInt(map.get("pg")) * 10;
			int startNum = endNum - 9;			
			
			//DB - 1페이지 당 10걔씩
			map.put("startNum", startNum+"");
			map.put("endNum", endNum+"");			
			
			List<UserAllDTO> list = userDAO.getUserSearchList(map);			
			int totalA = userDAO.getUserTotalSearchA(map); //검색된 총 유저 수 
			
			//System.out.println("adminUserSearch");
			userAdminPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
			userAdminPaging.setPageBlock(10);
			userAdminPaging.setPageSize(10);
			userAdminPaging.setTotalA(totalA);
			userAdminPaging.makePagingHTML();
			
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("list", list);
			sendMap.put("userAdminPaging", userAdminPaging);
			
			return sendMap;
		}
		
		//@@@ 어드민 페이지 > 카카오 회원 어드민 삭제 처리 기능 - 카카오 로그인 시 사용되는 유진님 앱 어드민키 사용 중 (220717)		
		@Override
		public void kakaoUnlink_admin(Long user_kakaoId) {
			String reqURL = "https://kapi.kakao.com/v1/user/unlink";
			String APP_ADMIN_KEY = "c1b3c590dbaa96911319ca662cb22096"; // 공동 장소에 올릴 때 잘 관리하기
			try {
				URL url = new URL(reqURL);
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("POST");
				conn.setRequestProperty("Authorization", "KakaoAK " + APP_ADMIN_KEY);
				conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded");
				conn.setDoOutput(true); // 서버에서 받을 값이 있다면 true		
				
				BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
				StringBuilder sb = new StringBuilder();
				sb.append("target_id_type=user_id");				
				sb.append("&target_id=" + user_kakaoId);
				bw.write(sb.toString());
				bw.flush();
				
				int responseCode = conn.getResponseCode();
				//System.out.println("responseCode : " + responseCode);
				
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				
				String result = "";
				String line = "";
				
				while ((line = br.readLine()) != null) {
					result += line;
				}
				//System.out.println(result);
				
				br.close();
				bw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}			
		}
		
		//@@@ 어드민 페이지 > 회원 선택삭제 기능(220716)
		@Override
		public void adminUserDelete_select(String[] check) {
			Map<String, String[]> map = new HashMap<String, String[]>();
			map.put("check", check);
			
			//String[] user_email = map.get("user_email");
			check = map.get("check");
			//System.out.println(check);
			
			userDAO.adminUserDelete_select(map);
			
			session.invalidate();
		}
		//@@ 관리자 선택 등록(220724)
		@Override
		public void adminRegister(String[] check) {
			Map<String, String[]> map = new HashMap<String, String[]>();
			map.put("check", check);
			
			//String[] user_email = map.get("user_email");
			check = map.get("check");
			//System.out.println(check);
			
			userDAO.adminRegister(map);			
		}
		
		//@@ 관리자 선택 등록해제(220724)
		@Override
		public void adminRegisterCancel(String[] check) {
			Map<String, String[]> map = new HashMap<String, String[]>();
			map.put("check", check);
			
			//String[] user_email = map.get("user_email");
			check = map.get("check");
			//System.out.println(check);
			
			userDAO.adminRegisterCancel(map);				
		}
		
		//@@관리자 권한으로 삭제된 회원에게 안내메일 발송(220724)
		@Override
		public void sendEmailToDeleteUser(String user_email) {
		 	String setFrom = "dustn551@gmail.com";
		 	String toMail = user_email;
	        String title = "회원탈퇴 안내 이메일 입니다.";
	        String content = 
				"<div style='width:1000px; height: 100px; background:#286090;' align='center'> "
				+ "<h1 style='color:#fff; font-size: 60px;'>BITFIRE</h1>"
				+ "</div>"
				+ "<div style='text-align:center;'><h2 style='margin-top:10px; font-size: 28px;'>회원탈퇴 안내 메일입니다.</h2>"
				+ "<p style='font-size:18px; text-align:center;'>"
				+ "귀하께서는 불가피한 사유로 회원 탈퇴 처리되었음을 안내드립니다.<br> "
				+ "로그인이 필요한 서비스는 더이상 이용이 불가한 점 양해부탁드리며,<br> "
				+ "자세한 사항은 bitcampfire 대표 이메일(bitcampfire@admin.co.kr)로 문의하여 주시기 바랍니다.<br>"
				+ "그동안 저희 서비스를 이용해주셔서 감사합니다.</p>"
				+ "</div>";
			
			try {            
			    MimeMessage message = mailSender4.createMimeMessage();
			    MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			    helper.setFrom(setFrom);
			    helper.setTo(toMail);
			    helper.setSubject(title);
			    helper.setText(content,true);
			    mailSender4.send(message);
			    
			    }catch(Exception e) {
			        e.printStackTrace();
			    } 
				
			}
		//삭제된 회원에게 안내메일 발송 - 선택삭제ver(220724)
		@Override
		public void sendEmailToDeleteUser_select(String[] check) {
		 	String setFrom = "dustn551@gmail.com";
		 	String[] toMail = check;
	        String title = "회원탈퇴 안내 이메일 입니다.";
	        String content = 
				"<div style='width:1000px; height: 100px; background:#286090;' align='center'> "
				+ "<h1 style='color:#fff; font-size: 60px;'>BITFIRE</h1>"
				+ "</div>"
				+ "<div style='text-align:center;'><h2 style='margin-top:10px; font-size: 28px;'>회원탈퇴 안내 메일입니다.</h2>"
				+ "<p style='font-size:18px; text-align:center;'>"
				+ "귀하께서는 불가피한 사유로 회원 탈퇴 처리되었음을 안내드립니다.<br> "
				+ "로그인이 필요한 서비스는 더이상 이용이 불가한 점 양해부탁드리며,<br> "
				+ "자세한 사항은 bitcampfire 대표 이메일(bitcampfire@admin.co.kr)로 문의하여 주시기 바랍니다.<br>"
				+ "그동안 저희 서비스를 이용해주셔서 감사합니다.</p>"
				+ "</div>";
			
			try {            
			    MimeMessage message = mailSender4.createMimeMessage();
			    MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			    helper.setFrom(setFrom);
			    helper.setTo(toMail);
			    helper.setSubject(title);
			    helper.setText(content,true);
			    mailSender4.send(message);
			    
			    }catch(Exception e) {
			        e.printStackTrace();
			    } 
			
		}


		//@@@ 연수 : BoardNoticeAdminController에서 요청한 서비스
		//@@@ 어드민 > 공지사항 리스트에 띄울 유저 정보 가져오기(220724)
		@Override
		public UserAllDTO getUserInfoForNoticeList(int board_uid) {
			return userDAO.getUserInfoForNoticeList(board_uid);
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
				
				//########## 연수 : 카카오 회원에 대한 어드민 삭제 기능 구현을 위해 카카오 아이디 저장 추가(220716)
				String id = element.getAsJsonObject().get("id").getAsString();			
				
				userInfo.put("nickname", nickname);
				userInfo.put("email", email);
				//########## 연수 : 카카오 회원에 대한 어드민 삭제 기능 구현을 위해 카카오 아이디 저장 추가(220716)
				userInfo.put("kakaoId", id);
				
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
		
		
		
		@Override
		public UserAllDTO getUserClass_Class(int class_id) {
			return userDAO.getUserClass_Class(class_id);
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
				session.setAttribute("memClassId", userAllDTO.getUser_classid());				
				session.setAttribute("memGrade", userAllDTO.getUser_grade()); //연수 : 어드민 계정 판별을 위해 추가(220724) / 관리자: A, 일반회원 : U
				
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
			System.out.println();
			System.out.println("userServiceImpl getUserInfo2");
			System.out.println("userService getUserInfo DTO : " + userDTO); 
			return userDTO;
		}
		
		
//		
//		@Override
//		public String getUserpagePagingList(int pg, int class_id) {
//			UserPagePaging userPagePaging = new UserPagePaging();
//			userPagePaging.setCurrentPage(pg);
//			userPagePaging.setPageBlock(10); //이전 다음 사이에 10개의 page
//			userPagePaging.setPageSize(10); //page 당 10개의 글 존재
//		//	userPagePaging.setTotalA(boardDAO.getTotalBoardClassSearchNum(keyword, class_id));
//			userPagePaging.setMakePagingHTML(class_id);
//			
//			return userPagePaging.makePagingHTML().toString();
//		}

//		@Override
//		public String getUserEmailByUserId(String user_id) {
//			UserDTO userDTO = userDAO.getUserInfo(user_id);
//			
//			String artical_id = userDTO.getUser_email();
//			
//			return artical_id;
//		}

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
