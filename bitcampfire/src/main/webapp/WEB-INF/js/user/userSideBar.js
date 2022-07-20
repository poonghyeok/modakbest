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


////////////////////////유진추가0715//////////////////////////////

$('#class_boardBtn').click(function(){
if($('#memEmail').val() == ''){
alert("로그인이 필요한 게시판입니다.");
location.href = "/semiproject/user/userLoginForm";
}
else if($('#memUser_classid').val()=='' || $('#memUser_classid').val()=='0'){
alert("학원 전용 게시판입니다.\n이용을 원하시면 학원을 등록하세요.");
location.href = "/semiproject/user/userUpdateForm";
}
else {
location.href = "/semiproject/board/boardClassList?class_id="+$('#memUser_classid').val();
}
});

