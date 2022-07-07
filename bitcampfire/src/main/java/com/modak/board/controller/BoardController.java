package com.modak.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.modak.board.bean.BoardDTO;
import com.modak.board.service.BoardService;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	//Board 공통 영역 : 시작 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		@Autowired
		private BoardService boardService;
		//풍혁 (0704) : 여유가 있다면 간단한 설명 주석으로 달아주세요~ 
	//Board 공통 영역 : 끝 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	
	//풍혁 : 시작 ==================================
		//boardList 띄우기.. 게시판 별 boardList
		@GetMapping(value = "/list")
		public ModelAndView boardList(@RequestParam(value = "pg", required = false, defaultValue = "1") int pg) {
			
			//ajax방식으로 할 거 아니면, String이나 String Buffer 물어와야 됨. 
			System.out.println("\n @Log@ /boardList/list mapping..!! current pg : " + pg);
			
			String userWriteTableList = boardService.getUserWriteTablelist(pg);
			String boardPagingList = boardService.getBoardPagingList(pg);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("userWriteTableList", userWriteTableList);
			mav.addObject("boardPagingList", boardPagingList);
			mav.setViewName("/board/boardList");
			
			return mav;
		}
		
		@GetMapping("/write")
		public String boardWrite() {
			return "/board/boardWriteForm";
		}
		
		
		@PostMapping("/write")
		public String boardWrite(BoardDTO boardDTO) {
			boardService.boardWrite(boardDTO);
			return "/board/boardView";
		}
		
		@GetMapping("/search")
		public ModelAndView boardSearchList(@RequestParam(value = "pg", required = false, defaultValue = "1") int pg, @RequestParam String keyword) {
			
			//ajax방식으로 할 거 아니면, String이나 String Buffer 물어와야 됨. 
			System.out.println("\n @Log@ /boardList/search mapping..!! current pg : " + pg);
			
			String userWriteTableList = boardService.getUserWriteTablelist(pg);
			String boardPagingList = boardService.getBoardPagingList(pg);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("userWriteTableList", userWriteTableList);
			mav.addObject("boardPagingList", boardPagingList);
			mav.setViewName("/board/boardList");
			
			return mav;
		} 
	//풍혁 : 끝 ====================================
	
	// 정수 : 시작  ###################### 
		//목록에서 글 가져와서 jsp 띄우기
		@GetMapping(value = "getBoardView") // 데이터값 담아서 jsp로 이동
		public ModelAndView getBoardView(@RequestParam(required = false, defaultValue = "3") int board_id, @RequestParam(required = false, defaultValue = "1") String pg) { // 글번호, 페이지값 
			System.out.println("\n getBoardView 컨트롤러 실행....");
			
			ModelAndView mav = new ModelAndView(); // boardView.jsp 에 데이터 넣어 보내기
			mav.addObject("board_id", board_id); // 글번호값이랑 
			mav.addObject("pg", pg); // 페이지값 실어서
			BoardDTO boardDTO = boardService.getBoardContent(board_id);
			mav.addObject("boardDTO", boardDTO);
			mav.setViewName("/board/boardView"); // boardView.jsp로 보냄 
			return mav; // 스프링한테 데이터랑 목적지 꺼내봐 하는거
			
		}
	// 정수 : 끝  ###################### 
	
	
				
}
