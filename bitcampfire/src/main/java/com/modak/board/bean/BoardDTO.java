package com.modak.board.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Component
public class BoardDTO implements Comparable<BoardDTO>{
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
			//풍혁0709 : jsonFormat 기능사용, java date 객체에서 json 객체로 변환될 때 format 지정
			@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss.S", timezone = "Asia/Seoul")
			private Date board_date_created; 
		// 공통영역 : 끝 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

			
			
			
			
			
		//풍혁 : 시작 =============================================
		//풍혁(220703) : category id가 번호이니깐 dto에서 꺼낼 때 String으로 꺼낼 수 있게 method를 하나 만들었습니다.
		public String cateidToString() {
			String categoryString = null;
			switch(this.board_cateid) {
			case 1: categoryString = "취업정보";
					break;
			case 2: categoryString = "후기";
					break;
			case 3: categoryString = "Q&A";
					break;
			case 4: categoryString = "자유게시판";
					break;
			}
			
			

			return categoryString;
		}
		@Override // 최신순으로 정렬
		public int compareTo(BoardDTO dto) { // dto는 기준날짜가 아닌 비교되는 대상 , 기준날짜랑 dto(비교날짜)랑  비교
			if (dto.getBoard_date_created().before(this.board_date_created)) {
				return -1; // -1은 앞으로 가라는거 list로 세웠을때 맨 위로 온다.(=최신순으로 된다.)
			}  else if(dto.getBoard_date_created().after(this.board_date_created)) {
				return 1;
			} else {
				return 0;
			}
		}
		//풍혁 : 끝 ==============================================

		// 정수 : 시작  ###################### 

		// 정수 : 끝  ######################  
}
