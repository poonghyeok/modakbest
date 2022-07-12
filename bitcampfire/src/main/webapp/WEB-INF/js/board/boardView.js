// View 에서 새글쓰기 버튼 눌렀을때-> 로그인 먼저
$('#boardWriteBtn').click(function(){ // 상세페이지에서 새글쓰기 버튼 눌렀을때
	
	if (!$('#memEmail').val()) {
		alert('먼저 로그인하세요.');
		location.href = "/semiproject/user/userloginForm";
	} else {
		location.href = "/semiproject/board/write";
	}
})

// 추천수 올리기
$('.note-vote-btn').click(function(){
	
	var vote_uid = $('#memId').val();  
	var vote_bid = $('#board_id').val(); // 게시글 번호
	
	//console.log("추천수 유저 : " + vote_uid  + "게시물번호 : " + vote_bid );
	
	var sendData  = {"vote_uid":vote_uid, "vote_bid":vote_bid}
	//console.log("sendData 유저" + sendData )
		$.ajax({
			
			type : 'get',
			url : "/semiproject/board/recommend", 
			data : sendData,
				//JSON.stringify(sendData),
			dataType : 'text', 
			success : function(sendData) {
				location.reload();
				/*if (recommendCheck == 0) {
					alert("추천완료");
					location.reload();
				} else {
					alert("추천을 취소하시겠습니까?");
					location.reload();
			} // else
*/			
		}, error: function (error) {
            console.log("ERROR!!!");
        	} 
		}); 
	}) 
