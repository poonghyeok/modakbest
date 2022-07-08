package com.modak.user.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.modak.user.bean.UserAllDTO;
import com.modak.user.bean.UserDTO;
import com.modak.user.service.UserService;

@Controller
@RequestMapping(value="user")
public class UserUpdateController {
	@Autowired
	private UserService userService;
	@Autowired
	HttpSession session;
	


	//회원정보 수정 시작 (이메일 인증 넣고 해	보기)
	//회원정보 수정폼 띄우기
	@GetMapping(value="userUpdateForm")
	public String userUpdateForm() {				
		return "/user/userUpdateForm";
	}	
	
	//회원정보 수정을 위해 회원정보 가져오기(통합DTO사용하기)
	@PostMapping(value="getUser")
	@ResponseBody
	public UserAllDTO getUser(HttpSession session) {
		String user_email = (String) session.getAttribute("memEmail");		
		return userService.getUser(user_email);
	}	
	
	
	//회원정보 수정
	@PostMapping(value="update")
	@ResponseBody
	public void update(@ModelAttribute UserAllDTO userAllDTO,
					   @RequestParam MultipartFile user_image,
					   HttpSession session) {
		
		//가상폴더
		//각자 설정한 workspace 주소에 맞게 filepath 변경해야함
		String filePath = "D:\\repository_semi\\modakbest\\bitcampfire\\src\\main\\webapp\\WEB-INF\\storage";		
		String fileName = user_image.getOriginalFilename();
		
		File file = new File(filePath, fileName); //파일 생성
		
		try {
			FileCopyUtils.copy(user_image.getInputStream(), new FileOutputStream(file)); //복사
		
		} catch (IOException e) {
			e.printStackTrace();
		}	
			
		userAllDTO.setUser_img(fileName);
		session.setAttribute("memName", userAllDTO.getUser_name());
		session.setAttribute("memNickname", userAllDTO.getUser_nickname());
		session.setAttribute("memEmail", userAllDTO.getUser_email());
		session.setAttribute("memImg", userAllDTO.getUser_img());		
		//session.setAttribute("memNickname", userAllDTO.getClass_academy());
		//session.setAttribute("memNickname", userAllDTO.getClass_class());
		//회원수정폼 정보 실어서 업데이트
		userService.update(userAllDTO);
	}
	
	//회원정보 수정 끝
	
	//비밀번호 변경 시작
	//비밀번호 수정폼 띄우기
	@GetMapping(value="userPasswordChange")
	public String passwordChange() {
		return "/user/userPasswordChange";
	}
	
	//비밀번호 일치여부 확인 	
	@PostMapping(value="checkPwd")	  
	@ResponseBody 
	public UserDTO checkPwd(HttpSession session){ 
		String user_email =(String) session.getAttribute("memEmail");
		return userService.checkPwd(user_email); 
	}
	
	//비밀번호 변경 완료	
	@PostMapping(value="pwdChangeComplete")
	@ResponseBody
	public void pwdChangeComplete(@RequestParam String user_pwd, HttpSession session) {
		String user_email = (String)session.getAttribute("memEmail");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_email", user_email); 
		map.put("user_pwd", user_pwd);
		
		userService.pwdChangeComplete(map);
	}
	
	//비밀번호 변경 끝
	
	//회원탈퇴 시작
	//회원탈퇴	 확인창 띄우기
	@GetMapping(value="userDeleteConfirm")
	public String userDeleteConfirm() {
		return "/user/userDeleteConfirm";
	}
	
	//회원탈퇴-탈퇴 후 정보보관 기간(60일) 기능 ??
	@PostMapping(value="delete")	
	@ResponseBody 
	public void delete(HttpSession session) { 
		String user_email = (String) session.getAttribute("memEmail"); 
		userService.delete(user_email);
		session.invalidate(); 
	}	 
 
	//회원탈퇴	완료
	@GetMapping(value="userDeleteComplete")
	public String userDeleteComplete() {
		return "/user/userDeleteComplete";
	}
	//회원탈퇴 끝
}
