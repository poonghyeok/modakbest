package com.modak.board.dao;

import java.util.List;
import java.util.Map;

import com.modak.board.bean.BoardDTO;

public interface BoardDAO {
	//공통 영역 : 시작 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	//공통 영역 : 끝 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	//풍혁 : 시작 ====================================
		public List<BoardDTO> getUserWriteTableList();
	
		public List<BoardDTO> getBoardRangeOrderByTime(Map<String, Integer> map);
	
		public int getTotalBoardNum();
		
		public void boardWrite(BoardDTO boardDTO);

		public List<BoardDTO> getBoardSearchRangeOrderByTime(Map<String, String> map);

		public int getTotalBoardSearchNum(String keyword);
		
		public List<BoardDTO> getBoardReviewList(Map<String, Integer> map);

		public List<BoardDTO> getBoardRangeOrder(Map<String, Integer> map, String sortOption);

	//풍혁 : 끝 ====================================
	
	// 정수 : 시작  ###################### 
		// 목록에서 글 가져오기
		public BoardDTO getBoardContent(int board_id);
		
		public void setHit(int board_id);

		public int recommendCheck(Map<String, Object> map);

		public void increaseRecommend(Map<String, Object> map);

		public void recommendCancel(Map<String, Object> map);

		public void addVote(Map<String, Object> map);

		public void deleteVote(Map<String, Object> map);

		public BoardDTO boardEditForm(int board_id);


		

	// 정수 : 끝  ###################### 





		
}
