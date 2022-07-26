package com.modak.comment.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.modak.comment.bean.CommentDTO;
import com.modak.comment.service.CommentService;
import com.modak.user.service.UserService;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping(value = "comment")
public class CommentClassController {
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private UserService userService;

	

		@PostMapping(value = "commentClassWrite")
		@ResponseBody
		public void commentClassWrite(@ModelAttribute CommentDTO commentDTO) {
			System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"+commentDTO.getCmt_content());
			String cmt_img = commentDTO.getCmt_content();
			
			commentService.commentClassWrite(commentDTO);
			
			Map<String, Integer> map = new HashMap<>();
			map.put("board_id",commentDTO.getCmt_bid());
			map.put("cateid",commentDTO.getCmt_cateid());
			
			commentService.increaseClassCommentCount(map);
			
			return ;
		}
		
		@PostMapping(value = "getClassCommentListByBoardId")
		@ResponseBody
		public List<CommentDTO> getClassCommentListByBoardId(@RequestParam int cmt_bid) {
			
			List<CommentDTO> list = commentService.getClassCommentListByBoardId(cmt_bid);
			
			return list;
		}

		
		@PostMapping(value = "getClassCommentContentById", produces = "application/text; charset=UTF-8")
		@ResponseBody
		public String getClassCommentContentById(@RequestParam int cmt_id) {
			
			return commentService.getClassCommentContentById(cmt_id);
		}
		
		@PostMapping(value = "commentClassUpdate")
		@ResponseBody
		public void commentClassUpdate(@RequestParam int cmt_id, @RequestParam String cmt_content) {
			
			System.out.println("\n @LOG@ comment...commentClassUpdate : " + cmt_id + " cmt_ content : "+ cmt_content);
			commentService.commentClassUpdate(cmt_id, cmt_content);
			
			return ;
		}
		
		@PostMapping(value = "commentClassDelete")
		@ResponseBody
		public void commentClassDelete(@ModelAttribute CommentDTO commentDTO) {
			
			Map<String, Integer> map = new HashMap<>();
			map.put("board_id",commentDTO.getCmt_bid());
			map.put("cateid",commentDTO.getCmt_cateid());
			map.put("cmt_id",commentDTO.getCmt_id());
			
			commentService.commentClassDelete(commentDTO.getCmt_id());
			commentService.decreaseClassCommentCount(map);
			
			return ;

		}
		
		
		@RequestMapping(value="uploadSummernoteImageFile", produces = "application/json; charset=utf8")
		@ResponseBody
		public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
			JsonObject jsonObject = new JsonObject();
			
			//String fileRoot = "C:\\Users\\dbwls\\OneDrive\\DOCUME~1-DESKTOP-Q3OEC9U-3933\\git\\git_home\\git_modak\\modakbest\\bitcampfire\\src\\main\\webapp\\WEB-INF\\storage\\commentImg";
			 
			
			// 내부경로로 저장
			String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
			String filepath = contextRoot+"WEB-INF\\storage\\";
			//String filepath = "C:\\Users\\dbwls\\OneDrive\\DOCUME~1-DESKTOP-Q3OEC9U-3933\\git\\git_home\\git_modak\\modakbest\\bitcampfire\\src\\main\\webapp\\WEB-INF\\storage\\";
			//System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"+fileRoot);
			System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$4"+contextRoot);
			
			String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
			System.out.println("----------------------"+originalFileName);
			
			String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
			System.out.println("----------------------"+extension);
			
			String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
			System.out.println("----------------------"+savedFileName);
			
			//File targetFile = new File(fileRoot + savedFileName);	
			File targetFile = new File(filepath + savedFileName);	
			try {
				InputStream fileStream = multipartFile.getInputStream();
				FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
				//jsonObject.addProperty("url", contextRoot+"/summernoteImage/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
				jsonObject.addProperty("url", "/semiproject/src/main/webapp/storage/commentImg/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
				jsonObject.addProperty("responseCode", "success");
					
			} catch (IOException e) {
				FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
				jsonObject.addProperty("responseCode", "error");
				e.printStackTrace();
			}
			String a = jsonObject.toString();
			System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++"+a);
			return a;
		}
		

	
}
