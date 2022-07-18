 package com.modak.board.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.modak.board.bean.BoardClassDTO;
import com.modak.board.bean.BoardDTO;
import com.modak.board.bean.BoardPaging;
import com.modak.board.dao.BoardDAO;
import com.modak.user.dao.UserDAO;

@Service
public class BoardServiceImpl implements BoardService {
	//공통 영역 : 시작 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	@Autowired
	private BoardDAO boardDAO;
	

		//풍혁 220708 : 세션 이메일로 user_id를 받아오기 위해 생성했습니다.
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private HttpSession session;

	// 글번호로 (글번호, DTO) 가져오기
	//public BoardDTO getBoardContent(int board_id);
		//풍혁(0706 2143) : interface에 넣어야할 것을 여기다가 넣으신거 같아요. 착각하신게 맞다면 지우고 commit 부탁드립니다. 

	//공통 영역 : 끝 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	//풍혁 : 시작 ===========================================
		@Override
		public String getUserWriteTablelist(int pg, String sortOption) {
			StringBuffer sb = new StringBuffer();
			//페이징 처리하려면 다 받아오면 안되잖아. 몇개씩 표시할지 start랑 end정해줘야 되잖아. 
			
			//최신순으로 정렬할 때, startNum이랑 endNum map에 담아서 보내주기 
			int boardPerPage = 10;
			int startNum = 1 + boardPerPage*(pg-1);
			int endNum = boardPerPage + boardPerPage*(pg-1);
			
			
			
			  // 세션값이 있다면 = 로그인을 했다면!
			session.setAttribute("board_view_cnt", "0"); // 조회수에 0을 넣어라! (= 값이 존재하게 만들어주자!)
			
			
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("startNum", startNum);
			map.put("endNum", endNum);
			
			List<BoardDTO> list = boardDAO.getBoardRangeOrder(map, sortOption);
 
			System.out.println("\n @ boardTalbeList size : " + list.size());
			System.out.println("\n @ getBoardRange parameter : " + pg + map.get("startNum") + map.get("endNum"));
			sb.append("<ul class=\"list-group \">");
			for(BoardDTO dto : list) {
				sb.append(boardDtoToTrTag(dto, sortOption));
			}
			sb.append("</ul>");
			return sb.toString(); 
		}
		 	
		@Override
		public String getUserSearchWriteTablelist(int pg, String keyword, String sortOption) {
			StringBuffer sb = new StringBuffer();
			
			int boardPerPage = 10;
			int startNum = 1 + boardPerPage*(pg-1);
			int endNum = boardPerPage + boardPerPage*(pg-1);
			
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("startNum", Integer.toString(startNum));
			map.put("endNum", Integer.toString(endNum));
			map.put("keyword", keyword);
			
			List<BoardDTO> list = boardDAO.getBoardSearchRangeOrder(map, sortOption); 
			System.out.println("\n @ boardTalbeList size : " + list.size());
			System.out.println("\n @ getBoardRange parameter : " + pg + map.get("startNum") + map.get("endNum"));
			sb.append("<ul class='list-group '>");
			for(BoardDTO dto : list) {
				sb.append(boardDtoToTrTag(dto, sortOption));
			}
			sb.append("</ul>");
			
			
			return sb.toString(); 
		}
		
		//풍혁220708 : board_uid 추가
		@Override
		public void boardWrite(BoardDTO boardDTO) {
			String session_email = (String)session.getAttribute("memEmail");
			int board_uid = userDAO.getUserIdByEmail(session_email);
			System.out.println("\n@ session_eamil = " + session_email);
			//풍혁220708 : userDAO에 user_id 받아오는 method와 query 생성해서 boardDTO에 집어넣고 글 생성할 때 반영
			boardDTO.setBoard_uid(board_uid);
			boardDAO.boardWrite(boardDTO);
		}
		
	
		//풍혁 (220703) : getUserWriteTablelist() method에서 table에 tr을 추가하는 코드가 너무 길어질 것으로 판단해, tr을 만들어주는 method를 생성했습니다. 
		private String boardDtoToTrTag(BoardDTO boardDTO, String sortOption) {
			//풍혁220708 : user_name 받아오기 
			int board_uid = boardDTO.getBoard_uid();
			String author = userDAO.getUserNameByUserId(board_uid);
			
			StringBuffer tr = new StringBuffer();
			
			//풍혁(220703) : DTO의 Date field를 String으로 변경 시작 
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = boardDTO.getBoard_date_created();
			System.out.println("\n date : " + date);
			String dateToStr = dateFormat.format(date);
			//풍혁(220703) : DTO의 Date field를 String으로 변경 마무리
			 
			//풍혁(220705) : comment의 개수에 따라 li의 클래스가 달라지는 것을 구분하기 위해서..
			int noteNum = boardDTO.getBoard_cmt_cnt();
			String hasNoteClass = null;
			if(noteNum > 0 ) {
				hasNoteClass = "list-group-has-note";
			}else {
				hasNoteClass = "list-group-no-note";
			}
			//풍혁(220705) : comment의 개수에 따라 li의 클래스가 달라지는 것을 구분하기 위해서..
			
			tr.append("<li class='list-group-item list-group-item-question clearfix " + hasNoteClass + "'>");
				tr.append("<div class='list-title-wrapper clearfix'>");
					tr.append("<div class='list-tag clearfix'>");
						//풍혁220709 : 게시판 아이콘 반영 안되고있음
						tr.append("<span class='list-group-item-text article-id'>"+ boardDTO.getBoard_id()+"</span>");
						tr.append("<a='/semiproject/board/list?pg=1' class='list-group-item-text item-tag label label-info'>"+ boardDTO.cateidToString()+"</a>"); 
					tr.append("</div>");
				
					tr.append("<h5 class='list-group-item-heading list-group-item-evaluate'>");
						//풍혁 (220707) : pg는 그냥 1로만 넣어놓았으니 나중에 pg 넘길방법 생각해야됨 input hidden만들어서 넘기자 
 						tr.append("<a href='/semiproject/board/getBoardView?board_id="+boardDTO.getBoard_id()+"&pg=1'>");
							tr.append(boardDTO.getBoard_title());
						tr.append("</a>");
					tr.append("</h5>");
				tr.append("</div>");
			
				tr.append("<div class='list-summary-wrapper clearfix'>");
					tr.append("<div class='list-group-item-summary clearfix'>");
						tr.append("<ul>");
							tr.append("<li class=''>");
								tr.append("<i class='item-icon fa fa-comment '></i>");
								tr.append(boardDTO.getBoard_cmt_cnt());
							tr.append("</li'>");
							
							tr.append("<li class=''>");
								tr.append("<i class='item-icon fa fa-thumbs-up '></i>");
								tr.append(boardDTO.getBoard_vote_cnt());
							tr.append("</li'>");
							
							tr.append("<li class=''>");
								tr.append("<i class='item-icon fa fa-eye '></i>");
								tr.append(boardDTO.getBoard_view_cnt());
							tr.append("</li'>");
							
						tr.append("</ul>");
					tr.append("</div>");
				tr.append("</div>");
				
				//풍혁0714 : QNA는 아래의 코드가 들어가기 때문에 일단 남겨두겠습니다.
//				tr.append("<div class='list-summary-wrapper clearfix'>");
//					tr.append("<div class='item-evaluate-wrapper pull-right clearfix'>");
//						tr.append("<div class='item-evaluate'>");
//							tr.append("<div class='item-evaluate-icon'>");
//								tr.append("<i class='item-icon fa fa-thumbs-o-up'>");
//								
//								tr.append("</i>");
//							tr.append("</div>");
//							
//							tr.append("<div class='item-evaluate-icon'>");
//								tr.append(boardDTO.getBoard_vote_cnt());
//							tr.append("</div>");
//						tr.append("</div>");
//						
//						tr.append("<div class='item-evaluate item-evaluate-has-note'>");
//							tr.append("<div class='item-evaluate-icon'>");
//								tr.append("<i class='item-icon fa fa-exclamation-circle'>");
//								
//								tr.append("</i>");
//							tr.append("</div>");
//							
//							tr.append("<div class='item-evaluate-icon'>");
//								tr.append(boardDTO.getBoard_cmt_cnt());
//							tr.append("</div>");
//						tr.append("</div>");
//					tr.append("</div>");
//				tr.append("</div>");
				
				tr.append("<div class=\"list-group-item-author clearfix\">");
					tr.append("<div class='avatar clearfix avatar-list '>");
						//풍혁(220707) : user click 했을 경우 user의 최근활동을 볼 수 있는 페이지로 이동 : 옵션으로
						String userProfileImg = userDAO.getUserImgByUserid(boardDTO.getBoard_uid());
						tr.append("<a href='/semiproject/user/userPage?user_id="+boardDTO.getBoard_uid()+"' class='avatar-photo'><img src='/semiproject/storage/userprofile/"+userProfileImg+"'></a>");
						tr.append("<div class='avatar-info'>");
							tr.append("<a class='nickname' href='#' title='"+ author +"'>"+ author +"</a>");
							tr.append("<div class='activity'>");
								tr.append("<span class='fa fa-flash'></span>" + "lev");
							tr.append("</div>");
							tr.append("<div class='date-created'>");
								tr.append("<span class='timeago' title='"+dateToStr+"'>"+ dateToStr +"</span>");
							tr.append("</div>");
						tr.append("</div>");
					tr.append("</div>");
				tr.append("</div>");
				
			tr.append("</li>");
		
			return tr.toString();
		}
		
		// 풍혁(220703) : list 하단에 pageList 입니다. container에 bean으로 올려서 받아쓰는 방법도 있으나 일단 객체생성 방식으로 사용해보겠습니다. 
		@Override
		public String getBoardPagingList(int pg, String sortOption) {
			BoardPaging boardPaging = new BoardPaging();
			boardPaging.setCurrentPage(pg);
			boardPaging.setPageBlock(10); //이전 다음 사이에 10개의 page
			boardPaging.setPageSize(10); //page 당 10개의 글 존재
			boardPaging.setTotalA(boardDAO.getTotalBoardNum());
			boardPaging.makePagingHTML(sortOption);
			
			return boardPaging.getPagingHTML().toString();
		}
		
		@Override
		public String getBoardSearchPagingList(int pg, String keyword, String sortOption) {
			BoardPaging boardPaging = new BoardPaging();
			boardPaging.setCurrentPage(pg);
			boardPaging.setPageBlock(10); //이전 다음 사이에 10개의 page
			boardPaging.setPageSize(10); //page 당 10개의 글 존재
			boardPaging.setTotalA(boardDAO.getTotalBoardSearchNum(keyword));
			boardPaging.makeSearchPagingHTML(keyword, sortOption);
			
			return boardPaging.getPagingHTML().toString();
		}
		
//		@Override
//		public String getBoardSortList(String sortOption) {
//			StringBuffer sortListBuffer = new StringBuffer();
//			
//			sortListBuffer.append("<li><a href='/semiproject/board/list?pg=1&sortOption=date' data-sort='id' data-order='desc' class='category-sort-link active'>최신순</a></li>");
//			sortListBuffer.append("<li><a href='/semiproject/board/list?pg=1&sortOption=vote' data-sort='voteCount' data-order='desc' class='category-sort-link '>추천순</a></li>");
//			sortListBuffer.append("<li><a href='/semiproject/board/list?pg=1&sortOption=view' data-sort='viewCount' data-order='desc' class='category-sort-link '>조회순</a></li>");
//			
//			
//			return null;
//		}
		
		@Override
		public String getUserNameByUserId(int board_uid) {
			String user_name = userDAO.getUserNameByUserId(board_uid);
			
			return user_name;
		}
		
		@Override
		public List<BoardDTO> getBoardReviewList(Map<String, Integer> map) {
			
			return boardDAO.getBoardReviewList(map);
		}
		
		//풍혁220714 : board 수정기능입니다~
		@Override
		public void update(Map<String, String> map) {
			
			boardDAO.update(map);
			return;
		}
	
//풍혁 : 끝 =============================================
	
	
	//정수 : 시작 ############################################

		@Override
		public BoardDTO getBoardContent(int board_id) { 
		
		if (session.getAttribute("board_view_cnt")!=null) { // 로그인을 했다면 / board_view_cnt
			boardDAO.setHit(board_id); // 글번호에 조회수 증가하게 해
			session.removeAttribute("board_view_cnt"); // 조회수에 해당하는 세션에 있는 값을 삭제.
		}
		
		BoardDTO boardDTO = boardDAO.getBoardContent(board_id); //글번호 가지고 dto 가지고와
		
		return boardDTO;
		}
		
		//추천수가 있는지 체크
		
		@Override
		public int recommendCheck(Map<String, Object> map) {
			
			return boardDAO.recommendCheck(map);
			
		}

		@Override
		public void increaseRecommend(Map<String, Object> map) {
			
			boardDAO.increaseRecommend(map);
			
		}

		@Override
		public void recommendCancel(Map<String, Object> map) {
			
			boardDAO.recommendCancel(map);
			
		}

		@Override
		public void addVote(Map<String, Object> map) {
			boardDAO.addVote(map);
		}

		@Override
		public void deleteVote(Map<String, Object> map) {
			boardDAO.deleteVote(map);
			
		}

		@Override
		public BoardDTO boardEditForm(int board_id) {
			return boardDAO.boardEditForm(board_id);
			
		}

		@Override
		public void boardEdit(BoardDTO boardDTO) {
			
			boardDAO.boardEdit(boardDTO);
		}

		@Override
		public void boardDelete(int board_id) {
			boardDAO.boardDelete(board_id);
		}

	
		
		//정수 : 끝 ############################################

		//유진 : 시작 ############################################
		@Override
		public void boardClassWrite(BoardClassDTO boardClassDTO) {
			String session_email = (String)session.getAttribute("memEmail");
			int board_uid = userDAO.getUserIdByEmailClass(session_email);
			System.out.println("\n@ session_eamil = " + session_email);
			//풍혁220708 : userDAO에 user_id 받아오는 method와 query 생성해서 boardDTO에 집어넣고 글 생성할 때 반영
			boardClassDTO.setBoard_uid(board_uid);
			boardDAO.boardClassWrite(boardClassDTO);
			
		}

		@Override
		public String getUserClassWriteTablelist(int pg, String sortOption, int class_id) {
			StringBuffer sb = new StringBuffer();
			//페이징 처리하려면 다 받아오면 안되잖아. 몇개씩 표시할지 start랑 end정해줘야 되잖아. 
			
			//최신순으로 정렬할 때, startNum이랑 endNum map에 담아서 보내주기 
			int boardPerPage = 10;
			int startNum = 1 + boardPerPage*(pg-1);
			int endNum = boardPerPage + boardPerPage*(pg-1);
			
			
			  // 세션값이 있다면 = 로그인을 했다면!
			session.setAttribute("board_view_cnt", "0"); // 조회수에 0을 넣어라! (= 값이 존재하게 만들어주자!)
			
			
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("startNum", startNum);
			map.put("endNum", endNum);
			
			List<BoardClassDTO> list = boardDAO.getBoardClassRangeOrder(map, sortOption,class_id);
 
			System.out.println("\n @ boardClassTalbeList size : " + list.size());
			System.out.println("\n @ getBoardClassRange parameter : " + class_id+ pg + map.get("startNum") + map.get("endNum"));
			sb.append("<ul class=\"list-group \">");
			for(BoardClassDTO dto : list) {
				sb.append(boardClassDtoToTrTag(class_id, dto, sortOption));
			}
			sb.append("</ul>");
			return sb.toString(); 
		}

		private Object boardClassDtoToTrTag(int class_id, BoardClassDTO boardClassDTO, String sortOption) {
			int board_uid = boardClassDTO.getBoard_uid();
			String author = userDAO.getUserNameByUserIdClass(board_uid);
			
			StringBuffer tr = new StringBuffer();
			
			//풍혁(220703) : DTO의 Date field를 String으로 변경 시작 
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = boardClassDTO.getBoard_date_created();
			System.out.println("\n date : " + date);
			String dateToStr = dateFormat.format(date);
			//풍혁(220703) : DTO의 Date field를 String으로 변경 마무리
			 
			//풍혁(220705) : comment의 개수에 따라 li의 클래스가 달라지는 것을 구분하기 위해서..
			int noteNum = boardClassDTO.getBoard_cmt_cnt();
			String hasNoteClass = null;
			if(noteNum > 0 ) {
				hasNoteClass = "list-group-has-note";
			}else {
				hasNoteClass = "list-group-no-note";
			}
			//풍혁(220705) : comment의 개수에 따라 li의 클래스가 달라지는 것을 구분하기 위해서..
			
			tr.append("<li class='list-group-item list-group-item-question clearfix " + hasNoteClass + "'>");
				tr.append("<div class='list-title-wrapper clearfix'>");
					tr.append("<div class='list-tag clearfix'>");
						//풍혁220709 : 게시판 아이콘 반영 안되고있음
						tr.append("<span class='list-group-item-text article-id'>"+ boardClassDTO.getBoard_id()+"</span>");
						tr.append("<a='/semiproject/board/boardClassList?pg=1&class_id=${sessionScope.memClassid }' class='list-group-item-text item-tag label label-info'>"+ boardClassDTO.getBoard_classid()+"</a>"); 
					tr.append("</div>");
				
					tr.append("<h5 class='list-group-item-heading list-group-item-evaluate'>");
						//풍혁 (220707) : pg는 그냥 1로만 넣어놓았으니 나중에 pg 넘길방법 생각해야됨 input hidden만들어서 넘기자 
 						tr.append("<a href='/semiproject/board/getBoardView?board_id="+boardClassDTO.getBoard_id()+"&pg=1&class_id=${sessionScope.memClassid }'>");
							tr.append(boardClassDTO.getBoard_title());
						tr.append("</a>");
					tr.append("</h5>");
				tr.append("</div>");
			
				tr.append("<div class='list-summary-wrapper clearfix'>");
					tr.append("<div class='list-group-item-summary clearfix'>");
						tr.append("<ul>");
							tr.append("<li class=''>");
								tr.append("<i class='item-icon fa fa-comment '></i>");
								tr.append(boardClassDTO.getBoard_cmt_cnt());
							tr.append("</li'>");
							
							tr.append("<li class=''>");
								tr.append("<i class='item-icon fa fa-thumbs-up '></i>");
								tr.append(boardClassDTO.getBoard_vote_cnt());
							tr.append("</li'>");
							
							tr.append("<li class=''>");
								tr.append("<i class='item-icon fa fa-eye '></i>");
								tr.append(boardClassDTO.getBoard_view_cnt());
							tr.append("</li'>");
							
						tr.append("</ul>");
					tr.append("</div>");
				tr.append("</div>");
				
				
				tr.append("<div class=\"list-group-item-author clearfix\">");
					tr.append("<div class='avatar clearfix avatar-list '>");
						//풍혁(220707) : user click 했을 경우 user의 최근활동을 볼 수 있는 페이지로 이동 : 옵션으로
						String userProfileImg = userDAO.getUserClassImgByUserid(boardClassDTO.getBoard_uid());
						tr.append("<a href='/semiproject/user/userPage?user_id="+boardClassDTO.getBoard_uid()+"' class='avatar-photo'><img src='/semiproject/storage/userprofile/"+userProfileImg+"'></a>");
						tr.append("<div class='avatar-info'>");
							tr.append("<a class='nickname' href='#' title='"+ author +"'>"+ author +"</a>");
							tr.append("<div class='activity'>");
								tr.append("<span class='fa fa-flash'></span>" + "lev");
							tr.append("</div>");
							tr.append("<div class='date-created'>");
								tr.append("<span class='timeago' title='"+dateToStr+"'>"+ dateToStr +"</span>");
							tr.append("</div>");
						tr.append("</div>");
					tr.append("</div>");
				tr.append("</div>");
				
			tr.append("</li>");
		
			return tr.toString();
		}

		@Override
		public String getBoardClassPagingList(int pg, String sortOption, int class_id) {
			BoardPaging boardPaging = new BoardPaging();
			boardPaging.setCurrentPage(pg);
			boardPaging.setPageBlock(10); //이전 다음 사이에 10개의 page
			boardPaging.setPageSize(10); //page 당 10개의 글 존재
			boardPaging.setTotalA(boardDAO.getTotalBoardNum());
			boardPaging.makePagingHTML(sortOption);
			
			return boardPaging.getPagingHTML().toString();
		}
	
}
