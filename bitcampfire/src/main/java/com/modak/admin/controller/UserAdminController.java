package com.modak.admin.controller;

import java.util.List;
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
	
	//회원선택 삭제(일반 이메일 가입자만 선택삭제 가능 함/ 추후 소셜로그인 체크박스 disabled 처리하기)
	@GetMapping(value="adminUserDelete_select")	
	public ModelAndView adminUserDelete_select(@RequestParam String[] check) {
		userService.adminUserDelete_select(check);

		return new ModelAndView("redirect:/admin/adminUserAllList");
	}
	
	//선택삭제가 아닌 1명씩 삭제 할때 (삭제 버튼 클릭 시 리스트에서 1명의 데이터분만 선택하여 보내는 방법을 못찾음)
	@RequestMapping(value="adminUserDelete")	
	public String adminUserDelete(@RequestParam String user_email, HttpSession session) {
		
		UserAllDTO userAllDTO = userService.getUser(user_email);
		Long user_kakaoId = userAllDTO.getUser_kakaoId();
		
		if(user_kakaoId==null) {
			userService.delete(user_email);
		}else {	
			userService.kakaoUnlink_admin(user_kakaoId);
			userService.delete(user_email);
		}	
		session.invalidate();
		return "/admin/adminUserAllList";
	}	

}
