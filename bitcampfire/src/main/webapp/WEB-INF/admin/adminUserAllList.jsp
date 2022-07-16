<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 풍혁 (220704) : okky 에서 복붙 -->		
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="/semiproject/css/board/boardList.css">
<link rel="stylesheet" href="/semiproject/css/board/boardList2.css">
<!-- 풍혁 (220704) : okky 에서 복붙 -->
</head>
<body>
<!-- 풍혁(220707) :  div layout container, div main 추가 -->
<div class="layout-container">
	<div class="main">
			<%@ include file="/admin/adminSidebar.jsp" %>
				<!-- <div id="index" class="content scaffold-list clearfix" role="main"> footer가 위로 올라오지 않게하는 폼/리스트 크기가 작아짐 -->		
				
				<!-- 메뉴제목  -->
				<h4>회원관리</h4>
				<!-- @@@@@@@@@@ 연수 : 검색 기능 추가 하기(220716)  @@@@@@@@@@ -->
				<div class="nav" role="navigation" style="text-align:center; margin: auto;">					
						<div class="job-filter-container" style="width:300px; text-align:center; margin: auto;">
							<select class="job-filter-btn" name="searchOption" id="searchOption" style="border-color: #DBDCE1; font-size: 10pt; color: #656667;">
						       <option value="user_all" id="user_all">전체</option>
						       <option value="user_email" id="user_email">이메일</option>
						       <option value="user_nickname" id="user_nickname">닉네임</option>         
					   		</select>
		                    <input type="search" name="query" id="search-field" class="form-control" placeholder="검색어" value="" style="border-color: #DBDCE1;">
		                    <span class="input-group-btn">
		                        <input type="button" class="btn btn-default" style="border-color: #DBDCE1; font-size: 10pt; color: #656667;" value="검색">
		                    </span>
		                </div>
	            </div>
				<br>
				<!-- @@@@@@@@@@ 연수 : 검색 기능 추가 하기(220716)  @@@@@@@@@@ -->
				
				<!-- @@@@@@@@@@ 연수 : 선택삭제 기능 추가 하기 : 소셜 로그인 사용자 토큰을 저장해야되남??(220716)  @@@@@@@@@@ -->
				<form id="adminUserAllListForm" method="get" action="/semiproject/user/delete">		
							
				<div class="panel panel-default questions-panel">
					<ul class="list-group">
						
						<!-- append 시작점 -->
						<li class="list-group-item list-group-item-question list-group-has-note clearfix">							
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
											
						<!-- 동적 처리   -->										
					</ul>
				</div>
				<input type="button" id="adminUserDeleteBtn_selected" class="btn btn-danger btn-sm" value="선택삭제" style="float: left;">
					
				<!-- @@@@@@@@@@ 연수 : 페이징 처리 기능 추가 하기(220716) @@@@@@@@@@ -->
				<div class="text-center"> 
					<ul class="pagination pagination-sm">
						
					</ul>
				</div>
				<!-- @@@@@@@@@@ 연수 : 페이징 처리 기능 추가 하기(220716) @@@@@@@@@@ -->
				
			</form><!-- deleteform --> 	
			<!-- </div> -->
		<jsp:include page="/WEB-INF/global/footer.jsp"/>
	</div> <!-- main -->   
</div> <!-- layout-container -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		type: 'post',
		url: '/semiproject/admin/getUserAllList',
		dataType: 'json',
		success: function(data){
			//alert(JSON.stringify(data));
			 
 			$.each(data, function(index, items){
 				
 				$('<li/>',{
					class: 'list-group-item list-group-item-question list-group-has-note clearfix' //추후 hasnote를 social 여부로 변경해볼지?
				})
				.append(
					$('<div/>',{
						class: 'list-title-wrapper clearfix1',
						align: 'center',
						text: items.user_id,
						style:'width:70px; height:35px; text-align:center; line-height:35px;'						
					})
						.prepend($('<input/>',{
						type: 'checkbox',
						name: 'check',
						style: 'float: left; margin-top: 10px;',
						value: items.user_id
					}))
				)//list-title-wrapper clearfix1
				.append(
					$('<div/>',{
						class: 'list-title-wrapper clearfix2',
						style: 'width:200px; height:35px; text-align:center;'
					})
					.append(
						$('<div/>',{
							class: 'avatar clearfix avatar-list'
						})
						.append(
							$('<a/>',{
								class : 'avatar-photo',
								href : '/semiproject/user/userpage?user_id='+items.user_id//접속 안됨, 확인 후 수정하기(220716)
							})
							.append(
								$('<img/>',{
									src : '/semiproject/storage/userprofile/'+items.user_img
								})		
							)//img
						)//avartar-photo
						.append(
							$('<div/>',{
								class : 'avatar-info'
							})
							.append(
								$('<a/>',{
									class : 'nickname',
									title : items.user_nickname,
									text : items.user_nickname
								})
							)						
							.append(
								$('<div/>',{
									class : 'date-created',
								})
								.append(
									$('<span/>',{
										class : 'timeago',
										title : items.user_logtime,
										text : items.user_logtime
									})
									)//timeago
								)//date-created						
							)//avatar-info
						)//avatar clearfix avatar-list
					)//list-title-wrapper clearfix2
					.append(
							$('<div/>',{
								class: 'list-title-wrapper clearfix3',
								align: 'center',
								text: items.user_name,
								style: 'width:150px; height:35px; text-align:center; line-height:35px;'
							})
					)//list-title-wrapper clearfix3	
					.append(
							$('<div/>',{
								class: 'list-title-wrapper clearfix4',
								align: 'center',
								text: items.user_email, 
								style: 'width:200px; height:35px; text-align:center; line-height:35px;'
							})
					)//list-title-wrapper clearfix4
					
					.append(
							$('<div/>',{
								class: 'list-title-wrapper clearfix5',
								align: 'center',
								text: items.user_classid,					
								style: 'width:100px; height:35px; text-align:center; line-height:35px;'
							})
					)//list-title-wrapper clearfix5
					
					.append(
							$('<div/>',{
								class: 'list-title-wrapper clearfix6',
								align: 'center',
								text: items.user_social,
								style: 'width:100px; height:35px; text-align:center; line-height:35px;'
							})
					)//list-title-wrapper clearfix6
					
					.append(
							$('<div/>',{
								class: 'list-title-wrapper clearfix7',
								style: 'width:82px; height:35px; text-align:center; line-height:35px;'
							})
							.append(
							$('<a/>',{
								class: 'btn btn-danger btn-sm',
								id: 'adminUserDeleteBtn_personal'
								title: '삭제',
								text: '삭제',
								href: '/semiproject/user/delete'								
							})	
						)//btn btn-danger
					)//list-title-wrapper clearfix7
					
					
	 	 		.appendTo($('.list-group')); //마지막단    
			
 	 			});//each
			 
		 },
		 error: function(err){
			 console.log(err);
		 }
	});
});

//전체선택 또는 전체해제
$('#all').click(function(){
	//alert($('#all').attr('checked')) //checked라는 속성이 없어서 undefine으로 나온다
	//alert($('#all').prop('checked')) //true 또는 false로 가져옴
	
	if($('#all').prop('checked'))
		$('input[name="check"]').prop('checked', true);
	else
		$('input[name="check"]').prop('checked', false);
});

//선택삭제
/* $('#adminUserDeleteBtn_selected').click(function(){
	var count = $('input[name="check"]:checked').length;
	
	if(count == 0)
		alert('삭제할 항목을 선택하세요!');
	else 
		if(confirm('정말로 삭제하시겠습니까?')) $('#imagebaordListForm').submit();
}); */

$('#adminUserDeleteBtn_personal').click(function(){
	$.ajax({
		type: 'post',
		url: '/semiproject/user/delete',
		//data: {user_email: + $('#user_email').val()},
		success: function(){
			location.href = '/semiproject/admin/adminUserAllList';
		},
		error: function(err){
			console.log(err);
		}
	});
});
</script>
</body>
</html>
