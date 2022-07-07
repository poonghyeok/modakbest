package com.modak.comment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modak.comment.bean.CommentDTO;
import com.modak.comment.dao.CommentDAO;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	public CommentDAO commentDAO; // db로 갈거니까 생성해주고

	//댓글 쓰기
	@Override
	public void writeCommentContent(CommentDTO commentDTO) { // dto 타입 가지고write 하러가(저장만 해 )
		commentDAO.writeCommentContent(commentDTO);
	}
	
	// 전체 댓글 가져오기
	@Override
	public List<CommentDTO> getCommentContent(int cmt_bid) {
		List<CommentDTO> list = commentDAO.getCommentContent(cmt_bid);
		return list;
	}
}
