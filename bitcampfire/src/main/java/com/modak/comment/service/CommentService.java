package com.modak.comment.service;

import java.util.List;

import com.modak.comment.bean.CommentDTO;

public interface CommentService {

//정수 시작 : #################################
	public void writeCommentContent(CommentDTO commentDTO);

	public List<CommentDTO> getCommentContent(int cmt_bid);
//정수 끝: #################################
	
//풍혁 시작 : =================================
	public void write(CommentDTO commentDTO);
	public List<CommentDTO> getCommentListByBoardId(int cmt_bid);
	public void increaseCommentCount(int cmt_bid);
	public void decreaseCommentCount(int cmt_bid);
	public String getCommentContentById(int cmt_id);
	public void update(int cmt_id, String cmt_content);
	public void delete(int cmt_id);
//풍혁 끝: =================================



	
}
