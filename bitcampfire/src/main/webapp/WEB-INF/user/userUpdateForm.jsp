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
	<!-- @@@ 연수 : 학원 검색 기능 수정중(0711) - selectbox 검색기능 @@@   -->
	<link rel="stylesheet" href="/semiproject/css/user/select2.css">
</head>			
<body>

<div class="layout-container">
 	<div class="main">
 		<jsp:include page="/WEB-INF/user/userSideBar.jsp"/>
 		
				<div id="create-user" class="content clearfix" role="main">
				<input type="hidden" id="user_social" value="${sessionScope.memSocial}">
				
				    <h3 class="content-header">회원 정보 수정</h3>
				    <div class="col-md-6 main-block-left">				    
				        <div class="panel panel-default">				                    		
				            <div class="panel-heading"> 				            
									<div class="avatar clearfix avatar-medium">											
										<a href="/semiproject/user/userMyPageForm" class='avatar-photo'><img src="/semiproject/storage/userprofile/${sessionScope.memImg}" id="show_user_image"/></a>
										<div class="avatar-info">
												<a class="user_nickname" href="/user/info/" title="">${sessionScope.memNickname}</a>
												<!-- <div class="activity block"><span class="fa fa-flash"></span> 10</div> 활동지수 삭제?-->
										</div>
									</div>				
																					
				           			<a id="edit-picture-btn">변경</a>					           				  						           	
	           			
					            <!-- user_imgUpdateForm -->
			           			<form id="update_userImgForm">				           			
			           				<div class="profile-picture-list" style="display:none; width: 153px;" id="user_imglist">			   						
					           			<div class="profile-picture selected" style="width: 130px;"><!-- id=profile-uploaded-image -->
						   					<span class="avatar-photo"><img src="/semiproject/storage/userprofile/${sessionScope.memImg}" id="uploaded_user_image"/></span>
						   					<span style="font-size: 15px;">my profile</span>
					   					</div> 
					   					
					   					<input type="button" class="btn btn-primary" id="profile-upload-btn" style="font-size: 12px; width: 130px; margin-bottom: 5px;" value="이미지 업로드">
					  					<input type="file" style="display:none;" name="user_image" accept="image/gif, image/jpg, image/jpeg, image/png" id="user_image"> <!-- files / profileImage -->
					  					
					  					<input type="button" class="btn btn-success picture-confirm-btn" id="update_userImgBtn" style="font-size: 12px; width: 130px;" value="확인" >
			           				</div><!-- profile-picture-list -->
	                 			</form>			            
					            
					            </div><!-- panel-heading -->
					            
			                <fieldset>
						       <!-- user_infoUpadateForm start -->			            
	            				<form id="upadate_userInfoForm" class="form-signup form-user panel-body">	
		            				<div class="alert alert-danger" id="check_alert">		                
	              					</div>
				                    <div class="form-group">
				                        <label class="control-label" for="user_name">이름</label>
				                        <input type="text" name="user_name" class="form-control input-sm" placeholder="이름" required="" value="" id="user_name">
				                    </div>								
									<div class="form-group">
										<label class="control-label" for="user_nickname">닉네임</label>
									<div class="row">										
										<div class="col-md-8">							                    	            									
										<input type="text" name="user_nickname" class="form-control input-sm" placeholder="닉네임" required="" value="" id="user_nickname" style="width: 270px">
										<input type="hidden" name="user_nickname_check" id="user_nickname_check" value="">
										</div>
										<div class="col-sm-2 col-xs-offset-1">			                                    		                                       			
										<button class="btn btn-primary btn-xm btn-sm" type="button" id="user_nickname_CheckBtn" style="visibility:visible; font-size:9pt;" disabled>중복체크</button>
										</div>	
									</div>
									</div>
									<div class="row" style="visibility:hidden;">줄맞춤을 위한 공간</div>                 
				                    
				                    <!-- @@@ 연수 : 학원 검색 기능 수정중(0711) @@@ -->		                    
				                    <div class="form-group">				                    					                    				                    
				                        <label class="control-label" for="class_academy">학원명</label>		
					                    <c:if test ="${!empty classList }">
								 		<select name="user_classid" class="form-control input-sm" id="user_classid" >
											<option value="0" selected>==선택안함==</option>							
											<c:forEach items="${classList }" var="classList">
												<option value="${classList.class_id}">${classList.class_academy}</option>
											</c:forEach>
										</select> 
										</c:if>
									</div>
									<!-- @@@ 연수 : 학원 검색 기능 수정중(0711) @@@ -->
			                        
			                        <!-- @@@ 연수 : 과정명 삭제(0711) @@@ -->
				                    <!-- <div class="form-group">
				                        <label class="control-label" for="class_class">과정명</label>
				                        <input type="text" name="class_class" class="form-control input-sm" placeholder="과정명" required="" value="" id="class_class">	
			                        </div> -->				                        
			                        		                                  
				                <input type="button" class="btn btn-primary btn-block" id="update_userInfoBtn" value="정보 수정">
				            	</form>
	                		</fieldset>
				        </div><!-- panel panel-default -->
				    </div><!-- col-md-6 main-block-left -->
				    
			        <div class="col-md-6 main-block-right">				       
				    	<div class="panel panel-default">
				    		<div class="panel-heading">
				                <h5 class="panel-header">이메일 변경</h5>
				            </div>
				            <!-- <div class="panel-body panel-margin"> -->										
				            	<!-- user_emailUpadateForm start -->			            
			            		<form id="upadate_userEmailForm" class="form-signup form-user panel-body" method="post">
			            				<div class="alert alert-danger" id="check_alert_userEmail">		                
  										</div>
					               		<div class="email-edit">
					               			<label class="control-label" for="user_email">이메일 주소</label>
						               		<div class="row">
						               			<div class="col-md-8">							                    	            									
							               			<input type="email" name="user_email" class="form-control input-sm" placeholder="이메일" required="" value="" id="user_email" style="width: 270px">
							               		   	<input type="hidden" name="user_email_check" id="user_email_check" value="">
						               			</div>
						               			<div class="col-sm-1 col-xs-offset-1">			                                    		                                       			
													<button class="btn btn-primary btn-xm btn-sm" type="button" id="emailBtn" style="font-size:9pt;" disabled id="emailCode_kakao">인증번호</button>
												</div>	
					               		   </div>
				               		 
						               		<div class="row" id="num_check_blank">
								            	<div class="col-md-8">							              		
										        	<input type="text" class="form-control input-sm" id="user_email_check_number" placeholder="인증번호 6자리" disabled="disabled" maxlength="6" style="width: 270px">
								            	</div>
								           		<div class="col-sm-1 col-xs-offset-1">													
											  		<button class="btn btn-success btn-xm btn-sm" type="button" id="mail-check-input" style="font-size:9pt;">번호인증</button>
							            	 	</div>		           	
						               		</div><!--num_check_blank  -->
						               		<div id="user_emailDiv" ></div>
					            		 </div> <!-- email-edit -->
									<br>
								<input type="button" class="btn btn-primary btn-block" id="update_userEmailBtn" value="이메일 변경">
								</form>
							<!-- </div>  panel-body panel-margin   -->
				    	</div><!-- panel panel-default -->				    	     
				        <!-- 비밀번호 변경  / 회원탈퇴 -->
		               <div class="panel panel-default">
            				<form class="form-signup form-user panel-body">			 
         				 		<!-- @@@ 연수 수정(220713) 카카오톡 가입자는 노출안됨 @@@ -->        
				                <a href="/semiproject/user/userPasswordChange" class="btn btn-info btn-block" id="pwdChange_kakao">비밀번호 변경</a>				                
				                <a href="/semiproject/user/userDeleteConfirm" class="btn btn-default btn-block">회원 탈퇴</a>				           
				        	</form>
		
				        </div> <!--panel panel-default -->				
			    	</div> <!-- col-md-6 main-block-right -->	
			    	   
			</div><!-- create-user -->  
		 <jsp:include page="/WEB-INF/global/footer.jsp"/>
   </div> <!-- main -->   
</div> <!-- layout-container -->

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- @@@ 연수 : 학원 검색 기능 수정중(0711) - selectbox 검색기능 @@@   -->
<script type="text/javascript" src="/semiproject/js/user/select2.js"></script>
<script type="text/javascript">
//@@@@@@@@@ 연수 : 학원명 검색 기능 적용(0715)
$('#user_classid').select2({});

/* @@@ 카카오톡 가입회원이 사용할 수 없는 기능 추가(220713) */
$(function(){
	if($('#user_social').val()!='X') {

		$('#pwdChange_kakao').click(function(){
			alert('[비밀번호] : 카카오톡 연동 가입회원은 비밀번호 변경이 불가합니다.');
			return false;
		});
		$('#update_userEmailBtn').attr('disabled', true);	
		$('#user_email').attr('disabled', true);
		$('#check_alert_userEmail').show();
		$('#check_alert_userEmail').html('[이메일] : 카카오톡 연동 가입회원은 이메일 변경이 불가합니다.');
		$('#check_alert_userEmail').css('color', 'red');
		$('#check_alert_userEmail').css('font-size', '8px');
	}	
});

$('#check_alert').hide();
$('#check_alert_userEmail').hide();


//회원정보 수정 - 데이터가져오기
$(function(){
	$.ajax({
		type: 'post',
		url: '/semiproject/user/getUser',
		dataType: 'json',
		success: function(data){
			//alert(JSON.stringify(data));		
 					
			$('#user_name').val(data.user_name);
			$('#user_nickname').val(data.user_nickname);
			$('input[name="user_nickname_check"]').val(data.user_nickname);
			$('#user_classid').val(data.user_classid).select2();
			$('#user_email').val(data.user_email); 
			//$('#class_academy').val(data.class_academy);
			//$('#class_class').val(data.class_class);
			
		},
		error: function(err){
			console.log(err);
		}
	});
});   

//프로필 사진 변경
//이미지 업로드 
$(function(){
	$('#edit-picture-btn').click(function(e) {
	    var $list = $('.profile-picture-list');
	       
	    if($list.is(':visible')) {
	        $list.hide();
	    } else {
	        $list.show();
	    }
	    e.preventDefault();       
	});

 	$('#profile-upload-btn').click(function(){		
	   $('#user_image').trigger('click'); 
	});
    	
 	$('#user_image').on('change', function(){
 	   var profileFile = $(this)[0].files[0]; 	   
	   if(profileFile){
	       if (!profileFile.type.startsWith('image/')){ 
	           alert("파일은 이미지만 가능합니다. png, jpg, gif");
	           $(this).val(null);
	           return;
	       } else if(profileFile.size >= 250 * 1000) {
			   alert("파일용량은 최대 250KB까지 가능합니다.");
			   $(this).val(null);
			   return;
	       }  
	   }
       readURL(this);	   
	});
 	
	function readURL(input){ 
		if(input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				$('#uploaded_user_image').attr('src', e.target.result); 
			}			
			reader.readAsDataURL(input.files[0]);
		}
	}
});	
$('#update_userImgBtn').click(function(){	
	var formData = new FormData($('#update_userImgForm')[0]);
	
	$.ajax({
		type: 'post',
		url: '/semiproject/user/update_userImg',
		enctype: 'multipart/form-data',
		processData: false,
		contentType: false,
		data: formData,
		async : false, //풍혁0714 : ajax 를 동기방식으로 변경하기
		success: function(){
			alert('프로필 이미지 변경을 완료하였습니다.');
			$('.profile-picture-list').hide();
			//location.href="/semiproject/user/userUpdateForm";
			//풍혁0714 : sts refresh 설정을 했는데도, 변경 사진이 바로 반영이 안돼서 ajax를 동기방식으로 변경하고 location.href를 밑으로 내려봤습니다. + 대기시간 넉넉히 2초 
			//location.href = "/semiproject/";
		},
		error: function(err) {
			console.log(err);
			return;
		}				
	});
	
	setTimeout("location.href='/semiproject/user/userUpdateForm'",2000);
});


//닉네임 중복체크
$('#user_nickname').change(function(){
	$('#check_alert').hide();	
	$('#user_nickname_CheckBtn').attr('disabled',false);
});

$('#user_nickname_CheckBtn').click(function(){
	$('#check_alert').hide();
	
	if( $('#user_nickname').val() == ''){
		$('#check_alert').show();
		$('#check_alert').html('[닉네임]: 닉네임 먼저 입력해주세요.');
		$('#check_alert').css('color','red');
		$('#check_alert').css('font-size','8px');		
	}else{
		$.ajax({ 
			type: 'post',
			url:'/semiproject/user/userUpdate_nicknameCheck',
			data: {'user_nickname' : $('#user_nickname').val()},				  
			//dataType: 'json', 
			success: function(data){
				//alert(JSON.stringify(data));
				if(data.user_email == $('#user_email').val()){
					$('#check_alert').show();
					$('input[name="user_nickname_check"]').val($('#user_nickname').val());
					$('#check_alert').html('[이메일] : 입력하신 닉네임은 기존에 등록된 닉네임과 동일합니다.');
					$('#check_alert').css('color', 'red');
					$('#check_alert').css('font-size', '8px');
					$('#user_nickname_CheckBtn').attr('disabled',true);
				}else if(data == ""){
					$('#check_alert').show();
					$('input[name="user_nickname_check"]').val($('#user_nickname').val());
					$('#check_alert').html('[닉네임] : 사용 가능한 닉네임입니다.');
					$('#check_alert').css('color', 'blue');
					$('#check_alert').css('font-size', '8px');	
					$('#user_nickname_CheckBtn').attr('disabled',false);
				}else{				
					$('#check_alert').show();
					$('#check_alert').html('[닉네임] : 이미 사용하고 있는 닉네임입니다.');
					$('#check_alert').css('color', 'red');
					$('#check_alert').css('font-size', '8px');
					$('#user_nickname_CheckBtn').attr('disabled',true);
				}
			},
			error: function(err){
				console.log(err);
			}
		});
	}		
});

//@@@ 회원정보수정(이름/닉네임/학원명/과정명) 기능 @@@@
$('#update_userInfoBtn').click(function(){	
	$('#check_alert').hide();
	if($('#user_name').val()=='') {
		$('#check_alert').show();
		$('#check_alert').html('[이름] : 이름을 입력하세요');
		$('#check_alert').css('color','red');
		$('#check_alert').css('font-size','8px');
	}else if($('#user_nickname').val()=='') {
		$('#check_alert').show();
		$('#check_alert').html('[닉네임] : 닉네임을 입력하세요');
		$('#check_alert').css('color','red');
		$('#check_alert').css('font-size','8px');
 	}else if($('#user_nickname').val() != $('input[name="user_nickname_check"]').val()){ 	
		$('#check_alert').show();
		$('#check_alert').html('[닉네임] : 닉네임 중복체크하세요.');
		$('#check_alert').css('color','red');
		$('#check_alert').css('font-size','8pt');	
	}else {
		$.ajax({
			type: 'post',
			url: '/semiproject/user/update_userInfo',
			//data: $('#upadate_userInfoForm').serialize(),
			data: {'user_name' : $('#user_name').val(),
				   'user_nickname' : $('#user_nickname').val(),
				   'user_classid' : $('select[name="user_classid"]').val()},
				   //'class_academy' : $('#class_academy').val(),
				   //'class_class' : $('#class_class').val(),			
			success: function(){
				alert('회원정보 수정을 완료하였습니다.');
				location.href="/semiproject/user/userUpdateForm";
				//location.href = "/semiproject/";
			},
			error: function(err) {
				console.log(err);
			}				
		}); 
	}
});

//@@@ 이메일 변경 기능 @@@@
//이메일 중복체크
$('#user_email').change(function(){
	$('#check_alert_userEmail').hide();
	$('#emailBtn').attr('disabled',false);
		
	var regExp =/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	//var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if($('#user_email').val() == ''){		
		$('#check_alert_userEmail').show();
		$('#check_alert_userEmail').html('[이메일] : 이메일 먼저 입력해주세요.');
		$('#check_alert_userEmail').css('color','red');
		$('#check_alert_userEmail').css('font-size','8px');
	}else if($('#user_email').val().match(regExp) == null){
		$('#check_alert_userEmail').show();
		$('#check_alert_userEmail').html('[이메일] : 이메일 형식이 올바르지 않습니다.');
		$('#check_alert_userEmail').css('color','red');
		$('#check_alert_userEmail').css('font-size','8px');
	}else{
		$.ajax({
			type: 'post',
			url:'/semiproject/user/userUpdate_emailCheck',
			data: {'user_email' : $('#user_email').val()}, 
			//dataType: 'json', 
			success: function(data){				
				//alert(JSON.stringify(data));
				if(data.user_nickname==$('#user_nickname').val()){
					$('#check_alert_userEmail').show();
					$('input[name="user_email_check"]').val($('#user_email').val());
					$('#check_alert_userEmail').html('[이메일] : 입력하신 이메일은 기존에 등록된 이메일과 동일합니다.');
					$('#check_alert_userEmail').css('color', 'red');
					$('#check_alert_userEmail').css('font-size', '8px');
					$('#emailBtn').attr('disabled',true);
				}else if(data==""){
					$('#check_alert_userEmail').show();
					$('input[name="user_email_check"]').val($('#user_email').val());
					$('#check_alert_userEmail').html('[이메일] : 사용 가능한 이메일입니다.');
					$('#check_alert_userEmail').css('color', 'blue');
					$('#check_alert_userEmail').css('font-size', '8px');
					$('#emailBtn').attr('disabled',false);
				}else{
					$('#check_alert_userEmail').show();
					$('#check_alert_userEmail').html('[이메일] : 이미 사용하고 있는 이메일입니다.');
					$('#check_alert_userEmail').css('color', 'red');
					$('#check_alert_userEmail').css('font-size', '8px');
					$('#emailBtn').attr('disabled',true);
				} 
				
			},
			error: function(err){
				console.log(err);
			}
		});
	}	
});

//이메일 인증 	
var code = "";
var mailnumCheck = false;

$('#num_check_blank').hide();

$('#emailBtn').click(function(){		
	$('#user_emailDiv').empty();
	$('#check_alert_userEmail').hide();	
	console.log('완성된 이메일 : ' + $('#user_email').val()); // 이메일 오는지 확인
	
	if($('#user_email').val() == ''){
		$('#check_alert_userEmail').show();
		$('#check_alert_userEmail').html('[이메일] : 이메일을 입력하세요');
		$('#check_alert_userEmail').css('color','red');
		$('#check_alert_userEmail').css('font-size','8px');
	}else{	
		$.ajax({
			type : 'get',
			url : '/semiproject/user/mailCheck_updateEmail?user_email='+$('#user_email').val(), // GET방식이라 Url 뒤에 email을 붙일수있다.
			//data: {'user_email': $('#user_email').val()},
			success : function (data) {
				console.log("data : " +  data);
				$('#user_email_check_number').attr('disabled',false);
				code = data;
				alert('인증번호가 전송되었습니다.');
				$('#num_check_blank').show();
				},
			error: function(err){
				console.log(err);
				}
			}); // end ajax
		}//else
});

$('#mail-check-input').click(function(){
	console.log(code);
	var inputCode = $(this).val();
	var $resultMsg = $('#user_emailDiv');
	
	if($('#user_email_check_number').val() == code){
		$resultMsg.html('[이메일 인증] : 인증번호가 일치합니다.');
		$resultMsg.css('color','blue');
		$resultMsg.css('font-size','8px');
		$('#emailBtn').attr('disabled',true);
		$('#user_email').attr('readonly',true);
		mailnumCheck = true;
		$('#num_check_blank').hide();
	}else{
		$resultMsg.html('[이메일 인증] : 인증번호가 불일치 합니다. 다시 확인해주세요.');
		$resultMsg.css('color','red');
		$resultMsg.css('font-size','8px');
		mailnumCheck = false;
	}
}); 

$('#update_userEmailBtn').click(function(){	
	$('#check_alert_userEmail').hide();	
	if($('#user_email').val()=='') {
		//alert('이메일 입력하세요')
		$('#check_alert_userEmail').show();
		$('#check_alert_userEmail').html('[이메일] : 이메일을 입력하세요');
		$('#check_alert_userEmail').css('color','red');
		$('#check_alert_userEmail').css('font-size','8px');
		
	}else if(!mailnumCheck){
		//alert('이메일 인증을 완료하세요')
		$('#check_alert_userEmail').show();
		$('#check_alert_userEmail').html('[이메일] : 이메일 인증을 완료하세요');
		$('#check_alert_userEmail').css('color','red');
		$('#check_alert_userEmail').css('font-size','8px');
		
	}else if($('#user_email').val() != $('input[name="user_email_check"]').val()){
		$('#check_alert_userEmail').show();
		$('#check_alert_userEmail').html('[이메일] : 이메일 중복체크하세요.');
		$('#check_alert_userEmail').css('color','red');
		$('#check_alert_userEmail').css('font-size','8pt');
		
	}else { 
		$.ajax({
			type: 'post',
			url: '/semiproject/user/update_userEmail',
			data: {'user_email' : $('#user_email').val()}, 			
			//data: $('#upadate_userEmailForm').serialize(),
			async: false,
			success: function(){
				alert('이메일 변경을 완료하였습니다.');
				//setTimeout("location.href='/semiproject/user/userLoginForm'",300);
				location.href="/semiproject/user/userUpdateForm"
				//location.href = "/semiproject/";
				},
			error: function(err) {
				console.log(err);
				}				
		}); 
	}	
});
</script>
</body>
</html>