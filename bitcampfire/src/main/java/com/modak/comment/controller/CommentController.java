package com.modak.comment.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.modak.comment.bean.CommentDTO;
import com.modak.comment.service.CommentService;
import com.modak.user.service.UserService;

@Controller
@RequestMapping(value = "/comment")
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private UserService userService;
	
	
//정수 :  시작 ########################################
	// 댓글쓰기 
		@PostMapping(value = "/writeCommentContent") // 댓글을 쓰면 바로 ajax로 뿌려서 댓글을 보이는데, 댓글을 쓰면 원래 있던 댓글 그 다음번호에 뿌려주면 되지
		@ResponseBody   // ajax로 간다.
		public void writeCommentContent(@ModelAttribute CommentDTO commentDTO) { // dto를 가지고 write메소드가서 
			commentService.writeCommentContent(commentDTO); // dto들고 서비스가서 작성해 반환하는건 없어.
		}
		
		// 댓글 가져오기
		@PostMapping(value = "/getCommentContent")
		@ResponseBody
		public List<CommentDTO> getCommentContent(@RequestParam int cmt_bid) {  // 댓글 원글번호를 이용해서 DTO가져오자
			return commentService.getCommentContent(cmt_bid);
					
		}
		
//정수 :  끝 ########################################
	
	
//풍혁 :  시작 =====================================
		@PostMapping(value = "/write")
		@ResponseBody
		public void write(@ModelAttribute CommentDTO commentDTO) {
			
			commentService.write(commentDTO);
			
			Map<String, Integer> map = new HashMap<>();
			map.put("board_id",commentDTO.getCmt_bid());
			map.put("cateid",commentDTO.getCmt_cateid());
			
			commentService.increaseCommentCount(map);
			
			return ;
		}
		
		@PostMapping(value = "/getCommentListByBoardId")
		@ResponseBody
		public List<CommentDTO> getCommentListByBoardId(@RequestParam int cmt_bid) {
			
			List<CommentDTO> list = commentService.getCommentListByBoardId(cmt_bid);
			
			return list;
		}

		//풍혁0709 : comment_uid로 부터 nickname 을 받아오기 
		@PostMapping(value = "/getNicknameByUserId", produces = "application/text; charset=UTF-8")
		@ResponseBody
		public String getNicknameByUserId(@RequestParam int user_id) {
			String user_nickname = userService.getUserNameByUserId(user_id); 
			System.out.println("\n @LOG@ comment..controller.. getNicknameByUserId .. parameter : " + user_id + "result : " + user_nickname);
			
			return user_nickname;
		}
		
		@PostMapping(value = "/getCommentContentById", produces = "application/text; charset=UTF-8")
		@ResponseBody
		public String getCommentContentById(@RequestParam int cmt_id) {
			
			return commentService.getCommentContentById(cmt_id);
		}
		
		@PostMapping(value = "/update")
		@ResponseBody
		public void update(@RequestParam int cmt_id, @RequestParam String cmt_content) {
			
			System.out.println("\n @LOG@ comment...update : " + cmt_id + " cmt_ content : "+ cmt_content);
			commentService.update(cmt_id, cmt_content);
			
			return ;
		}
		
//		@PostMapping(value = "/delete")
//		@ResponseBody
//		public void delete(@RequestParam int cmt_id, @RequestParam int cmt_bid) {
//			
//			System.out.println("\n @LOG@ comment...delete : " + cmt_id + cmt_bid);
//			
//			commentService.delete(cmt_id);
//			commentService.decreaseCommentCount(cmt_bid);
//			
//			return ;
//		}
//		
		@PostMapping(value = "/delete")
		@ResponseBody
		public void delete(@ModelAttribute CommentDTO commentDTO) {
			Map<String, Integer> map = new HashMap<>();
			map.put("board_id",commentDTO.getCmt_bid());
			map.put("cateid",commentDTO.getCmt_cateid());
			
			commentService.delete(commentDTO.getCmt_id());
			commentService.decreaseCommentCount(map);
			
			return ;
		}
		
		
	
		
//풍혁 :  끝 =====================================
		
//연수 추가 (220726) - summernote 이미지 업로드 기능(by 유진) 	
		@RequestMapping(value="uploadSummernoteImageFileAtBoard", produces = "application/json; charset=utf8")
	      @ResponseBody
	      public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
	         JsonObject jsonObject = new JsonObject();        
	         	         
	         // 내부경로로 저장
	         String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
	         String filepath = contextRoot+"WEB-INF\\storage\\commentImgAtBoard\\"; //각자 contextroot 경로를 확인한 후 servers 폴더 > server.xml > docBase에  경로 수정 
	         //String filepath = "C:\\Users\\dbwls\\OneDrive\\DOCUME~1-DESKTOP-Q3OEC9U-3933\\git\\git_home\\git_modak\\modakbest\\bitcampfire\\src\\main\\webapp\\WEB-INF\\storage\\";
	         //System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"+fileRoot);
	         System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"+contextRoot);
	         
	         String originalFileName = multipartFile.getOriginalFilename();   //오리지날 파일명
	         System.out.println("----------------------"+originalFileName);
	         
	         String extension = originalFileName.substring(originalFileName.lastIndexOf("."));   //파일 확장자
	         System.out.println("----------------------"+extension);
	         
	         String savedFileName = UUID.randomUUID() + extension;   //저장될 파일 명
	         System.out.println("----------------------"+savedFileName);	         
	         
	         File targetFile = new File(filepath + savedFileName);   
	         try {
	            InputStream fileStream = multipartFile.getInputStream();
	            FileUtils.copyInputStreamToFile(fileStream, targetFile);   //파일 저장	           
	            jsonObject.addProperty("url", "/semiproject/src/main/webapp/storage/commentImgAtBoard/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
	            jsonObject.addProperty("responseCode", "success");
	               
	         } catch (IOException e) {
	            FileUtils.deleteQuietly(targetFile);   //저장된 파일 삭제
	            jsonObject.addProperty("responseCode", "error");
	            e.printStackTrace();
	         }
	         String a = jsonObject.toString();
	         System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++"+a);
	         return a;
	      }
	
	
	
	
}
