// View 에서 새글쓰기 버튼 눌렀을때-> 로그인 먼저
$('#boardWriteBtn').click(function(){ // 상세페이지에서 새글쓰기 버튼 눌렀을때
	
	if (!$('#memEmail').val()) {
		alert('먼저 로그인하세요.');
		location.href = "/semiproject/user/userLoginForm";
	} else {
		location.href = "/semiproject/board/write";
	}
})

// 추천수 올리기
$('.note-vote-btn').click(function(){
	
	/*var vote_uid = $('#note-evaluate-assent-2853281').val();*/
	var vote_uid = $('#board_watcher').val(); //세션 유저아이디
	var vote_bid = $('#board_id').val(); // 게시글 번호
	var vote_cateid = $('#board_cateid').val(); //카테 번호
	
	console.log("추천수 유저 : " + vote_uid  + "게시물번호 : " + vote_bid + "글 카테 번호 : " + vote_cateid);
	
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
				alert("추천완료");
				location.reload();
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
        console.log("ERROR!!!");
    	} 
	}); 
}) 

	$('#boardUpdate').click(function(){  // 글 수정
		
		var board_id = $('#board_id').val();
		alert("글수정 board_id = " + board_id);
		
		$.ajax({
			type : 'get',
			url : "/semiproject/board/boardEditForm", // 요청될 주소 
			data : {board_id : board_id},  // "board_id=" + board_id // 글번호를 가지고가서
			dataType : "json", // dto 받아와
			success : function(data) {
				let url = "/semiproject/board/boardEdit";
				location.replace(url);
			}, error : function(err) {
				console.log(err);
			}
		})
	})
	
	
	$('#boardDelete').click(function(){
		
		var board_id = $('#board_id').val();
		alert("삭제? board_id = " + board_id)
		
		$.ajax({
			type : 'get',
			url : "/semiproject/board/boardDelete",
			data : {board_id : board_id},
			success: function() {
				alert("글이 삭제되었습니다.")
			}, error : function(err) {
				console.log(err);
			}
				
		})
	})
		
	
		
