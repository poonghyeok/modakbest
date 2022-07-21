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
		<!-- 풍혁0721 사이드 통일-->
		<jsp:include page="/WEB-INF/board/boardSideBar.jsp"/>
		<input id="category" type = 'hidden' value ='${param.category}'/>
		<!-- 풍혁0721 사이드 통일-->
	
			<!-- <div id="index" class="content scaffold-list clearfix" role="main"> footer가 위로 올라오지 않게하는 폼/리스트 크기가 작아짐 -->				
			<!-- 메뉴제목  -->
			<h4>회원관리</h4>
			<!-- 유저 검색 기능 -->
			<form id="userSearchForm">
			<input type="hidden" name="pg" id="searchPg" value="1" >
			<div class="nav" role="navigation" style="margin-left:600px;">										
					<div class="job-filter-container" style="width:300px; text-align:center; margin: auto;">
						<select class="job-filter-btn" name="searchOption" id="searchOption" style="border-color: #DBDCE1; font-size: 10pt; color: #656667;">
					       <option value="user_name" id="user_name">이름</option>
					       <option value="user_email" id="user_email">이메일</option>
					       <option value="user_nickname" id="user_nickname">닉네임</option>         
				   		</select>
	                    <input type="search" id="keyword" name="keyword" class="form-control" placeholder="검색어" value="" style="border-color: #DBDCE1;">
	                    <span class="input-group-btn"> 
	                        <input type="button" id="userSearchBtn" class="btn btn-default" style="border-color: #DBDCE1; font-size: 10pt; color: #656667;" value="검색">
	                    </span>
	                </div>
            </div>
			</form>
			<br>
			
			<input type="hidden" id="pg" value="${pg }">				
			<!-- 선택 삭제(체크박스) 폼 -->
			<form id="adminUserAllListForm" method="get" action="/semiproject/admin/adminUserDelete_select">							
			<div class="panel panel-default questions-panel">
				<ul class="list-group">
					
					<!-- append 시작점 -->
					<li class="list-group-item list-group-item-question clearfix">							
						<!-- user_id  -->
						<div class="list-title-wrapper clearfix1" style="width:70px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold;">									
							<input type="checkbox" id="all" style="float:left; margin-top: 10px;">아이디									
						</div>
														
						<!-- user_img & nickname & logtime -->
						<div class="list-title-wrapper clearfix2" style="width:200px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold;"> 
							<p style="height:5px;">프로필</p>
							<p style="font-size:5pt; height:5px; color: #8F9193;">(사진/닉네임/가입 또는 정보수정일)</p>
						</div>
																				
						<!-- user_name  -->
						<div class="list-title-wrapper clearfix3" style="width:150px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold;">									
							이름									
						</div>
						
						<!-- user_email  -->
						<div class="list-title-wrapper clearfix4" style="width:200px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold;">									
							이메일								
						</div>
						
						<!-- user_class  -->
						<div class="list-title-wrapper clearfix5" style="width:100px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold;">									
							학원								
						</div>
						
						<!-- user_social  -->								
						<div class="list-title-wrapper clearfix6" style="width:100px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold;">									
							소셜로그인						
						</div>
						
						<!-- user_delete  -->
						<div class="list-title-wrapper clearfix7" style="width:82px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold;">									
							삭제								
						</div>							
					</li>
					<!-- append 종료시점 -->	
										
					<!-- 유저 리스트: 동적 처리   -->										
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
<script type="text/javascript" src="/semiproject/js/admin/adminUserAllList.js"></script>
</body>
</html>
