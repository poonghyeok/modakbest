package com.modak.comment.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modak.comment.bean.CommentDTO;

@Repository
public class CommentDAOMyBatis implements CommentDAO {

	@Autowired
	public SqlSession sqlSession;

	@Override
	public CommentDTO getCommentDTO(int cmt_bid) {
		return sqlSession.selectOne("CommentSQL.getCommentDTO",cmt_bid);
	}

	
	

}
