package com.modak.board.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		public String getUserWriteTablelist(int pg) {
			StringBuffer sb = new StringBuffer();
			//페이징 처리하려면 다 받아오면 안되잖아. 몇개씩 표시할지 start랑 end정해줘야 되잖아. 
			
			//최신순으로 정렬할 때, startNum이랑 endNum map에 담아서 보내주기 
			int boardPerPage = 10;
			int startNum = 1 + boardPerPage*(pg-1);
			int endNum = boardPerPage + boardPerPage*(pg-1);
			
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("startNum", startNum);
			map.put("endNum", endNum);
			
			List<BoardDTO> list = boardDAO.getBoardRangeOrderByTime(map); 
			System.out.println("\n @ boardTalbeList size : " + list.size());
			System.out.println("\n @ getBoardRange parameter : " + pg + map.get("startNum") + map.get("endNum"));
			sb.append("<ul class=\"list-group \">");
			for(BoardDTO dto : list) {
				sb.append(boardDtoToTrTag(dto));
			}
			sb.append("</ul>");
			return sb.toString(); 
		}
		
		@Override
		public String getUserSearchWriteTablelist(int pg, String keyword) {
			StringBuffer sb = new StringBuffer();
			
			int boardPerPage = 10;
			int startNum = 1 + boardPerPage*(pg-1);
			int endNum = boardPerPage + boardPerPage*(pg-1);
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("startNum", Integer.toString(startNum));
			map.put("endNum", Integer.toString(endNum));
			map.put("keyword", keyword);
			
			List<BoardDTO> list = boardDAO.getBoardSearchRangeOrderByTime(map); 
			System.out.println("\n @ boardTalbeList size : " + list.size());
			System.out.println("\n @ getBoardRange parameter : " + pg + map.get("startNum") + map.get("endNum"));
			sb.append("<ul class='list-group '>");
			for(BoardDTO dto : list) {
				sb.append(boardDtoToTrTag(dto));
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
		private String boardDtoToTrTag(BoardDTO boardDTO) {
			//풍혁220708 : user_name 받아오기 
			int board_uid = boardDTO.getBoard_uid();
			String author = userDAO.getUserNameByUserId(board_uid);
			
			StringBuffer tr = new StringBuffer();
			
			//풍혁(220703) : DTO의 Date field를 String으로 변경 시작 
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = boardDTO.getBoard_date_created();        
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
					
						tr.append("<span class='list-group-item-text article-id'>"+ boardDTO.getBoard_id()+"</span>");
						tr.append("<a 	='/semiproject/board/list?pg=1' class='list-group-item-text item-tag label label-info'><i class='fa fa-database'></i> 자유토론</a>"); 
					tr.append("</div>");
				
					tr.append("<h5 class='list-group-item-heading list-group-item-evaluate'>");
						//풍혁 (220707) : pg는 그냥 1로만 넣어놓았으니 나중에 pg 넘길방법 생각해야됨 input hidden만들어서 넘기자 
 						tr.append("<a href='/semiproject/board/getBoardView?board_id="+boardDTO.getBoard_id()+"&pg=1'>");
							tr.append(boardDTO.getBoard_title());
						tr.append("</a>");
					tr.append("</h5>");
				tr.append("</div>");
			
				tr.append("<div class='list-summary-wrapper clearfix'>");
					tr.append("<div class='item-evaluate-wrapper pull-right clearfix'>");
						tr.append("<div class='item-evaluate'>");
							tr.append("<div class='item-evaluate-icon'>");
								tr.append("<i class='item-icon fa fa-thumbs-o-up'>");
								
								tr.append("</i>");
							tr.append("</div>");
							
							tr.append("<div class='item-evaluate-icon'>");
								tr.append(boardDTO.getBoard_vote_cnt());
							tr.append("</div>");
						tr.append("</div>");
						
						tr.append("<div class='item-evaluate item-evaluate-has-note'>");
							tr.append("<div class='item-evaluate-icon'>");
								tr.append("<i class='item-icon fa fa-exclamation-circle'>");
								
								tr.append("</i>");
							tr.append("</div>");
							
							tr.append("<div class='item-evaluate-icon'>");
								tr.append(boardDTO.getBoard_cmt_cnt());
							tr.append("</div>");
						tr.append("</div>");
					tr.append("</div>");
				tr.append("</div>");
				
				tr.append("<div class=\"list-group-item-author clearfix\">");
					tr.append("<div class='avatar clearfix avatar-list '>");
						//풍혁(220707) : user click 했을 경우 user의 최근활동을 볼 수 있는 페이지로 이동 : 옵션으로
						tr.append("<a href='#' class='avatar-photo'><img src='//www.gravatar.com/avatar/e7d844c379aaafb37172977b206d129d?d=identicon&amp;s=30\'></a>");
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

			//풍혁(220705) : 처음 만들었던 테이블 
//				tr.append("<span id = 'tdSeq'>"+ boardDTO.getBoard_id()+"</span><span id = 'categoryTag'>"+boardDTO.cateidToString()+"</span> <br>");
//					tr.append("<span id = 'boardSubject'>"+boardDTO.getBoard_title()+"</span>");
//				tr.append("</td>");
//				
//				tr.append("<td id = 'td_recommend'>");
//					tr.append("<span id = 'boardRecommend'><img alt='thumbs_up.jpg' src='#'>"+ boardDTO.getBoard_vote_cnt() +"</span>");
//				tr.append("</td>");
//			
//				tr.append("<td id = 'td_state'>");
//					tr.append("<span id = 'boardState'>"+ boardDTO.getBoard_view_cnt()+"</span>");
//				tr.append("</td>");
//				
//				tr.append("<td id = 'td_author'>");
//					tr.append("<span id = 'boardAuthor'> <img alt='user_icon.jpg' src='#'>"+ boardDTO.getBoard_uid()+"<br><span id = 'boardLogdate'>"+ dateToStr +"</span> </span>");
//				tr.append("</td>");
//				
//			tr.append("</tr>");
			
			return tr.toString();
		}
		
		// 풍혁(220703) : list 하단에 pageList 입니다. container에 bean으로 올려서 받아쓰는 방법도 있으나 일단 객체생성 방식으로 사용해보겠습니다. 
		@Override
		public String getBoardPagingList(int pg) {
			BoardPaging boardPaging = new BoardPaging();
			boardPaging.setCurrentPage(pg);
			boardPaging.setPageBlock(10); //이전 다음 사이에 10개의 page
			boardPaging.setPageSize(10); //page 당 10개의 글 존재
			boardPaging.setTotalA(boardDAO.getTotalBoardNum());
			boardPaging.makePagingHTML();
			
			return boardPaging.getPagingHTML().toString();
		}
		
		@Override
		public String getBoardSearchPagingList(int pg, String keyword) {
			BoardPaging boardPaging = new BoardPaging();
			boardPaging.setCurrentPage(pg);
			boardPaging.setPageBlock(10); //이전 다음 사이에 10개의 page
			boardPaging.setPageSize(10); //page 당 10개의 글 존재
			boardPaging.setTotalA(boardDAO.getTotalBoardSearchNum(keyword));
			boardPaging.makePagingHTML();
			
			return null;
		}
		
		@Override
		public String getUserNameByUserId(int board_uid) {
			String user_name = userDAO.getUserNameByUserId(board_uid);
			
			return user_name;
		}
		
		//풍혁220708 : main board list 작업
		@Override
		public String getHomeBoardList(int boardNum) {
				
			StringBuffer indexBoardList = new StringBuffer();
			
			int startNum = 1;
			int endNum = boardNum;
			
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("startNum", startNum);
			map.put("endNum", endNum);
			
			List<BoardDTO> list = boardDAO.getBoardRangeOrderByTime(map);
			
			for(BoardDTO dto : list) {
				indexBoardList.append(makingIndexBoardList(dto));
			}
		
			
			return indexBoardList.toString();
		}
		
		//풍혁220706 : MAIN에 띄울 리스트들 
		private StringBuffer makingIndexBoardList(BoardDTO boardDTO) {
			StringBuffer sb = new StringBuffer();
			String user_name = userDAO.getUserNameByUserId(boardDTO.getBoard_uid());
			
			sb.append("<div class='panel panel-default'>");
				sb.append("<ul class='list-group'>");
					sb.append("<li class='list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix'>");
						sb.append("<div class='list-title-wrapper'>");
							sb.append("<h5 class='list-group-item-heading'>");
								sb.append("<a href='/semiproject/board/getBoardView?board_id="+boardDTO.getBoard_id()+"'>"+ boardDTO.getBoard_title() +"</a>");
								sb.append("<div class='list-group-item-author pull-right clearfix'>");
									sb.append("<div class='avatar clearfix avatar-x-small'>");
										sb.append("<a href='#' class='avatar-photo'><img src='//www.gravatar.com/avatar/9a316994cda85c56cd4f0c833ec511b6?d=identicon&amp;s=10'></a>");
										sb.append("<div class='avatar-info'>");
											sb.append("<a class='nickname' href='#' title=''>"+user_name+"</a>");
											sb.append("<div class='activity'>");
												sb.append("<span class='fa fa-flash'></span>2k");
												sb.append("<div class='date-created'>");
													sb.append("<span class='timeago' title=''>"+ boardDTO.getBoard_date_created() +"</span>");
												sb.append("</div>");
											sb.append("</div>");
										sb.append("</div>");
									sb.append("</div>");
							sb.append("</h5>");
						sb.append("</div>");
					sb.append("</li>");
				sb.append("</ul>");
			sb.append("</div>");
			
			return sb;
		}
		
		@Override
		public List<BoardDTO> getBoardReviewList(Map<String, Integer> map) {
			
			return boardDAO.getBoardReviewList(map);
		}
	
//풍혁 : 끝 =============================================
	
	
	//정수 : 시작 ############################################
		@Override
	public BoardDTO getBoardContent(int board_id) {
		System.out.println("getBoardContent 서비스실행 ");
		// ***********boardList에서 세션 잡아주는 곳이 있어야함************
		//세션 - 새로고침방지
//			if (session.getAttribute("board_view_cnt")!=null) { //조회수가 null이 아니라면 
//				boardDAO.setView_cnt(board_id); // 글번호에 조회수 설정
//				session.removeAttribute("board_view_cnt"); // 조회수에 해당하는 세션에 있는 값을 삭제.
//			}
		
		BoardDTO boardDTO = boardDAO.getBoardContent(board_id); //글번호를 통해서 getBoard
		System.out.println("ServiceImpl 에서 date 값 TEST =  " + boardDTO.getBoard_date_created());
		//String user_id = (String)session.getAttribute("user_id"); // 세션에 저장된 user_id를 가져온다.
		
//			Map<String, Object> map = new HashMap<String, Object>();
//			map.put("user_id", user_id);
//			map.put("boardDTO", boardDTO);
		
		return boardDTO;
		
		}
		
		
	//정수 : 끝 ############################################
	
	
	
}
