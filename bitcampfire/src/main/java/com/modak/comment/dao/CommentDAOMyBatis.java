package com.modak.comment.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modak.comment.bean.CommentDTO;

@Repository
public class CommentDAOMyBatis implements CommentDAO {

	
//정수 시작 : #################################
	@Autowired
	public SqlSession sqlSession;

	// 댓글 쓰기
	@Override
	public void writeCommentContent(CommentDTO commentDTO) {
		 sqlSession.selectOne("commentSQL.writeCommentContent", commentDTO);
	}

	// 전체 댓글 가져오기
	@Override
	public List<CommentDTO> getCommentContent(int cmt_bid) {
		return sqlSession.selectOne("commentSQL.getCommentDTO",cmt_bid);
	}

//정수 끝: #################################
	
//풍혁 시작 : =================================
	@Override
	public void write(CommentDTO commentDTO) {
		sqlSession.insert("commentSQL.write", commentDTO);
		
		return;
	}
	
	@Override
	public List<CommentDTO> getCommentListByBoardId(int cmt_bid) {
		
		return sqlSession.selectList("commentSQL.getCommentListByBoardId", cmt_bid);
	}
	
	@Override
	public void increaseCommentCount(int cmt_bid) {
		
		sqlSession.update("commentSQL.increaseCommentCount",cmt_bid);
	}
	
	@Override
	public void decreaseCommentCount(int cmt_bid) {
		// 
		sqlSession.update("commentSQL.decreaseCommentCount",cmt_bid);
	}
	
	@Override
	public String getCommentContentById(int cmt_id) {
		
		return sqlSession.selectOne("commentSQL.getCommentContentById", cmt_id);
	}
	
	@Override
	public void update(int cmt_id, String cmt_content) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("cmt_id",cmt_id);
		map.put("cmt_content",cmt_content);
		
		sqlSession.update("commentSQL.update", map);
		
		return;
	}
	
	@Override
	public void delete(int cmt_id) {
		sqlSession.delete("commentSQL.delete", cmt_id);
		
		return;
	}
//풍혁 끝: =================================

//유진시작##############################################################
	@Override
	public void commentClassWrite(CommentDTO commentDTO) {
		sqlSession.insert("commentSQL.commentClassWrite", commentDTO);
	}

	@Override
	public List<CommentDTO> getClassCommentListByBoardId(int cmt_bid) {
		return sqlSession.selectList("commentSQL.getClassCommentListByBoardId", cmt_bid);
	}

	@Override
	public String getClassCommentContentById(int cmt_id) {
		return sqlSession.selectOne("commentSQL.getClassCommentContentById", cmt_id);
	}

	@Override
	public void commentClassUpdate(int cmt_id, String cmt_content) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("cmt_id",cmt_id);
		map.put("cmt_content",cmt_content);
		
		sqlSession.update("commentSQL.commentClassUpdate", map);
		
		return;
		
	}

	@Override
	public void commentClassDelete(int cmt_id) {
		sqlSession.delete("commentSQL.commentClassDelete", cmt_id);
		
	}
	//유진끝##############################################################
	
	
	
	
	

}