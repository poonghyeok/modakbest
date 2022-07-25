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
	<input id="pg" type = 'hidden' value ='${param.pg}'/>
	<!-- 풍혁0721 사이드 통일 + active 효과적용 위해 category 표시-->
	
	<h3>게시글 관리</h3>
	<!-- 검색 기능-->
	<form id="BoardSearchForm">
	<div class="nav" role="navigation" style="margin-left:600px;">
		<input type="hidden" name="pg" id="searchPg" value="1">					
			<div class="job-filter-container" style="width:300px; text-align:center; margin: auto;">
			<select class="job-filter-btn" name="searchOption" id="searchOption" style="border-color: #DBDCE1; font-size: 10pt; color: white;">
		       <option value="board_title" id="board_title">제목</option>
		       <option value="board_uid" id="board_uid">작성자</option>
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
					<div class="list-title-wrapper clearfix1" id = "adminBoard" style="width:100px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; ">									
						<input type="checkbox" id="all" style="float:left; margin-top: 10px;">번호 									
					</div>
													
					<!-- board_cateid -->	
					<div class="list-title-wrapper clearfix2" id = "adminBoard" style="width:100px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; "> 
						<p style="height:5px;">카테고리</p>
					</div>
																			
					<!-- board_title  -->
					<div class="list-title-wrapper clearfix3" id = "adminBoard" style="width:150px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; ">									
						제목									
					</div>
					
					<!-- board_cmt_cnt  -->
					<div class="list-title-wrapper clearfix4"  id = "adminBoard" style="width:100px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; ">									
						댓글수								
					</div>
					
					<!-- board_view_cnt  -->
					<div class="list-title-wrapper clearfix5"  id = "adminBoard" style="width:100px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; ">									
						조회수								
					</div>
					
					<!-- board_uid  -->								
					<div class="list-title-wrapper clearfix6" id = "adminBoard" style="width:150px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; ">									
						작성자						
					</div>
					
					<!-- board_date_created  -->
					<div class="list-title-wrapper clearfix7"  id = "adminBoard" style="width:150px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; ">									
						날짜								
					</div>
					
					<div class="deleteBtn" id = "adminBoard" style="width:40px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold;">									
						삭제								
					</div>	
				
				 </li>
				<!-- append 종료시점 -->
			</ul>
		</div> 
							
		<input type="button" id="adminBoardDeleteBtn_select" class="btn btn-primary btn-sm" value="삭제" style="float: right; background-color: white; font-weight: bold; color : black;">
	</form>
</div>
</div>
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type = "text/javascript">
$(function(){	
	$.ajax({
		type : "post",
		url : "/semiproject/admin/getBoardAllList",  // 리스트 전체 가져오기
		dataType : "json",
		success : function(data) {  // list
			//console.log(JSON.stringify(data));
			
		$.each(data, function(index, item){ //board_uid 
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
						}
					}); // ajax끝
					console.log(item);
				var test = '<li class="list-group-item list-group-item-question list-group-has-note clearfix">'+
								'<input name="check" class="checkDelete" id="checkDelete" type="checkbox" style="float: left; margin-top: 10px;">'+
								'<div style ="float:left; width:100px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+item.board_id+'</div>'+
								'<div style ="float:left; width:100px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+item.board_cateid+'</div>'+
								'<div style ="float:left; width:160px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+item.board_title+'</div>'+
								'<div style ="float:left; width:120px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+item.board_cmt_cnt+'</div>'+
								'<div style ="float:left; width:110px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+item.board_view_cnt+'</div>'+
								'<div id = "userNickname" style ="float:left; width:150px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">' 
								+'<a href = "/semiproject/board/getBoardView?category="'+item.board_cateid+'"info&board_id="' +item.board_id+ '"&pg=1">' +userNickname +'</a></div>'+
								'<div style ="float:left; width:160px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+item.board_date_created+'</div>'
							'</li>';
				$(test).appendTo('.list-group');
				
			}) // each 
		}, // success
		error : function(err) {
			console.log(err);
		} // error
	})
});




/* 선택 삭제 */
$('#adminBoardDeleteBtn_select').click(function(){
	
	var num = $("input:checkbox[name=check]:checked").length // 체크된 개수
	
	if (num == 0) {
		alert('삭제할 항목이 없습니다.')
	} else if (confirm('정말로 삭제하시겠습니까?')) {
		$("input:checkbox[name=check]:checked").parent().remove();
		
	} 
}); 

/* 전체 삭제 */
	$('#all').click(function(){
		if($('#all').prop('checked'))
			$('input[name="check"]').prop('checked', true);
		else
			$('input[name="check"]').prop('checked', false);
	});
	
/* 검색 버튼 눌렀을 때 */	
 $('#BoardSearchBtn').click(function(){
	 $.ajax({
		 type : 'get',
		 url :'/semiproject/admin/'
	 });
 });
</script>

	<!-- <table border = "1" width = "700px" id = "table">
		<tr>
			<th>게시글번호</th>
			<th>작성자</th>
			<th>카테고리ID</th>
			<th>제목</th>
			<th>날짜</th>
		</tr>
	</table> 
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type = "text/javascript">
$(function(){
	$.ajax({
		type : "post",
		url : "/semiproject/admin/getBoardAllList", 
		dataType : "json",
		success : function(data) { 
			//data.reviewList[0] 
			//console.log(JSON.stringify(data.reviewList[0])) // string형태로 보기
			//KEY로 접근했을떄  value로 나온다 
			
			var key = data.reviewList
			 console.log(key)
			
			 $("<tr>", {
				html : 
				 "<td>" + key[0] + "</td>"+ 
				 "<td>" + key[1] + "</td>"+
				 "<td>" + key[2] + "</td>"+
				 "<td>" + key[3] + "</td>"
			}).appendTo("table")
			
			$.each(data.reviewList, function(index, item) { // index = 번호 item  = list중에 객체 하나
				var items = [];
				items.push("<td>" + item.board_id + "</td>")
				items.push("<td>" + item.board_uid + "</td>")
				items.push("<td>" + item.board_cateid + "</td>")
				items.push("<td>" + item.board_title + "</td>")
				items.push("<td>" + item.board_date_created + "</td>")
				$("<tr/>", {
					html : items
				}).appendTo("table");
				
			}); // each끝
			
		}, error : function(err) {
			console.log(err);
		}
	})
});

</script>	 -->
</body>
</html>