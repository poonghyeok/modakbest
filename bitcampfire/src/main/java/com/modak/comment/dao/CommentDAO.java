package com.modak.comment.dao;

import java.util.List;
import java.util.Map;

import com.modak.comment.bean.CommentDTO;

public interface CommentDAO {

//정수 시작 : #################################
	// 댓글쓰기
	public void writeCommentContent(CommentDTO commentDTO);

	// 전체 댓글 가져오기
	public List<CommentDTO> getCommentContent(int cmt_bid);


//정수 끝: #################################
	
//풍혁 시작 : =================================
	
	public void write(CommentDTO commentDTO);

	public List<CommentDTO> getCommentListByBoardId(int cmt_bid);

	public void increaseCommentCount(Map<String, Integer> map);

	public String getCommentContentById(int cmt_id);

	public void update(int cmt_id, String cmt_content);

	public void delete(int cmt_id);


	public void decreaseCommentCount(Map<String, Integer> map);

//풍혁 끝: =================================
	
	
	public void commentClassWrite(CommentDTO commentDTO);

	public List<CommentDTO> getClassCommentListByBoardId(int cmt_bid);

	public String getClassCommentContentById(int cmt_id);

	public void commentClassUpdate(int cmt_id, String cmt_content);

	public void commentClassDelete(int cmt_id);
	
	
}
