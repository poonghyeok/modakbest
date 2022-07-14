  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>bitcampfire - 비밀번호 변경</title>
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/semiproject/css/user/application.css">
<!-- 	<style type="text/css">
	#user_pwdDiv, #newPwdDiv, #newPwdCheckDiv{
		color: red;
		font-size: 8pt;
		font-weight: bold;
		}
	</style> -->
</head>
<body>
<div class="layout-container">
 	<div class="main">
 		<jsp:include page="/WEB-INF/user/userSideBar.jsp"/>	
 		 
 		 	<!-- 메인시작 -->
			<div id="create-user" class="content clearfix" role="main">
			    <h3 class="content-header">비밀번호 변경</h3>
			    
				   <form id="userPwdChangeForm">
					
						<input type="hidden" name="_csrf" value="">
						<input type="hidden" name="user_email" id="user_email" value="${sessionScope.memEmail }">
						<!-- <div>${sessionScope.memEmail}</div> -->
						  
						    <div class="col-sm-8 col-sm-offset-2">
						        <div class="panel panel-default panel-margin-10">
						            <div class="panel-body panel-body-content text-center">
						            
						                <p class="lead">변경하실 비밀번호를 입력해 주세요.</p>
							               	<div class="alert alert-danger" id="check_alert">		                
		              						</div>
						                
						                <div class="form-group">
						                    <input type="password" name="newPwd" id="newPwd" class="form-control form-control-inline text-center" placeholder="새 비밀번호" />
						                </div>
						                
						                <div class="form-group">
						                    <input type="password" name="newPwdCheck" id="newPwdCheck" class="form-control form-control-inline text-center" placeholder="새 비밀번호 확인" />
						                	<div id="newPwdCheckDiv"></div>
						                </div>
						                
						                <input type="button" id="userPwdChangeBtn" class="btn btn-primary" value="비밀번호 변경"> <!-- button -->
						                <a href="/semiproject/user/userLoginForm" class="btn btn-default">취소 </a><!--  button 메인으로 이동  -->
						            
						            </div><!-- panel-body panel-body-content text-center -->
						        </div><!-- panel panel-default panel-margin-10 -->
						    </div><!-- col-sm-8 col-sm-offset-2 -->
				   </form>
			</div><!-- create-user -->          
>
		<!-- 메인끝 -->
	  <jsp:include page="/WEB-INF/global/footer.jsp"/>   
   </div> <!-- main -->   
</div> <!-- layout-container -->

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
//연수: 로그인 엔터키 이벤트 수정(220712)
$(document).ready(function() {
	$('input').on('keyup', function(e){
		if(e.keyCode == 13) {
			$('#userPwdChangeBtn').trigger('click');			
		}
	});
});

//비밀번호 유효성검사
$('#check_alert').hide();
var pwdCheck = false;

//@@@ 연수 알럿 메시지 일부 워딩 수정(220710)

$('#userPwdChangeBtn').click(function(){
	$('#check_alert').hide();
    var pw = $("#newPwd").val();
    var num = pw.search(/[0-9]/g);
    var eng = pw.search(/[a-z]/ig);
    var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

    if($('#newPwd').val()=='') {
		$('#check_alert').show();
		$('#check_alert').html('[비밀번호] : 새로운 비밀번호를 입력해주세요.');
		$('#check_alert').css('color','red');
		$('#check_alert').css('font-size','8px');
		$('#check_alert').css('color','red');
		$('#check_alert').css('font-size','8px');
		
    }else if(pw.length < 8 || pw.length > 20){
    	$('#check_alert').show();
    	$('#check_alert').html('[비밀번호] : 비밀번호는 8자리 ~ 20자리 이내로 입력해주세요.');
		$('#check_alert').css('color','red');
		$('#check_alert').css('font-size','8px');
    	
    }else if(pw.search(/\s/) != -1){
    	$('#check_alert').show();
    	$('#check_alert').html('[비밀번호] : 비밀번호는 공백 없이 입력해주세요.');  
		$('#check_alert').css('color','red');
		$('#check_alert').css('font-size','8px');
    	
    }else if(num < 0 || eng < 0 || spe < 0 ){
    	$('#check_alert').show();
        $('#check_alert').html('[비밀번호] : 비밀번호는 영문, 숫자, 특수문자를 혼합하여 입력해주세요.');
		$('#check_alert').css('color','red');
		$('#check_alert').css('font-size','8px');
         
	}else if($('#newPwdCheck').val()==''){
		$('#check_alert').show();
		$('#check_alert').html('[비밀번호] : 새로운 비밀번호를 재입력해주세요.');
		$('#check_alert').css('color','red');
		$('#check_alert').css('font-size','8px');
		
 	}else if($('#newPwd').val()!=$('#newPwdCheck').val()){		
		$('#check_alert').show();
		$('#check_alert').html('[비밀번호] : 입력하신 비밀번호가 새로운 비밀번호와 일치하지 않습니다.');
		$('#check_alert').css('color','red');
		$('#check_alert').css('font-size','8px');
 	
  	}else {	
		 $.ajax({
			type: 'post',
			url: '/semiproject/user/pwdFindChangeComplete',
			data: {'user_pwd' : $('#newPwd').val(),
		  			'user_email' : $('#user_email').val()},
			success: function(){
				alert('비밀번호 변경을 완료하였습니다.\n다시 로그인 하세요.');
				location.href = "/semiproject/user/userLoginForm"; 
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