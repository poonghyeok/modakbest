package com.modak.user.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class UserAllDTO {
   //user테이블
   private String user_id;       
   private String user_email;   
   private String user_pwd;    
   private String user_nickname; 
   private String user_tel;
   private String user_name;   
   private int user_classid;    //반 외래키?
   private String user_img;     //프로필사진 파일명   
   private Date user_logtime;   //가입일자 
   private String user_auth;    //이메일 인증여부    
   private String user_grade;   //권한
   private String user_ip;      //아이피 
   private String user_salt;    //비밀번호 암호화키    
   private String user_social;  // 소셜로그인여부
   
   private String pwd1;
   private String pwd2;
   
   //class테이블
   private int class_id;         //게시글고유키
   private String class_academy; //학원이름
   private String class_class;   //반이름
}
