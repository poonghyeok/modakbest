package com.modak.home;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.modak.board.service.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	//풍혁220708 : index에서 글 list 띄우려고 추가했습니다.
	@Autowired
	private BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	//index 초기 
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		String list1 = boardService.getHomeBoardList(4);
		String list2 = boardService.getHomeBoardList(5);
		String list3 = boardService.getHomeBoardList(8);
		
		model.addAttribute("list1", list1);
		model.addAttribute("lsit2", list2);
		model.addAttribute("list3", list3);
		model.addAttribute("serverTime", formattedDate);
		
		return "home";
	}
	// 풍혁220708 : main index page list----
		
	// ----- 풍혁220708 : main index page list
	
	//@@@@ 연수 test용 home2 삭제(220710)
	
	//멤버 사이드바
	@GetMapping(value="/user/userSideBar")
	public String userSideBar() {				
		return "/user/userSideBar";
	}	
}
