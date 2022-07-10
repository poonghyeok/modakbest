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
		                	<div class="alert alert-danger" id="check_alert">		                
	              			</div>
			            </div>
			
			            <form class="form-signin form-user panel-body panel-margin" id="loginForm">
			                <!--@@@ 연수 pwdDiv, idDiv 삭제 (220710)@@@-->
			                <input type="text" name="user_email" id="user_email" class="username form-control input-sm" placeholder="이메일">			                
			                <input type="password" name="user_pwd" id="user_pwd" class="password form-control input-sm" placeholder="비밀번호">							
			                <div id="divUserLogin">
			                    <input type="button" class="btn btn-primary btn-block" id="btnUserLogin" value="로그인">
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
$('#check_alert').hide();

//연수: 로그인 엔터키 이벤트 수정(220710)
$(document).ready(function() {
	$('input').on('keyup', function(e){
		if(e.keyCode == 13) {
			//alert('엔터키 눌렀다!');
			$('#btnUserLogin').trigger('click');			
		}
	});
});
 
$('#btnUserLogin').click(function(){
	$('#check_alert').hide();
	
	//@@@ 연수 로그인 이메일 /비밀번호 정규식 추가(220710)
	//이메일 정규식
	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    
	//비밀번호 정규식	
    var pw = $("#user_pwd").val();
    var num = pw.search(/[0-9]/g);
    var eng = pw.search(/[a-z]/ig);
    var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
    
	if($('#user_email').val()=='') {		
		$('#check_alert').show();
		$('#check_alert').html('[이메일] : 이메일을 입력하세요.');
		$('#check_alert').css('color','red');
		$('#check_alert').css('font-size','8px');
	}else if($('#user_email').val().match(regExp) == null){
		$('#check_alert').show();
		$('#check_alert').html('[이메일] : 이메일 형식이 올바르지 않습니다.');
		$('#check_alert').css('color','red');
		$('#check_alert').css('font-size','8px');		
	}else if($('#user_pwd').val()=='') {		
		$('#check_alert').show();
		$('#check_alert').html('[비밀번호] : 비밀번호를 입력하세요.');
		$('#check_alert').css('color','red');
		$('#check_alert').css('font-size','8px');
	}else if(pw.length < 8 || pw.length > 20){
    	$('#check_alert').show();
    	$('#check_alert').html('[비밀번호] : 비밀번호는 8자리 ~ 20자리 이내로 입력해주세요.');
	}else if(pw.search(/\s/) != -1){
	   	$('#check_alert').show();
	   	$('#check_alert').html('[비밀번호] : 비밀번호는 공백 없이 입력해주세요.');	    	
    }else if(num < 0 || eng < 0 || spe < 0 ){
    	$('#check_alert').show();
        $('#check_alert').html('[비밀번호] : 비밀번호는 영문, 숫자, 특수문자를 혼합하여 입력해주세요.');	
    //@@@ 연수 로그인 이메일 /비밀번호 정규식 추가(220710)
	
    }else {
		$.ajax({ 
			type: 'post',
			url: '/semiproject/user/login', 
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
						//alert('이메일 또는 비밀번호가 일치하지 않습니다. 다시 시도해주세요!');
						//setTimeout("location.href='/semiproject/user/userLoginForm'",300);
						$('#check_alert').show();
						$('#check_alert').html('[로그인 실패] 이메일 또는 비밀번호가 일치하지 않습니다.<br>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; 다시 시도해주세요!');
						$('#check_alert').css('color','red');
						$('#check_alert').css('font-size','8px');	
						$('#user_email').val('');
						$('#user_pwd').val('');
					}
				},
				error: function(err){
					console.log(err);
				}
			});
		}
});

</script>
</body>

</html>

