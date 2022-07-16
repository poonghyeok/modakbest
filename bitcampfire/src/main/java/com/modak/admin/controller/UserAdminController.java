package com.modak.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.modak.user.bean.UserAllDTO;
import com.modak.user.service.UserService;

@Controller
@RequestMapping(value="admin")
public class UserAdminController {
	@Autowired
	private UserService userService;

	@GetMapping(value="adminUserAllList")
	public String userAllList() {
		return "/admin/adminUserAllList";
	}	

	//유저 서비스에서 회원리스트 가져오기
	@PostMapping(value="getUserAllList")
	@ResponseBody
	public List<UserAllDTO> getUserAllList() {		
		return userService.getUserAllList();
	}	
	

}
