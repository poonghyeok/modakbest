package com.modak.user.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public void update(@ModelAttribute UserDTO userDTO,
					   @RequestParam MultipartFile user_image,
					   HttpSession session) {
		
		//회원 프로필 사진 수정
		String filePath = session.getServletContext().getRealPath("/WEB-INF/storage");
		String fileName = user_image.getOriginalFilename();
		
		File file = new File(filePath, fileName);
		
		try {
			user_image.transferTo(file);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		userDTO.setUser_img(fileName); //업로드 시 비워져있던  DTO 채워주는 역할
		//System.out.println("\n"+fileName+"file 저장 완료 : "+ filePath);
		//회원수정폼 정보 실어서 업데이트
		userService.update(userDTO);
	}	
	//회원정보 수정 끝
	
	//비밀번호 변경 시작 (암호화 넣기)
	//비밀번호 수정폼 띄우기
	@GetMapping(value="userPasswordChange")
	public String passwordChange() {
		return "/user/userPasswordChange";
	}
	
	//비밀번호 일치여부 확인 
	/*
	@PostMapping(value="checkPwd")	  
	@ResponseBody public UserDTO checkPwd(HttpSession session){ String user_email
	(String) session.getAttribute("memEmail");
	session.setAttribute("user_email", "manbal3@aaa"); return
	userService.checkPwd(user_email); }
	*/ 
	
	//비밀번호 일치여부-테스트용 성공
	@PostMapping(value="checkPwd")
	@ResponseBody
	public UserDTO checkPwd(@RequestParam String user_email){		
		return userService.checkPwd(user_email);	
	}
	
	//비밀번호 변경 완료
	/*
	@PostMapping(value="pwdChangeComplete")
	@ResponseBody
	public void pwdChangeComplete(@RequestParam String user_pwd, HttpSession session) {
		String user_email = (String) session.getAttribute("memEmail");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_email", user_email); 
		map.put("user_pwd", user_pwd);
		
		userService.pwdChangeComplete(map);
	}
	*/
	//비밀번호 변경-테스트용 성공
	@PostMapping(value="pwdChangeComplete")
	@ResponseBody
	public void pwdChangeComplete(@RequestParam String user_pwd) {	
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_email", "manbal3@aaa"); 
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
	/*
	 * @PostMapping(value="delete")
	 * 
	 * @ResponseBody public void delete(HttpSession session) { String user_email =
	 * (String) session.getAttribute("memEmail"); userService.delete(user_email);
	 * session.invalidate(); }
	 */
    
	@PostMapping(value="delete")
	@ResponseBody
	public void delete(@RequestParam String user_email){		
		userService.delete(user_email);	
	}
    
	//회원탈퇴	완료
	@GetMapping(value="userDeleteComplete")
	public String userDeleteComplete() {
		return "/user/userDeleteComplete";
	}
	//회원탈퇴 끝
}
