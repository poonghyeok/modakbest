package com.modak.admin.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.modak.board.bean.BoardDTO;
import com.modak.board.service.BoardService;

@Controller
@RequestMapping(value="admin")
public class BoardNoticeAdminController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private HttpSession session;	
	
	//공지사항 목록(관리) 폼 띄우기
	@GetMapping(value="adminBoardNoticeList")
	public ModelAndView adminBoardNoticeList(@RequestParam(value = "pg", required = false, defaultValue = "1") int pg) {
		//어차피 관리자는 페이지 이동(user id = 0이여야 접근 가능)에서 걸러지기 때문에 아이디 가져오지 않음
		String adminNoticeTableList = boardService.getAdminNoticeTableList(pg);
		//String adminNoticePagingList = boardService.getAminNoticePagingList(pg);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("adminNoticeTableList", adminNoticeTableList);
		//mav.addObject("adminNoticePagingList", adminNoticePagingList);
		mav.setViewName("/admin/adminBoardNoticeList");
		
		return mav;
	}
	
	//글쓰기 폼
	@GetMapping(value = "adminBoardNoticeWriteForm")
	public String adminBoardNoticeWriteForm(){
		return "/admin/adminBoardNoticeWriteForm";
	}
	 
	//글 등록
	@PostMapping(value = "adminBoardNoticeWrite")	
	public String adminBoardNoticeWrite(BoardDTO boardDTO){
		boardService.adminBoardNoticeWrite(boardDTO);
		
		return "/admin/adminBoardNoticeView";
	}
	
	
	@GetMapping(value = "adminBoardNoticeView")
	public String adminBoardNoticeView(){
		return "/admin/adminBoardNoticeView";
	}
	
	
	
	
}
