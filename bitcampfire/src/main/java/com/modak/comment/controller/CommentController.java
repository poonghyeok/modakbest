package com.modak.comment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.modak.comment.bean.CommentDTO;
import com.modak.comment.service.CommentService;
import com.modak.user.service.UserService;

@Controller
@RequestMapping(value = "/comment")
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private UserService userService;
	
	
//정수 :  시작 ########################################
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
		
//정수 :  끝 ########################################
	
	
//풍혁 :  시작 =====================================
		@PostMapping(value = "/write")
		@ResponseBody
		public void write(@ModelAttribute CommentDTO commentDTO) {
			
			commentService.write(commentDTO);
			
			Map<String, Integer> map = new HashMap<>();
			map.put("board_id",commentDTO.getCmt_bid());
			map.put("cateid",commentDTO.getCmt_cateid());
			
			commentService.increaseCommentCount(map);
			
			return ;
		}
		
		@PostMapping(value = "/getCommentListByBoardId")
		@ResponseBody
		public List<CommentDTO> getCommentListByBoardId(@RequestParam int cmt_bid) {
			
			List<CommentDTO> list = commentService.getCommentListByBoardId(cmt_bid);
			
			return list;
		}

		//풍혁0709 : comment_uid로 부터 nickname 을 받아오기 
		@PostMapping(value = "/getNicknameByUserId", produces = "application/text; charset=UTF-8")
		@ResponseBody
		public String getNicknameByUserId(@RequestParam int user_id) {
			String user_nickname = userService.getUserNameByUserId(user_id); 
			System.out.println("\n @LOG@ comment..controller.. getNicknameByUserId .. parameter : " + user_id + "result : " + user_nickname);
			
			return user_nickname;
		}
		
		@PostMapping(value = "/getCommentContentById", produces = "application/text; charset=UTF-8")
		@ResponseBody
		public String getCommentContentById(@RequestParam int cmt_id) {
			
			return commentService.getCommentContentById(cmt_id);
		}
		
		@PostMapping(value = "/update")
		@ResponseBody
		public void update(@RequestParam int cmt_id, @RequestParam String cmt_content) {
			
			System.out.println("\n @LOG@ comment...update : " + cmt_id + " cmt_ content : "+ cmt_content);
			commentService.update(cmt_id, cmt_content);
			
			return ;
		}
		
//		@PostMapping(value = "/delete")
//		@ResponseBody
//		public void delete(@RequestParam int cmt_id, @RequestParam int cmt_bid) {
//			
//			System.out.println("\n @LOG@ comment...delete : " + cmt_id + cmt_bid);
//			
//			commentService.delete(cmt_id);
//			commentService.decreaseCommentCount(cmt_bid);
//			
//			return ;
//		}
//		
		@PostMapping(value = "/delete")
		@ResponseBody
		public void delete(@ModelAttribute CommentDTO commentDTO) {
			Map<String, Integer> map = new HashMap<>();
			map.put("board_id",commentDTO.getCmt_bid());
			map.put("cateid",commentDTO.getCmt_cateid());
			
			commentService.delete(commentDTO.getCmt_bid());
			commentService.decreaseCommentCount(map);
			
			return ;
		}
		
		
	
		
//풍혁 :  끝 =====================================
	
	
	
	
	
}
