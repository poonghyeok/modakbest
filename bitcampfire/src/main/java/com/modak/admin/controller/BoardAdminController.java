package com.modak.admin.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.modak.board.bean.BoardDTO;
import com.modak.board.bean.BoardPaging;
import com.modak.board.service.BoardService;

@Controller
@RequestMapping(value = "admin")
public class BoardAdminController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping(value = "adminBoardAllList")
	public ModelAndView adminBoardAllList(@RequestParam int pg) { 		
		
		String pageButton = boardService.getBoardAdminPaging(pg).getPagingHTML().toString();
		
		ModelAndView mav = new ModelAndView(); 
		mav.addObject("pageButton", pageButton);
		
		mav.setViewName("/admin/adminBoardAllList");
		return mav;
	}
	
	// board 정보 전체 가져오기
	@PostMapping(value = "getBoardAllList")
	@ResponseBody // 에이작스로 간다.
	public List<BoardDTO> adminAllList(@RequestParam int pg) { 
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@pg =" + pg);
		
			List<BoardDTO> list = new ArrayList<>();
			
			List<BoardDTO> informList = boardService.informList();
			List<BoardDTO> reviewList = boardService.reviewList(); 
			List<BoardDTO> qnaList = boardService.qnaList();
			List<BoardDTO> freeList = boardService.freeList(); 
			
			// list 합침. 
			list.addAll(informList); 
			list.addAll(reviewList);
			list.addAll(qnaList);
			list.addAll(freeList);
			
			
			for(BoardDTO dto: list) {
				System.out.println(dto);
			}
			
			//System.out.println("@@@@@@@@@@@@@@list.get(0).getBoard_date_created()" +list.get(0).getBoard_date_created() );
			
			Collections.sort(list);
			
			int boardPerPage = 10;
			int startNum = 1 + boardPerPage*(pg-1)-1;
			int endNum = boardPerPage + boardPerPage*(pg-1);
			int totalNum = list.size();
			if(endNum > totalNum) {
				endNum = totalNum;
			}
				
				
			List<BoardDTO> listPg = list.subList(startNum, endNum);			
			
//			Map<String, List<BoardAllDTO>> map = new HashMap<>();
//			map.put("informList", informList);
//			map.put("reviewList", reviewList); // 앞에있는 건 key, 
//			map.put("qnaList", qnaList);
//			map.put("freeList", freeList);
		return listPg;
	}
	// 유저아이디로 닉네임 가져오는것
	@GetMapping(value = "getUserNickname", produces="application/text;charset=utf-8")
	@ResponseBody // 에이작스로 간다.
	public String getUserNickname(@RequestParam int board_uid) { 
		System.out.println("@@@@board_uid@@@@@@"+board_uid);
		String userNickname = boardService.getUserNameByUserId(board_uid);
		System.out.println("userNickname = " + userNickname);
		return boardService.getUserNameByUserId(board_uid);
	}
	
	@GetMapping(value = "adminBoardSearchList")
	public ModelAndView adminBoardSearchList(@RequestParam int pg, String target, String keyword ) { 		
//		Map<String , Object> map = new HashMap<String, Object>(); 
//		map.put("target", target); // sortOption
//		map.put("keyword", keyword);
//		map.put("pg", pg);
		
		String pageButton = boardService.getBoardAdminSearchPaging(pg, target, keyword).getPagingHTML().toString();
		
		ModelAndView mav = new ModelAndView(); 
		mav.addObject("pageButton", pageButton);
		
		mav.setViewName("/admin/adminBoardAllList");
		return mav;	}

	
	@GetMapping(value= "adminBoardSearch")
	@ResponseBody
	public List<BoardDTO> adminSearch(@RequestParam String target, String keyword, int pg) {
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@target = " + target + ", keyword = " + keyword); // board_id, 구 넘어옴
		//System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@pg = " + pg);
		Map<String , Object> map = new HashMap<String, Object>(); 
		map.put("target", target); // sortOption
		map.put("keyword", keyword);
		map.put("pg", pg);
		
		List<BoardDTO> list = boardService.adminBoardSearch(map);
		return list;
		//System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@map = " + map);
	}
	
	  @GetMapping(value = "adminBoardDelete")
	  @ResponseBody public void adminBoardDelete(@RequestParam int board_id, int board_cateid) {
		  
		  //System.out.println("보드보드 = " + board_id  +" @@@@@@@@@" + board_cateid);
		  Map<String, Integer> map = new HashMap<>();
		  map.put("board_id", board_id);
		  map.put("board_cateid", board_cateid);
		  boardService.adminBoardDelete(map); 
		 }
}








