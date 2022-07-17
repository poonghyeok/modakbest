$('#check_alert').hide();  

//로그인 엔터키 이벤트 
$(document).ready(function() {
	$('input').on('keyup', function(e){
		if(e.keyCode == 13) {
			$('#btnUserLogin').trigger('click');			
		}
	});
});
 
//로그인 
$('#btnUserLogin').click(function(){

	$('#check_alert').hide();	
	//이메일 정규식
	var regExp =/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    
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