package com.modak.user.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.modak.home.HomeController;
import com.modak.user.bean.UserAllDTO;
import com.modak.user.bean.UserDTO;
import com.modak.user.service.UserService;

@Controller
@RequestMapping(value = "user")
public class UserSignupController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	private static final Logger logger = LoggerFactory.getLogger(UserSignupController.class);	
	
	@GetMapping(value = "userSignupForm")
	public String userSignupForm() {
		return "/user/userSignupForm";
	}
	
	@PostMapping(value = "userSignup_emailCheck")
	@ResponseBody
	public String userSignup_emailCheck(@RequestParam String user_email) {
		return userService.userSignup_emailCheck(user_email);
	}
	
	//@@@@ 연수 닉네임 중복검사 추가(220708) @@@@
	@PostMapping(value = "userSignup_nicknameCheck")
	@ResponseBody
	public String userSignup_nicknameCheck(@RequestParam String user_nickname) {
		return userService.userSignup_nicknameCheck(user_nickname);
	}
	//@@@@ 연수 닉네임 중복검사 추가(220708) @@@@
	
	@GetMapping(value = "userSignupComplete")
	public String userSignupComplete() {
		return "/user/userSignupComplete";
	}	
	
	//이메일 인증
		@GetMapping("mailCheck")
		@ResponseBody
		public String mailCheck(String user_email) throws Exception{
			logger.info("이메일 인증 요청이 들어옴!"+user_email);
	        logger.info("인증번호 : " + user_email);
			//return  mailService.joinEmail(user_email);
	        
	        /* 인증번호(난수) 생성 */
	        Random random = new Random();
	        int checkNum = random.nextInt(888888) + 111111;
	        logger.info("인증번호 " + checkNum);
	        
	        /* 이메일 보내기 */
	        String setFrom = "yujin980810@gmail.com";
	        String toMail = user_email;
	        String title = "회원가입 인증 이메일 입니다.";
	        String content = 
	                "홈페이지를 방문해주셔서 감사합니다." +
	                "<br><br>" + 
	                "인증 번호는 " + checkNum + "입니다." + 
	                "<br>" + 
	                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
	        
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
	        String num = Integer.toString(checkNum);
	        
	        return num;
		}
		
		
		/*회원가입하기*/
		
		@PostMapping(value="user_register")
		@ResponseBody
		public void user_register(@ModelAttribute UserAllDTO userAllDTO, HttpSession session) {
			//비밀번호 암호화
			logger.info("post user_register");
	         
	         String inputPass =  userAllDTO.getUser_pwd();
	         String pwd = passwordEncoder.encode(inputPass);
	         userAllDTO.setUser_pwd(pwd);
			
			userService.user_register(userAllDTO);
		}
		
		//회원정보 수정 끝
		
	}
	

