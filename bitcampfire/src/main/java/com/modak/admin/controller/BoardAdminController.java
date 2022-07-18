package com.modak.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.modak.board.bean.BoardAllDTO;
import com.modak.board.service.BoardService;

@Controller
@RequestMapping(value = "admin")
public class BoardAdminController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping(value = "adminBoardAllList")
	public String adminBoardAllList() {
		
		System.out.println("adminBoardAllList 왔따!!!!!");
		return "/admin/adminBoardAllList";
	}
	
	// board 정보 전체 가져오기
	@PostMapping(value = "getBoardAllList")
	@ResponseBody // 에이작스로 간다.
	public List<BoardAllDTO> getBoardAllList() {
		
		return boardService.getBoardAllList();
		
	}
}
