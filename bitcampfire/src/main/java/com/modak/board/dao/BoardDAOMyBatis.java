package com.modak.board.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.modak.board.bean.BoardClassDTO;
import com.modak.board.bean.BoardDTO;
import com.modak.board.bean.BoardAllDTO;

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
		public List<BoardDTO> getBoardSearchRangeOrder(Map<String, String> map, String sortOption) {
			List<BoardDTO> list = new ArrayList<>();
			map.put("sortOption", sortOption);
			list = sqlSession.selectList("boardSQL.getBoardSearchRangeOrder", map);
			return list;
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
		
		@Override
		public List<BoardDTO> getBoardRangeOrder(Map<String, Integer> map, String sortOption) {
			Map<String, String> newMap = new HashMap<>();
			newMap.put("startNum", map.get("startNum").toString());
			newMap.put("endNum", map.get("endNum").toString());
			newMap.put("sortOption", sortOption);
			
			return sqlSession.selectList("boardSQL.getBoardRangeOrder", newMap);
		}
		
		@Override
		public void update(Map<String, String> map) {
			
			sqlSession.update("boardSQL.update", map);
		
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

			@Override
			public int recommendCheck(Map<String, Object> map) {
				return (int)sqlSession.selectOne("boardSQL.recommendCheck", map);
				
			}

			@Override
			public void increaseRecommend(Map<String, Object> map) {
				sqlSession.update("boardSQL.increaseRecommend", map);
				
			}

			@Override
			public void recommendCancel(Map<String, Object> map) {
				sqlSession.update("boardSQL.recommendCancel", map);
			}

			@Override
			public void addVote(Map<String, Object> map) {
				sqlSession.insert("boardSQL.addVote", map);
			}

			@Override
			public void deleteVote(Map<String, Object> map) {
				sqlSession.update("boardSQL.deleteVote", map);
				
			}

			@Override
			public BoardDTO boardEditForm(int board_id) {
				return sqlSession.selectOne("boardSQL.boardEditForm", board_id);
				// selectList 는 객체 여러개 받아올때
			}

			@Override
			public void boardEdit(BoardDTO boardDTO) {
				 sqlSession.insert("boardSQL.boardEdit",boardDTO);
				
			}

			@Override
			public void boardDelete(int board_id) {
				sqlSession.update("boardSQL.boardDelete", board_id);
				
			}
		
			
	// 정수 : 끝  ###################### 

				

			// 기진 : 시작  ###################### 
      @Override
        public List<BoardAllDTO> getBoardAllList() {
          return sqlSession.selectList("boardSQL.getBoardAllList");
			}
      
			@Override
			public List<BoardDTO> getUserPageArticle(Map<String, Object> map) {
				
				
				
				return sqlSession.selectList("boardSQL.getUserPageArticle", map);

			}

			// 기진 : 끝  ###################### 
      
      
      
      //유진 : 시작
      	@Override
			public void boardClassWrite(BoardClassDTO boardClassDTO) {
				System.out.print("Mybatis insert");
				sqlSession.insert("boardSQL.boardClassWrite",boardClassDTO);
				
			}

			@Override
			public List<BoardClassDTO> getBoardClassRangeOrder(Map<String, Integer> map, String sortOption,	int class_id) {
				Map<String, Object> newMap = new HashMap<>();
				newMap.put("startNum", map.get("startNum").toString());
				newMap.put("endNum", map.get("endNum").toString());
				newMap.put("sortOption", sortOption);
				newMap.put("class_id", class_id);
				
				return sqlSession.selectList("boardSQL.getBoardClassRangeOrder", newMap);		
      
      //유진 : 끝 
}
}
