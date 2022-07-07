package com.modak.board.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Component
public class BoardDTO {
	// 공통영역 : 시작 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			private int board_id;           
			private int board_uid;           
			private int board_cateid;       
			private String board_title; 
			private String board_content;
			private int board_vote_cnt;        
			private int board_view_cnt;      
			private int board_cmt_cnt;   
			private int board_selected_ans;
			private Date board_date_created; 
		// 공통영역 : 끝 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

		//풍혁 : 시작 =============================================
		//풍혁(220703) : category id가 번호이니깐 dto에서 꺼낼 때 String으로 꺼낼 수 있게 method를 하나 만들었습니다.
		public String cateidToString() {
			String categoryString = null;
			switch(this.board_cateid) {
			case 1: categoryString = "1번게시판";
					break;
			case 2: categoryString = "2번게시판";
					break;
			case 3: categoryString = "3번게시판";
					break;
			case 4: categoryString = "4번게시판";
					break;
			}

			return categoryString;
		}
		//풍혁 : 끝 ==============================================

		// 정수 : 시작  ###################### 

		// 정수 : 끝  ######################  
}
