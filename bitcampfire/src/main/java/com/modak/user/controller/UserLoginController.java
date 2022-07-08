package com.modak.user.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

import com.modak.user.service.UserService;


@Controller
@RequestMapping(value= "user")
public class UserLoginController {
	@Autowired
	UserService userService;
	@Autowired
	HttpSession session;
	
	

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
	
	@PostMapping(value="checkIdPw")
	@ResponseBody
	public String checkIdPw(@RequestParam Map<String, String> map) {
		return userService.checkIdPw(map);
		 
	}
	/* 로그인 기능구현  끝 */ 
	
	/* 로그아웃  */
	@PostMapping(value="userLogout")
	@ResponseBody
	public void logout() {
		userService.userLogout();
	}

	//@@@@ 연수 수정 @@@@///
	
	
	
		
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



}
