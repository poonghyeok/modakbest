package com.modak.board.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Component
public class BoardClassDTO {
	private int board_id;
	private int board_uid;
	private int board_classid;
	private String board_title;
	private String board_content;
	private int board_vote_cnt;
	private int board_view_cnt;
	private int board_cmt_cnt;
	private Date board_date_created;

}
