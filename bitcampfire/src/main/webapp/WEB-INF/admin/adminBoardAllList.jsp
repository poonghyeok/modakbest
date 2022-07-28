<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.adminBoardAllListForm {
height : 100px;
}
</style>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
 <link rel="stylesheet" href="/semiproject/css/board/boardList.css">
<link rel="stylesheet" href="/semiproject/css/board/boardList2.css">
</head>
<body>

<div class="layout-container">
	<div class="main">
	<!-- 풍혁0721 사이드 통일-->
	<jsp:include page="/WEB-INF/board/boardSideBar.jsp"/>
	<input id="category" type = 'hidden' value ='${param.category}'/>
	<input id="pg" type = 'text' value ='${param.pg}'/>
	<!-- 풍혁0721 사이드 통일 + active 효과적용 위해 category 표시-->
	
	<h3>게시글 관리</h3>
	<!-- 검색 기능-->
	<form id="BoardSearchForm">
	<div class="nav" role="navigation" style="margin-left:600px;">
		<input type="hidden" name="pg" id="searchPg" value="1">					
			<div class="job-filter-container" style="width:300px; text-align:center; margin: auto;">
			<select class="job-filter-btn" name="searchOption" id="searchOption" style="border-color: #DBDCE1; font-size: 10pt; color: black ;">
		       <option value="board_title" id="board_title">제목</option>
		       <option value="board_cateid" id="board_cateid">카테고리</option>
	   		</select>
             <input type="search" id="keyword" name="keyword" class="form-control" placeholder="검색어" value="" style="border-color: #DBDCE1;">
             <span class="input-group-btn"> 
                 <input type="button" id="BoardSearchBtn" class="btn btn-default" style="border-color: #DBDCE1; font-size: 10pt; color: #656667;" value="검색">
             </span>
         </div>
    </div>
    </form>
    <br>
    <br>
	<form id="adminBoardAllListForm" method="get" action="/semiproject/admin/adminBoardDelete_select" >		
		<div class="panel panel-default questions-panel">
			<ul class="list-group">
				<li class="list-group-item list-group-item-question list-group-has-note clearfix" name = "checkList" style="background-color: white;" >
				<!-- append 시작점 -->
					
					<!-- board_id  -->
					<div class="list-title-wrapper clearfix1" style="width:100px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; ">									
						번호 									
					</div>
													
					<!-- board_cateid -->	
					<div class="list-title-wrapper clearfix2" style="width:100px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold;  "> 
						<p style="height:5px;">카테고리</p>
					</div>
																			
					<!-- board_title  -->
					<div class="list-title-wrapper clearfix3"  style="width:150px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; ">									
						제목									
					</div>
					
					<!-- board_cmt_cnt  -->
					<div class="list-title-wrapper clearfix4"   style="width:75px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; ">									
						댓글수								
					</div>
					
					<!-- board_view_cnt  -->
					<div class="list-title-wrapper clearfix5"  style="width:75px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; ">									
						조회수								
					</div>
					
					<!-- board_uid  -->								
					<div class="list-title-wrapper clearfix6"  style="width:120px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; ">									
						작성자						
					</div>
					
					<!-- board_date_created  -->
					<div class="list-title-wrapper clearfix7"   style="width:200px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; ">									
						날짜								
					</div>
					
					
				
				 </li>
				<!-- append 종료시점 -->
			</ul>
		</div> 
	</form>

	<div class="text-center"> 
		<ul class="pagination pagination-sm">
		${pageButton}
		</ul>
	</div>	
</div>
</div>
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type = "text/javascript">

	// 카테고리 아이디
	function cateidToString(cateid){
		let result;
		if(cateid == 1){
			result = 'info';
		}else if(cateid == 2){
			result = 'review';
		}else if(cateid == 3){
			result = 'qna';
		}else if(cateid == 4){
			result = 'free';
		}
		return result;
	}

	// list view에 뿌리기
	$(function(){
		console.log("ajax pg : " + $('#pg').val())
		$.ajax({
			type : "post",
			url : "/semiproject/admin/getBoardAllList",  // 리스트 전체 가져오기(4개 테이블)
			data : {pg : $('#pg').val()},
			dataType : "json",
			success : function(data) {  // list
				console.log(JSON.stringify(data))
			$.each(data, function(index, item){ //board_uid
					// 유저닉네임 가져오기
					var userNickname;
			
						$.ajax({
							type : "get",
							url : "/semiproject/admin/getUserNickname",
							data : {
								 		board_uid : item.board_uid
								 		
								 	},
							async : false,
							success : function(name) {
								userNickname = name;
							}, error : function(err) {
								console.log(err);
							}
						}); // ajax끝
						
			var test = '<li class="list-group-item list-group-item-question list-group-has-note clearfix">'+						
						'<div id = "board_id'+item.board_id+'"class="list-title-wrapper clearfix1" style ="width:100px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+item.board_id+'</div>'+
						'<div id = "board_cateid'+item.board_id+'" class="list-title-wrapper clearfix2" style ="width:100px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+item.board_cateid+'</div>'+
						'<div class="list-title-wrapper clearfix3" style =" width:150px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+
						'<a href = "/semiproject/board/getBoardView?category='+cateidToString(item.board_cateid)+'&board_id=' +item.board_id+ '">' +item.board_title +'</a></div>'+
						'<div class="list-title-wrapper clearfix4" style ="width:75px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+item.board_cmt_cnt+'</div>'+
						'<div class="list-title-wrapper clearfix5" style ="width:75px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+item.board_view_cnt+'</div>'+
						'<div id = "userNickname" class="list-title-wrapper clearfix6" style ="width:120px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+ userNickname+'</div>'+
						'<div class="list-title-wrapper clearfix7" style =" width:200px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+item.board_date_created+'</div>'+
						'<div class="list-title-wrapper clearfix8" id = "adminBoard" style="width:70px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold;">'+
						'<input type="button" value = "삭제" id="adminBoardDeleteBtn_select'+item.board_id+'"class="btn btn-primary btn-sm" value="삭제" style="background-color: #337ab7; font-weight: bold; color : white;"></div>'+
						
						'</li>';
			$(test).appendTo('.list-group');
			
			/* 선택 삭제 */
			$('#adminBoardDeleteBtn_select' + item.board_id).click(function(){
				if (confirm('정말로 삭제하시겠습니까?')) {
					 $.ajax({
						type : "get",
						url : "/semiproject/admin/adminBoardDelete",
						//data : $("input:checkbox[name=check]:checked").val(),
						data :
							//{'board_id': $('#board_id'+items.user_id).text()},
									{'board_id': $('#board_id'+item.board_id).text(),
									'board_cateid': $('#board_cateid'+item.board_id).text()},
						success : function(data) {
							console.log(data)
							alert("관리자페이지에서 삭제완료")
							location.reload();
						}, error : function(err) {
							console.log(err);
						} 
					}) // ajax 
				} // if 
			});  // click
			
				}) // each
			}, // success
			error : function(err) {
				console.log(err);
			} // error
		})
	});

		
			
	/* 검색 버튼 눌렀을 때 */	
	 $('#BoardSearchBtn').click(function(){
			if($('#keyword').val()=='') { // 입력하지 않으면  
				alert('검색어를 입력하세요.') // ok
				location.reload(); // 새로고침
			} else { 
				 var target = document.getElementById("searchOption"); // target 안에 searchOption 값 담겨있음. 
				        //alert('선택된 옵션 value 값=' + target.options[target.selectedIndex].value);     // 옵션 value 값 // ok
	
				 $.ajax({
					type : "get",
					url : "/semiproject/admin/adminBoardSearch",
					data : {
							target : target.options[target.selectedIndex].value, // searchOption 값 
							keyword : $('#keyword').val() // 키워드
							},
							success : function(data) {
								console.log(JSON.stringify(data));
								
					$.each(data, function(index, item){ //board_uid
						$('.list-group li:gt(0)').remove();
						// 유저닉네임 가져오기
						var userNickname;
							$.ajax({
								type : "get",
								url : "/semiproject/admin/getUserNickname",
								data : {
									 		board_uid : item.board_uid,
									 	},
								async : false,
								success : function(name) {
									userNickname = name;
								}, error : function(err) {
									console.log(err);
								}
							}); // ajax끝
									
							var test = '<li class="list-group-item list-group-item-question list-group-has-note clearfix">'+
										'<input class="checkDelete" id="checkDelete" type="checkbox" style="float: left; margin-top: 10px;" name="'+item.board_id+'">'+
										'<div style ="float:left; width:100px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+item.board_id+'</div>'+
										'<div style ="float:left; width:100px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+item.board_cateid+'</div>'+
										'<div style ="float:left; width:160px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+
										'<a href = "/semiproject/board/getBoardView?category='+cateidToString(item.board_cateid)+'&board_id=' +item.board_id+ '">' +item.board_title +'</a></div>'+
										'<div style ="float:left; width:120px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+item.board_cmt_cnt+'</div>'+
										'<div style ="float:left; width:110px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+item.board_view_cnt+'</div>'+
										'<div id = "userNickname" style ="float:left; width:150px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+ userNickname+'</div>'+
										'<div style ="float:left; width:160px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+item.board_date_created+'</div>'
										
										'</li>';
							$(test).appendTo('.list-group');
							
								}) // each
								
								
							}, error : function(err) {
								console.log(err);
							}  
						});
				}
		 });
			
		function boardAdminPaging(pg) {
			location.href = "http://localhost:8080/semiproject/admin/adminBoardAllList?category=admin&pg="+pg;
		}
		
		
		</script>
</body>
</html>