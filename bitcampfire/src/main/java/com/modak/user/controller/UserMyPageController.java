package com.modak.user.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
	public ModelAndView userPage(@RequestParam(value = "user_id") String user_id, @RequestParam(value = "pg", required = false, defaultValue = "1") int pg, HttpServletRequest req) {
		
		
		
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> userPageInfo = new HashMap<String, Object>();
		List<BoardDTO> list = new ArrayList<>();
		
		UserDTO userDTO = (UserDTO)userService.getUserInfo2(user_id);

		System.out.println("pg = " + pg);
				
		String articalEmail = userDTO.getUser_email();
		String login_user = (String) session.getAttribute("memEmail");
		
		
		if(articalEmail.equals(login_user)) { 

			System.out.println("나 자신입니다. ####");
			System.out.println("나 =====" + login_user + "글쓴이 ======" + articalEmail);

			
			//boardDTO 게시물 가져오기
			System.out.println("user_id = " + user_id);
			map.put("user_id", session.getAttribute("memId"));
			System.out.println("memId = " + session.getAttribute("memId"));
			
			list = boardService.getUserPageArticle(map);
			System.out.println("my boardDTO list = " + list);


			//상단 아바타 및 닉네임 데이터 가져오기 
			userPageInfo.put("userPage_img", session.getAttribute("memImg"));
			userPageInfo.put("userPage_nickname", session.getAttribute("memNickname"));
			userPageInfo.put("userPage_id", session.getAttribute("memId"));
			userPageInfo.put("pg", pg);
			
			System.out.println("userPageInfo = " + userPageInfo);
			
//			String boardPagingList = boardService.getUserPagePaging(userPageInfo);
			
//			System.out.println(boardPagingList);

			mav.setViewName("/user/userPageForm");
			mav.addObject("userDTO",userDTO);
			mav.addObject("list",list);
			mav.addObject("userPageInfo", userPageInfo);
//			mav.addObject("boardPagingList", boardPagingList);

			
			
		}else{

//			System.out.println("남");		
//
//			System.out.println("나 else : " + login_user + "  글쓴이 else : " + articalEmail);

			//boardDTO 게시물 가져오기
			map.put("user_id", user_id);
			System.out.println("\n @log@ user_id map : " + user_id);
			list = boardService.getUserPageArticle(map);
//			System.out.println("my boardDTO list = " + list);
			
			//상단 아바타 및 닉네임 데이터 가져오기
			userPageInfo.put("userPage_img", userDTO.getUser_img());
			userPageInfo.put("userPage_nickname", userDTO.getUser_nickname());
			userPageInfo.put("userPage_id", userDTO.getUser_id());
			userPageInfo.put("pg", pg);
			
			System.out.println("userPageInfo = " + userPageInfo);
			
//			String boardPagingList = boardService.getUserPagePaging(userPageInfo);

//			System.out.println(boardPagingList);

			mav.setViewName("/user/userPageForm");
			mav.addObject("list",list);
			mav.addObject("userPageInfo", userPageInfo);
//			mav.addObject("boardPagingList", boardPagingList);
		}
		
		System.out.println("mav = " + mav);
		return mav;
	}
	
	
	/*	성기진	끝	*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	@RequestMapping(value="userPage", method = RequestMethod.GET)
//	public ModelAndView userPage(@RequestParam("user_id") String user_id) {
//		
//		ModelAndView mav = new ModelAndView();
//		Map<String, Object> map = new HashMap<String, Object>();
//		List<BoardDTO> list = new ArrayList<>();
//
//		UserDTO userDTO = (UserDTO)userService.getUserInfo2(user_id);
////		String artical_id = userService.getUserEmailByUserId(user_id);
//		
//		String articalEmail = userDTO.getUser_email();
//		String login_user = (String) session.getAttribute("memEmail");
//		
//		System.out.println("글작성자 : " + articalEmail + ", 로그인 : " + login_user);
//		
//		if(articalEmail.equals(login_user)) { 
//			
//			System.out.println("나 =====" + login_user + "글쓴이 ======" + articalEmail);
//			map.put("user_id", user_id);
//			
// 			list = boardService.getUserPageArticle(map);
//			System.out.println();
//			System.out.println();
//			System.out.println("나 자신");
//			System.out.println();
//			System.out.println();
//			System.out.println("my boardDTO list = " + list);
//			System.out.println();
//			System.out.println();
//			System.out.println("session = " + session.getAttribute("memEmail"));
//			
//			
//			
//			System.out.println();
//			System.out.println();
//			mav.setViewName("/user/userPageForm");
//			mav.addObject("boardDTO",list);
//			
//			
//		}else{
//			System.out.println();
//			System.out.println();
//			System.out.println("남");		
//			System.out.println();
//			System.out.println();
//			System.out.println("나 else : " + login_user + "  글쓴이 else : " + articalEmail);
//			System.out.println();
//			System.out.println();
//			System.out.println("session = " + session.getAttribute("memEmail"));
//			//session = Current HttpSession
//			
//			System.out.println();
//			System.out.println();
//			
//			mav.setViewName("/user/userPageForm");
//			mav.addObject("userDTO",userDTO);
//			
//		}
//		System.out.println("mav = " + mav);
//		return mav;
//	}
//	
	
	
}
