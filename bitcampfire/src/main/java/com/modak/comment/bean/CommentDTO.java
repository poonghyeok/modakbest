package com.modak.comment.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class CommentDTO {
	
	private int cmt_id;    			// 댓글 글번호 
	private int cmt_uid;            // 댓글 유저 아이디
	private int cmt_cateid;         // 댓글 카테 아이디
	private int cmt_bid;            // 댓글 원글번호 
	private String cmt_content; 	// 댓글 내용
	private int cmt_date_created;	// 날짜
	
}
