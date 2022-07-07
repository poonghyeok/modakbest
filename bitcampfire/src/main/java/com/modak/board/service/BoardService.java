package com.modak.board.service;

import com.modak.board.bean.BoardDTO;

public interface BoardService {
	
	//공통 영역: 시작 =================================
	//공통 영역: 끝 =================================

	//풍혁 : 시작 =================================
		public String getUserWriteTablelist(int pg);
		public String getUserWriteTablelist(int pg, String keyword);
		public String getBoardPagingList(int pg);
		public void boardWrite(BoardDTO boardDTO);
	//풍혁 : 끝 =================================

	
	// 정수 : 시작  ###################### 
		// 글번호로 (글번호, DTO) 가져오기
		public BoardDTO getBoardContent(int board_id);
	// 정수 : 끝  ###################### 
		
					


}
