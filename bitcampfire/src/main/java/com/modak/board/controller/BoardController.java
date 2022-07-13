package com.modak.board.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.modak.board.bean.BoardDTO;
import com.modak.board.service.BoardService;
import com.modak.user.service.UserService;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	//Board 공통 영역 : 시작 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		@Autowired
		private BoardService boardService;
		
		//풍혁(0709) list에 작성자 반영해야해서 userService추가
		@Autowired
		private UserService userService;
		
		
		//풍혁(0707) : session이 필요할 수도 있으니 
		@Autowired
		private HttpSession session;
		//풍혁 (0704) : 여유가 있다면 간단한 설명 주석으로 달아주세요~ 
	//Board 공통 영역 : 끝 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	
	//풍혁 : 시작 ==================================
		//boardList 띄우기.. 게시판 별 boardList
		@GetMapping(value = "/list")
		public ModelAndView boardList(@RequestParam(value = "pg", required = false, defaultValue = "1") int pg,HttpServletRequest req, @RequestParam(required = false, defaultValue = "date") String sortOption) {
			 
			
			//ajax방식으로 할 거 아니면, String이나 String Buffer 물어와야 됨. 
			System.out.println("\n @Log@ /boardList/list mapping..!! current pg : " + pg);
			HttpSession session = req.getSession();
			System.out.println("\n @LOG@ session_email check : " + (String)session.getAttribute("memEmail"));
			String session_email = (String)session.getAttribute("memEmail");
			
			String userWriteTableList = boardService.getUserWriteTablelist(pg, sortOption);
			String boardPagingList = boardService.getBoardPagingList(pg);
			
			ModelAndView mav = new ModelAndView();
			if(session_email != null) {
				mav.addObject("session_email", session_email);
			}
			mav.addObject("userWriteTableList", userWriteTableList);
			mav.addObject("boardPagingList", boardPagingList);
			mav.setViewName("/board/boardList");
			
			return mav;
		}
		
		@GetMapping("/write")
		public String boardWrite(Model model) {
			//풍혁 220708 : 어짜피 login 안되어 있으면  글쓰러 들어오지도 못한다. 그냥 바로 jsp 에서 sessionScope에서 꺼내면 될 듯
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
			
			String userWriteTableList = boardService.getUserSearchWriteTablelist(pg, keyword);
			String boardPagingList = boardService.getBoardSearchPagingList(pg, keyword);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("userWriteTableList", userWriteTableList);
			mav.addObject("boardPagingList", boardPagingList);
			mav.setViewName("/board/boardList");
			
			return mav;
		} 
		
		//풍혁220708 : BoardDTO list로 받아보기 
		@PostMapping("/jsonTest")
		@ResponseBody
		public Map<String, Object> jsonTest(@RequestParam Map<String,Integer> map){
			Map<String, Object> result = new HashMap<>();
			
			List<BoardDTO> list =  new ArrayList<>();
			System.out.println("\n @ log @ json test .. startNum : " + map.get("startNum") );
			list = boardService.getBoardReviewList(map);
			
			result.put("boardList", list);
			result.put("authorArray", getUserNicknameArray(list));
			
			return result;
		}
		
		
		//풍혁0709 : boardDTO로 이루어진 list에서 각 board_uid를 가지고 각 글에 대한 user_nick name 배열을 받아오는 method
		private String[] getUserNicknameArray(List<BoardDTO> list) {
			String[] userNickArray = new String[list.size()];
			
			for(int i = 0; i < list.size(); i++) {
				int board_uid = list.get(i).getBoard_uid();
				userNickArray[i] = userService.getUserNameByUserId(board_uid);
			}
			
			return userNickArray;
		}
		
		
		
	//풍혁 : 끝 ====================================
	
	// 정수 : 시작  ###################### 
		//목록에서 글 가져와서 jsp 띄우기
		@GetMapping(value = "getBoardView") // 데이터값 담아서 jsp로 이동
		public ModelAndView getBoardView(@RequestParam(required = false, defaultValue = "1") int board_id, @RequestParam(required = false, defaultValue = "1") String pg) { // 글번호, 페이지값 
			//System.out.println("getBoardView 컨트롤러 실행....");
		
			ModelAndView mav = new ModelAndView(); // boardView.jsp 에 데이터 넣어 보내기
			mav.addObject("board_id", board_id); // 글번호값이랑 
			mav.addObject("pg", pg); // 페이지값 실어서
			BoardDTO boardDTO = (BoardDTO) boardService.getBoardContent(board_id);
			mav.addObject("boardDTO", boardDTO);
			
			System.out.println("TEST BoardDTO getboardDTO_view_cnt =" +boardDTO.getBoard_view_cnt());
			
			Date date = boardDTO.getBoard_date_created(); // 날짜 꺼내서
			String dateToStr = DateFormatUtils.format(date, "yyyy-MM-dd HH:mm:SS"); // 바꿔주고
			mav.addObject("dateToStr",dateToStr);

			//풍혁220708 : boadr_uid로 유저nickname 받아서 작성자에 넣겠습니다.
			String author = boardService.getUserNameByUserId(boardDTO.getBoard_uid());
			mav.addObject("author", author);
			
			mav.addObject("cateidToString", boardDTO.cateidToString());
			
			//System.out.println("DTO에서 댓글수 TEST = " + boardDTO.getBoard_cmt_cnt());
			//System.out.println("DTO 에서 시간 TEST = " + boardDTO.getBoard_date_created());
			mav.setViewName("board/boardView"); // boardView.jsp로 보냄 
			return mav; // 스프링한테 데이터랑 목적지 꺼내봐 하는거
		}
		
		@GetMapping(value = "/recommend")
		@ResponseBody
		public int recommend(@RequestParam int vote_uid, int vote_bid) { // 게시글 번호와, 추천유저아이디 
			
			System.out.println("****** TEST recommend Controller");
			
			Map<String, Object> map = new HashMap<String, Object>();
		
			map.put("vote_uid", vote_uid);
			map.put("vote_bid", vote_bid);
			
			int recommendCheck =  boardService.recommendCheck(map);	 // 추천수를 이미 눌렀는지 체크 - DB에서 가져와서 보자
			
			System.out.println("****** TEST recommendCheck" + recommendCheck);
			
			// 0또는 1일때 
			if (recommendCheck == 0 ) {
				boardService.increaseRecommend(map);
			} else {
				System.out.println("추천을 취소하시겠습니까?");
				boardService.recommendCancel(map);
			}
			
			return recommendCheck;
			
		}
	// 정수 : 끝  ###################### 
			
}
