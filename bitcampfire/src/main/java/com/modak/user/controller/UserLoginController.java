package com.modak.user.controller;

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
//@@@@@@@@@@@@@@@@@@@@@@@@@@유진0709 추가@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@	
	@Autowired
	private JavaMailSender mailSender;

	private static final Logger logger = LoggerFactory.getLogger(UserSignupController.class);
	//@@@@@@@@@@@@@@@@@@@@@@@@@@유진0709 추가 끝@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


   //@@@@ 연수 수정(220707)  @@@@///
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
	 //@@@@ 연수 수정(220708) @@@@///
	//로그인-비밀번호 복호화
	@PostMapping(value="login")
	@ResponseBody
	public String login(@RequestParam Map<String, String> map) {
		return userService.login(map);
	}
	
	/* 로그인 기능구현  끝 */ 
	
	/* 로그아웃  */
	@PostMapping(value="userLogout")
	@ResponseBody
	public void logout() {
		userService.userLogout();
	}
	
		
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
			public String pwdFindmailCheck(String user_email) throws Exception{
				logger.info("이메일 인증 요청이 들어옴"+user_email);
				//return  mailService.joinEmail(user_email);
		        
	
		        /* 이메일 보내기 */
		        String setFrom = "yujin980810@gmail.com";
		        String toMail = user_email;
		        String title = "계정찾기 인증 이메일 입니다.";
		        String content = 
		        				"<div style='width:1000px; height: 100px; background:#286090;' align='center'> <h1 style='color:#fff; font-size: 60px;'>BITFIRE</h1></div>"
		        				+ "<div><h2 style='margin-top:10px; font-size: 28px;'>계정 찾기 인증 메일입니다.</h2><p style='font-size:18px;'>아래 버튼을 눌러 비밀번호 변경을 계속 진행해 주세요.</p><br><br> <a style='text-decoration:none; padding: 13px; background:#337ab7; color:#fff; font-size: 16px;' href='http://localhost:8080/semiproject/user/userPasswordChange?user_email="+user_email+"'>비밀번호 변경</a><div>";
		        			

		        
		        
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
//@@@@@@@@@@@@@@@@@@@@@@@@@@유진0709 끝@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



}
