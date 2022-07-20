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
import com.modak.board.bean.BoardClassPaging;
import com.modak.board.bean.BoardDTO;
import com.modak.board.bean.BoardPaging;
import com.modak.board.bean.BoardAllDTO;
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
	
	//공통 영역 : 끝 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	//풍혁 : 시작 ===========================================
		private int stringCateToInt(String category) {
			int result = -1;
			switch(category){
				case "info" : result = 1; break;
				case "review" : result = 2; break;
				case "qna" : result = 3; break;
				case "free" : result = 4; break;
			}
			
			return result;
		}
		private String cateidToString(int cateid) {
			String result = null;
			switch(cateid){
			case 1 : result = "info"; break;
			case 2 : result = "review"; break;
			case 3 : result = "qna"; break;
			case 4 : result = "free"; break;
			}
			
			return result;
		}
		
		@Override
		public String getUserWriteTablelist(String category, int pg, String sortOption) {
			//풍혁0718 : category에 따라 mapper에서 참조하는 table이 달리지므로 category에 맞게 번호를 만들어주겠습니다. 
			int cateid = stringCateToInt(category);
			
			
			StringBuffer sb = new StringBuffer();
			//페이징 처리하려면 다 받아오면 안되잖아. 몇개씩 표시할지 start랑 end정해줘야 되잖아. 
			
			//최신순으로 정렬할 때, startNum이랑 endNum map에 담아서 보내주기 
			int boardPerPage = 10;
			int startNum = 1 + boardPerPage*(pg-1);
			int endNum = boardPerPage + boardPerPage*(pg-1);
			
			
			
			  // 세션값이 있다면 = 로그인을 했다면!
			session.setAttribute("board_view_cnt", "0"); // 조회수에 0을 넣어라! (= 값이 존재하게 만들어주자!)
			
			
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("cateid", cateid);
			map.put("startNum", startNum);
			map.put("endNum", endNum);
			
			//풍혁0718 : cateid까지 넣어줬으니 DAOMyBatis 에서 이를 반영해 잘꺼내와보자. query에서 조건문을 사용할 것이다. 
			List<BoardDTO> list = boardDAO.getBoardRangeOrder(map, sortOption);
 
			sb.append("<ul class=\"list-group \">");
			for(BoardDTO dto : list) {
				sb.append(boardDtoToTrTag(dto, sortOption));
			}
			sb.append("</ul>");
			return sb.toString(); 
		}
		 	
		@Override
		public String getUserSearchWriteTablelist(String category, int pg, String keyword, String sortOption) {
			int cateid = stringCateToInt(category);
			
			StringBuffer sb = new StringBuffer();
			
			int boardPerPage = 10;
			int startNum = 1 + boardPerPage*(pg-1);
			int endNum = boardPerPage + boardPerPage*(pg-1); 
			
			
			//풍혁0718 : startnum 이랑 endnum은 integer라서 mam의 generic을 String, Integer로 해야하는 줄 알았는데, startNum을 String으로 만들어서 담아도 상관이 없습니다. 
			//마지막에 mapper에서 query 에서 #{}이 아니라 ${}로 꺼내면 되기 때문이죠. 
			Map<String, String> map = new HashMap<String, String>();
			map.put("cateid",Integer.toString(cateid));
			map.put("startNum", Integer.toString(startNum));
			map.put("endNum", Integer.toString(endNum));
			map.put("keyword", keyword);
			
			//풍혁0718 : sortOption은 왜 map에 안넣어줬는지는 모르겠지만 담았다가 에러뜨면 복잡해질거같아서 일다 하던대로 따로 담아서 보내보겠습니다. 
			List<BoardDTO> list = boardDAO.getBoardSearchRangeOrder(map, sortOption); 
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
 						tr.append("<a href='/semiproject/board/getBoardView?category="+cateidToString(boardDTO.getBoard_cateid())+"&board_id="+boardDTO.getBoard_id()+"&pg=1'>");
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
							tr.append("<a class='nickname' href='/semiproject/user/userPage?user_id="+boardDTO.getBoard_uid()+"' title='"+ author +"'>"+ author +"</a>");
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
		public String getBoardPagingList(String category, int pg, String sortOption) {
			BoardPaging boardPaging = new BoardPaging();
			int cateid = stringCateToInt(category);
			boardPaging.setCurrentPage(pg);
			boardPaging.setPageBlock(10); //이전 다음 사이에 10개의 page
			boardPaging.setPageSize(10); //page 당 10개의 글 존재
			boardPaging.setTotalA(boardDAO.getTotalBoardNum(cateid));
			boardPaging.makePagingHTML(category, sortOption);
			
			return boardPaging.getPagingHTML().toString();
		}
		
		@Override
		public String getBoardSearchPagingList(String category, int pg, String keyword, String sortOption) {
			BoardPaging boardPaging = new BoardPaging();
			boardPaging.setCurrentPage(pg);
			boardPaging.setPageBlock(10); //이전 다음 사이에 10개의 page
			boardPaging.setPageSize(10); //page 당 10개의 글 존재
			boardPaging.setTotalA(boardDAO.getTotalBoardSearchNum(keyword));
			boardPaging.makeSearchPagingHTML(category, keyword, sortOption);
			
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
		public List<BoardDTO> getBoardList(Map<String, Integer> map, String category) {
			
			return boardDAO.getBoardList(map, category);
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
		public BoardDTO getBoardContent(Map<String, Integer>map) { 
			
			BoardDTO boardDTO = boardDAO.getBoardContent(map); //글번호 가지고 dto 가지고와
			
			if (session.getAttribute("board_view_cnt")!=null) { // 로그인을 했다면 / board_view_cnt
				boardDAO.setHit(map); // 글번호에 조회수 증가하게 해
				session.removeAttribute("board_view_cnt"); // 조회수에 해당하는 세션에 있는 값을 삭제.
			}
			
		
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
		public BoardDTO boardEditForm(Map<String,Integer> map) {
			return boardDAO.boardEditForm(map);
			
		}

		@Override
		public void boardEdit(BoardDTO boardDTO) {
			
			boardDAO.boardEdit(boardDTO);
		}

		@Override
		public void boardDelete(Map<String,Integer> map) {
			boardDAO.boardDelete(map);
		}
		
		//정수 : 끝 ############################################

		
		//기진 : 시작 ############################################
		
    @Override
      public List<BoardAllDTO> getBoardAllList() {

			return boardDAO.getBoardAllList();
		}
	
		@Override
		public List<BoardDTO> getUserPageArticle(Map<String, Object> map) {
			
			
			return boardDAO.getUserPageArticle(map);
		}
		
		//기진 : 끝 ############################################

  
  	//유진 : 시작 ############################################
		@Override
		public void boardClassWrite(BoardClassDTO boardClassDTO) {
			String session_email = (String)session.getAttribute("memEmail");
			int board_uid = userDAO.getUserIdByEmail(session_email);
			System.out.println("\n@ session_eamil = " + session_email);
			//풍혁220708 : userDAO에 user_id 받아오는 method와 query 생성해서 boardDTO에 집어넣고 글 생성할 때 반영
			boardClassDTO.setBoard_uid(board_uid);
			boardDAO.boardClassWrite(boardClassDTO);
			
		}

		@Override
		public String getUserClassWriteTablelist(int pg, String sortOption, int class_id, String class_academy) {
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
				sb.append(boardClassDtoToTrTag(class_id, dto, sortOption, class_academy));
			}
			sb.append("</ul>");
			return sb.toString(); 
		}

		@Override
		public String getBoardClassPagingList(int pg, String sortOption, int class_id) {
			BoardClassPaging boardClassPaging = new BoardClassPaging();
			boardClassPaging.setCurrentPage(pg);
			boardClassPaging.setPageBlock(10); //이전 다음 사이에 10개의 page
			boardClassPaging.setPageSize(10); //page 당 10개의 글 존재
			boardClassPaging.setTotalA(boardDAO.getTotalBoardClassNum(class_id));
			boardClassPaging.makePagingHTML(sortOption, class_id);
			
			return boardClassPaging.getPagingHTML().toString();
		}

		@Override
		public String getUserClassSearchWriteTablelist(int pg, String keyword, String sortOption, int class_id, String class_academy) {
			StringBuffer sb = new StringBuffer();
			
			int boardPerPage = 10;
			int startNum = 1 + boardPerPage*(pg-1);
			int endNum = boardPerPage + boardPerPage*(pg-1); 
			
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("startNum", Integer.toString(startNum));
			map.put("endNum", Integer.toString(endNum));
			map.put("keyword", keyword);
			map.put("class_id", class_id);
			
			List<BoardClassDTO> list = boardDAO.getBoardClassSearchRangeOrder(map, sortOption); 
			sb.append("<ul class='list-group '>");
			for(BoardClassDTO dto : list) {
				sb.append(boardClassDtoToTrTag(class_id, dto, sortOption, class_academy));
			}
				
			sb.append("</ul>");
			
			
			return sb.toString();
		}

		@Override
		public String getBoardClassSearchPagingList(int pg, String keyword, String sortOption, int class_id) {
			BoardClassPaging boardClassPaging = new BoardClassPaging();
			boardClassPaging.setCurrentPage(pg);
			boardClassPaging.setPageBlock(10); //이전 다음 사이에 10개의 page
			boardClassPaging.setPageSize(10); //page 당 10개의 글 존재
			boardClassPaging.setTotalA(boardDAO.getTotalBoardClassSearchNum(keyword, class_id));
			boardClassPaging.makeSearchPagingHTML(keyword, sortOption, class_id);
			
			return boardClassPaging.getPagingHTML().toString();
		}
		
		private Object boardClassDtoToTrTag(int class_id, BoardClassDTO boardClassDTO, String sortOption, String class_academy) {
			int board_uid = boardClassDTO.getBoard_uid();
			String author = userDAO.getUserNameByUserId(board_uid);
			
			
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
						tr.append("<a='/semiproject/board/boardClassList?pg=1&class_id=${sessionScope.memClassid }' class='list-group-item-text item-tag label label-info'>"+ class_academy+"</a>"); 
					tr.append("</div>");
				
					tr.append("<h5 class='list-group-item-heading list-group-item-evaluate'>");
						//풍혁 (220707) : pg는 그냥 1로만 넣어놓았으니 나중에 pg 넘길방법 생각해야됨 input hidden만들어서 넘기자 
 						tr.append("<a href='/semiproject/board/getBoardClassView?board_id="+boardClassDTO.getBoard_id()+"&pg=1&class_id="+boardClassDTO.getBoard_classid()+"'>");
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
						String userProfileImg = userDAO.getUserImgByUserid(boardClassDTO.getBoard_uid());
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

		public BoardClassDTO getBoardClassContent(int board_id, int class_id) {
			if (session.getAttribute("board_view_cnt")!=null) { // 로그인을 했다면 / board_view_cnt
				boardDAO.setClassHit(board_id); // 글번호에 조회수 증가하게 해
				session.removeAttribute("board_view_cnt"); // 조회수에 해당하는 세션에 있는 값을 삭제.
			}
			
			BoardClassDTO boardClassDTO = boardDAO.getBoardClassContent(board_id, class_id); //글번호 가지고 dto 가지고와
			
			return boardClassDTO;
		}

		@Override
		public int boardClassRecommendCheck(Map<String, Object> map) {
			return boardDAO.boardClassRecommendCheck(map);
		}

		@Override
		public void boardClassincreaseRecommend(Map<String, Object> map) {
			boardDAO.boardClassincreaseRecommend(map);
			
		}

		@Override
		public void boardClassaddVote(Map<String, Object> map) {
			boardDAO.boardClassaddVote(map);
		}

		@Override
		public void boardClassdeleteVote(Map<String, Object> map) {
			boardDAO.boardClassdeleteVote(map);
			
		}

		@Override
		public void boardClassRecommendCancel(Map<String, Object> map) {
			boardDAO.boardClassRecommendCancel(map);

		public String getBoardClassPagingList(int pg, String sortOption, int class_id) {
			BoardPaging boardPaging = new BoardPaging();
			boardPaging.setCurrentPage(pg);
			boardPaging.setPageBlock(10); //이전 다음 사이에 10개의 page
			boardPaging.setPageSize(10); //page 당 10개의 글 존재
			
			//풍혁0719 : getTotalBoardNum String category parameter필요, 필요없는 메소드 오버로딩으로 생성해서 사용하면 될듯합니다. 
			boardPaging.setTotalA(boardDAO.getTotalBoardNum());
			boardPaging.makePagingHTML(sortOption);

			
		}


		
	// @@@@@@@@@ 연수 시작: admincontroller > 어드민 페이지 > 공지사항 관리  @@@@@@@@@ 	
		@Override
		public void adminBoardNoticeWrite(BoardDTO boardDTO) {
			String session_email = (String)session.getAttribute("memEmail");
			int board_uid = userDAO.getUserIdByEmail(session_email);
			
			boardDTO.setBoard_uid(board_uid);
			System.out.println(boardDTO);
			
			boardDAO.adminBoardNoticeWrite(boardDTO);
			
		}

		@Override
		public String getAdminNoticeTableList(String pg) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getAminNoticePagingList(String pg) {
			// TODO Auto-generated method stub
			return null;
		}
	// @@@@@@@@@ 연수 끝: admincontroller > 어드민 페이지 > 공지사항 관리  @@@@@@@@@ 	


		@Override
		public void boardClassDelete(int board_id) {
			boardDAO.boardClassDelete(board_id);
		}

		@Override
		public BoardClassDTO boardClassEditForm(int board_id) {
			return boardDAO.boardClassEditForm(board_id);
		}

		@Override
		public void boardClassUpdate(Map<String, String> map) {
			boardDAO.boardClassUpdate(map);
			return;
		}
		
		//유진 끝#######################################################


