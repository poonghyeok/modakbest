package com.modak.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="admin")
public class BoardNoticeAdminController {
	//list
	//공지사항 관리 폼 띄우기
	@GetMapping(value="adminBoardNoticeList")
	public ModelAndView userAllList(@RequestParam(required = false, defaultValue ="1") String pg) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.setViewName("/admin/adminBoardNoticeList");
		
		return mav;
	}
	  
	@GetMapping(value = "adminBoardNoticeWriteForm")
	public String adminBoardNoticeWriteForm(){
		return "/admin/adminBoardNoticeWriteForm";
	}
	//write
}
