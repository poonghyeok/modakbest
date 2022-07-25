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

			System.out.println("user_id = " + user_id);
			System.out.println("나 자신입니다. ####");
			System.out.println("나 =====" + login_user + "글쓴이 ======" + articalEmail);



			//상단 아바타 및 닉네임 데이터 가져오기 
			userPageInfo.put("userPage_img", session.getAttribute("memImg"));
			userPageInfo.put("userPage_nickname", session.getAttribute("memNickname"));
			userPageInfo.put("userPage_id", session.getAttribute("memId"));
			userPageInfo.put("pg", pg);
			
			System.out.println("userPageInfo = " + userPageInfo);

			
			//boardDTO 게시물 가져오기
			map.put("user_id", session.getAttribute("memId"));
			System.out.println("memId = " + session.getAttribute("memId"));
			
			list = boardService.getUserPageArticle(map);
			System.out.println("my boardDTO list = " + list);
			
			List<Map<String, Object>> articleList = new ArrayList<Map<String,Object>>();
			Map<String, Object> articleMap = new HashMap<String, Object>();
			for(BoardDTO dto : list) {
				if(dto.getBoard_cateid() == 1) {
					articleMap.put("articleIcon", "icon_inform.png");
					articleMap.put("board_name", "취업정보");
					articleList.add(articleMap);
				}else if(dto.getBoard_cateid() == 2) {
					articleMap.put("articleIcon", "icon_review.png");
					articleMap.put("board_name", "후기");
					articleList.add(articleMap);
				}else if(dto.getBoard_cateid() == 3) {
					articleMap.put("articleIcon", "icon_qna.png");
					articleMap.put("board_name", "Q&A");
					articleList.add(articleMap);
				}else if(dto.getBoard_cateid() == 4) {
					articleMap.put("articleIcon", "icon_free.png");
					articleMap.put("board_name", "자유게시판");
					articleList.add(articleMap);
				}else if(dto.getBoard_classid() == 1) {
					articleMap.put("articleIcon", "icon_class.png");
					articleMap.put("board_name", "학원전용 게시판");
					articleList.add(articleMap);
				}else {
					articleMap.put("articleIcon", "bit_small_logo.png");
					articleMap.put("board_name", "기타 게시물");
					articleList.add(articleMap);
				}
				articleMap.put("board_id", dto.getBoard_id());
				articleMap.put("board_cateid", dto.getBoard_cateid());
				articleMap.put("board_title", dto.getBoard_title());
				articleMap.put("board_date_created", dto.getBoard_date_created());
				
				System.out.println("art map = " + articleMap);
				articleList.add(articleMap);

			}
			
			
			mav.setViewName("/user/userPageForm");
			mav.addObject("articleList",articleList);
			mav.addObject("userPageInfo", userPageInfo);
		
			
			
			
			
			
//		
//			for(int i=0; i<list.size(); i++) {
//				if()
//			}
//
//			mav.setViewName("/user/userPageForm");
//			mav.addObject("userDTO",userDTO);
//			mav.addObject("list",list);
//			mav.addObject("userPageInfo", userPageInfo);
//		


			
			
		}else{
			//상단 아바타 및 닉네임 데이터 가져오기
			userPageInfo.put("userPage_img", userDTO.getUser_img());
			userPageInfo.put("userPage_nickname", userDTO.getUser_nickname());
			userPageInfo.put("userPage_id", userDTO.getUser_id());
			userPageInfo.put("pg", pg);
			
			System.out.println("@@userPageInfo = " + userPageInfo);
			
			//boardDTO 게시물 가져오기
			map.put("user_id", user_id);
			System.out.println("\n @log@ user_id map : " + user_id);
			list = boardService.getUserPageArticle(map);
			System.out.println("my boardDTO list = " + list);
			
			List<Map<String, Object>> articleList = new ArrayList<Map<String,Object>>();
			Map<String, Object> articleMap = new HashMap<String, Object>();
			for(BoardDTO dto : list) {
				if(dto.getBoard_cateid() == 1) {
					articleMap.put("articleIcon", "icon_inform.png");
					articleMap.put("board_name", "취업정보");
					articleList.add(articleMap);
				}else if(dto.getBoard_cateid() == 2) {
					articleMap.put("articleIcon", "icon_review.png");
					articleMap.put("board_name", "후기");
					articleList.add(articleMap);
				}else if(dto.getBoard_cateid() == 3) {
					articleMap.put("articleIcon", "icon_qna.png");
					articleMap.put("board_name", "Q&A");
					articleList.add(articleMap);
				}else if(dto.getBoard_cateid() == 4) {
					articleMap.put("articleIcon", "icon_free.png");
					articleMap.put("board_name", "자유게시판");
					articleList.add(articleMap);
				}else if(dto.getBoard_classid() == 1) {
					articleMap.put("articleIcon", "icon_class.png");
					articleMap.put("board_name", "학원전용 게시판");
					articleList.add(articleMap);
				}else {
					articleMap.put("articleIcon", "bit_small_logo.png");
					articleMap.put("board_name", "기타 게시물");
					articleList.add(articleMap);
				}
				articleMap.put("board_id", dto.getBoard_id());
				articleMap.put("board_cateid", dto.getBoard_cateid());
				articleMap.put("board_title", dto.getBoard_title());
				articleMap.put("board_date_created", dto.getBoard_date_created());
				
				System.out.println("art map = " + articleMap);
				
				articleList.add(articleMap);
			}
			
			
			mav.setViewName("/user/userPageForm");
			mav.addObject("articleList",articleList);
			mav.addObject("userPageInfo", userPageInfo);
		

		}
		
		System.out.println("mav = " + mav);
		return mav;
	}
	
	
	/*	성기진	끝	*/
	
}
