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
						
						<option name="board_cateid" value="0">전체</option>
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
			
			<!-- <form id="" method="" action="" style="margin-top:10px;">	 -->		
						
			
			<div class="okkys-choice">
			    <div class="panel panel-default">
			        <!-- Table -->
			        <ul class="list-group">
			
						<!-- append 시작점 -->
			            <li class="list-group-item list-group-item-question list-group-has-note clearfix">
			            <li class="list-group-item list-group-item-question clearfix" style="background-color:black;">
							<!-- 타이틀 부분 젤 큰 틀(버튼 넣으려면 이사이즈를 줄여야 될듯)  -->
							<div class="list-title-wrapper clearfix" style="width:20px; background-color:green;">
							<div class="list-tag clearfix" style="width:20px;">
							<input type="checkbox" id="all" style="float:left;">
							</div>
							</div>
							
			                <div class="list-title-wrapper clearfix" style="width:500px; background-color:yellow;">			                		
			                    <div class="list-tag clearfix" style="background-color:pink;">
			                    	<!-- 글번호 -->			                    	
			                        <span class="list-group-item-text article-id">글번호</span>
			                        <!-- 게시판 구분 -->
			                        <a href="#" class="list-group-item-text item-tag label label-info">
			                        <!-- <i class="fa fa-database"></i> -->카테고리</a>
									<!-- 태그부분 일단 삭제  -->
			                        <!-- <a href="/articles/tagged/OKKY"
			                            class="list-group-item-text item-tag label label-gray ">CAMPFIRE</a> -->
			                    </div>
								<!-- 글제목 -->
			                    <h5 class="list-group-item-heading list-group-item-evaluate">
			                        <a href="#">
			                            title 
			                        </a>
			                    </h5>
			                    
			                </div>
							
							<!-- 추천 조회 수 제일 큰 틀 -->	
			                <div class="list-summary-wrapper clearfix" style="background-color:pink;">
			                	<!-- 추천 조회 수 그루핑 틀-->	
			                    <div class="list-group-item-summary clearfix" style="background-color:red;">
			                        <ul>			                        	
			                            <!-- <li class=""><i class="item-icon fa fa-comment "></i> 27</li> -->
			                            <li class="">
			                                <i class="item-icon fa fa-thumbs-up"></i> 추천
			                            </li>
			                            <li class=""><i class="item-icon fa fa-eye"></i> 조회</li>
			                        </ul>
			                    </div>
			                </div>
			                
							<!-- 작성자 정보  제일 큰 틀-->
			                <div class="list-group-item-author clearfix" style="background-color:pink; margin-right: 150px;">	
			                	<!-- 작성자 정보  그루핑-->		
			                    <div class="avatar clearfix avatar-list ">
			                        <a href="#" class="avatar-photo"><img src="/semiproject/storage/userprofile/${userDTO.user_img}"></a>
			                        <div class="avatar-info">
			                            <a class="nickname" href="#" title="">닉네임</a>
			                            <div class="activity"><span class="fa fa-flash"></span> 레벨</div>
			                            <div class="date-created"><span class="timeago" title="">작성일</span></div>
			                        </div>
			                    </div>
			                </div>
			                
			                <!-- user_delete  -->
							<div class="list-title-wrapper clearfix" style="width:82px; background-color:pink; margin-left: 150px;">									
								삭제								
							</div>
						</li>					                
			            </li>
			            <!-- append 종료시점 -->
			            
			        </ul>
			    </div>
			</div>
			
			
			<input type="button" id="adminUserDeleteBtn_select" class="btn btn-primary btn-sm" value="선택삭제" style="float: left;">				
			
			<div class="text-center"> 
				<ul class="pagination pagination-sm" id="userAdminPagingDiv">
				<!-- 페이징 : 동적 처리 -->
				</ul>
			</div>				
			
			<!-- </form> --><!-- adminUserAllListForm : 선택삭제(체크박스) 기능을 위해 만든 폼 -->	
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