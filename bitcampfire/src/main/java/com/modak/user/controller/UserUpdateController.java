package com.modak.user.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.modak.user.bean.ClassDTO;
import com.modak.user.bean.UserAllDTO;
import com.modak.user.bean.UserDTO;
import com.modak.user.service.UserService;

@Controller
@RequestMapping(value="user")
public class UserUpdateController {
	@Autowired
	private UserService userService;
	@Autowired
	HttpSession session;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;	
	@Autowired
	private JavaMailSender mailSender4;
	private static final Logger logger = LoggerFactory.getLogger(UserSignupController.class);	
	
	//회원정보 수정 시작
	//회원정보 수정폼 띄우기
	@GetMapping(value="userUpdateForm")
	public String userUpdateForm(Model model) {
		model.addAttribute("classList", userService.classList());	
		return "/user/userUpdateForm";
	}	

	
	//회원정보 수정을 위해 회원정보 가져오기(통합DTO사용하기)
	@PostMapping(value="getUser")
	@ResponseBody
	public UserAllDTO getUser(HttpSession session) {
		String user_email = (String) session.getAttribute("memEmail");		
		return userService.getUser(user_email);
	}	
	
	//닉네임 중복체크
	@PostMapping(value="userUpdate_nicknameCheck")
	@ResponseBody
	public UserAllDTO userUpdate_nicknameCheck(@RequestParam String user_nickname) {		
		return userService.userUpdate_nicknameCheck(user_nickname);	
	}
	
	//이메일 중복체크
	@PostMapping(value="userUpdate_emailCheck")
	@ResponseBody
	public UserAllDTO userUpdate_emailCheck(@RequestParam String user_email) {		
		return userService.userUpdate_emailCheck(user_email);	
	}
	
	///이메일 인증 - 이메일 변경
	@GetMapping("mailCheck_updateEmail")
	@ResponseBody
	public String mailCheck_updateEmail(String user_email) throws Exception{
		//logger.info("이메일 인증 요청이 들어옴!"+user_email);
     //   logger.info("인증번호 : " + user_email);
		//return  mailService.joinEmail(user_email);
        
        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
      //  logger.info("인증번호 " + checkNum);
        
        /* 이메일 보내기 */
        String setFrom = "dustn551@gmail.com";
        String toMail = user_email;
        String title = "이메일 변경 인증 이메일 입니다.";
        String content = 
        "<div style='width:1000px; height: 100px; background:#286090;' align='center'> <h1 style='color:#fff; font-size: 60px;'>BITFIRE</h1></div>"
		+ "<div><h2 style='margin-top:10px; font-size: 24px;'>홈페이지를 방문해주셔서 감사합니다.<br><br>이메일 변경을 위해 아래의 인증번호를 인증번호 확인란에 기입하여 주세요.</h2>"
		+ "<p style='font-size:18px;'>인증 번호 : <span style='padding: 10px; background: #d2e9fc;'>" + checkNum + "</span> </p>"
		+ "<div>";
        
        try {
            
            MimeMessage message = mailSender4.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender4.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        String num = Integer.toString(checkNum);
        
        return num;
	}
			
	
	
	//프로필 사진 변경
	@PostMapping(value="update_userImg")
	@ResponseBody
	public void update_userImg(@ModelAttribute UserAllDTO userAllDTO,
							  @RequestParam MultipartFile user_image,
								HttpSession session) {
		
		String user_email = (String) session.getAttribute("memEmail");
		//가상폴더
		//각자 설정한 workspace 주소에 맞게 filepath 변경해야함

		String filePath = "C:\\Users\\이풍혁\\Documents\\bitcamp2\\세미프로젝트\\github\\github_backup\\220706_ver2\\bitcampfire\\src\\main\\webapp\\WEB-INF\\storage\\userprofile"; //연수비트캠프
		//String filePath = "D:\\bit_semi_repository\\modakbest\\bitcampfire\\src\\main\\webapp\\WEB-INF\\storage\\userprofile"; //연수집

	//	String filePath = "D:\\projectModak\\modakbest\\bitcampfire\\src\\main\\webapp\\WEB-INF\\storage\\userprofile";
	//풍혁 노트북 : "C:\\Users\\이풍혁\\Documents\\bitcamp2\\세미프로젝트\\github\\github_backup\\220706_ver2\\bitcampfire\\src\\main\\webapp\\WEB-INF\\storage\\userprofile"
		// String filePath = "C:\\Users\\dbwls\\OneDrive\\DOCUME~1-DESKTOP-Q3OEC9U-3933\\git\\git_home\\git_modak\\modakbest\\bitcampfire\\src\\main\\webapp\\WEB-INF\\storage\\userprofile";//우진놑북



		String fileName = user_image.getOriginalFilename();
		
		File file = new File(filePath, fileName); //파일 생성
		
		try {
			FileCopyUtils.copy(user_image.getInputStream(), new FileOutputStream(file)); //복사
			//user_image.transferTo(file);
		} catch (IOException e) {
			e.printStackTrace();
		}	
			
		session.setAttribute("memImg", fileName);		
		userAllDTO.setUser_img(fileName);
		userAllDTO.setUser_email(user_email);
		//회원수정폼 정보 실어서 업데이트
		userService.update_userImg(userAllDTO);
	}
	//이메일 주소 변경
	
	//회원 기본정보 수정(이메일값 기준으로 수정)
	@PostMapping(value="update_userInfo")
	@ResponseBody
	public void update_userInfo(@ModelAttribute UserAllDTO userAllDTO, HttpSession session) {
		String user_email = (String) session.getAttribute("memEmail");
		userAllDTO.setUser_email(user_email);
		userService.update_userInfo(userAllDTO);

		session.setAttribute("memName", userAllDTO.getUser_name());
		session.setAttribute("memNickname", userAllDTO.getUser_nickname());		
		session.setAttribute("memClassId", userAllDTO.getUser_classid());
	}
	
	//이메일 주소 변경(아이디값 기준으로 수정)
	@PostMapping(value="update_userEmail")
	@ResponseBody
	public void update_userEmail(@RequestParam String user_email, HttpSession session) {
		String user_id = (String) session.getAttribute("memId");
		session.setAttribute("memEmail", user_email);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		map.put("user_email", user_email);		

		userService.update_userEmail(map);
	}
	//회원정보 수정 끝
	
	//비밀번호 변경 시작
	//비밀번호 수정폼 띄우기
	@GetMapping(value="userPasswordChange")
	public String passwordChange() {
		return "/user/userPasswordChange";
	}
	
	//비밀번호 일치여부 확인 	
	@PostMapping(value="checkPwd")	  
	@ResponseBody 
	public String checkPwd(@RequestParam String user_pwd, HttpSession session){ 
		
		String user_email = (String) session.getAttribute("memEmail");
		UserDTO userDTO = userService.checkPwd(user_email); 	
		String inputPwd = user_pwd;

		if(userDTO != null && passwordEncoder.matches(inputPwd, userDTO.getUser_pwd())){ //입력 비밀번호, 복호화 비밀번호
			return "ok";
			
		}else {			
			return "fail";
		}	
	}

	//비밀번호 변경 완료	
	@PostMapping(value="pwdChangeComplete")
	@ResponseBody
	public void pwdChangeComplete(@RequestParam String user_pwd, HttpSession session) {
		String user_email = (String)session.getAttribute("memEmail");
		
		String inputPass = user_pwd;
		String pwd = passwordEncoder.encode(inputPass);		
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_email", user_email); 
		map.put("user_pwd", pwd);
		
		userService.pwdChangeComplete(map);
	}
	
	//비밀번호 변경 끝
	
	//회원탈퇴 시작
	//회원탈퇴	 확인창 띄우기
	@GetMapping(value="userDeleteConfirm")
	public String userDeleteConfirm() {
		return "/user/userDeleteConfirm";
	}

	
	//@@@ 연수 카카오 탈퇴 추가(220713)
	//회원탈퇴-탈퇴 후 정보보관 기간(60일) 기능 ??
	@RequestMapping(value="delete")	
	public String delete(HttpSession session) {
		String access_Token = (String)session.getAttribute("memAccessToken");
		String user_email = (String) session.getAttribute("memEmail"); 

		if(access_Token==null) {
			userService.delete(user_email);
		}else {	
			userService.kakaoUnlink(access_Token);
			userService.delete(user_email);
		}
		session.invalidate();
		return "redirect:/";
	}	 
	//@@@ 연수 카카오 탈퇴 추가(220713)
	

	//회원탈퇴	완료
	@GetMapping(value="userDeleteComplete")
	public String userDeleteComplete() {
		return "/user/userDeleteComplete";
	}

}
