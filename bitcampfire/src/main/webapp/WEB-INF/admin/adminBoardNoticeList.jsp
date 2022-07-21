<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bitcampfire - 회원관리</title>
		
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="/semiproject/css/board/boardList.css">
<link rel="stylesheet" href="/semiproject/css/board/boardList2.css">

</head>
<body>

<div class="layout-container">
	<div class="main">
		<!-- 사이드바 완성되면 바꿔넣기  -->
		<!-- 풍혁0721 사이드 통일-->
		<jsp:include page="/WEB-INF/board/boardSideBar.jsp"/>
		<input id="category" type = 'hidden' value ='${param.category}'/>
		<!-- 풍혁0721 사이드 통일-->
		
			<!-- <div id="index" class="content scaffold-list clearfix" role="main"> footer가 위로 올라오지 않게하는 폼/리스트 크기가 작아짐 -->				
			
			<div class="nav" role="navigation">			
				<h4>공지사항</h4>		
				
			  	<form id="adminNoticeSearchForm">	 
				    <div class="category-filter-wrapper">
			            <div class="category-filter-query pull-right">
			                <div class="input-group input-group-sm">
			                	<!-- searchOption 생략했는데 필요하면 넣기  -->
			                    <input type="text" id="keyword" name="keyword" class="form-control" placeholder="검색어" value="">
			                    <span class="input-group-btn">
			                        <input type="button" id="adminNoticeSearchBtn" class="btn btn-default" value = "검색" ><!-- <i class="fa fa-search"></i> -->
			                    </span>
			                </div>
			            </div>
				    </div>
			  	</form>
			</div>
			<input type="hidden" id="pg" value="${pg }">						          
			<span class="btn btn-primary btn-sm"><input type="checkbox" id="all" style="float:left; font-size: 9pt;">&nbsp;전체선택</span>			  
            <a class="create btn btn-success btn-sm" id ="adminNoticeWriteBtnAtList"><i class="fa fa-pencil"></i>공지등록</a>					
			
			<form id="adminNoticeListForm" method="get" action="/semiproject/admin/adminNoticeDelete_select" style="margin-top:10px;">           				        
			<div class="okkys-choice">
			    <div class="panel panel-default">
			     	
		       		<!-- 동적처리  -->		            
		            ${adminNoticeTableList}			
			       
			    </div>
			</div>
						
			<input type="button" id="adminNoticeDeleteBtn_select" class="btn btn-primary btn-sm" value="선택삭제" style="float: left;">				
			
			<!-- 페이징 처리 챙기기 -->
			<div class="text-center"> 
				<ul class="pagination pagination-sm" id="adminNoticePagingDiv">
				<!-- 페이징 : 동적 처리 -->
				</ul>
			</div>				
			
			</form><!-- adminBoardNoticeistForm : 선택삭제(체크박스) 기능을 위해 만든 폼 -->	
			<!-- </div> -->
			
		<jsp:include page="/WEB-INF/global/footer.jsp"/>
	</div> <!-- main -->   
</div> <!-- layout-container -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

//@@@글쓰기 : 공지등록
$('#adminNoticeWriteBtnAtList').click(function(){
	location.href="/semiproject/admin/adminBoardNoticeWriteForm";
});

//@@@@@ 체크박스 선택삭제 기능
//전체선택 또는 전체해제
 $(document).ready(function(){
	$('#all').click(function(){
		if($('#all').prop('checked'))
			$('input[name="check"]').prop('checked', true);
		else
			$('input[name="check"]').prop('checked', false);
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
/* $('#adminNoticeDeleteBtn_each').click(function(){
	
	var board_id = $('#board_id').val();
		
		if (confirm("글을 삭제하시겠습니까?")){			
			$.ajax({
				type : 'get',
				url : "/semiproject/admin/boardNoticeDelete_each",
				data : {board_id : board_id, cateid : cateid},
				success: function() {
					alert("글이 삭제되었습니다.")
					location.href="/semiproject/admin/adminBoardNoticeList";
				},
				error : function(err) {
					console.log(err);
				}
			})
		}	
}); */

//글 수정 adminNoticeUpdateBtn
</script>
</body>
</html>