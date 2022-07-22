package com.modak.admin.controller;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.time.DateFormatUtils;
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
import com.modak.user.service.UserService;

@Controller
@RequestMapping(value="admin")
public class BoardNoticeAdminController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private HttpSession session;
	@Autowired
	private UserService userService;	
	
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
	
	//보드뷰 가져오기
	@GetMapping(value = "adminBoardNoticeView")
	public ModelAndView getAdminBoardNoticeView(@RequestParam(required = false, defaultValue = "1") int board_id, @RequestParam(required = false, defaultValue = "1") String pg) {
		//전체 목록은 일단 cateid를 안가져간다
		ModelAndView mav = new ModelAndView(); // boardView.jsp 에 데이터 넣어 보내기
		mav.addObject("board_id", board_id); // 글번호값이랑 
		mav.addObject("pg", pg); // 페이지값 실어서
		BoardDTO boardDTO = (BoardDTO) boardService.getAdminBoardNoticeContent(board_id);
		mav.addObject("boardDTO", boardDTO);
		
		//System.out.println("TEST BoardClassDTO getboardClassDTO_view_cnt =" +boardClassDTO.getBoard_view_cnt());
		
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
		
		mav.setViewName("admin/adminBoardNoticeView"); // boardView.jsp로 보냄 
		return mav; // 스프링한테 데이터랑 목적지 꺼내봐 하는거
	}
	
	
	//공지사항 선택 삭제
	@GetMapping(value="adminNoticeDelete_select")	
	public ModelAndView adminNoticeDelete_select(@RequestParam String[] check) {
		System.out.println(check[0]+"  " +check[1]);
		boardService.adminNoticeDelete_select(check);
		

		return new ModelAndView("redirect:/admin/adminBoardNoticeList");
	}
	//<!--@@@@ 연수 살려주세요!(220721)  -->
	
	
}
