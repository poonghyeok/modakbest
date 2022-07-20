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
//import com.modak.board.bean.BoardAllDTO;

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
//			System.out.println("\nBoardDaoImpl.. getUserWriteTableList().. ");
			
			return sqlSession.selectList("boardSQL.getBoardUserWriteList");
		}
		
//		@Override
//		public List<BoardDTO> getBoardRangeOrderByTime(Map<String, Integer> map) {
//			System.out.println("\nBoardDaoImpl.. getBoardRangeOrderByTime().. ");
//	
//			return sqlSession.selectList("boardSQL.getBoardRangeOrderByTime", map);
//		}
		
		@Override
		public int getTotalBoardNum(int cateid) {
			
			return sqlSession.selectOne("boardSQL.getTotalBoardNum", cateid);
		}
		
		@Override
		public void boardWrite(BoardDTO boardDTO) {
//			System.out.print("Mybatis insert");
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
//			System.out.print("@LOG@ : Mybatis getTotalBoardSearchNum.. ");
			return sqlSession.selectOne("boardSQL.getTotalBoardSearchNum",keyword);
		}
		
		@Override
		public List<BoardDTO> getBoardList(Map<String, Integer> map, String category) {
			
			//풍혁0719 : category에 맞게 index page에 list를 띄워야해서 String category가 들어왔고, 급하게 여기다가 새로운 map 생성
			Map<String, String> newMap = new HashMap<>();
			
			newMap.put("startNum", String.valueOf(map.get("startNum")));
			newMap.put("endNum", String.valueOf(map.get("endNum")));
			newMap.put("category", category);
			 
			return sqlSession.selectList("boardSQL.getBoardRangeOrderByTime", newMap);
		}
		
		@Override
		public List<BoardDTO> getBoardRangeOrder(Map<String, Integer> map, String sortOption) {
			//풍혁0718 : 굳이 여기서 다시 String, String으로 담을 필요없이 이전 단계부터 map을 String, String으로 만들어서 넘겨주면 된다. 이부분 수정할것
			
			Map<String, String> newMap = new HashMap<>();
			newMap.put("cateid", map.get("cateid").toString());
			
			System.out.println("\n @POONG LOG@ cateid : " + map.get("cateid").toString());
			
			newMap.put("startNum",Integer.toString(map.get("startNum")));
			newMap.put("endNum", Integer.toString(map.get("endNum")));
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
		public BoardDTO getBoardContent(Map<String, Integer>map) {
			//System.out.println("getBoardContent 마이바티스 실행");
			return sqlSession.selectOne("boardSQL.getBoardContent", map);
//			
			//System.out.println("글 개수 카운트 : " + sqlSession.selectOne("boardSQL.getBoardCount"));
//			System.out.println("board_id 테스트 = " + board_id);
//			System.out.println("DTO 테스트 = " + boardDTO.getBoard_title());
//			System.out.println("마이바티스 날짜 테스트 = " + boardDTO.getBoard_date_created());
			
		}
			@Override
			public void setHit(Map<String, Integer>map) {
				sqlSession.update("boardSQL.setHit", map);
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
			public BoardDTO boardEditForm(Map<String,Integer> map) {
				return sqlSession.selectOne("boardSQL.boardEditForm", map);
				// selectList 는 객체 여러개 받아올때
			}

			@Override
			public void boardEdit(BoardDTO boardDTO) {
				 sqlSession.insert("boardSQL.boardEdit",boardDTO);
				
			}

			@Override
			public void boardDelete(Map<String,Integer> map) {
				sqlSession.update("boardSQL.boardDelete", map);
				
			}
			
			//admin
			@Override
			public List<BoardDTO> informList() {
				return sqlSession.selectList("boardSQL.informList");
			}

			@Override
			public List<BoardDTO> reviewList() {
				return sqlSession.selectList("boardSQL.reviewList");
			}
			
			@Override
			public List<BoardDTO> qnaList() {
				return sqlSession.selectList("boardSQL.qnaList");
			}

			@Override
			public List<BoardDTO> freeList() {
				return sqlSession.selectList("boardSQL.freeList");
			}

	// 정수 : 끝  ###################### 

				

			// 기진 : 시작  ###################### 
			/*
			 * @Override public List<BoardAllDTO> getBoardAllList() { return
			 * sqlSession.selectList("boardSQL.getBoardAllList"); }
			 * 
			 * @Override public List<BoardDTO> getUserPageArticle(Map<String, Object> map) {
			 * 
			 * 
			 * 
			 * return sqlSession.selectList("boardSQL.getUserPageArticle", map);
			 * 
			 * }
			 */

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
			}

			@Override
			public int getTotalBoardClassNum(int class_id) {
				return sqlSession.selectOne("boardSQL.getTotalBoardClassNum", class_id);
			}

			@Override
			public List<BoardClassDTO> getBoardClassSearchRangeOrder(Map<String, Object> map, String sortOption) {
				List<BoardClassDTO> list = new ArrayList<>();
				map.put("sortOption", sortOption);
				list = sqlSession.selectList("boardSQL.getBoardClassSearchRangeOrder", map);
				return list;
			}

			@Override
			public int getTotalBoardClassSearchNum(String keyword, int class_id) {
				Map<String, Object> map = new HashMap<String,Object>();
				map.put("keyword", keyword);
				map.put("class_id", class_id);
				return sqlSession.selectOne("boardSQL.getTotalBoardClassSearchNum",map);
			}

			@Override
			public BoardClassDTO getBoardClassContent(int board_id, int class_id) {
				Map<String, Object> map = new HashMap<String,Object>();
				map.put("board_id", board_id);
				map.put("class_id", class_id);
				return sqlSession.selectOne("boardSQL.getBoardClassContent", map);
			}
			
			@Override
			public void setClassHit(int board_id) {
				sqlSession.update("boardSQL.setClassHit", board_id);
			}

			@Override
			public int boardClassRecommendCheck(Map<String, Object> map) {
				return (int)sqlSession.selectOne("boardSQL.boardClassRecommendCheck", map);
			}

			@Override
			public void boardClassincreaseRecommend(Map<String, Object> map) {
				sqlSession.update("boardSQL.boardClassincreaseRecommend", map);
				
			}

			@Override
			public void boardClassaddVote(Map<String, Object> map) {
				sqlSession.insert("boardSQL.boardClassaddVote", map);				
			}

			@Override
			public void boardClassdeleteVote(Map<String, Object> map) {
				sqlSession.update("boardSQL.boardClassdeleteVote", map);				
			}

			@Override
			public void boardClassRecommendCancel(Map<String, Object> map) {
				sqlSession.update("boardSQL.boardClassRecommendCancel", map);
				
			}

			@Override
			public void boardClassDelete(int board_id) {
				sqlSession.update("boardSQL.boardClassDelete", board_id);
			}

			@Override
			public BoardClassDTO boardClassEditForm(int board_id) {
				return sqlSession.selectOne("boardSQL.boardClassEditForm", board_id);
			}

			@Override
			public void boardClassUpdate(Map<String, String> map) {
				sqlSession.update("boardSQL.boardClassUpdate", map);
				
			}
	
			//유진 : 끝

	 // @@@@@@@@@ 연수 시작: admincontroller > 어드민 페이지 > 공지사항 관리  @@@@@@@@@ 		
			@Override
			public void adminBoardNoticeWrite(BoardDTO boardDTO) {
				sqlSession.insert("boardSQL.adminBoardNoticeWrite", boardDTO);
				
			}
	// @@@@@@@@@ 연수 끝: admincontroller > 어드민 페이지 > 공지사항 관리  @@@@@@@@@ 
}

