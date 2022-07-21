package com.modak.board.dao;

import java.util.List;
import java.util.Map;

import com.modak.board.bean.BoardDTO;
//import com.modak.board.bean.BoardAllDTO;
import com.modak.user.bean.UserAllDTO;

public interface BoardDAO {
	//공통 영역 : 시작 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	//공통 영역 : 끝 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	//풍혁 : 시작 ====================================
		public List<BoardDTO> getUserWriteTableList();
	
//		public List<BoardDTO> getBoardRangeOrderByTime(Map<String, Integer> map);
	
		public int getTotalBoardNum(int cateid);
		
		public void boardWrite(BoardDTO boardDTO);

		public List<BoardDTO> getBoardSearchRangeOrder(Map<String, String> map, String sortOption);

		public int getTotalBoardSearchNum(String keyword);
		
		public List<BoardDTO> getBoardList(Map<String, Integer> map, String category);

		public List<BoardDTO> getBoardRangeOrder(Map<String, Integer> map, String sortOption);

		public void update(Map<String, String> map);

	//풍혁 : 끝 ====================================
	
	// 정수 : 시작  ###################### 
		// 목록에서 글 가져오기
		//풍혁0719 : category 반영해야해서 int board_id 에서 map으로 변경
		
		public BoardDTO getBoardContent(Map<String, Integer>map);
		
		public void setHit(Map<String, Integer>map);

		public int recommendCheck(Map<String, Object> map);

		public void increaseRecommend(Map<String, Object> map);

		public void recommendCancel(Map<String, Object> map);

		public void addVote(Map<String, Object> map);

		public void deleteVote(Map<String, Object> map);

		public BoardDTO boardEditForm(Map<String,Integer> map);

		public void boardEdit(BoardDTO boardDTO);

		public void boardDelete(Map<String,Integer> map);

		// admin 
		
		public List<BoardDTO> reviewList();
		
		public List<BoardDTO> informList();
		
		public List<BoardDTO> qnaList();

		public List<BoardDTO> freeList();

		// 정수 : 끝  ###################### 


		// 기진 : 시작  ###################### 
//		public List<BoardAllDTO> getBoardAllList();
//
		public List<BoardDTO> getUserPageArticle(Map<String, Object> map);


		// 기진 : 끝  ###################### 

    // 유진 시작
		public void boardClassWrite(BoardDTO boardDTO);
    
      	public List<BoardDTO> getBoardClassRangeOrder(Map<String, Integer> map, String sortOption, int class_id);
      
      	public int getTotalBoardClassNum(int class_id);

      	public List<BoardDTO> getBoardClassSearchRangeOrder(Map<String, Object> map, String sortOption);	
      
      	public int getTotalBoardClassSearchNum(String keyword, int class_id);

		public void setClassHit(int board_id);

		public BoardDTO getBoardClassContent(int board_id, int class_id);

		public int boardClassRecommendCheck(Map<String, Object> map);

		public void boardClassincreaseRecommend(Map<String, Object> map);

		public void boardClassaddVote(Map<String, Object> map);

		public void boardClassdeleteVote(Map<String, Object> map);

		public void boardClassRecommendCancel(Map<String, Object> map);

		public void boardClassDelete(int board_id);

		public BoardDTO boardClassEditForm(int board_id);

		public void boardClassUpdate(Map<String, String> map);
	

	// 유진 끝


	//<!--@@@@ 연수 살려주세요!(220721)  -->
	// @@@@@@@@@ 연수 시작: admincontroller > 어드민 페이지 > 공지사항 관리  @@@@@@@@@ 	
		//@@@ 어드민 페이지 > notice 글작성
		public void adminBoardNoticeWrite(BoardDTO boardDTO);
		//@@@ 어드민 페이지 > notice 리스트 가져오기
		public List<BoardDTO> getBoardNoticeAllList(Map<String, Integer> map);
		//@@@ 어드민 페이지 > notice 글내용 가져오기
		public BoardDTO getAdminBoardNoticeContent(int board_id);
		//@@@ 어드민 페이지 > notice 조회수 가져오기
		public void setAdminBoardNoticeHit(int board_id);
		// @@@@@@@@@ 연수 끝: admincontroller > 어드민 페이지 > 공지사항 관리  @@@@@@@@@ 
	//<!--@@@@ 연수 살려주세요!(220721)  -->

		public void adminNoticeDelete_select(Map<String, String[]> map);

		
}
