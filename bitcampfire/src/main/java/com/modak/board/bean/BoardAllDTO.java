package com.modak.board.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class BoardAllDTO {
	
	//board 테이블
	private int board_id;           
	private int board_uid;           
	private int board_cateid;       
	private String board_title; 
	private String board_content;
	private int board_vote_cnt;        
	private int board_view_cnt;      
	private int board_cmt_cnt;   
	private int board_selected_ans;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss.S", timezone = "Asia/Seoul")
	private Date board_date_created; 
	
	// class 테이블
	private int class_id;         //게시글고유키
	private String class_academy; //학원이름
	private String class_class;   //반이름

}
