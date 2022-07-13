package com.modak.board.service;

import java.util.List;
import java.util.Map;

import com.modak.board.bean.BoardDTO;

public interface BoardService {
	
	//공통 영역: 시작 =================================
	//공통 영역: 끝 =================================

	//풍혁 : 시작 =================================
		public String getUserWriteTablelist(int pg, String sortOption);
		
		public String getUserSearchWriteTablelist(int pg, String keyword);
		
		public String getBoardPagingList(int pg);
		
		public void boardWrite(BoardDTO boardDTO);
		
		public String getBoardSearchPagingList(int pg, String keyword);
		
//		public String getHomeBoardList(int boardNum);
		
		public String getUserNameByUserId(int board_uid);
	//풍혁 : 끝 =================================

	
	// 정수 : 시작  ###################### 
		// 글번호로 (글번호, DTO) 가져오기
		public BoardDTO getBoardContent(int board_id);
		
		public List<BoardDTO> getBoardReviewList(Map<String,Integer> map);

		public int recommendCheck(Map<String, Object> map);

		public void increaseRecommend(Map<String, Object> map);

		public void recommendCancel(Map<String, Object> map);
		
	// 정수 : 끝  ###################### 

		
		
					


}
