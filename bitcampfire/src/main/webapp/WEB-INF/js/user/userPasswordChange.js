//비밀번호 유효성검사
$('#check_alert').hide();
var pwdCheck = false;

$('#user_pwd').focusout(function(){
	$('#check_alert').hide();
 	if($('#user_pwd').val()!=null){
		$.ajax({ 
			url: '/semiproject/user/checkPwd',
			type: 'post',
			data: {'user_pwd' : $('#user_pwd').val()},
			dataType: 'text',			
			success: function(data){
				//alert(JSON.stringify(data));
				//console.log(data.user_pwd !== $('#user_pwd').val());
				
				if(data == 'fail') {
					$('#check_alert').show();
					$('#check_alert').html('[비밀번호] : 입력하신 비밀번호가 현재 비밀번호와 일치하지 않습니다.');
					$('#check_alert').css('color','red');
					$('#check_alert').css('font-size','8px');
					pwdCheck = false;
				}else {
					$('#check_alert').show();
					$('#check_alert').html('[비밀번호] : 입력하신 비밀번호가 현재 비밀번호와 일치합니다.');
					$('#check_alert').css('color', 'blue');
					$('#check_alert').css('font-size', '8px');
					pwdCheck = true;
				}	
			},
			error: function(err){
				console.log(err);
			}
		});
 	}
});

$('#userPwdChangeBtn').click(function(){
	$('#check_alert').hide();
    var pw = $("#newPwd").val();
    var num = pw.search(/[0-9]/g);
    var eng = pw.search(/[a-z]/ig);
    var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
	if($('#user_pwd').val()=='') {
		$('#check_alert').show();
		$('#check_alert').html('[비밀번호] : 현재 비밀번호를 입력해주세요.');
		$('#check_alert').css('color','red');
		$('#check_alert').css('font-size','8px');	
	
	}else if($('#newPwd').val()=='') {
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
 	
  	}else if(pwdCheck == false){
		$('#check_alert').show();
		$('#check_alert').html('[비밀번호] : 입력하신 비밀번호가 현재 비밀번호와 일치하지 않습니다.');
		$('#check_alert').css('color','red');
		$('#check_alert').css('font-size','8px');
 	
    }else {    	 	
		 $.ajax({
			type: 'post',
			url: '/semiproject/user/pwdChangeComplete',
			data: 'user_pwd='+$('#newPwd').val(),
			success: function(){
				alert('비밀번호 변경을 완료하였습니다.');
				location.href = "/semiproject/user/userUpdateForm"; 
			},
			error: function(err){
				console.log(err);
			} 
		}); 
	}
});
