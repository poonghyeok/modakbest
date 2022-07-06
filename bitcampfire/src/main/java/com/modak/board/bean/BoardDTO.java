package com.modak.board.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Component
public class BoardDTO {
	private int board_id;           
	private int board_uid;           
	private int board_cateid;       
	private String board_title;      
	private String board_content;      
	private int board_vote_cnt;        
	private int board_view_cnt;      
	private int board_cmt_cnt;        
	private int board_selected_ans;        
	private Date bqna_date_created; 
}
