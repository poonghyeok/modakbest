package com.modak.board.service;

<<<<<<< HEAD
import java.util.List;
=======
>>>>>>> e8a916304b5f365049e78de2f5158a08153f2c6e
import java.util.Map;

import com.modak.board.bean.BoardDTO;

public interface BoardService {
	
	//공통 영역: 시작 =================================
	//공통 영역: 끝 =================================

	//풍혁 : 시작 =================================
		public String getUserWriteTablelist(int pg);
		public String getUserSearchWriteTablelist(int pg, String keyword);
		public String getBoardPagingList(int pg);
		public void boardWrite(BoardDTO boardDTO);
		public String getBoardSearchPagingList(int pg, String keyword);
		public String getHomeBoardList(int boardNum);
		public String getUserNameByUserId(int board_uid);
	//풍혁 : 끝 =================================

	
	// 정수 : 시작  ###################### 
		// 글번호로 (글번호, DTO) 가져오기
		public BoardDTO getBoardContent(int board_id);
		
	// 정수 : 끝  ###################### 

		public String getUserNameByUserId(int board_id);
		public List<BoardDTO> getBoardReviewList(Map<String,Integer> map);
		
					


}
