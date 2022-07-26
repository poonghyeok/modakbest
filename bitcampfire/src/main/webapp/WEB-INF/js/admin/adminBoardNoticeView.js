//관리자가 아니면 뷰-> 에디트 폼으로 갈 수 없도록(공지등록/수정/삭제/취소 못함)
$('#adminNoticeDeleteBtnAtView').hide();
$('#adminNoticeEditBtnAtView').hide();
$('#adminNoticeWriteBtnAtView').hide();
$('#boardListFromAdminNoticeViewBtn').hide();

$(function(){
	//0을 null값으로 인식해서 조건이 적용되지 않음, 찾아보니 Admin 여부 DB(user_grade)에 등록 가능함(관리자: 'A', 일반회원 'U')
	if($('#user_grade').val()=='A'){
		$('#adminNoticeDeleteBtnAtView').show();
		$('#adminNoticeEditBtnAtView').show();
		$('#adminNoticeWriteBtnAtView').show();		
		$('#boardListFromAdminNoticeViewBtn').show();
	}else{
		$('#boardListFromAdminNoticeViewBtn').show();		
	} 
});

//뷰에서 이전 페이지(게시판 목록)으로 가기(일반사용자: 접근게시판별 , 관리자: 공지사항리스트)
$('#boardListFromAdminNoticeViewBtn').click(function(){
	//alert($('#board_category').val());
	//var board_category = $('#board_category').val();
	var category = $('#category').val();
	
	if($('#user_grade').val()!='A'){ //일반 회원 글 수정이 불가하므로 뷰 > 뒤로가기하면 이전페이지(목록)으로 이동
		history.back();		
		//location.href="/semiproject/board/list?category="+board_category+"&pg=1&sortOption=date"; //전체공지(notice)가 갈 곳이 없음	
	}else{ 
		//관리자 수정/삭제 기능  show(뷰 > 수정 전 뒤로가기는 목록, 뷰 > 수정 후 > 뷰 > 뒤로가기는 수정페이지로 이동하는 문제가 있어 일반회원과 방식 다름)
		//관리자 페이지 > 전체 공지 리스트 > 관리자 목록으로 갈 수 있도록 설정
		//@@@각 게시판별 상단 공지> 여기서 수정할 경우 목록 버튼을 누르면 무족권 관리자 페이지로 이동함@@@	
		location.href="/semiproject/admin/adminBoardNoticeList?category="+category+"&pg=1";
	}
	
}); 

//뷰에서 공지등록하러 가기
$('#adminNoticeWriteBtnAtView').click(function(){
	var category = $('#category').val();
	location.href="/semiproject/admin/adminBoardNoticeWriteForm?category="+category; 
});

//뷰에서 글삭제 
$('#adminNoticeDeleteBtnAtView').click(function(){
	
	var board_id = $('#board_id').val();
	var category = $('#category').val();
		
	if (confirm("글을 삭제하시겠습니까?")){			
		$.ajax({
			type : 'post',
			url : "/semiproject/admin/adminNoticeDelete",
			data : {board_id : board_id},
			success: function() {
				alert("글이 삭제되었습니다.")
				location.href="/semiproject/admin/adminBoardNoticeList?category="+category+"&pg=1";
			},
			error : function(err) {
				console.log(err);
			}
		})
	}	
});

//뷰에서 글 수정 : 관리자는 로그인 해야지만(user_grade가 'A'일때) 페이지 접속 가능하기 때문에 로그인 관련 유효성 검사 하지 않음
$('#adminNoticeEditBtnAtView').click(function(){ // 수정버튼을 눌렀을떄
	var board_id = $('#board_id').val();
	var category = $('#category').val();
	
	location.href = "/semiproject/admin/adminBoardNoticeEditForm?category="+category+"&board_id="+ board_id;

});