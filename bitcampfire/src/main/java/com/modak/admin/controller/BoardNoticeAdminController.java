package com.modak.admin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.modak.board.bean.BoardDTO;
import com.modak.board.service.BoardService;
import com.modak.user.bean.UserAllDTO;
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
	public ModelAndView adminBoardNoticeList(@RequestParam String category, @RequestParam(value = "pg", required = false, defaultValue = "1") int pg) {
		//어차피 관리자는 페이지 이동(user id = 0이여야 접근 가능)에서 걸러지기 때문에 아이디 가져오지 않음
		String adminNoticeTableList = boardService.getAdminNoticeTableList(category, pg);
		String adminNoticePagingList = boardService.getAdminNoticePagingList(category, pg);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("adminNoticeTableList", adminNoticeTableList);
		mav.addObject("adminNoticePagingList", adminNoticePagingList);
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
	@GetMapping(value = "getAdminBoardNoticeView")
	public ModelAndView getAdminBoardNoticeView(@RequestParam(required = false, defaultValue = "1") int board_id, @RequestParam(required = false, defaultValue = "1") String pg) {
		//전체 목록은 일단 cateid를 안가져간다
		ModelAndView mav = new ModelAndView(); // boardView.jsp 에 데이터 넣어 보내기
		mav.addObject("board_id", board_id); // 글번호값이랑 
		mav.addObject("pg", pg); // 페이지값 실어서
		BoardDTO boardDTO = (BoardDTO) boardService.getAdminBoardNoticeContent(board_id);
		
		int board_cateid = boardDTO.getBoard_cateid();
		String category = null;
		switch(board_cateid){
		case 6 : category = "notice"; break;
		case 1 : category = "info"; break;
		case 2 : category = "review"; break;
		case 3 : category = "qna"; break;
		case 4 : category = "free"; break;
		case 5 : category = "class"; break;
		}
		
		mav.addObject("boardDTO", boardDTO);
		mav.addObject("category", category);
		
		System.out.println("TEST BoardDTO getBoardDTO_view_cnt =" + boardDTO.getBoard_view_cnt());
		
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
	
	
	//공지사항 리스트  선택 삭제
	@GetMapping(value="adminNoticeDelete_select")	
	public ModelAndView adminNoticeDelete_select(@RequestParam String[] check) {
		//System.out.println(check[0]+"  " +check[1]);
		boardService.adminNoticeDelete_select(check);
		

		return new ModelAndView("redirect:/admin/adminBoardNoticeList?category=admin&pg=1");
	}
	
	
	//공지사항 리스트 개별 삭제 + 공지사항  뷰 > 글삭제
	@PostMapping(value="adminNoticeDelete")
	@ResponseBody
	public String adminNoticeDelete(@RequestParam int board_id) {
		//뭘로 들어오냐
		System.out.println(board_id);
		boardService.adminNoticeDelete(board_id);
		session.invalidate();
		return "/admin/adminBoardNoticeList";
	}
	
	//공지사항 수정 폼 띄우기
	@GetMapping(value = "adminBoardNoticeEditForm")
	public String adminBoardNoticeEditForm(@RequestParam int board_id) { 
		return "/admin/adminBoardNoticeEditForm"; 
	}
	
	//공지사항 수정 데이터 불러오기	
	@GetMapping(value = "getAdminBoardNotice_edit")
	@ResponseBody
	public Map<String, Object> getAdminBoardNotice_edit(@RequestParam int board_id) { 		  
		
		BoardDTO boardDTO= boardService.getAdminBoardNotice_edit(board_id);
		
		//관리자의 경우 본인글이 아니어도 볼 수 있음=> 유저별 정보 끌어 오기 
		//닉네임
		//풍혁220708 : boadr_uid로 유저nickname 받아서 작성자에 넣겠습니다.
		String author = boardService.getUserNameByUserId(boardDTO.getBoard_uid());
		
		//사진
		//풍혁220714 : board_uid로 user_img를 받아서 프로필 사진 반영하겠습니다. 
		String userImg = userService.getUserImgByUserid(boardDTO.getBoard_uid());
		//System.out.println("\n @log@ userimg : " + userImg);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardDTO", boardDTO); 
		map.put("user_nickname", author);
		map.put("user_img", userImg);
		
		return map; 
	}
			 
	//글수정
	@PostMapping(value = "adminBoardNoticeUpdate")
	public void update(@RequestParam Map<String,String> map) {
//		System.out.println("\n@board update LOG @");
//		System.out.println("board_title" + map.get("board_title"));
//		System.out.println("board_content" + map.get("board_content"));
//		System.out.println("board_cateid" + map.get("board_cateid"));
//		System.out.println("board_id" + map.get("board_id"));
		
		boardService.adminBoardNoticeUpdate(map);
	};
	
	@GetMapping(value ="adminBoardNoticeSearchList") 
	public ModelAndView adminBoardNoticeSearchList(@RequestParam String category, @RequestParam(value = "pg", required = false, defaultValue = "1") int pg, @RequestParam String keyword, @RequestParam String searchOption) {
		
		//ajax방식으로 할 거 아니면, String이나 String Buffer 물어와야 됨. 
		//System.out.println("\n @Log@ /boardList/search mapping..!! current pg : " + pg);
		
		String adminNoticeTableList = boardService.getAdminNoticeSearchTableList(category, pg, keyword, searchOption);
		String adminNoticePagingList = boardService.getAdminNoticeSearchPagingList(category, pg, keyword, searchOption);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("adminNoticeTableList", adminNoticeTableList);
		mav.addObject("adminNoticePagingList", adminNoticePagingList);
		mav.addObject("keyword",keyword);
		mav.addObject("searchOption",searchOption);
		
		mav.setViewName("/admin/adminBoardNoticeList");
		
		return mav;
	} 
	
	//공지사항 - 게시판별 공지 띄우기
	@PostMapping(value="adminBoardNoticeListOfficial")
	@ResponseBody
	public List<BoardDTO> adminBoardNoticeListOfficial(@RequestParam String category, @RequestParam(value = "pg", required = false, defaultValue = "1") int pg) {
		
		return boardService.getAdminBoardNoticeListOfficial(category, pg);
	}
	
	//공지사항 리스트에 띄울 유저정보 가져오기
	@PostMapping(value="getUserInfoForNoticeList")
	@ResponseBody
	public UserAllDTO getUserInfoForNoticeList(int board_uid) {
		return userService.getUserInfoForNoticeList(board_uid);
	}
	
	//@@@@@ 연수 : admin> boardwrite & boardedit - ckeditor 이미지 업로드  추가(220726)@@@@@
	  @PostMapping(value="uploadImageFileByCkAtAdmin")
		public void uploadImageFileByCkAtAdmin(HttpServletRequest req, HttpServletResponse res, @RequestParam MultipartFile upload) throws Exception {
		 
		 String uploadPath = req.getSession().getServletContext().getRealPath("/").concat("WEB-INF\\storage\\boardImg\\");
		 System.out.println("uploadPath  : "+uploadPath);
		 // 랜덤 문자 생성
		 UUID uid = UUID.randomUUID();
		 
		 OutputStream out = null;
		 PrintWriter printWriter = null;
		   
		 // 인코딩
		 res.setCharacterEncoding("utf-8");
		 res.setContentType("application/json");
		 
		 try {
		  
		  String fileName =  upload.getOriginalFilename(); // 파일 이름 가져오기
		  byte[] bytes = upload.getBytes();
		  
		  // 업로드 경로			 
		  String ckUploadPath = uploadPath + File.separator + uid + "_" +fileName;
		  
		  out = new FileOutputStream(new File(ckUploadPath));
		  out.write(bytes);
		  out.flush(); // out에 저장된 데이터를 전송하고 초기화
		  
		  //String callback = req.getParameter("CKEditorFuncNum");
		  //System.out.println("**************"+callback);
		  printWriter = res.getWriter();
		  String fileUrl = "/semiproject/src/main/webapp/storage/boardImg/" + uid + "_" +fileName; // 작성화면
		  // 업로드시 메시지 출력
		  JsonObject json = new JsonObject();
		  json.addProperty("uploaded", 1);
		  json.addProperty("fileName", fileName);
		  json.addProperty("url", fileUrl);
		  printWriter.println(json);
		  System.out.println("내가바로콜백"+json);
		  
		  printWriter.flush();
		  System.out.println("test url : "+req.getSession().getServletContext().getRealPath("/"));
		  System.out.println("url : "+fileUrl);
		  System.out.println("ckUploadPath : "+ckUploadPath);
		 } catch (IOException e) { e.printStackTrace();
		 } finally {
		  try {
		   if(out != null) { out.close(); }
		   if(printWriter != null) { printWriter.close(); }
		  } catch(IOException e) { e.printStackTrace(); }
		 }
		 
		 return; 
		}
	  //@@@@@ 연수 : admin> boardwrite & boardedit - ckeditor 이미지 업로드  추가(220726)@@@@@
	
	
}
