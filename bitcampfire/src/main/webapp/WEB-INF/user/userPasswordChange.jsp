<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>bitcampfire - 회원정보 수정</title>
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
						  
						    <div class="col-sm-8 col-sm-offset-2">
						        <div class="panel panel-default panel-margin-10">
						            <div class="panel-body panel-body-content text-center">
						            
						                <p class="lead">변경하실 비밀번호를 입력해 주세요.</p>
							               	<div class="alert alert-danger" id="check_alert">		                
		              						</div>
						                <div class="form-group">
						                    <input type="password" name="user_pwd" id="user_pwd" class="form-control form-control-inline text-center" placeholder="현재 비밀번호" />						                	 
						                </div>
						                
						                <div class="form-group">
						                    <input type="password" name="newPwd" id="newPwd" class="form-control form-control-inline text-center" placeholder="새 비밀번호" />
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
	  <jsp:include page="/WEB-INF/global/footer.jsp"/>   
   </div> <!-- main -->   
</div> <!-- layout-container -->

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
//비밀번호 유효성검사
$('#check_alert').hide();
var pwdCheck = false;

$('#user_pwd').focusout(function(){
 	if($('#user_pwd').val()!=null){
		$.ajax({ 
			url: '/semiproject/user/checkPwd',
			type: 'post',
			dataType: 'json',
			
			success: function(data){
				//alert(JSON.stringify(data));
				
				//data.user_pwd? 뭐가 틀린지
				if(data.user_pwd != $('#user_pwd').val()) {
					$('#check_alert').show();
					$('#check_alert').html('현재 비밀번호 불일치');
					$('#check_alert').css('color','red');
					$('#check_alert').css('font-size','8px');
					pwdCheck = false;
				}else 
					$('#check_alert').show();
					$('#check_alert').html('현재 비밀번호 일치');
					$('#check_alert').css('color', 'blue');
					$('#check_alert').css('font-size', '8px');
					pwdCheck = true;
			},
			error: function(err){
				console.log(err);
			}
		});
 	}
});

$('#userPwdChangeBtn').click(function(){

    var pw = $("#newPwd").val();
    var num = pw.search(/[0-9]/g);
    var eng = pw.search(/[a-z]/ig);
    var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

	
	if($('#user_pwd').val()=='') {
		$('#check_alert').show();
		$('#check_alert').html('현재 비밀번호를 입력해주세요.');
		$('#check_alert').css('color','red');
		$('#check_alert').css('font-size','8px');	
	
	}else if($('#newPwd').val()=='') {
		$('#check_alert').show();
		$('#check_alert').html('새로운 비밀번호를 입력해주세요.');
		$('#check_alert').css('color','red');
		$('#check_alert').css('font-size','8px');
		
	//새로운 비밀번호 입력 오류	
    }else if(pw.length < 8 || pw.length > 20){        
        $('#newPwdDiv').html('비밀번호는 8자리 ~ 20자리 이내로 입력해주세요.');
    }else if(pw.search(/\s/) != -1){
        $('#newPwdDiv').html('비밀번호는 공백 없이 입력해주세요.');        
    }else if(num < 0 || eng < 0 || spe < 0 ){
        $('#newPwdDiv').html('비밀번호는 영문,숫자, 특수문자를 혼합하여 입력해주세요.');
         
	}else if($('#newPwdCheck').val()==''){
		$('#check_alert').show();
		$('#check_alert').html('새로운 비밀번호를 재입력해주세요.');
		$('#check_alert').css('color','red');
		$('#check_alert').css('font-size','8px');
		
 	}else if($('#newPwd').val()!=$('#newPwdCheck').val()){		
		$('#check_alert').show();
		$('#check_alert').html('입력하신 비밀번호가 새로운 비밀번호와 일치하지 않습니다.');
		$('#check_alert').css('color','red');
		$('#check_alert').css('font-size','8px');
 	
  	}else if(pwdCheck == false){
		$('#check_alert').show();
		$('#check_alert').html('입력하신 비밀번호가 현재 비밀번호와 일치하지 않습니다.');
		$('#check_alert').css('color','red');
		$('#check_alert').css('font-size','8px');
 	
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