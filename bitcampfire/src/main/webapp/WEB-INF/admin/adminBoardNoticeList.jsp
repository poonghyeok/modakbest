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
				<!-- 연수 상단 공지 추가(220724) / 수정 다하고 지우기 - 테스트용 삭제(0726)-->		
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
<!-- 연수 : js파일 별도 생성 (220726) -->
<script type="text/javascript" src="/semiproject/js/admin/adminBoardNoticeList.js"></script>
</body>
</html>