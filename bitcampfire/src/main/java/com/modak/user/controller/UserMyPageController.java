package com.modak.user.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.modak.board.bean.BoardDTO;
import com.modak.board.service.BoardService;
import com.modak.user.bean.UserDTO;
import com.modak.user.service.UserService;

@Controller
@RequestMapping(value= "user")
public class UserMyPageController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	HttpSession session;
	
	/*
	 * @GetMapping(value = "userMyPageForm") public ModelAndView userMyPageForm() {
	 * 
	 * ModelAndView mav = new ModelAndView(); String mySession = (String)
	 * session.getAttribute("memEmail");
	 * 
	 * mav.setViewName("/user/userPageForm"); mav.addObject("memEmail", mySession);
	 * return mav; }
	 */
	
	
	 @GetMapping(value = "userMyPageForm") public String userMyPageForm() { 
		 
		 return "/user/userMyPageForm"; 
	 }
	 
	
	
	@PostMapping(value = "getUserInformation")
	public UserDTO getUserInformation(HttpSession session) {
		String user_email = (String) session.getAttribute("memEmail");
		return userService.getUserInformation(user_email);
	}

	/*	성기진	*/
	
	/*
	 * @RequestMapping(value = "/admin/doLogin", method = {RequestMethod.POST})
	 * public String adminLogin(HttpServletRequest request, Model model, HttpSession
	 * session) throws Exception { return null; }
	 */
	
	
	@RequestMapping(value="userPage", method = RequestMethod.GET)
	public ModelAndView userPage(@RequestParam("user_id") String user_id) {
		
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		List<BoardDTO> list = new ArrayList<>();

		UserDTO userDTO = (UserDTO)userService.getUserInfo2(user_id);
//		String artical_id = userService.getUserEmailByUserId(user_id);
		
		String articalEmail = userDTO.getUser_email();
		String login_user = (String) session.getAttribute("memEmail");
		
		System.out.println("글작성자 : " + articalEmail + ", 로그인 : " + login_user);
		
		if(articalEmail.equals(login_user)) { 
			
			
			
		}else{
			System.out.println();
			System.out.println();
			System.out.println("남");		
			System.out.println();
			System.out.println();
			System.out.println("나 else : " + login_user + "  글쓴이 else : " + articalEmail);
			System.out.println();
			System.out.println();
			System.out.println("session = " + session.getAttribute("memEmail"));
			//session = Current HttpSession
			
			System.out.println();
			System.out.println();
			
			mav.setViewName("/user/userPageForm");
			mav.addObject("userDTO",userDTO);
			
		}
		System.out.println("mav = " + mav);
		return mav;
	}
	
	// 07/15(금)기준 변경 전 page
	
	/*
	 * @RequestMapping(value="userPage", method = RequestMethod.GET) public
	 * ModelAndView userPageForm(@RequestParam("user_id") String user_id) {
	 * System.out.println("mypage con =" + user_id); ModelAndView mav = new
	 * ModelAndView(); UserDTO userDTO = (UserDTO)userService.getUserInfo2(user_id);
	 * 
	 * mav.setViewName("/user/userPageForm"); mav.addObject("userDTO",userDTO);
	 * 
	 * return mav; }
	 * 
	 */	
	// 07/15(금)기준 변경 전 page 끝
	
	/*	성기진	끝	*/
	
	
	
	
	
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
