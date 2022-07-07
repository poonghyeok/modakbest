<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>bitcampfire - 회원정보 수정</title>
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/semiproject/css/user/application.css">
	<style type="text/css">
	#user_pwdDiv, #newPwdDiv, #newPwdCheckDiv{
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
 		 
 		 	<!-- 메인시작 -->
			<div id="create-user" class="content clearfix" role="main">
			    <h3 class="content-header">비밀번호 변경</h3>
			    
				   <form id="userPwdChangeForm">
					
						<input type="hidden" name="_csrf" value="">
						  
						    <div class="col-sm-8 col-sm-offset-2">
						        <div class="panel panel-default panel-margin-10">
						            <div class="panel-body panel-body-content text-center">
						            
						                <p class="lead">변경하실 비밀번호를 입력해 주세요.</p>
						               
						                <div class="form-group">
						                    <input type="password" name="user_pwd" id="user_pwd" class="form-control form-control-inline text-center" placeholder="현재 비밀번호" />
						                	 <!-- 현재 비밀번호 일치여부 확인 -->
						                	<div id="user_pwdDiv"></div>
						                </div>
						                
						                <div class="form-group">
						                    <input type="password" name="newPwd" id="newPwd" class="form-control form-control-inline text-center" placeholder="새 비밀번호" />
						               		<div id="newPwdDiv"></div>
						                </div>
						                
						                <div class="form-group">
						                    <input type="password" name="newPwdCheck" id="newPwdCheck" class="form-control form-control-inline text-center" placeholder="새 비밀번호 확인" />
						                	<div id="newPwdCheckDiv"></div>
						                </div>
						                
						                <input type="button" id="userPwdChangeBtn" class="btn btn-primary" value="비밀번호 변경"> <!-- button -->
						                <a href="/semiproject/user/userUpdateForm" class="btn btn-default">취소 </a><!--  button 메인으로 이동  -->
						            
						            </div><!-- panel-body panel-body-content text-center -->
						        </div><!-- panel panel-default panel-margin-10 -->
						    </div><!-- col-sm-8 col-sm-offset-2 -->
				   </form>
			</div><!-- create-user -->          
>
		<!-- 메인끝 -->
<%-- 	<jsp:include page="/WEB-INF/global/footer.jsp"/>    --%> 
   </div> <!-- main -->   
</div> <!-- layout-container -->

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

<!-- 비밀번호 변경 -->
//비밀번호 유효성검사
$('#user_pwd').focusout(function(){
 	if($('#user_pwd').val()!=null){
		$.ajax({ 
			url: '/semiproject/user/checkPwd',
			type: 'post',
			data: 'user_email='+$('#user_email').val(),
			//data: 'user_email='+'manbal3@aaa',
			dataType: 'json',
			
			success: function(data){
				alert(JSON.stringify(data));
							
				if(data.user_pwd != $('#user_pwd').val()) {
					$('#user_pwdDiv').html('비밀번호 불일치');		
				}else $('#user_pwdDiv').html('');					
			},
			error: function(err){
				console.log(err);
			}
		});
 	}
});

$('#userPwdChangeBtn').click(function(){
	$('#user_pwdDiv').empty();
	$('#newPwdDiv').empty();
	$('#newPwdCheckDiv').empty();
	
    var pw = $("#newPwd").val();
    var num = pw.search(/[0-9]/g);
    var eng = pw.search(/[a-z]/ig);
    var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

	
	if($('#user_pwd').val()=='') {
		$('#user_pwdDiv').html('현재 비밀번호 입력');	
	
	}else if($('#newPwd').val()=='') {
		$('#newPwdDiv').html('새로운 비밀번호 입력');
	//새로운 비밀번호 입력 오류	
    }else if(pw.length < 8 || pw.length > 20){        
        $('#newPwdDiv').html('비밀번호는 8자리 ~ 20자리 이내로 입력해주세요.');
    }else if(pw.search(/\s/) != -1){
        $('#newPwdDiv').html('비밀번호는 공백 없이 입력해주세요.');        
    }else if(num < 0 || eng < 0 || spe < 0 ){
        $('#newPwdDiv').html('비밀번호는 영문,숫자, 특수문자를 혼합하여 입력해주세요.');
         
	}else if($('#newPwdCheck').val()==''){
		$('#newPwdCheckDiv').html('새로운 비밀번호 재입력');
		
 	}else if($('#newPwd').val()!=$('#newPwdCheck').val()){		
		$('#newPwdCheckDiv').html('비밀번호가 맞지 않습니다.'); 
 	
  	}else if($('#user_pwdDiv').val()=='비밀번호 불일치'){
 		alert('현재 비밀번호가 불일치합니다.'); 
    }else {
    	 //$('#userPwdChangeForm').submit();	
		 $.ajax({
			type: 'post',
			url: '/semiproject/user/pwdChangeComplete',
			data: 'user_pwd='+$('#newPwd').val(),
			success: function(){
				alert('비밀번호 변경 완료');
				location.href = "/semiproject/user/userUpdateForm"; 
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