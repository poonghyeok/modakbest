package com.modak.user.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class UserDTO {
   //공통 영역 : 시작 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   //user테이블
   private int	user_id; 
   private int user_classid;
   private String user_email, user_pwd, user_name, user_nickname, user_img, user_auth, user_grade, user_ip, user_salt, user_social;
   private Date user_logtime;
   //공통 영역 : 끝 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


	}
