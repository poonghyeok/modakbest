package com.modak.user.bean;

import org.springframework.stereotype.Component;
import lombok.Data;

@Data
@Component
public class ClassDTO {	 
	   //공통 영역 : 시작 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	   //class테이블
	   private int class_id;
	   private String class_academy,class_class; 
       //공통 영역 : 끝 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		   
}
