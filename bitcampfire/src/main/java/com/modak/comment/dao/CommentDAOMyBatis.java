package com.modak.comment.dao;

import java.util.List;

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
//풍혁 끝: =================================

}