package com.modak.board.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.modak.board.bean.BoardClassDTO;
import com.modak.board.bean.BoardDTO;
import com.modak.board.service.BoardService;
import com.modak.user.bean.UserAllDTO;
import com.modak.user.service.UserService;

@Controller
@RequestMapping(value = "board")
public class BoardClassController {
		@Autowired
		private BoardService boardService;
		
		@Autowired
		private UserService userService;
		
		@Autowired
		private HttpSession session;

		@GetMapping("boardClassList")
		public ModelAndView boardClassList(@RequestParam(value = "pg", required = false, defaultValue = "1") int pg,HttpServletRequest req, @RequestParam(required = false, defaultValue = "date") String sortOption, @RequestParam(value = "class_id", required = false) int class_id) {
			UserAllDTO userAllDTO = userService.getUserClass_Class(class_id);
			session.setAttribute("memClassid", userAllDTO.getClass_id());
			session.setAttribute("memClass_academy", userAllDTO.getClass_academy());
			
			
			//ajax방식으로 할 거 아니면, String이나 String Buffer 물어와야 됨.
			System.out.println("\n @Log@ /boardList/list mapping..!! current pg : " + pg);
			HttpSession session = req.getSession();
			System.out.println("\n @LOG@ session_email check : " + (String)session.getAttribute("memEmail"));
			String session_email = (String)session.getAttribute("memEmail");
			System.out.println("\n @LOG@ session_classid check : " + session.getAttribute("memClassid"));
			int session_classid = (int)session.getAttribute("memClassid");
			
			String userClassWriteTableList = boardService.getUserClassWriteTablelist(pg, sortOption,class_id);
			String boardClassPagingList = boardService.getBoardClassPagingList(pg, sortOption, class_id); 
			
			ModelAndView mav = new ModelAndView();
			if(session_email != null) {
				mav.addObject("session_email", session_email);
			}
			mav.addObject("userClassWriteTableList", userClassWriteTableList);
			mav.addObject("boardClassPagingList", boardClassPagingList);
			mav.setViewName("/board/boardClassList");
			System.out.println();
			
			return mav;
			//return "/board/boardClassList";
		}
		
		@GetMapping(value = "classWrite")
		public String classWrite(@RequestParam(value = "class_id", required = false) int class_id, @RequestParam String class_academy){
			return "/board/boardClassWriteForm";
		}
		
		@PostMapping("/boardClassWrite")
		public String boardClassWrite(BoardClassDTO boardClassDTO) {
			boardService.boardClassWrite(boardClassDTO);
			return "/board/boardClassView";
		}
		  
}