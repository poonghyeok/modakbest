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
@RequestMapping(value = "/commentView")
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	// 댓글쓰기
	@PostMapping(value = "/writeCommentContent")
	public ModelAndView writeCommentContent(@ModelAttribute CommentDTO commentDTO) { // uid, cateid, bid, content를 가지고 가야함
		ModelAndView mav = new ModelAndView(); 
		commentService.writeCommentContent(commentDTO);   // 댓글을 DB에 저장
		List<CommentDTO> commentList = this.getCommentContent(commentDTO.getCmt_bid());  // 해당하는 글의 댓글 전부 가져오기  & 서비스 가서 dto를 전부 가지고와 -> 가지고온걸 DTO 리스트에 넣어
		mav.addObject(commentList); 
		mav.setViewName("board/boardView");
		return mav; 
	}
	
	// 댓글 가져오기
	@PostMapping(value = "/getCommentContent")
	@ResponseBody
	public List<CommentDTO> getCommentContent(@RequestParam int cmt_bid) {  // 댓글 원글번호를 이용해서 DTO가져오자
		
		return commentService.getCommentContent(cmt_bid);
				
	}
	
	
	
	
	
}
