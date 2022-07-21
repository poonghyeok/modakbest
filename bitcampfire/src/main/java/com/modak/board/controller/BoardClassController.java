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
import com.modak.user.bean.UserAllDTO;
import com.modak.user.service.UserService;

@Controller
@RequestMapping(value = "board")
public class BoardClassController {
		@Autowired
		private BoardService boardService;
		
		@Autowired
		private UserService userService;
		
		@Autowired
		private HttpSession session;

		@GetMapping("boardClassList")

		public ModelAndView boardClassList(@RequestParam(value = "pg", required = false, defaultValue = "1") int pg,HttpServletRequest req, @RequestParam(required = false, defaultValue = "date") String sortOption, @RequestParam(value = "class_id", required = false) int class_id) {

			UserAllDTO userAllDTO = userService.getUserClass_Class(class_id);
			session.setAttribute("memClassid", userAllDTO.getClass_id());
			session.setAttribute("memClass_academy", userAllDTO.getClass_academy());
			
			//ajax방식으로 할 거 아니면, String이나 String Buffer 물어와야 됨.
			System.out.println("\n @Log@ /boardList/list mapping..!! current pg : " + pg); 
			HttpSession session = req.getSession();
			System.out.println("\n @LOG@ session_email check : " + (String)session.getAttribute("memEmail"));
			String session_email = (String)session.getAttribute("memEmail");
			System.out.println("\n @LOG@ session_classid check : " + session.getAttribute("memClassid"));
			int session_classid = (int)session.getAttribute("memClassid");
			
			String userClassWriteTableList = boardService.getUserClassWriteTablelist(pg, sortOption,class_id, userAllDTO.getClass_academy());

			String boardClassPagingList = boardService.getBoardClassPagingList(pg, sortOption, class_id); 
			
			ModelAndView mav = new ModelAndView();
			if(session_email != null) {
				mav.addObject("session_email", session_email);
				mav.addObject("session_classid", session_classid);
			}
			mav.addObject("userClassWriteTableList", userClassWriteTableList);
			mav.addObject("boardClassPagingList", boardClassPagingList);
			mav.setViewName("/board/boardClassList");
			System.out.println();
			
			return mav;
			//return "/board/boardClassList";
		}
		
		@GetMapping(value = "classWrite")
		public String classWrite(@RequestParam(value = "class_id", required = false) int class_id, @RequestParam String class_academy){
			return "/board/boardClassWriteForm";
		}
		
		@PostMapping("/boardClassWrite")
		public String boardClassWrite(BoardDTO boardDTO) {
			boardService.boardClassWrite(boardDTO);
			return "/board/boardClassView";
		}
		
		//검색
		@GetMapping(value = "boadClassSearchList")
		public ModelAndView boadClassSearchList(@RequestParam(value = "pg", required = false, defaultValue = "1") int pg, @RequestParam String keyword, @RequestParam String sortOption,  @RequestParam(value = "class_id", required = false) int class_id) {
			UserAllDTO userAllDTO = userService.getUserClass_Class(class_id);
			//ajax방식으로 할 거 아니면, String이나 String Buffer 물어와야 됨. 
			System.out.println("\n @Log@ /boardList/search mapping..!! current pg : " + pg);
			
			String userClassWriteTableList = boardService.getUserClassSearchWriteTablelist(pg, keyword, sortOption, class_id, userAllDTO.getClass_academy());
			String boardClassPagingList = boardService.getBoardClassSearchPagingList(pg, keyword, sortOption, class_id);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("userClassWriteTableList", userClassWriteTableList);
			mav.addObject("boardClassPagingList", boardClassPagingList);
			mav.addObject("keyword",keyword);
			mav.addObject("class_id",class_id);
			//mav.addObject("class_academy",userAllDTO.getClass_academy());
			
			mav.setViewName("/board/boardClassList");
			
			return mav;
		} 
		
		//######################view#####################
		@GetMapping(value = "getBoardClassView") // 데이터값 담아서 jsp로 이동
		public ModelAndView getBoardClassView(@RequestParam(required = false, defaultValue = "1") int board_id, @RequestParam(required = false, defaultValue = "1") String pg, @RequestParam(value = "class_id", required = false) int class_id) { // 글번호, 페이지값 
			System.out.println("getBoardView 컨트롤러 실행....");
		
			ModelAndView mav = new ModelAndView(); // boardView.jsp 에 데이터 넣어 보내기
			mav.addObject("board_id", board_id); // 글번호값이랑 
			mav.addObject("pg", pg); // 페이지값 실어서
			mav.addObject("class_id", class_id);
			BoardDTO boardDTO = (BoardDTO) boardService.getBoardClassContent(board_id, class_id);
			mav.addObject("boardDTO", boardDTO);
			
			System.out.println("TEST boardDTO getboardDTO_view_cnt =" +boardDTO.getBoard_view_cnt());
			
			Date date = boardDTO.getBoard_date_created(); // 날짜 꺼내서
			String dateToStr = DateFormatUtils.format(date, "yyyy-MM-dd HH:mm:SS"); // 바꿔주고
			mav.addObject("dateToStr",dateToStr);

			//풍혁220708 : boadr_uid로 유저nickname 받아서 작성자에 넣겠습니다.
			String author = boardService.getUserNameByUserId(boardDTO.getBoard_uid());
			mav.addObject("author", author);
			
			//풍혁220714 : board_uid로 user_img를 받아서 프로필 사진 반영하겠습니다. 
			String userImg = userService.getUserImgByUserid(boardDTO.getBoard_uid());
			System.out.println("\n @log@ userimg : " + userImg);
			mav.addObject("user_img", userImg);
			
			mav.addObject("getBoard_classid", boardDTO.getBoard_classid());
			
			System.out.println("DTO에서 댓글수 TEST = " + boardDTO.getBoard_cmt_cnt());
			System.out.println("DTO 에서 시간 TEST = " + boardDTO.getBoard_date_created());
			mav.setViewName("board/boardClassView"); // boardView.jsp로 보냄 
			return mav; // 스프링한테 데이터랑 목적지 꺼내봐 하는거
		}
		
		@GetMapping(value = "boardClassRecommend")
		@ResponseBody
		public int boardClassRecommend(@RequestParam int vote_uid, int vote_classid, int vote_bid) { // 게시글 번호와, 추천유저아이디 
			
			System.out.println("****** TEST 추천 컨트롤러*************");
			System.out.println("추천글번호 :" + vote_bid + " | " + "유저번호 :" +  vote_uid + "|" +  "카테번호 :" + vote_classid);
			
			Map<String, Object> map = new HashMap<String, Object>();
		
			map.put("vote_uid", vote_uid);
			map.put("vote_cateid", vote_classid);
			map.put("vote_bid", vote_bid);
			
			int boardClassRecommendCheck =  boardService.boardClassRecommendCheck(map);	 // 추천수를 이미 눌렀는지 체크 - DB에서 가져와서 보자
			
			System.out.println("****** TEST recommendCheck : " + boardClassRecommendCheck);
			
			// 0또는 1일때 
			if (boardClassRecommendCheck == 0) {
				boardService.boardClassincreaseRecommend(map); // 추천수 한번만 누르면 db가서 추천됨
				boardService.boardClassaddVote(map);  // 추천 정보를 (추천유저, 추천한 게시글번호) vote 테이블에 넣어주기! 그래야 0에서 1이 되고 더 올라가지 않음. 1이 되면 ajax가서 반환되어서 추천을 취소? 물어봄
			} 
			return boardClassRecommendCheck;
			
		}
		
		  // 추천수 취소 기능
		  @GetMapping(value = "boardClassRecommendCancel")
		  @ResponseBody 
		  public void boardClassRecommendCancel(@RequestParam int vote_uid,@RequestParam int vote_classid,@RequestParam int vote_bid) {
			
			//System.out.println("**** 추천취소 컨트롤러");
					  
			Map<String, Object> map = new HashMap<String, Object>();
					  
			map.put("vote_uid", vote_uid); 
			map.put("vote_cateid", vote_classid);
			map.put("vote_bid", vote_bid);
					  
			boardService.boardClassdeleteVote(map); 
			boardService.boardClassRecommendCancel(map);
		  
		  }
		  
		  //수정
		  @GetMapping(value = "boardClassEditForm")
		  public String boardClassEditForm(@RequestParam int board_id) {
			  return "/board/boardClassEditForm";
		  }
			 
		  // 글 삭제
		  @GetMapping(value = "boardClassDelete")
		  @ResponseBody
		  public void boardDelete(@RequestParam int board_id) {
			  boardService.boardClassDelete(board_id);
		  }
		  
		  
		  @GetMapping(value = "getBoardClass")
		  @ResponseBody
		  public BoardDTO getBoardClass(@RequestParam int board_id) { 
			  
			  BoardDTO boardDTO= boardService.boardClassEditForm(board_id); 
			  return boardDTO; 
			 }
		  
		  
		  @PostMapping(value = "boardClassUpdate")
			public void boardClassUpdate(@RequestParam Map<String,String> map) {
				System.out.println("\n@board update LOG @");
				System.out.println("board_title" + map.get("board_title"));
				System.out.println("board_content" + map.get("board_content"));
				System.out.println("board_classid" + map.get("board_classid"));
				System.out.println("board_id" + map.get("board_id"));
				
				boardService.boardClassUpdate(map);
			};

		  
}