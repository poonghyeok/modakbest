package com.modak.comment.service;

import java.util.List;

import com.modak.comment.bean.CommentDTO;

public interface CommentService {

	public void writeCommentContent(CommentDTO commentDTO);

	public List<CommentDTO> getCommentContent(String cmt_bid);

}
