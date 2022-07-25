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
		<input id="category" type = 'text' value ='${param.category}'/>
		<!-- 풍혁0721 사이드 통일-->
				
			<div class="nav" role="navigation">			
				<h4>공지사항</h4>
						
				<!-- 연수 상단 공지 추가(220724) / 수정 다하고 지우기 -->
				<%-- <jsp:include page="/WEB-INF/admin/adminBoardNoticeListOfficial.jsp"/> --%>
				<!-- 연수 상단 공지 추가(220724) / 수정 다하고 지우기-->
								
				<!-- 공지 검색 기능  -->
			  	<form id="adminNoticeSearchForm">
			  	<input type="hidden" name="pg" id="searchPg" value="1" >	 
				   
				    <div class="category-filter-wrapper">
			            <div class="category-filter-query pull-right" style="width:376px;" >
			                <div class="input-group input-group-sm">			                	
			                	<div class="job-filter-container">
				                	<select class="job-filter-btn" name="searchOption" id="searchOption" style="border-color: #DBDCE1; font-size: 10pt; color: #656667;">
								       <option value="total" id="total">전체</option>
								       <option value="board_id" id="board_id">글번호</option>								      
								       <option value="board_title" id="board_title">글제목</option>
								       <option value="board_content" id="board_title">글내용</option>
								       <!-- 번호로만 가능  -->
								       <option value="board_cateid" id="board_cateid">카테고리</option>
								       <!-- 번호로만 가능  -->
								       <option value="board_uid" id="board_uid">작성자</option>
								       <option value="board_date_created" id="board_date_created">작성일</option>
								       <!-- <option value="user_nickname" id="user_nickname">닉네임</option>   -->       
							   		</select>
				                    <input type="text" id="keyword" name="keyword" class="form-control" placeholder="검색어" value="" style="border-color: #DBDCE1;">
				                    <span class="input-group-btn">
				                        <input type="button" id="adminBoardNoticeSearchBtn" class="btn btn-default" value = "검색" style="border-color: #DBDCE1; color: #656667;"><!-- <i class="fa fa-search"></i> -->
				                    </span>
			                    </div>
			                </div>
			            </div>
				    </div>
			  	</form>
			</div>
			<input type="hidden" id="pg" value="${pg }">						          
			
			<span class="btn btn-primary btn-sm"><input type="checkbox" id="all" style="float:left; font-size: 9pt; margin-left: 2.5px;">&nbsp;&nbsp;전체선택</span>			  
            <a class="create btn btn-success btn-sm" id ="adminNoticeWriteBtnAtList"><i class="fa fa-pencil"></i>공지등록</a>			
			
			<form id="adminNoticeListForm" method="get" action="/semiproject/admin/adminNoticeDelete_select" style="margin-top:10px;">           				        
			<!-- <div class="okkys-choice"> -->
			    <div class="panel panel-default">
			     	
		       		<!-- 동적처리  -->		            
		            ${adminNoticeTableList}			
			       
			    </div>
			<!-- </div> -->
						
			<input type="button" id="adminNoticeDeleteBtn_select" class="btn btn-primary btn-sm" value="선택삭제" style="float: left;">				
			
			<!-- 페이징 처리 챙기기 -->
			<div class="text-center"> 
				<ul class="pagination pagination-sm" id="adminNoticePagingDiv">
				<!-- 페이징 : 동적 처리 -->
				${adminNoticePagingList}
				</ul>
			</div>				
			
			</form><!-- adminNoticeListForm : 선택삭제(체크박스) 기능을 위해 만든 폼 -->	

			
		<jsp:include page="/WEB-INF/global/footer.jsp"/>
	</div> <!-- main -->   
</div> <!-- layout-container -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

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


//@@@@@@@@@@@@@@@@@@@@@@@@@ 카테고리명으로 검색할 수 있는 방법은 없겠지?(0723) @@@@@@@@@@@@@@@@@@@@@@@@@
/* $(function(){
	
	let keyword = $('#keyword').val();
	if($('#board_cateid:selected')){			
	function stringNoticeCateToInt(keyword){
		let board_cateid;
		
		if(keyword == '전체'){
			board_cateid = 6;
		}else if(keyword == 'info'){
			board_cateid = 1;
		}else if(keyword == 'review'){
			board_cateid = 2;
		}else if(keyword == 'qna'){
			board_cateid = 3;
		}else if(keyword == '자유'){
			board_cateid = 4;
		}else if(keyword == 'class'){
			board_cateid = 5;
		}
		
		return board_cateid;
		}
	}
});	 */

	
</script>
</body>
</html>