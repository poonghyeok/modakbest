//@@@글쓰기 : 공지등록
$('#adminNoticeWriteBtnAtList').click(function(){
	var category = $('#category').val();
	location.href="/semiproject/admin/adminBoardNoticeWriteForm?category="+category; 
});

//@@@@@ 체크박스 선택삭제 기능
//전체선택 또는 전체해제, 개별 체크박스 상태변화에 따른 전체선택 및 해제
 $(document).ready(function(){
	$('#all').click(function(){
		if($('#all').prop('checked'))
			$('input[name="check"]').prop('checked', true);
		else
			$('input[name="check"]').prop('checked', false);
	});
	
	 $('input[name="check"]').click(function() {
		var total = $('input[name="check"]').length;
		var checked = $('input[name="check"]:checked').length;
		
		if(total != checked) $("#all").prop("checked", false);
		else $("#all").prop("checked", true); 
	});
  
});  


//선택삭제 :선택한 글 삭제
$('#adminNoticeDeleteBtn_select').click(function(){
	var count = $('input[name="check"]:checked').length;
	
	if(count == 0) {
		alert('삭제할 항목을 선택하세요!');
	}else if(confirm('정말로 삭제하시겠습니까?')){
		$('#adminNoticeListForm').submit();
		alert('선택하신 글을 삭제하였습니다.');
	}
});    
//@@@@@ 체크박스 선택삭제 끝

//개별삭제 
$('.btn-danger').click(function(){
	
	var board_id = $(this).attr('data-id');
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
$('.btn-secondary').click(function(){ // 수정버튼을 눌렀을떄
	var board_id = $(this).attr('data-id');
	var category = $('#category').val();
	
	location.href = "/semiproject/admin/adminBoardNoticeEditForm?category="+category+"&board_id="+ board_id;
});

//검색기능
$('#adminBoardNoticeSearchBtn').click(function(){
	//var category = $('#category').val();
		
	if($('#keyword').val()==''){
		alert('검색어를 입력하세요!')
		location.href = "/semiproject/admin/adminBoardNoticeList?category=admin&pg=1";
	}else{
		let keyword = $('#keyword').val();
		let searchOption = $('#searchOption').val();
		//alert(keyword);
		//alert(searchOption);	
		
		if(keyword){
			//풍혁0714 : searchKeword가 있을 경우
			location.href="/semiproject/admin/adminBoardNoticeSearchList?category="+$('#category').val()+"&searchOption="+searchOption+"&keyword="+keyword;
		}else{
			location.href="/semiproject/admin/adminBoardNoticeList?category="+$('#category').val()+"&pg=1";
		}
	} //else
		
});

//@@@@@ 연수 검색 엔터키 이벤트 추가(220719) 
$(function(){		
	//Block Enter key events. 엔터키 이벤트 막기.		
	$(document).keypress(function (e) {			
		if (e.keyCode == 13) {
			e.preventDefault();		
			}	
	});		
	//검색 박스에서 에서 Enter키를 누를 때 검색 버튼을 클릭.		
	$('#keyword').keypress(function (e) {		 
		if(e.keyCode == 13) { 				
			$('#adminBoardNoticeSearchBtn').click();			
				return false;  		  
			}		
	});   	
});
