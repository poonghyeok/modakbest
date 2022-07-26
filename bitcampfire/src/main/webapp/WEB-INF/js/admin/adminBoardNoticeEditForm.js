$(function(){
	
	$.ajax({
		type : 'get',
		url : '/semiproject/admin/getAdminBoardNotice_edit',
		data : {"board_id":$('#board_id').val()},
		success :function(data){
			console.log(JSON.stringify(data));
			$('#board_title').val(data.boardDTO.board_title);
			editor.setData(data.boardDTO.board_content);
			//연수 option value값  기준으로 선택되도록 변경
			$('#board_cateid').val(data.boardDTO.board_cateid).prop('selected', true);
			//$('#category').val(data.boardDTO.board_cateid);
			//관리자는 로그인 정보(본인글 여부)에 상관없이 글을 수정할 수 있게 하려고 로그인 유저의 세션값이 아닌 실제 작성자별 정보를 넣어줌
			$('#user_nicknameDiv').html(data.user_nickname);
			document.getElementById("profile-photo").src = "/semiproject/storage/userprofile/"+data.user_img;
			document.getElementById("user_imgDiv").href="/semiproject/user/userPage?user_id="+data.boardDTO.board_uid;
			document.getElementById("user_nicknameDiv").href="/semiproject/user/userPage?user_id="+data.boardDTO.board_uid;
		},
		error : function(err){
			console.log(err);
		}
	})
});	
 
$(function(){
	$('#adminBoardNoticeUpdateBtn').click(function(){
		const editorData = editor.getData();
		var category = $('#category').val()
		//비엇을때 진해지고 포커스아웃시 풀리고
		
		if($('#board_title').val()==''){
		//	$('#board_title').css('border','2px solid #1fb6ff');
			alert('제목을 입력해주세요.');
			$('#board_title').addClass('empty');
			

		}
		else if(!editor.getData()){
			alert("내용을 입력하세요");
		}
		else if( $('#board_classid option:selected').val()==''){
			alert('카테고리를 선택하세요');
		}
		else{
			//글 등록 전 확인
	        if(!confirm('정말 등록하시겠습니까?')){
	            return false;
	        }	
	        else{
				$.ajax({
					type: 'post',
					url: '/semiproject/admin/adminBoardNoticeUpdate',
					data: {'board_title' : $('#board_title').val(),
						   'board_content' : $('div.ck-blurred').html(),
						   'board_cateid' : $('#board_cateid option:selected').val(),
						   'board_id' : $('#board_id').val()
					},
			       	success: function(){
						alert('게시글을 수정하였습니다.');
			            location.href='/semiproject/admin/getAdminBoardNoticeView?category='+category+'&board_id='+$('#board_id').val();
					},
					error: function(e){
						console.log(e);
						/* 풍혁 0714 success 에서 location.href까지 먹히지 않아서 임시로 error 에도 location href를 써두었습니다~ */
						location.href='/semiproject/admin/getAdminBoardNoticeView?category='+category+'&board_id='+$('#board_id').val();
					}
				});//ajax					
	        }
		}
	});//$('#adminBoardNoticeUpdateBtn').click	
	
	//$('#resetBtn').click(function() 삭제 상단 버튼에서 온클릭으로 이미 처리가 되는 듯(연수_0722)
	
	$('#board_title').focusout(function(){
		$('#board_title').removeClass('empty');
	});
});