// View 에서 새글쓰기 버튼 눌렀을때-> 로그인 먼저
$('#boardWriteBtn').click(function(){ // 상세페이지에서 새글쓰기 버튼 눌렀을때
	if(!$('#board_watcher').val()){
		alert('글을 쓰려면 먼저 로그인을 해주세요.');
		location.href = "/semiproject/user/userLoginForm";
	}else{
		location.href = "/semiproject/board/write?category="+$('#category').val();
	}
})

// 추천수 올리기
$('.note-vote-btn').click(function(){
	
	/*var vote_uid = $('#note-evaluate-assent-2853281').val();*/
	var vote_uid = $('#board_watcher').val(); //세션 유저아이디
	var vote_bid = $('#board_id').val(); // 게시글 번호
	var vote_cateid = $('#board_cateid').val(); //카테 번호
	var board_cateid = $('#board_cateid').val(); //풍혁0719 : 같은 값이지만 헷갈려서 그냥 하나 더 추가했습니다. 
	
	//console.log("추천수 유저 : " + vote_uid  + "게시물번호 : " + vote_bid + "글 카테 번호 : " + vote_cateid);
	
	let sendData  = {"vote_uid" : vote_uid,
					"vote_bid" : vote_bid,
					"vote_cateid" : vote_cateid};
	
	console.log("sendData 유저" + sendData)
	
	$.ajax({
		type : 'get',
		url : "/semiproject/board/recommend", 
		data : sendData,
			//JSON.stringify(sendData),
		dataType : 'text', 
		success : function(sendData) {
			if (sendData == 0) {
				location.href="http://localhost:8080/semiproject/board/getBoardView?category="+$('#category').val()+"&board_id="+$('#board_id').val()+"&pg=1&state=recommend";
		} else{
			if(confirm("추천을 취소하시겠습니까?")){
				$.ajax({
					type : 'get',
					url : "/semiproject/board/recommendCancel",
					data :{"vote_uid" : vote_uid,
						"vote_bid" : vote_bid,
						"vote_cateid" : vote_cateid},
					dataType : 'text',
					async : false, // 비동기화 동작 여부
					success : function() {
						location.href="http://localhost:8080/semiproject/board/getBoardView?category="+$('#category').val()+"&board_id="+$('#board_id').val()+"&pg=1&state=recommendCancel";
					},
					error : function(err){
						console.log(err);
					}
				})
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
			location.href = "/semiproject/board/boardEditForm?category="+$('#category').val()+"&board_id="+$('#board_id').val();
		}
		/*} else {
			location.reload();
			
		}*/
	})
	
// 글 삭제	
	$('#boardDelete').click(function(){
		
		var board_id = $('#board_id').val();
		//풍혁 0719 : 카테고리에 맞게 테이블 반영해야하므로, cateid 추가 
		var cateid = $('#board_cateid').val();
		
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
					url : "/semiproject/board/boardDelete",
					data : {board_id : board_id, cateid : cateid},
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
	