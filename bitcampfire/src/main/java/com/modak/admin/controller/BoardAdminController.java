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

import com.modak.board.bean.BoardDTO;
import com.modak.board.service.BoardService;

@Controller
@RequestMapping(value = "admin")
public class BoardAdminController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping(value = "adminBoardAllList")
	public String adminBoardAllList() {
		return "/admin/adminBoardAllList";
	}
	
	// board 정보 전체 가져오기
	@PostMapping(value = "getBoardAllList")
	@ResponseBody // 에이작스로 간다.
	public List<BoardDTO> adminAllList() { 
		
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
			
//			Map<String, List<BoardAllDTO>> map = new HashMap<>();
//			map.put("informList", informList);
//			map.put("reviewList", reviewList); // 앞에있는 건 key, 
//			map.put("qnaList", qnaList);
//			map.put("freeList", freeList);
		return list;
		
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
	
	@GetMapping(value= "adminBoardSearch")
	@ResponseBody
	public List<BoardDTO> adminSearch(@RequestParam String target, String keyword) {
		
		//System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@target = " + target + ", keyword = " + keyword); // board_id, 구 넘어옴
		
		Map<String , Object> map = new HashMap<String, Object>(); 
		map.put("target", target);
		map.put("keyword", keyword);
		
		List<BoardDTO> boardDTO = boardService.adminBoardSearch(map);
		//System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@map = " + map);
		
		return boardDTO;
	}
}








