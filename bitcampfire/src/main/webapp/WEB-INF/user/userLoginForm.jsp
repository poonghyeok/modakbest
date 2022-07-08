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
	<style type="text/css">
		#user_emailDiv, #user_pwdDiv{
		color: red;
		font-size: 8pt;
		font-weight: bold;
		}
	</style>

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
		                	<!-- <div class="alert alert-danger" id="check_alert">		                
	              			</div> -->
			            </div>
			
			            <form class="form-signin form-user panel-body panel-margin" id="loginForm">
			                   <!--  <input type="hidden" name="redirectUrl" value="%2F"> -->
			                <input type="text" name="user_email" id="user_email" class="username form-control input-sm" placeholder="이메일">
			                <div id="user_emailDiv"></div>
			                <input type="password" name="user_pwd" id="user_pwd" class="password form-control input-sm" placeholder="비밀번호">
							<div id="user_pwdDiv"></div>
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

		    </div>
		    <!-- 메인끝  -->
 		 <jsp:include page="/WEB-INF/global/footer.jsp"/>   
   </div> <!-- main -->   
</div> <!-- layout-container -->

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>    
<script type="text/javascript">
function enterkey() {
	if (window.event.keyCode == 13) {
		$('#btnUserLogin').trigger('click');
    }
}
/* $('#check_alert').hide(); */
 
$('#btnUserLogin').click(function(){
	$('#user_emailDiv').empty();	
	$('#user_pwdDiv').empty();	
	
	if($('#user_email').val()=='') {		
		$('#user_emailDiv').html('이메일을 입력하세요.');
		/* $('#check_alert').show();
		$('#check_alert').html('이메일을 입력하세요');
		$('#check_alert').css('color','red');
		$('#check_alert').css('font-size','8px');	 */	
	}else if($('#user_pwd').val()=='') {		
		$('#user_pwdDiv').html('비밀번호를 입력하세요.');
		/* $('#check_alert').show();
		$('#check_alert').html('비밀번호를 입력하세요.');
		$('#check_alert').css('color','red');
		$('#check_alert').css('font-size','8px');	 */
	}else {
		$.ajax({ 
			type: 'post',
			url: '/semiproject/user/checkIdPw',
			data: { 'user_email' : $('#user_email').val(), 
					'user_pwd' : $('#user_pwd').val() }, 		
			dataType: 'text', 
			success: function(data){
				//alert(data);
				data = data.trim();			
					if(data == 'ok') {

						/* 풍혁220707 : 서버를 시작하고 처음에 session 반영이 안되는 부분 해결 시도를 위해 지연을 넣어봤습니다.  */
						setTimeout("location.href='/semiproject/'",300);
					}else if(data == 'fail') {
						/* 풍혁220707 : alert 추가했습니다. */
						alert('이메일 또는 비밀번호가 일치하지 않습니다. 다시 시도해주세요!');
						location.href = "/semiproject/user/userLoginForm";
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

