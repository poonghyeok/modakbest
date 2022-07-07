<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>bitcampfire - 회원정보 수정</title>
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/semiproject/css/user/application.css">	

</head>

<body>
<div class="layout-container">
 	<div class="main">
 		<jsp:include page="/WEB-INF/user/userSideBar.jsp"/>	            
	
		<!-- 메인시작  -->
		<div id="edit-user" class="content" role="main">
		    <h3 class="content-header">로그인</h3>
		    <div class="col-md-6 main-block-left">
		        <div class="panel panel-default">
		            <div class="panel-heading">
		                <h5 class="panel-header">이메일 로그인</h5>
		            </div>
		
		            <form class="form-signin form-user panel-body panel-margin" id="loginForm" autocomplete="off">
		                    <input type="hidden" name="redirectUrl" value="%2F">
		                <input type="text" name="user_email" autocorrect="off" autocapitalize="off" id="user_email" class="username form-control input-sm" placeholder="이메일" required="" autofocus="">
		                <input type="password" name="user_pwd" id="user_pwd" class="password form-control input-sm" placeholder="비밀번호" required="">
		                <div class="checkbox">
		                    <label>
		                        <input type="checkbox" name="remember_me" id="remember_me"> 로그인 유지
		                    </label>
		                </div>
	
		                <!--button class="btn btn-primary btn-block" type="submit"><g:message code="springSecurity.login.button"/></button-->
		
		                <div id="divUserLogin">
		                    <button class="btn btn-primary btn-block" id="btnUserLogin">로그인</button>
		                </div>
		                <br>
		                
		                <div id="divUserLogin">    
		                    <a href="/oauth2/authorization/kakao" id="kakao-connect-link" class="btn btn-kakao btn-block">
		                	<span class="icon-social icon-kakao"></span>Login with Kakao</a>
		                </div>

		                <div class="signup-block">
		                    <a href="/semiproject/user/userFindPwdForm">계정 찾기</a>
		                    <span class="inline-saperator">/</span>
		                    <a href="/semiproject/user/userSignupForm">회원 가입</a>
		                </div>
		            </form>
		        </div>
		    </div>
		    
		    <!-- 메인끝  -->
 		<%-- <jsp:include page="/WEB-INF/global/footer.jsp"/>  --%>   
   </div> <!-- main -->   
</div> <!-- layout-container -->

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>    
<script type="text/javascript">
$('#btnUserLogin').click(function(){	
	if($('#user_email').val()=='') {
		alert('이메일을 입력하세요.');
	}else if($('#user_pwd').val()=='') {
		alert('비밀번호를 입력하세요.');
	}else {
		$.ajax({ 
			type: 'post',
			url: '/semiproject/user/checkIdPw',
			data: { 'user_email' : $('#user_email').val(), 
					'user_pwd' : $('#user_pwd').val() }, 		
			dataType: 'text', 
			success: function(data){
				data = data.trim();			
					if(data == 'ok') {
						location.href = "/semiproject/";						
					}else if(data == 'fail') {						
						location.href = "/semiproject/userLoginForm";
					}
				},
				error: function(err){
					console.log(err);
				},
			});
	}
});


</script>
</body>

</html>

