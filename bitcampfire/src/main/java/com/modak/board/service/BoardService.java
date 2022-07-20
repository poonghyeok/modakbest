package com.modak.board.service;

import java.util.List;
import java.util.Map;

import com.modak.board.bean.BoardClassDTO;
import com.modak.board.bean.BoardDTO;
import com.modak.board.bean.BoardAllDTO;

public interface BoardService {
	
	//공통 영역: 시작 =================================
	//공통 영역: 끝 =================================

	//풍혁 : 시작 =================================
		public String getUserWriteTablelist(String category,int pg, String sortOption);
		
		public String getUserSearchWriteTablelist(String category, int pg, String keyword, String sortOption);
		
		public String getBoardPagingList(String category ,int pg, String sortOption);
		
		public String getBoardSearchPagingList(String category, int pg, String keyword, String sortOption);
		
		public void boardWrite(BoardDTO boardDTO);
		
//		public String getHomeBoardList(int boardNum);
		
		public String getUserNameByUserId(int board_uid);

//		public String getBoardSortList(String sortOption);
	
		public void update(Map<String, String> map);
		
		public List<BoardDTO> getBoardList(Map<String,Integer> map, String category);
	//풍혁 : 끝 =================================

	
	// 정수 : 시작  ###################### 
		// 글번호로 (글번호, DTO) 가져오기
		public BoardDTO getBoardContent(Map<String, Integer>map);

		public int recommendCheck(Map<String, Object> map);

		public void increaseRecommend(Map<String, Object> map);

		public void recommendCancel(Map<String, Object> map);

		public void addVote(Map<String, Object> map);

		public void deleteVote(Map<String, Object> map);

		public BoardDTO boardEditForm(Map<String,Integer> map);

		public void boardEdit(BoardDTO boardDTO);

		public void boardDelete(Map<String,Integer> map);


		
	// 정수 : 끝  ###################### 


		// 기진 " 시작 ##########################			
		 
    public List<BoardAllDTO> getBoardAllList(); 
		public List<BoardDTO> getUserPageArticle(Map<String, Object> map);

		// 기진 " 끝 ##########################			



	// 유진 : 시작 ##############################################
		public void boardClassWrite(BoardClassDTO boardClassDTO);

		public String getUserClassWriteTablelist(int pg, String sortOption, int class_id, String class_academy);

		//		public String getUserClassWriteTablelist(int pg, String sortOption, int class_id);

		public String getBoardClassPagingList(int pg, String sortOption, int class_id);


//		public String getUserClassSearchWriteTablelist(int pg, String keyword, String sortOption, int class_id);
	
		public String getUserClassSearchWriteTablelist(int pg, String keyword, String sortOption, int class_id, String class_academy);

		public String getBoardClassSearchPagingList(int pg, String keyword, String sortOption, int class_id);

		public BoardClassDTO getBoardClassContent(int board_id, int class_id);

		public int boardClassRecommendCheck(Map<String, Object> map);

		public void boardClassincreaseRecommend(Map<String, Object> map);

		public void boardClassaddVote(Map<String, Object> map);

		public void boardClassdeleteVote(Map<String, Object> map);

		public void boardClassRecommendCancel(Map<String, Object> map);

		public void boardClassDelete(int board_id);

		public BoardClassDTO boardClassEditForm(int board_id);

		public void boardClassUpdate(Map<String, String> map);
//유진 끝###################################################################33

		
}

