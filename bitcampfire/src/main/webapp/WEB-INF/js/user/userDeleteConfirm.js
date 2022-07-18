$('#userDeleteBtn').click(function(){
	$.ajax({
		type: 'post',
		url: '/semiproject/user/delete',
		//data: {user_email: + $('#user_email').val()},
		success: function(){
			location.href = '/semiproject/user/userDeleteComplete';
		},
		error: function(err){
			console.log(err);
		}
	});
});