/* 이메일 로그인 회원 로그아웃 */
$('#logoutBtn1').click(function(){
	$.ajax({
		type: 'post',
		url: '/semiproject/user/logout',
		success: function(data){
			alert("로그아웃 되었습니다.")
			location.href = "/semiproject/";
			},
			error: function(err){
				console.log(err);
			},
		});
	});