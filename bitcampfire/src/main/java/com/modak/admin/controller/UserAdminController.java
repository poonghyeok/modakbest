package com.modak.admin.controller;

import java.util.Arrays;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.modak.user.bean.UserAllDTO;
import com.modak.user.service.UserService;

@Controller
@RequestMapping(value="admin")
public class UserAdminController {
	@Autowired
	private UserService userService;
	
	//회원관리 폼 띄우기
	@GetMapping(value="adminUserAllList")
	public ModelAndView userAllList(@RequestParam(required = false, defaultValue ="1") String pg) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.setViewName("/admin/adminUserAllList");
		return mav;
	}	

	//유저 서비스에서 회원리스트 가져오기
	@PostMapping(value="getUserAllList")
	@ResponseBody
	public Map<String, Object> getUserAllList(@RequestParam(required = false, defaultValue ="1") String pg) {		
		return userService.getUserAllList(pg);
	}	
	
	//어드민 페이지 > 유저 리스트> 학원명 가져오기	(0723)
	@PostMapping(value="getUserClass")
	@ResponseBody
	public UserAllDTO getUserClass(String user_classid) {
		return userService.getUserClass(user_classid);
	}
	
	//회원선택 삭제(일반 이메일 가입자만 선택삭제 가능 함/ 소셜로그인 체크박스 disabled)
	@GetMapping(value="adminUserDelete_select")	
	public ModelAndView adminUserDelete_select(@RequestParam String[] check) {
		System.out.println(Arrays.toString(check));
		//삭제된 회원에게 안내메일 발송 - 선택삭제ver(220724)
		userService.sendEmailToDeleteUser_select(check);
		userService.adminUserDelete_select(check);

		return new ModelAndView("redirect:/admin/adminUserAllList?category=admin&pg=1");
	}
	
	//회원 개별 삭제(카카오회원은 이 기능으로만 삭제가 가능함)
	@PostMapping(value="adminUserDelete")
	@ResponseBody
	public String adminUserDelete(@RequestParam String user_email, HttpSession session) {
		
		UserAllDTO userAllDTO = userService.getUser(user_email);
		Long user_kakaoId = userAllDTO.getUser_kakaoId();
		
		System.out.println(user_email);
		if(user_kakaoId==null) {
			userService.delete(user_email);
		}else {	
			userService.kakaoUnlink_admin(user_kakaoId);
			userService.delete(user_email);
		}	
		session.invalidate();
		//삭제된 회원에게 안내메일 발송(220724)
		userService.sendEmailToDeleteUser(user_email);
		return "/admin/adminUserAllList";
	}
	
	//회원 검색
	@PostMapping(value="adminUserSearch")
	@ResponseBody
	public Map<String, Object> adminUserSearch(@RequestParam Map<String, String> map){ //pg, searchOption, keyword
		return userService.adminUserSearch(map);
	}
	
	//관리자 선택등록
	@GetMapping(value="adminRegister")	
	public ModelAndView adminRegister(@RequestParam String[] check) {
		userService.adminRegister(check);

		return new ModelAndView("redirect:/admin/adminUserAllList?category=admin&pg=1");
	}
	
	//관리자 선택 등록해제
	@GetMapping(value="adminRegisterCancel")	
	public ModelAndView adminRegisterCancel(@RequestParam String[] check) {
		userService.adminRegisterCancel(check);

		return new ModelAndView("redirect:/admin/adminUserAllList?category=admin&pg=1");
	}
}
