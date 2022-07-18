package com.modak.user.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Component
public class UserDTO {
   //공통 영역 : 시작 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   //user테이블
   private int	user_id; 
   private int user_classid;
   private String user_email, user_pwd, user_name, user_nickname, user_img, user_auth, user_grade, user_ip, user_salt, user_social;
   //@@@@@ 연수 : 회원가입 및 업데이트 시간 노출 형식 변경(220716)
   @JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy.MM.dd")
   private Date user_logtime;
//   //########## 연수 : 카카오 회원에 대한 어드민 삭제 기능 구현을 위해 카카오 아이디 저장 추가(220716)
//   private Long user_kakaoId;  // 카카오 연동 가입회원 카카오 아이디
   //공통 영역 : 끝 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


	}
