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
	#user_nameDiv, #user_nicknameDiv, #user_emailDiv{
		color: red;
		font-size: 8pt;
		font-weight: bold;
		}
	#emailBtn_check, #mail-check-input_font {
		visibility:hidden;
		}	
		
	</style>
</head>			
<body>

<div class="layout-container">
 	<div class="main">
 		<jsp:include page="/WEB-INF/user/userSideBar.jsp"/>
 		
				<div id="create-user" class="content clearfix" role="main">
				    <h3 class="content-header">회원 정보 수정</h3>
				    <div class="col-md-6 main-block-left">
				        <div class="panel panel-default"> 				        
				            <!-- upadate form start -->
		 		            <form id="updateForm" class="form-signup form-user panel-body">	           		
					            <div class="panel-heading">                      
					                			            
									<div class="avatar clearfix avatar-medium">				
											<!-- 이동 경로가 회원번호 같은디? img src 넣기! -->	
											<a href="/user/info/" class='avatar-photo'><img src="/semiproject/storage/${sessionScope.memImg}" id="show_user_image"/></a>
											<div class="avatar-info">
													<a class="user_nickname" href="/user/info/" title=""></a>
													<!-- <div class="activity block"><span class="fa fa-flash"></span> 10</div> 활동지수 삭제?-->
											</div>
									</div>																	
						           			<a id="edit-picture-btn">변경</a>	
						           			<input type="file" style="display:none;" name="user_image" accept="image/gif, image/jpg, image/jpeg, image/png" id="user_image">		  						           	
				                 			
					            </div><!-- panel-heading -->			            
		            				<div class="alert alert-danger" id="check_alert">		                
	              					</div>
				                <fieldset>
				                    <div class="form-group">
				                        <label class="control-label" for="user_name">이름</label>
				                        <input type="text" name="user_name" class="form-control input-sm" placeholder="이름" required="" value="" id="user_name">
				                    	<div id="user_nameDiv"></div>
				                    </div>
				                    <div class="form-group">
				                        <label class="control-label" for="user_nickname">닉네임</label>
				                        <input type="text" name="user_nickname" class="form-control input-sm" placeholder="닉네임" required="" value="" id="user_nickname">
				                        <input type="hidden" name="user_nickname_check" id="user_nickname_check" value="">		                        
			                        	<div id="user_nicknameDiv"></div>
			                        </div>
				                    <div class="form-group">
				                        <label class="control-label" for="class_academy">학원명</label>
				                        <input type="text" name="class_academy" class="form-control input-sm" placeholder="학원명" required="}" value="" id="class_academy">       
			             
			                        </div>
				                    <div class="form-group">
				                        <label class="control-label" for="class_class">과정명</label>
				                        <input type="text" name="class_class" class="form-control input-sm" placeholder="과정명" required="" value="" id="class_class">
	
			                        </div>
			                        		                        			                    
				                    <!-- email 폼 이동-->
					               	<div class="form-group">
					               		<div class="email-edit">
						               		<div class="row">
						               			<div class="col-md-8">
							                    	<label class="control-label" for="user_email">이메일 주소</label>
								               		<!-- <div class="field-subtitle"></div> -->
							               			<input type="email" name="user_email" class="form-control input-sm" placeholder="이메일" required="" value="" id="user_email">
							               			<!-- 연수 이메일 중복체크  추가(0708)  -->
							               			<input type="hidden" name="user_email_check" id="user_email_check" value="">
						               			</div>
						               			<div class="col-md-4">							               			
				                                    <label for="emailBtn" class="form-label" id="emailBtn_check">인증번호</label>				                                       			
													<button class="btn btn-primary" type="button" id="emailBtn">인증번호 전송</button>
												</div>	
					               		   </div>
				               		 
						               		<div class="row" id="num_check_blank">
								            	<div class="col-md-8">
								              		<label for="user_email_check_number"  class="form-label" id="input_num"></label>
										        	<input type="text" class="form-control" id="user_email_check_number"placeholder="인증번호 6자리를 입력하세요" disabled="disabled" maxlength="6">
								            	</div>
								           		<div class="col-md-4">
													<label for="mail-check-input" class="form-label" id="mail-check-input_font">인증번호</label>
											  		<button class="btn btn-success" type="button" id="mail-check-input" >인증번호 인증</button>
								            	</div>		            	
						               		</div><!--num_check_blank  -->
						        			<div id="user_emailDiv" ></div>
					            		 </div> <!-- email-edit -->
				               		</div> <!--  form-group  -->                
				                </fieldset>
				                <input type="button" class="btn btn-primary btn-block" id="userUpdateBtn" value="정보 수정">
				            </form>
			
				        </div><!-- panel panel-default -->
			       
				        <div class="panel panel-default">				            
				                <a href="/semiproject/user/userPasswordChange" class="btn btn-info btn-block">비밀번호 변경</a>
				                <a href="/semiproject/user/userDeleteConfirm" class="btn btn-default btn-block">회원 탈퇴</a>				           
				        </div>
				    </div><!-- col-md-6 main-block-left --> 	   
				</div><!-- create-user -->  
		
		 <jsp:include page="/WEB-INF/global/footer.jsp"/>
   </div> <!-- main -->   
</div> <!-- layout-container -->

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$('#check_alert').hide();
//회원정보 수정 - 데이터가져오기(유저/클래스 통합 DTO로 받아오자)
$(function(){
	$.ajax({
		type: 'post',
		url: '/semiproject/user/getUser',
		dataType: 'json',
		success: function(data){
			//alert(JSON.stringify(data));
		
 			//$('#show_user_img').val(data.user_img);			
			$('#user_name').val(data.user_name);
			$('#user_nickname').val(data.user_nickname);
			//$('#class_academy').val(data.class_academy);
			//$('#class_class').val(data.class_class);
			$('#user_email').val(data.user_email); 
		},
		error: function(err){
			console.log(err);
		}
	});
});   

//이미지 업로드 
$(function(){
	$('#edit-picture-btn').click(function(){
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
				$('#show_user_image').attr('src', e.target.result); 
			}			
			reader.readAsDataURL(input.files[0]);
		}
	}	
});

//이미지 업로드 끝

/* @@@@ 이렇게가 진짜(0708) @@@@ */
/*닉네임 중복체크*/
$('#user_nickname').focusout(function(){
	$('#check_alert').hide();
	
	if( $('#user_nickname').val() == ''){
		$('#check_alert').show();
		$('#check_alert').html('[닉네임]: 닉네임 먼저 입력해주세요.');
		$('#check_alert').css('color','red');
		$('#check_alert').css('font-size','8px');
	}else{
		$.ajax({
			type: 'post',
			url:'/semiproject/user/userSignup_nicknameCheck',
			data: {'user_nickname' : $('#user_nickname').val()}, 
			dataType: 'text', 
			success: function(data){
				//data = data.trim();
				//alert(data);
				if(data=='exist'){
					$('#check_alert').show();
					$('#check_alert').html('[닉네임]: 이미 사용하고 있는 닉네임입니다.');
					$('#check_alert').css('color', 'red');
					$('#check_alert').css('font-size', '8px');
					$('#emailBtn').attr('disabled',true);
					
				}else if(data=='non exist'){
					$('#check_alert').show();
					$('input[name="user_nickname_check"]').val($('#user_nickname').val());
					$('#check_alert').html('[닉네임]: 사용 가능한 닉네임입니다.');
					$('#check_alert').css('color', 'blue');
					$('#check_alert').css('font-size', '8px');
					$('#emailBtn').attr('disabled',false);
				}
			},
			error: function(err){
				console.log(err);
			}
		});
	}		
});

/*이메일 중복체크*/
$('#user_email').focusout(function(){
	$('#check_alert').hide();
	
	if( $('#user_email').val() == ''){
		$('#check_alert').show();
		$('#check_alert').html('[이메일]: 이메일 먼저 입력해주세요.');
		$('#check_alert').css('color','red');
		$('#check_alert').css('font-size','8px');
	}else{
		$.ajax({
			type: 'post',
			url:'/semiproject/user/userSignup_emailCheck',
			data: {'user_email' : $('#user_email').val()}, 
			dataType: 'text', 
			success: function(data){
				//data = data.trim();
				//alert(data);
				if(data=='exist'){
					$('#check_alert').show();
					$('#check_alert').html('[이메일]: 이미 사용하고 있는 이메일입니다.');
					$('#check_alert').css('color', 'red');
					$('#check_alert').css('font-size', '8px');
					$('#emailBtn').attr('disabled',true);
					
				}else if(data=='non exist'){
					$('#check_alert').show();
					$('input[name="user_email_check"]').val($('#user_email').val());
					$('#check_alert').html('[이메일]: 사용 가능한 이메일입니다.');
					$('#check_alert').css('color', 'blue');
					$('#check_alert').css('font-size', '8px');
					$('#emailBtn').attr('disabled',false);
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
	console.log('완성된 이메일 : ' + $('#user_email').val()); // 이메일 오는지 확인
	
	if($('#user_email').val() == ''){
		$('#check_alert').show();
		$('#check_alert').html('이메일을 입력하세요');
		$('#check_alert').css('color','red');
		$('#check_alert').css('font-size','8px');
	}else{
	
	$.ajax({
		type : 'get',
		url : '/semiproject/user/mailCheck?user_email='+$('#user_email').val(), // GET방식이라 Url 뒤에 email을 붙일수있다.
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
		$resultMsg.html('인증번호가 일치합니다.');
		$resultMsg.css('color','blue');
		$resultMsg.css('font-size','8px');
		$('#emailBtn').attr('disabled',true);
		$('#user_email').attr('readonly',true);
		mailnumCheck = true;
	}else{
		$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요.');
		$resultMsg.css('color','red');
		$resultMsg.css('font-size','8px');
		mailnumCheck = false;
	}
});  
	
$('#userUpdateBtn').click(function(){	
	$('#check_alert').hide();
	if($('#user_name').val()=='') {
		$('#check_alert').show();
		$('#check_alert').html('이름을 입력하세요');
		$('#check_alert').css('color','red');
		$('#check_alert').css('font-size','8px');
	}
	else if($('#user_nickname').val()=='') {
		$('#check_alert').show();
		$('#check_alert').html('닉네임을 입력하세요');
		$('#check_alert').css('color','red');
		$('#check_alert').css('font-size','8px');
	}
	else if($('#user_nickname').val() != $('input[name="user_nickname_check"]').val()){
		$('#check_alert').show();
		$('#check_alert').html('[닉네임] : 닉네임 중복체크하세요.');
		$('#check_alert').css('color','red');
		$('#check_alert').css('font-size','8pt');
	}	
	else if($('#user_email').val()=='') {
		$('#check_alert').show();
		$('#check_alert').html('이메일을 입력하세요');
		$('#check_alert').css('color','red');
		$('#check_alert').css('font-size','8px');
	}	
	else if(!mailnumCheck){
		alert("이메일 인증을 완료하세요!");
		$('#check_alert').show();
		$('#check_alert').html('이메일 인증을 완료하세요');
		$('#check_alert').css('color','red');
		$('#check_alert').css('font-size','8px');
		
	}else if($('#user_email').val() != $('input[name="user_email_check"]').val()){
		$('#check_alert').show();
		$('#check_alert').html('[이메일] : 이메일 중복체크하세요.');
		$('#check_alert').css('color','red');
		$('#check_alert').css('font-size','8pt');			
	
	}else {
 		var formData = new FormData($('#updateForm')[0]);
		
		$.ajax({
			type: 'post',
			url: '/semiproject/user/update',
			enctype: 'multipart/form-data',
			processData: false,
			contentType: false,
			data: formData,
			success: function(){
				alert('회원정보 수정을 완료하였습니다.');
				setTimeout("location.href='/semiproject/user/userLoginForm'",300);
				//location.href = "/semiproject/";
			},
			error: function(err) {
				console.log(err);
			}				
		}); 
	}
});
/* @@@@ 이렇게가 진짜(0708) @@@@ */


</script>
</body>
</html>