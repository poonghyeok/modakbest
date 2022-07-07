package com.modak.comment.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modak.comment.bean.CommentDTO;

@Repository
public class CommentDAOMyBatis implements CommentDAO {

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
}