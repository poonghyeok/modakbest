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
	//풍혁 : 끝 ====================================
	
	// 정수 : 시작  ###################### 
	
	// 정수 : 끝  ###################### 
					
					
	

}
