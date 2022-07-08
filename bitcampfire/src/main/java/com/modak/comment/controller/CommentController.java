package com.modak.comment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.modak.comment.bean.CommentDTO;
import com.modak.comment.service.CommentService;

@Controller
@RequestMapping(value = "/comment")
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	// 댓글쓰기 
	@PostMapping(value = "/writeCommentContent") // 댓글을 쓰면 바로 ajax로 뿌려서 댓글을 보이는데, 댓글을 쓰면 원래 있던 댓글 그 다음번호에 뿌려주면 되지
	@ResponseBody   // ajax로 간다.
	public void writeCommentContent(@ModelAttribute CommentDTO commentDTO) { // dto를 가지고 write메소드가서 
		commentService.writeCommentContent(commentDTO); // dto들고 서비스가서 작성해 반환하는건 없어.
	}
	
	// 댓글 가져오기
	@PostMapping(value = "/getCommentContent")
	@ResponseBody
	public List<CommentDTO> getCommentContent(@RequestParam int cmt_bid) {  // 댓글 원글번호를 이용해서 DTO가져오자
		return commentService.getCommentContent(cmt_bid);
				
	}
	
	
	
	
	
}
