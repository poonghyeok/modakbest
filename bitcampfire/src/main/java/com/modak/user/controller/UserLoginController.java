package com.modak.user.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.modak.user.bean.UserAllDTO;
import com.modak.user.service.UserService;


@Controller
@RequestMapping(value= "user")
public class UserLoginController {
	@Autowired
	UserService userService;
	@Autowired
	HttpSession session;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
//@@@@@@@@@@@@@@@@@@@@@@@@@@유진0709 추가@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@	
	@Autowired
	private JavaMailSender mailSender;

	private static final Logger logger = LoggerFactory.getLogger(UserSignupController.class);
	//@@@@@@@@@@@@@@@@@@@@@@@@@@유진0709 추가 끝@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

   	/* 로그인 기능구현 */ 
	@GetMapping(value="userLoginForm")
	public String userLoginForm() {
		return "/user/userLoginForm";
	}

//	@RequestMapping(value="loginForm", method = RequestMethod.GET)
//	public String loginForm() {		
//		String sessionCheck = (String) session.getAttribute("userEmail");		
//		if(sessionCheck == null) {			
//			return "/user/userLoginForm";			
//		}else {			
//			return "/";		
//		}
//	}
	
	//로그인-비밀번호 복호화
	@PostMapping(value="login")
	@ResponseBody
	public String login(@RequestParam Map<String, String> map) {
		return userService.login(map);
	}	
	/* 로그인 기능구현  끝 */ 
	
	/* 로그아웃  */
	//@@@@@@ 연수 : 카카오 로그아웃 추가(220712) @@@@@@ 
	@RequestMapping(value="logout")	
	public String logout(HttpSession session) {
		String access_Token = (String)session.getAttribute("memAccessToken");
	    
		if(access_Token==null) {
		}else {
			userService.kakaoLogout(access_Token);
			session.invalidate();
		}	
		userService.userLogout();
		return "redirect:/";
	}
	//@@@@@@ 연수 카카오 로그아웃 추가(220712) @@@@@@ 

	/* 이메일 계정을 통한 비밀번호 찾기 jsp 호출  */ 
	@RequestMapping(value="userFindPwdForm")
	public String userFindPwdForm() {
		System.out.println("userFindPwdForm");
		return "/user/userFindPwdForm";
	}

	/* 계정찾기 취소 후 인덱스 페이지로 이동 */ 
	@RequestMapping(value="cancelFindPwd")
	public String cancelFindPwd() {
//		session.invalidate();
//		System.out.println("cancelFindPwd");
		return "index";
	}

//@@@@@@@@@@@@@@@@@@@@@@@@@@유진0709 추가@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	//이메일 계정찾기 전송
	
			@GetMapping("pwdFindmailCheck")
			@ResponseBody
			public String pwdFindmailCheck(String user_email, HttpSession session) throws Exception{
				//user_email = (String)session.getAttribute("memEmail");
				session.setAttribute("memEmail", user_email);
				logger.info("이메일 인증 요청이 들어옴"+user_email);
	
		        /* 이메일 보내기 */
		        String setFrom = "yujin980810@gmail.com";
		        String toMail = user_email;
		        String title = "계정찾기 인증 이메일 입니다.";
		        String content = 
		        				"<div style='width:1000px; height: 100px; background:#286090;' align='center'> <h1 style='color:#fff; font-size: 60px;'>BITFIRE</h1></div>"
		        				+ "<div><h2 style='margin-top:10px; font-size: 28px;'>계정 찾기 인증 메일입니다.</h2><p style='font-size:18px;'>아래 버튼을 눌러 비밀번호 변경을 계속 진행해 주세요.</p><br><br> <a style='text-decoration:none; padding: 13px; background:#337ab7; color:#fff; font-size: 16px;' href='http://localhost:8080/semiproject/user/userFindPasswordChange?user_email="+user_email+"'>비밀번호 변경</a><div>";
		        			

		        
		        
		        try {
		            
		            MimeMessage message = mailSender.createMimeMessage();
		            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		            helper.setFrom(setFrom);
		            helper.setTo(toMail);
		            helper.setSubject(title);
		            helper.setText(content,true);
		            mailSender.send(message);
		            
		        }catch(Exception e) {
		            e.printStackTrace();
		        }
		    
		        return user_email;
			}
			
		
		@GetMapping(value = "userFindPasswordChange")
		public String userFindPasswordChange() {
			return "/user/userFindPasswordChange";
		}
			
			
		//계정찾기 비밀번호 변경 
		@PostMapping(value = "pwdFindChangeComplete")
		@ResponseBody
		public void pwdFindChangeComplete(@RequestParam String user_pwd, @RequestParam String user_email, HttpSession session) {
			//user_email = (String)session.getAttribute("memEmail");
			session.setAttribute("memEmail", user_email);
			String inputPass = user_pwd;
			String pwd = passwordEncoder.encode(inputPass);		
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("user_email", user_email); 
			map.put("user_pwd", pwd);
			
			session.invalidate();
			userService.pwdFindChangeComplete(map);
		}
		
		//카카오 로그인
		/*
		@GetMapping(value="userKakaoLoginForm")
		public String userKakaoLoginForm(@RequestParam(value = "code", required = false) String code) throws Exception {
			System.out.println("#########" + code);
			String access_Token = userService.getAccessToken(code);
			HashMap<String, Object> userInfo = userService.getUserInfo(access_Token);
			System.out.println("###access_Token#### : " + access_Token);
			System.out.println("###nickname#### : " + userInfo.get("nickname"));
			System.out.println("###email#### : " + userInfo.get("email"));
			return "member/testPage";
	    	}*/
		
		@GetMapping(value="userKakaoLoginForm")
		public String userKakaoLoginForm(@RequestParam(value = "code", required = false) String code) throws Exception {
			System.out.println("#########" + code);
			String access_Token = userService.getAccessToken(code);
			
			// userInfo의 타입을 KakaoDTO로 변경 및 import.
			UserAllDTO userInfo = userService.getUserInfo(access_Token);
		    
			System.out.println("###access_Token#### : " + access_Token);
			System.out.println("###nickname#### : " + userInfo.getUser_name());
			System.out.println("###email#### : " + userInfo.getUser_email());
			System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
			
			// 아래 코드가 추가되는 내용
			session.invalidate();
			// 위 코드는 session객체에 담긴 정보를 초기화 하는 코드.			
			session.setAttribute("memName", userInfo.getUser_name());
			session.setAttribute("memEmail", userInfo.getUser_email());
			session.setAttribute("memNickname", userInfo.getUser_nickname()); 
			session.setAttribute("memImg", userInfo.getUser_img()); //연수추가(220713)
			session.setAttribute("memAccessToken", access_Token); //연수추가(220713)
			session.setAttribute("memSocial", userInfo.getUser_social()); //연수추가(220713)
			// 위 2개의 코드는 닉네임과 이메일을 session객체에 담는 코드
			// jsp에서 ${sessionScope.kakaoN} 이런 형식으로 사용할 수 있다.
			
			return "home2";
		}
		
		
//@@@@@@@@@@@@@@@@@@@@@@@@@@유진0709 끝@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@	

}
