$('#num_check_blank').hide();
$('#check_alert').hide();

/*
$(function(){
	
	//프로필 설정
	$('#camera_icon_div').click(function(){
		$('#user_image').trigger('click');
	});
	
	$('#user_image').on('change',function(){
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
			reader.onload=function(e){ 
				$('#basic_profile_img').attr('src', e.target.result); 
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
});*/

/*이메일 정규식*/


/*이메일 중복체크*/
$('#user_email').focusout(function(){
	$('#check_alert').hide();
	
	var regExp =/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	///^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if( $('#user_email').val() == ''){
		$('#num_check_blank').hide();
		$('#check_alert').show();
		$('#check_alert').html('[이메일]: 이메일 먼저 입력해주세요.');
		$('#check_alert').css('color','red');
		$('#check_alert').css('font-size','8px');
		
	}
	else if($('#user_email').val().match(regExp) == null){
		$('#num_check_blank').hide();
		$('#check_alert').show();
		$('#check_alert').html('[이메일]: 이메일 형식이 올바르지 않습니다.');
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
					$('#num_check_blank').hide();
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
					
				}else if(data=='non exist'){
					$('#check_alert').show();
					$('input[name="user_nickname_check"]').val($('#user_nickname').val());
					$('#check_alert').html('[닉네임]: 사용 가능한 닉네임입니다.');
					$('#check_alert').css('color', 'blue');
					$('#check_alert').css('font-size', '8px');
				}
			},
			error: function(err){
				console.log(err);
			}
		});
	}		
});

/*아이디 수 세기*/
/*$("#user_id").keyup(function(e) {
	var content = $(this).val();
	$("#countId").val("(" + content.length + "/ 20)"); //실시간 글자수 카운팅
	$("#countId").css('font-size','8px');
	if (content.length > 20) {
		$(this).val(content.substring(0, 20));
		$('#countId').html("(200 / 최대 20자)");
	}
});*/

/*비밀번호 제약조건*/

/*$('#user_pwd').focusout(function(){
	
	 var pw = $("#user_pwd").val();
	 var num = pw.search(/[0-9]/g);
	 var eng = pw.search(/[a-z]/ig);
	 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
	 if(pw.length < 8 || pw.length > 20){
		 
		$('#user_pwdDiv').html('8자리 ~ 20자리 이내로 입력해주세요.');
		$('#user_pwdDiv').css('color','red');
		$('#user_pwdDiv').css('font-size','8px');
		  
		 }else if(pw.search(/\s/) != -1){
			$('#user_pwdDiv').html('비밀번호는 공백 없이 입력해주세요.');
			$('#user_pwdDiv').css('color','red');
			$('#user_pwdDiv').css('font-size','8px');
		
		 }else if(num < 0 || eng < 0 || spe < 0 ){
			$('#user_pwdDiv').html('영문,숫자, 특수문자를 혼합하여 입력해주세요.');
			$('#user_pwdDiv').css('color','red');
			$('#user_pwdDiv').css('font-size','8px');
		  
		 }else {
			 $('#user_pwdDiv').val('사용가능');
			 $('#user_pwdDiv').css('color','blue');
			$('#user_pwdDiv').css('font-size','8px');
		 
		 }
	
});*/

/*메일 인증*/
var code = "";
var mailnumCheck = false;

$('#emailBtn').click(function(){
	
	$('#check_alert').hide();
	
	console.log('완성된 이메일 : ' + $('#user_email').val()); // 이메일 오는지 확인
	
	if($('#user_email').val() == ''){
		$('#check_alert').show();
		$('#check_alert').html('[이메일]: 이메일을 입력하세요.');
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

$('#mail-check-input').click(function () {
	
	$('#check_').hide();
	console.log(code);
	var inputCode = $(this).val();
	var $resultMsg = $('#check_alert');
	
	if($('#user_email_check_number').val() == code){
		$('#check_alert').show();
		$resultMsg.html('[이메일 인증]: 인증번호가 일치합니다.');
		$resultMsg.css('color','blue');
		$resultMsg.css('font-size','8px');
		$('#emailBtn').attr('disabled',true);
		$('#user_email').attr('readonly',true);
		mailnumCheck = true;
		$('#num_check_blank').hide();
	}else{
		$('#check_alert').show();
		$resultMsg.html('[이메일 인증]: 인증번호가 불일치 합니다. 다시 확인해주세요.');
		$resultMsg.css('color','red');
		$resultMsg.css('font-size','8px');
		mailnumCheck = false;
	}
});

/*회원가입 버튼 눌렀을떄~*/
/*버튼을 눌렀을때~*/

$('#signUpBtn').click(function(){
		$('#check_alert').hide();
		
		var pw = $("#user_pwd").val();
		 var num = pw.search(/[0-9]/g);
		 var eng = pw.search(/[a-z]/ig);
		 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		
		
		if($('#user_name').val() == ''){
			$('#check_alert').show();
			$('#check_alert').html('[이름] : 이름을 입력하세요.');
			$('#check_alert').css('color','red');
			$('#check_alert').css('font-size','8px');
		}
		else if($('#user_email').val() == ''){
			$('#num_check_blank').hide();
			$('#check_alert').show();
			$('#check_alert').html('[이메일] : 이메일을 입력하세요.');
			$('#check_alert').css('color','red');
			$('#check_alert').css('font-size','8px');
			
		}
		else if($('#user_email').val() != $('input[name="user_email_check"]').val()){
			$('#num_check_blank').hide();
			$('#check_alert').show();
			$('#check_alert').html('[이메일] : 이메일 중복체크하세요.');
			$('#check_alert').css('color','red');
			$('#check_alert').css('font-size','8pt');
		}
		else if(mailnumCheck == false){
			$('#num_check_blank').hide();
			$('#check_alert').show();
			$('#check_alert').html('[이메일] : 이메일 인증을 하세요.');
			$('#check_alert').css('color','red');
			$('#check_alert').css('font-size','8px');
		}
		else if($('#user_pwd').val() == ''){
			$('#check_alert').show();
			$('#check_alert').html('[비밀번호] : 비밀번호를 입력하세요.');
			$('#check_alert').css('color','red');
			$('#check_alert').css('font-size','8px');
		}
		else if(pw.length < 8 || pw.length > 20){
			$('#check_alert').show();
			$('#check_alert').html('[비밀번호] : 8자리 ~ 20자리 이내로 입력해주세요.');
			$('#check_alert').css('color','red');
			$('#check_alert').css('font-size','8px');
			
		}
		else if(pw.search(/\s/) != -1){
			$('#check_alert').show();
			$('#check_alert').html('[비밀번호] : 비밀번호는 공백 없이 입력해주세요.');
			$('#check_alert').css('color','red');
			$('#check_alert').css('font-size','8px');
			
		}
		else if(num < 0 || eng < 0 || spe < 0 ){
			$('#check_alert').show();
			$('#check_alert').html('[비밀번호] : 영문,숫자,특수문자를 혼합하여 입력해주세요.');
			$('#user_pwdDiv').html('영문,숫자, 특수문자를 혼합하여 입력해주세요.');
			$('#user_pwdDiv').css('color','red');
			$('#user_pwdDiv').css('font-size','8px');
			
		}
		else if($('#user_nickname').val() == ''){
			$('#check_alert').show();
			$('#check_alert').html('[닉네임] : 닉네임을 입력하세요.');
			$('#check_alert').css('color','red');
			$('#check_alert').css('font-size','8px');
		}	
	
		else if($('#user_nickname').val() != $('input[name="user_nickname_check"]').val()){
			$('#check_alert').show();
			$('#check_alert').html('[닉네임] : 닉네임 중복체크하세요.');
			$('#check_alert').css('color','red');
			$('#check_alert').css('font-size','8pt');
		}
		
		/* @@@연수 이메일 수신 동의 삭제(220711)@@@ */
	/*	else if(!$('input[name="flexCheckChecked"]').is(':checked')){
			$('#check_alert').show();
			$('#check_alert').html('[이메일 수신] : 이메일 수신에 동의해주세요.');
			$('#check_alert').css('color','red');
			$('#check_alert').css('font-size','8px');
			
		}*/

		else{
			//$('#userSignupWriteForm').submit();
	 		var formData = new FormData($('#userSignupWriteForm')[0]);
			
			$.ajax({
				type: 'post',
				url: '/semiproject/user/user_register',
				enctype: 'multipart/form-data',
				processData: false,
				contentType: false,
				data: formData,
				success: function(){
					alert("회원가입을 완료하였습니다.\n로그인 하세요.");
					location.href='/semiproject/user/userLoginForm';
				},
				error: function(err) {
					console.log(err);
				}				
			}); 
		}//else
			
		
});

