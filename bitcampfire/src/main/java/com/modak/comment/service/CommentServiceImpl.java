package com.modak.comment.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modak.comment.bean.CommentDTO;
import com.modak.comment.dao.CommentDAO;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	public CommentDAO commentDAO; // db로 갈거니까 생성해주고
	
	
//정수 시작 : #################################
	// 전체 댓글 가져오기
	@Override
	public List<CommentDTO> getCommentContent(int cmt_bid) {
		List<CommentDTO> list = commentDAO.getCommentContent(cmt_bid);
		return list;
	}
	//댓글 쓰기
	@Override
	public void writeCommentContent(CommentDTO commentDTO) {
		commentDAO.writeCommentContent(commentDTO);
		
	}
//정수 끝: #################################
	
	
//풍혁 시작 : =================================
	@Override
	public void write(CommentDTO commentDTO) {
		commentDAO.write(commentDTO);
	}
	
	@Override
	public List<CommentDTO> getCommentListByBoardId(int cmt_bid) {
		
		return commentDAO.getCommentListByBoardId(cmt_bid);
	}
	
	//풍혁0715 : increase decrease 가 여기가 아니라 board쪽에 있어야하는데... 일단..
	@Override
	public void increaseCommentCount(Map<String, Integer> map) {
		commentDAO.increaseCommentCount(map);
	}
	
	@Override
	public void decreaseCommentCount(Map<String, Integer> map) {
		commentDAO.decreaseCommentCount(map);
	}
	//
	
	@Override
	public String getCommentContentById(int cmt_id) {
		
		return commentDAO.getCommentContentById(cmt_id);
	}
	
	@Override
	public void update(int cmt_id, String cmt_content) {
		
		commentDAO.update(cmt_id,cmt_content);
		
		return ;
	}
	
	@Override
	public void delete(int cmt_id) {
		
		commentDAO.delete(cmt_id);
		
		return;
	}
//풍혁 끝: =================================

//유진시작#################################################
	@Override
	public void commentClassWrite(CommentDTO commentDTO) {
		commentDAO.commentClassWrite(commentDTO);
	}
	@Override
	public List<CommentDTO> getClassCommentListByBoardId(int cmt_bid) {
		return commentDAO.getClassCommentListByBoardId(cmt_bid);
	}
	@Override
	public String getClassCommentContentById(int cmt_id) {
		return commentDAO.getClassCommentContentById(cmt_id);
	}
	@Override
	public void commentClassUpdate(int cmt_id, String cmt_content) {
		commentDAO.commentClassUpdate(cmt_id,cmt_content);
		
	}
	@Override
	public void commentClassDelete(int cmt_id) {
		commentDAO.commentClassDelete(cmt_id);
		
	}
//유진끝#################################################

}
