package com.modak.comment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modak.comment.bean.CommentDTO;
import com.modak.comment.dao.CommentDAO;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	public CommentDAO commentDAO; // db로 갈거니까 생성해주고

	@Override
	public CommentDTO getCommentDTO(int cmt_bid) {
		CommentDTO commentDTO = commentDAO.getCommentDTO(cmt_bid);
		return commentDTO;
	}
	
	

}
