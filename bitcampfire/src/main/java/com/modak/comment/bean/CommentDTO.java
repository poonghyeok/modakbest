package com.modak.comment.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Component
@Getter
@Setter
//풍혁220711 : @DATA에서 게터세터로 변경했습니다.
public class CommentDTO {
	
	private int cmt_id;    			// 댓글 글번호 
	private int cmt_uid;            // 댓글 유저 아이디
	private int cmt_cateid;         // 댓글 카테 아이디
	private int cmt_bid;            // 댓글 원글번호 
	private String cmt_content; 	// 댓글 내용
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date cmt_date_created;	// 날짜
	//풍혁 220711 : int에서 Date로 자료형 수정했습니다.
}
