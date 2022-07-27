package com.modak.board.service;

import java.util.List;
import java.util.Map;

import com.modak.board.bean.BoardDTO;
//import com.modak.board.bean.BoardAllDTO;

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

		// admin 
		public List<BoardDTO> reviewList();
		
		public List<BoardDTO> informList();
		
		public List<BoardDTO> qnaList();
		
		public List<BoardDTO> freeList();
		

		public List<BoardDTO> adminBoardSearch(Map<String, Object> map);
		
		public void adminBoardDelete(Map<String, Integer> map);
		
		public String getAdminAllListPages(int pg);

		
	// 정수 : 끝  ###################### 


		// 기진 " 시작 ##########################			
		 
//    public List<BoardAllDTO> getBoardAllList(); 
		public List<BoardDTO> getUserMyPageArticle(Map<String, Object> map);
		public List<BoardDTO> getUserPageArticle(Map<String, Object> map);

		// 기진 " 끝 ##########################			



	// 유진 : 시작 ##############################################
		public void boardClassWrite(BoardDTO boardDTO);

		public String getUserClassWriteTablelist(int pg, String sortOption, int class_id, String class_academy);

		public String getUserClassWriteTablelist(int pg, String sortOption, int class_id);

		public String getBoardClassPagingList(int pg, String sortOption, int class_id);



//		public String getUserClassSearchWriteTablelist(int pg, String keyword, String sortOption, int class_id);
	
		public String getUserClassSearchWriteTablelist(int pg, String keyword, String sortOption, int class_id, String class_academy);

		public String getBoardClassSearchPagingList(int pg, String keyword, String sortOption, int class_id);

		public BoardDTO getBoardClassContent(int board_id, int class_id);

		public int boardClassRecommendCheck(Map<String, Object> map);

		public void boardClassincreaseRecommend(Map<String, Object> map);

		public void boardClassaddVote(Map<String, Object> map);

		public void boardClassdeleteVote(Map<String, Object> map);

		public void boardClassRecommendCancel(Map<String, Object> map);

		public void boardClassDelete(int board_id);

		public BoardDTO boardClassEditForm(int board_id);

		public void boardClassUpdate(Map<String, String> map);

//유진 끝###################################################################33

		//@@@@@@@@@ 연수 시작: admincontroller > 어드민 페이지 > 공지사항 관리  @@@@@@@@@ 
		//@@@ 공지사항 작성
		public void adminBoardNoticeWrite(BoardDTO boardDTO);
		
		//@@@ 공지사항 리스트 불러오기
		public String getAdminNoticeTableList(String category, int pg);
		//@@@ 공지사항 내용  불러오기
		public BoardDTO getAdminBoardNoticeContent(int board_id);
		//@@공지사항 리스트 - 선택삭제
		public void adminNoticeDelete_select(String[] check);
		//@@공지사항 리스트 개별 삭제 + 공지사항  뷰 > 글삭제
		public void adminNoticeDelete(int board_id);
		//@@글수정 데이터 가져오기
		public BoardDTO getAdminBoardNotice_edit(int board_id);
		//@@글수정 데이터 업데이트하기
		public void adminBoardNoticeUpdate(Map<String, String> map);
		//@@페이징 처리
		public String getAdminNoticePagingList(String category, int pg);
		//@@공지사항 리스트 - 서치
		public String getAdminNoticeSearchTableList(String category, int pg, String keyword, String searchOption);
		//@@페이징 처리 - 서치
		public String getAdminNoticeSearchPagingList(String category, int pg, String keyword, String searchOption);
		//@@게시판별 공지 띄우기
		public List<BoardDTO> getAdminBoardNoticeListOfficial(String category, int pg);

		

		


		
		// @@@@@@@@@ 연수 끝: admincontroller > 어드민 페이지 > 공지사항 관리  @@@@@@@@@ 
}
