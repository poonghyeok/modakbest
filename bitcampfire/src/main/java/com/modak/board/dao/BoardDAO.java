package com.modak.board.dao;

import java.util.List;
import java.util.Map;

import com.modak.board.bean.BoardClassDTO;
import com.modak.board.bean.BoardDTO;
import com.modak.board.bean.BoardAllDTO;

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
		public BoardDTO getBoardContent(int board_id);
		
		public void setHit(int board_id);

		public int recommendCheck(Map<String, Object> map);

		public void increaseRecommend(Map<String, Object> map);

		public void recommendCancel(Map<String, Object> map);

		public void addVote(Map<String, Object> map);

		public void deleteVote(Map<String, Object> map);

		public BoardDTO boardEditForm(int board_id);

		public void boardEdit(BoardDTO boardDTO);

		public void boardDelete(int board_id);

		public List<BoardAllDTO> getBoardAllList();





		
		// 정수 : 끝  ###################### 


		// 기진 : 시작  ###################### 


		public List<BoardDTO> getUserPageArticle(Map<String, Object> map);


		// 기진 : 끝  ###################### 

    // 유진 시작
      public void boardClassWrite(BoardClassDTO boardClassDTO);

      public List<BoardClassDTO> getBoardClassRangeOrder(Map<String, Integer> map, String sortOption, int class_id);
      
      
    // 유진 끝
		
}
