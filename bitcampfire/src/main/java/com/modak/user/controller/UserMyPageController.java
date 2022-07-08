package com.modak.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.modak.user.bean.UserDTO;
import com.modak.user.service.UserService;

@Controller
@RequestMapping(value= "user")
public class UserMyPageController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping(value = "userMyPageForm")
	public String userMyPageForm() {
		return "/user/userMyPageForm";
	}
	
	@PostMapping(value = "getUserInformation")
	//풍혁220703 : board_list 나 board_view 에서 들어올 수 있게 user_id로 구현해주시면 감사하겠습니다 .	
	public UserDTO getUserInformation(HttpSession session) {
		String user_email = (String) session.getAttribute("memEmail");
		return userService.getUserInformation(user_email);
	}

}
