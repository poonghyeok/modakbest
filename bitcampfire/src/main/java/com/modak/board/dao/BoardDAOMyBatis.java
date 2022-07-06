package com.modak.board.dao;

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
	//풍혁 : 끝 ====================================
	
	// 정수 : 시작  ###################### 
		// 글번호로 내용 가져오기
		@Override
		public BoardDTO getBoardContent(int board_id) {
			System.out.println("getBoardContent 마이바티스 실행");
			BoardDTO boardDTO = sqlSession.selectOne("boardSQL.getBoardContent", board_id);
			System.out.println("글 개수 카운트 : " + sqlSession.selectOne("boardSQL.getBoardCount"));
			System.out.println("board_id 테스트 = " + board_id);
			System.out.println("DTO 테스트 = " + boardDTO.getBoard_title());
			System.out.println("마이바티스 날짜 테스트 = " + boardDTO.getBoard_date_created());
			return boardDTO;
			//return sqlSession.selectOne("boardSQL.getBoardContent", board_id);
			
		}
	// 정수 : 끝  ###################### 
					
					
	

}
