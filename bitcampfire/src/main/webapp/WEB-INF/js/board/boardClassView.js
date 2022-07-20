// View 에서 새글쓰기 버튼 눌렀을때-> 로그인 먼저
$('#boardWriteBtn').click(function(){ // 상세페이지에서 새글쓰기 버튼 눌렀을때 
	if(!$('#board_watcher').val()){
		alert('글을 쓰려면 먼저 로그인을 해주세요.');
		location.href = "/semiproject/user/userLoginForm";
	}else if($('#memClassid').val() != $('#board_classid').val()){
		alert('해당 게시글에 권한이 없습니다.\n다른 게시판을 이용하세요.');
		location.href = "/semiproject/";
		
	}else{
		location.href = "/semiproject/board/classWrite?class_id="+$('#memClassid').val()+"&class_academy="+$('#memClass_academy').val();
	}
})

// 추천수 올리기
$('.note-vote-btn').click(function(){
	
	/*var vote_uid = $('#note-evaluate-assent-2853281').val();*/
	var vote_uid = $('#board_watcher').val(); //세션 유저아이디
	var vote_bid = $('#board_id').val(); // 게시글 번호
	var vote_classid = $('#board_classid').val(); //카테 번호
	
	console.log("추천수 유저 : " + vote_uid  + "게시물번호 : " + vote_bid + "글 카테 번호 : " + vote_classid);
	
	let sendData  = {"vote_uid" : vote_uid,
					"vote_bid" : vote_bid,
					"vote_classid" : vote_classid};
	
	console.log("sendData 유저" + sendData)
	
	$.ajax({
		type : 'get',
		url : "/semiproject/board/boardClassRecommend", 
		data : sendData,
			//JSON.stringify(sendData),
		dataType : 'text', 
		success : function(sendData) {
			if (sendData == 0) {
				alert("추천완료");
				location.reload();
		} else{
			if(confirm("추천을 취소하시겠습니까?")){
				$.ajax({
					type : 'get',
					url : "/semiproject/board/boardClassRecommendCancel",
					data :{"vote_uid" : vote_uid,
						"vote_bid" : vote_bid,
						"vote_classid" : vote_classid},
					dataType : 'text',
					async : false, // 비동기화 동작 여부
					success : function() {
						alert("추천을 취소하였습니다.");
					},
					error : function(err){
						console.log(err);
					}
				})
				location.reload();
			};
		}
	}, error: function (error) {
        console.log("ERROR!!!")
        alert('추천을 하려면 먼저 로그인을 해야합니다')
        location.href = "/semiproject/user/userLoginForm"
    	} 
	}); 
}) 


//글 수정버튼을 눌렀을때 자신의 아이디가 아니면 로그인

	$('#boardUpdateFormBtn').click(function(){ // 수정버튼을 눌렀을떄
		
		/*if (confirm ("글을 수정하시겠습니까?")){*/ // 세션의 아이디가 없으면 로그인
		if(!$('#board_watcher').val()){
			alert("먼저 로그인하세요.")
			location.href = "/semiproject/user/userLoginForm"
		} else if ($('#board_watcher').val() != $('#board_uid').val()){ 
			alert("본인의 글만 수정할 수 있습니다.")
		} else if($('#board_watcher').val() == $('#board_uid').val()){ // 세션의 아이디가 맞으면 (자신의 아이디면) 글 수정 폼 띄우기
			//location.href = "/semiproject/board/boardEditForm?board_id=" + ${board_id};
			location.href = "/semiproject/board/boardClassEditForm?board_id="+$('#board_id').val()+"&class_id="+$('#memClassid').val()+"&class_academy="+$('#memClass_academy').val();
		}
		/*} else {
			location.reload();
			
		}*/
	})
	
// 글 삭제	
	$('#boardDelete').click(function(){
		
		var board_id = $('#board_id').val();

		// alert("글 삭제?")
		if(!$('#board_watcher').val()){
			alert("먼저 로그인하세요 .")
			location.href = "/semiproject/user/userLoginForm";
		}else if ($('#board_watcher').val() != $('#board_uid').val()){
			
			alert("본인의 글만 삭제할 수 있습니다.")
		} else {
			
			if (confirm(" 글을 삭제하시겠습니까?")){

				
				$.ajax({
					type : 'get',
					url : "/semiproject/board/boardClassDelete",
					data : {board_id : board_id},
					success: function() {
						alert("글이 삭제되었습니다.")
						location.href="/semiproject/";
					},
					error : function(err) {
						console.log(err);
					}
				})
			}

		}
	})
	