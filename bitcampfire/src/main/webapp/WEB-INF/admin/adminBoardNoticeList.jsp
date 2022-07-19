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
		<%@ include file="/admin/adminSidebar.jsp" %> 
			<!-- <div id="index" class="content scaffold-list clearfix" role="main"> footer가 위로 올라오지 않게하는 폼/리스트 크기가 작아짐 -->				
			<!-- 메뉴제목  -->
			<h4>공지사항</h4>				
			<!-- 유저 검색 기능 -->
			<form id="userSearchForm">
			<input type="hidden" name="pg" id="searchPg" value="1" >
<!-- 			<div class="nav" role="navigation" style="width:1000px;">				
				<div class="job-filter-container" style="width:1000px; text-align:center; margin: auto;">
				<a class="create btn btn-success btn-sm" id ="adminBoardNoticeWriteBtnAtList"><i class="fa fa-pencil"></i>공지등록</a>									
                    <input type="search" id="keyword" name="keyword" class="form-control" placeholder="검색어" value="" style="width:297px; margin-left:568px; border-color: #DBDCE1;">
                    <span class="input-group-btn"> 
                        <input type="button" id="userSearchBtn" class="btn btn-default" style="border-color: #DBDCE1; font-size: 10pt; color: #656667;" value="검색">
                    </span>
                </div>
            </div> -->
			<div class="nav" role="navigation" style="margin-left:600px;">										
				<div class="job-filter-container" style="width:300px; text-align:center; margin: auto;">
					<select class="job-filter-btn" name="searchOption" id="searchOption" style="border-color: #DBDCE1; font-size: 10pt; color: #656667;">

					    <option name="board_cateid" value="1">취업정보</option>
					    <option name="board_cateid" value="2">후기</option>
					    <option name="board_cateid" value="3">Q &amp; A</option>
					    <option name="board_cateid" value="4">자유게시판</option>
     
			   		</select>
                    <input type="search" id="keyword" name="keyword" class="form-control" placeholder="검색어" value="" style="border-color: #DBDCE1;">
                    <span class="input-group-btn"> 
                        <input type="button" id="userSearchBtn" class="btn btn-default" style="border-color: #DBDCE1; font-size: 10pt; color: #656667;" value="검색">
                    </span>
                </div>
            </div>
            </form>
            <a class="create btn btn-success btn-sm" id ="adminBoardNoticeWriteBtnAtList"><i class="fa fa-pencil"></i>공지등록</a>		
			
			<input type="hidden" id="pg" value="${pg }">
			
			<!-- 선택 삭제(체크박스) 폼 / 선택여부에 따라 공지 여부 결정될 수 있도록??? -->
			
			<form id="" method="" action="" style="margin-top:10px;">							
			<div class="panel panel-default questions-panel">
				<ul class="list-group">
					
					<!-- append 시작점 -->
					<li class="list-group-item list-group-item-question clearfix">	
			
					<!-- 공지사항 리스트: 동적 처리   -->	
					
					</li>
					<!-- append 종료시점 -->	
														
				</ul>
			</div>
			<input type="button" id="adminUserDeleteBtn_select" class="btn btn-primary btn-sm" value="선택삭제" style="float: left;">				
			
			<div class="text-center"> 
				<ul class="pagination pagination-sm" id="userAdminPagingDiv">
				<!-- 페이징 : 동적 처리 -->
				</ul>
			</div>				
			
			</form><!-- adminUserAllListForm : 선택삭제(체크박스) 기능을 위해 만든 폼 -->	
			<!-- </div> -->
			
		<jsp:include page="/WEB-INF/global/footer.jsp"/>
	</div> <!-- main -->   
</div> <!-- layout-container -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$('#adminBoardNoticeWriteBtnAtList').click(function(){
	location.href="/semiproject/admin/adminBoardNoticeWriteForm";
})
</script>
</body>
</html>