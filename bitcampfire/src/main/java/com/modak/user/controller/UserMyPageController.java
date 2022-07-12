package com.modak.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	public UserDTO getUserInformation(HttpSession session) {
		String user_email = (String) session.getAttribute("memEmail");
		return userService.getUserInformation(user_email);
	}
	
	@RequestMapping(value="userPage", method = RequestMethod.GET)
	public ModelAndView userPageForm(@RequestParam("user_id") String user_id) {
		System.out.println("mypage con =" + user_id);
		ModelAndView mav = new ModelAndView();
		UserDTO userDTO = (UserDTO)userService.getUserInfo(user_id);
		
		mav.setViewName("/user/userPageForm");
		mav.addObject("userDTO",userDTO);

		return mav;
	}
	
	
	
//	@GetMapping(value = "userPageForm")
//	public String userPageForm(){
//		return "/user/userPageForm";
//	}

//	@PostMapping(value="getUserPageInfo")
//	public UserDTO getUserPageInfo(String user_id) {
//		userService.getUserPageInfo(user_id);
//		
//	}
//	
	
}
