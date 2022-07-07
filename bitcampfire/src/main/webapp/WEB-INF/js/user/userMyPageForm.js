$(function(){
	$.ajax({
		type: 'post',
		url: '/semiproject/user/getUserInformation',
		dataType: 'json',
		success: function(data){
			alert(JSON.stringify(data) );
			$('#myEmail').html(data.user_email);
			$('#myProfile').val(data.user_img);
		},
		error : function(err){
				console.log(err);
		}
	});
});