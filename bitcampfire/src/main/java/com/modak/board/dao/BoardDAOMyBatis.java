package com.modak.board.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.modak.board.bean.BoardDTO;

@Transactional
@Repository
public class BoardDAOMyBatis implements BoardDAO {
	//공통 : 시작 ====================================
		@Autowired
		private SqlSession sqlSession;
	//공통 : 끝 ====================================
	
	//풍혁 : 시작 ====================================
		@Override
		public List<BoardDTO> getUserWriteTableList() {
			System.out.println("\nBoardDaoImpl.. getUserWriteTableList().. ");
			
			return sqlSession.selectList("boardSQL.getBoardUserWriteList");
		}
	
		@Override
		public List<BoardDTO> getBoardRangeOrderByTime(Map<String, Integer> map) {
			System.out.println("\nBoardDaoImpl.. getBoardRangeOrderByTime().. ");
	
			return sqlSession.selectList("boardSQL.getBoardRangeOrderByTime", map);
		}
		
		@Override
		public int getTotalBoardNum() {
			
			return sqlSession.selectOne("boardSQL.getTotalBoardNum");
		}
		
		@Override
		public void boardWrite(BoardDTO boardDTO) {
			System.out.print("Mybatis insert");
			sqlSession.insert("boardSQL.boardWrite",boardDTO);
		}
		
		@Override
		public List<BoardDTO> getBoardSearchRangeOrderByTime(Map<String, String> map) {
			List<BoardDTO> list = new ArrayList<>();
			list = sqlSession.selectList("boardSQL.getBoardSearchRangeOrderByTime", map);
			System.out.println("\n @LOG@ myBatis getBoardSearchRangeOrderByTime ... 마지막 요소 제목 꺼내보기 : " + list.get(list.size()-1).getBoard_title());
			return sqlSession.selectList("boardSQL.getBoardSearchRangeOrderByTime", map);
		}
		
		@Override
		public int getTotalBoardSearchNum(String keyword) {
			System.out.print("@LOG@ : Mybatis getTotalBoardSearchNum.. ");
			return sqlSession.selectOne("boardSQL.getTotalBoardSearchNum",keyword);
		}
		
		@Override
		public List<BoardDTO> getBoardReviewList(Map<String, Integer> map) {
			
			return sqlSession.selectList("boardSQL.getBoardRangeOrderByTime", map);
		}
	//풍혁 : 끝 ====================================
	
	// 정수 : 시작  ###################### 
		// 글번호로 내용 가져오기
		@Override
		public BoardDTO getBoardContent(int board_id) {
			//System.out.println("getBoardContent 마이바티스 실행");
			return sqlSession.selectOne("boardSQL.getBoardContent", board_id);
//			
			//System.out.println("글 개수 카운트 : " + sqlSession.selectOne("boardSQL.getBoardCount"));
//			System.out.println("board_id 테스트 = " + board_id);
//			System.out.println("DTO 테스트 = " + boardDTO.getBoard_title());
//			System.out.println("마이바티스 날짜 테스트 = " + boardDTO.getBoard_date_created());
			
		}
			@Override
			public void setHit(int board_id) {
				
				sqlSession.update("boardSQL.setHit", board_id);
			
		}
	// 정수 : 끝  ###################### 

}
