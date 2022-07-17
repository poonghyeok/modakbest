<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>bitcampfire - 로그인</title>
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
		                	<div class="alert alert-danger" id="check_alert">		                
	              			</div>
			            </div>
			
			            <form class="form-signin form-user panel-body panel-margin" id="loginForm">			                
			                <input type="text" name="user_email" id="user_email" class="username form-control input-sm" placeholder="이메일">			                
			                <input type="password" name="user_pwd" id="user_pwd" class="password form-control input-sm" placeholder="비밀번호">							
			                <div id="divUserLogin">
			                    <input type="button" class="btn btn-primary btn-block" id="btnUserLogin" value="로그인">
			                </div>
			                <br>		                
			                <div id="divUserLogin">  
			              		<a class="p-2 btn btn-kakao btn-block" id="kakaoBtn" href="https://kauth.kakao.com/oauth/authorize?client_id=99d19c4d787174d74fec051d2035c26e&redirect_uri=http://localhost:8080/semiproject/user/userKakaoLoginForm&response_type=code">  
			                		<span class="icon-social icon-kakao"></span>Login with Kakao
			                	</a>
			                </div>	                

			                <div class="signup-block">
			                    <a href="/semiproject/user/userFindPwdForm">계정 찾기</a>
			                    <span class="inline-saperator">/</span>
			                    <a href="/semiproject/user/userSignupForm">회원 가입</a>
			                </div>
			            </form>
		           </div>
		       </div>

		    </div>
		    <!-- 메인끝  -->
 		 <jsp:include page="/WEB-INF/global/footer.jsp"/>   
   </div> <!-- main -->   
</div> <!-- layout-container -->

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>    
<script type="text/javascript" src="/semiproject/js/user/userLoginForm.js"></script>
</body>
</html>