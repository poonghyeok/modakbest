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
	//풍혁 : 끝 ====================================
	

	
	// 정수 : 시작  ###################### 
	
	// 정수 : 끝  ###################### 
					
					

}
