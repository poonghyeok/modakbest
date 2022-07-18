//연수: 로그인 엔터키 이벤트 수정(220712)
$(document).ready(function() {
	$('input').on('keyup', function(e){
		if(e.keyCode == 13) {
			//alert('엔터키 눌렀다!');
			$('#findPwdButton').trigger('click');			
		}
	});
});

var code = "";
var mailnumCheck = false;

$(function(){
	$('#alertDiv').hide();
	
	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		
		$('#findPwdButton').click(function(){
			$('#alertDiv').hide();
			
			//console.log('완성된 이메일 : ' + $('#user_email').val()); // 이메일 오는지 확인	
			
			if($('#user_email').val() == '') {
				$('#alertDiv').show();
				$('#alertDiv').html('[이메일] : 가입하신 이메일을 입력하세요')
				$('#alertDiv').css('color', 'red');
				$('#alertDiv').css('font-size', '8pt');
				
			}
			else if($('#user_email').val().match(regExp) == null) {
				$('#alertDiv').show();
				$('#alertDiv').html('[이메일] : 이메일 형식이 올바르지 않습니다.')
				$('#alertDiv').css('color', 'red');
				$('#alertDiv').css('font-size', '8pt');
				
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
							
							$.ajax({
								type : 'get',
								url : '/semiproject/user/pwdFindmailCheck?user_email='+$('#user_email').val(),
								success : function (data) {
									//console.log("data : " +  data);
									code = data;
									alert('메일을 전송했습니다.\n메일에 들어가서 링크를 클릭하세요.');
								},
								error: function(err){
									console.log(err);
								}
							})	
							
							
						}else if(data=='non exist'){
							$('#alertDiv').show();
							$('input[name="user_email_check"]').val($('#user_email').val());
							$('#alertDiv').html('[이메일]: 존재하지 않는 이메일입니다.');
							$('#alertDiv').css('color', 'red');
							$('#alertDiv').css('font-size', '8px');
						}
					},
					error: function(err){
						console.log(err);
					}
				});
			}
			
				
		});
		
		//메일이 존재하는지 여부도 구현해야함.
});