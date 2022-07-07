package com.modak.comment.dao;

import java.util.List;

import com.modak.comment.bean.CommentDTO;

public interface CommentDAO {

	// 댓글쓰기
	public void writeCommentContent(CommentDTO commentDTO);

	// 전체 댓글 가져오기
	public List<CommentDTO> getCommentContent(int cmt_bid);
}