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
import org.springframework.beans.factory.annotation.Required;
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
		public ModelAndView boardList(@RequestParam String category, @RequestParam(value = "pg", required = false, defaultValue = "1") int pg,HttpServletRequest req, @RequestParam(required = false, defaultValue = "date") String sortOption) {
			//ajax방식으로 할 거 아니면, String이나 String Buffer 물어와야 됨. 
//			System.out.println("\n @Log@ /boardList/list mapping..!! current pg : " + pg);
			HttpSession session = req.getSession();
//			System.out.println("\n @LOG@ session_email check : " + (String)session.getAttribute("memEmail"));
			String session_email = (String)session.getAttribute("memEmail");
			
			String userWriteTableList = boardService.getUserWriteTablelist(category, pg, sortOption);
			String boardPagingList = boardService.getBoardPagingList(category, pg, sortOption);
			
			ModelAndView mav = new ModelAndView();
			if(session_email != null) {
				mav.addObject("session_email", session_email);
			}
			mav.addObject("userWriteTableList", userWriteTableList);
			mav.addObject("boardPagingList", boardPagingList);
			mav.setViewName("/board/boardList");
			System.out.println();
			
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
		public ModelAndView boardSearchList(@RequestParam String category, @RequestParam(value = "pg", required = false, defaultValue = "1") int pg, @RequestParam String keyword, @RequestParam String sortOption) {
			
			//ajax방식으로 할 거 아니면, String이나 String Buffer 물어와야 됨. 
			System.out.println("\n @Log@ /boardList/search mapping..!! current pg : " + pg);
			
			String userWriteTableList = boardService.getUserSearchWriteTablelist(category, pg, keyword, sortOption);
			String boardPagingList = boardService.getBoardSearchPagingList(category, pg, keyword, sortOption);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("userWriteTableList", userWriteTableList);
			mav.addObject("boardPagingList", boardPagingList);
			mav.addObject("keyword",keyword);
			
			mav.setViewName("/board/boardList");
			
			return mav;
		} 
		
		//풍혁220708 : BoardDTO list로 받아보기..++0718 : jsonTest 추후에 이름 변경 예정..
		@PostMapping("/jsonTest")
		@ResponseBody
		public Map<String, Object> jsonTest(@RequestParam Map<String,Integer> map, @RequestParam("category") String category){
			Map<String, Object> result = new HashMap<>();
			
			List<BoardDTO> list =  new ArrayList<>();
			System.out.println("\n @ log @ json test .. startNum : " + map.get("startNum") );
			list = boardService.getBoardList(map, category);
			
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
		
		//풍혁0714 : boardUpdate 기능구현
		@PostMapping(value = "update")
		@ResponseBody
		public void update(@RequestParam Map<String,String> map) {
			System.out.println("\n@board update LOG @");
			System.out.println("board_title" + map.get("board_title"));
			System.out.println("board_content" + map.get("board_content"));
			System.out.println("board_cateid" + map.get("board_cateid"));
			System.out.println("board_id" + map.get("board_id"));
			
			boardService.update(map);
		};
		
		//풍혁0714 : indexList 에서 user 사진 보여주기, board_uid 로 user_img 받아오기
		@PostMapping(value = "getUserImgByBoardUid")
		@ResponseBody
		public String getUserImgByBoardUid(@RequestParam int user_id) {
			
			return userService.getUserImgByUserid(user_id);
		}
		  	
		  
//풍혁 : 끝 ====================================
	
	// 정수 : 시작  ###################### 
		//목록에서 글 가져와서 jsp 띄우기
		@GetMapping(value = "getBoardView") // 데이터값 담아서 jsp로 이동
		public ModelAndView getBoardView(@RequestParam String category, @RequestParam(required = false, defaultValue = "1") int board_id, @RequestParam(required = false, defaultValue = "1") String pg) 	{ // 카테고리번호, 글번호, 페이지값 
			
			int cateid = -1;
			
			switch(category) {
			case "info" :
				cateid = 1;
				break;
			case "review" :
				cateid = 2;
				break;
			case "qna" :
				cateid = 3;
				break;
			case "free" :
				cateid = 4;
				break;
			}
			
			System.out.println("\n @LOG 0722 PH@ changed cate_id : " + cateid );
			
			//풍혁0719 : category 반영해야해서 parameter는  map으로 변경
			Map<String,Integer> map = new HashMap<>();
			map.put("cateid",cateid); // 카테고리아이디
			map.put("board_id",board_id);

			
			ModelAndView mav = new ModelAndView(); // boardView.jsp 에 데이터 넣어 보내기
			mav.addObject("board_id", board_id); // 글번호값이랑 
			mav.addObject("pg", pg); // 페이지값 실어서
			BoardDTO boardDTO = (BoardDTO) boardService.getBoardContent(map);
			mav.addObject("boardDTO", boardDTO);
			
			//System.out.println("TEST BoardDTO getboardDTO_view_cnt =" +boardDTO.getBoard_view_cnt());
			
			Date date = boardDTO.getBoard_date_created(); // 날짜 꺼내서
			String dateToStr = DateFormatUtils.format(date, "yyyy-MM-dd HH:mm:SS"); // 바꿔주고
			mav.addObject("dateToStr",dateToStr);

			//풍혁220708 : boadr_uid로 유저nickname 받아서 작성자에 넣겠습니다.
			String author = boardService.getUserNameByUserId(boardDTO.getBoard_uid());
			mav.addObject("author", author);
			
			//풍혁220714 : board_uid로 user_img를 받아서 프로필 사진 반영하겠습니다. 
			String userImg = userService.getUserImgByUserid(boardDTO.getBoard_uid());
			//System.out.println("\n @log@ userimg : " + userImg);
			mav.addObject("user_img", userImg);
			
			mav.addObject("cateidToString", boardDTO.cateidToString());
			
			//System.out.println("DTO에서 댓글수 TEST = " + boardDTO.getBoard_cmt_cnt());
			//System.out.println("DTO 에서 시간 TEST = " + boardDTO.getBoard_date_created());
			mav.setViewName("board/boardView"); // boardView.jsp로 보냄 
			return mav; // 스프링한테 데이터랑 목적지 꺼내봐 하는거
		}
		
		@GetMapping(value = "/recommend")
		@ResponseBody
		public int recommend(@RequestParam int vote_uid, int vote_cateid, int vote_bid) { // 게시글 번호와, 추천유저아이디 
			
			System.out.println("****** TEST 추천 컨트롤러*************");
			System.out.println("추천글번호 :" + vote_bid + " | " + "유저번호 :" +  vote_uid + "|" +  "카테번호 :" + vote_cateid);
			
			Map<String, Object> map = new HashMap<String, Object>();
		
			map.put("vote_uid", vote_uid);
			map.put("vote_cateid", vote_cateid);
			map.put("vote_bid", vote_bid);
			
			int recommendCheck =  boardService.recommendCheck(map);	 // 추천수를 이미 눌렀는지 체크 - DB에서 가져와서 보자
			
			System.out.println("****** TEST recommendCheck : " + recommendCheck);
			
			// 0또는 1일때 
			if (recommendCheck == 0) {
				boardService.increaseRecommend(map); // 추천수 한번만 누르면 db가서 추천됨
				boardService.addVote(map);  // 추천 정보를 (추천유저, 추천한 게시글번호) vote 테이블에 넣어주기! 그래야 0에서 1이 되고 더 올라가지 않음. 1이 되면 ajax가서 반환되어서 추천을 취소? 물어봄
			} 
			return recommendCheck;
			
		}
		
		  // 추천수 취소 기능
		  @GetMapping(value = "/recommendCancel")
		  @ResponseBody 
		  public void recommendCancel(@RequestParam int vote_uid,@RequestParam int vote_cateid,@RequestParam int vote_bid) {
			
			//System.out.println("**** 추천취소 컨트롤러");
					  
			Map<String, Object> map = new HashMap<String, Object>();
					  
			map.put("vote_uid", vote_uid); 
			map.put("vote_cateid", vote_cateid);
			map.put("vote_bid", vote_bid);
					  
			boardService.deleteVote(map); 
			boardService.recommendCancel(map);
		  
		  }
		  
		  // 글 수정 데이터 불러오기
		  @GetMapping(value = "/getBoard")
		  @ResponseBody
		  public BoardDTO getBoard(@RequestParam int board_id, int cateid) { 
			  Map<String,Integer> map = new HashMap<>();
			  map.put("board_id", board_id);
			  map.put("cateid", cateid);
			  
			  BoardDTO boardDTO= boardService.boardEditForm(map); 
			  //System.out.println("***boardEdit*** TEST boardDTO = " + boardDTO); 
			  return boardDTO; 
			 }
		  
		  @GetMapping(value = "/boardEditForm")
		  public String boardEditForm(@RequestParam int board_id) {
			  return "/board/boardEditForm";
		  }
			 
		  // 글 삭제
		  @GetMapping(value = "/boardDelete")
		  @ResponseBody
		  public void boardDelete(@RequestParam int board_id, int cateid) {
			  Map<String,Integer> map = new HashMap<>();
			  map.put("board_id", board_id);
			  map.put("cateid", cateid);
			  boardService.boardDelete(map);
		  }
		  
		  @GetMapping(value = "/boardDelete2")
		  @ResponseBody
		  public void boardDelete2(@RequestParam Map<Integer, String> map) {
			  
			  boardService.boardDelete2(map);
		  }
		  
	// 정수 : 끝  ###################### 
}
