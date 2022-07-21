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
	<input id="category" type = 'text' value ='${param.category}'/>
	<!-- 풍혁0721 사이드 통일 + active 효과적용 위해 category 표시-->
	
	<h4>게시글 관리</h4>
	<!-- 검색 기능-->
	<form id="BoardSearchForm">
	<div class="nav" role="navigation" style="margin-left:600px;">
		<input type="hidden" name="pg" id="searchPg" value="1">					
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
    <br>
	<form id="adminBoardAllListForm" method="get" action="/semiproject/admin/adminBoardDelete_select" >		
		<div class="panel panel-default questions-panel">
			<ul class="list-group">
				<li class="list-group-item list-group-item-question list-group-has-note clearfix" style="background-color: pink;" >
				<!-- append 시작점 -->
					<!-- board_id  -->
					<div class="list-title-wrapper clearfix1" style="width:100px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: ;">									
						<input type="checkbox" id="all" style="float:left; margin-top: 10px;">번호 									
					</div>
													
					<!-- board_cateid -->	
					<div class="list-title-wrapper clearfix2" style="width:100px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: ;"> 
						<p style="height:5px;">카테고리</p>
					</div>
																			
					<!-- board_title  -->
					<div class="list-title-wrapper clearfix3" style="width:150px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: ;">									
						제목								
					</div>
					
					<!-- board_cmt_cnt  -->
					<div class="list-title-wrapper clearfix4" style="width:100px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: ;">									
						댓글수								
					</div>
					
					<!-- board_view_cnt  -->
					<div class="list-title-wrapper clearfix5" style="width:100px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: ;">									
						조회수								
					</div>
					
					<!-- board_uid  -->								
					<div class="list-title-wrapper clearfix6" style="width:150px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: ;">									
						작성자						
					</div>
					
					<!-- board_date_created  -->
					<div class="list-title-wrapper clearfix7" style="width:150px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: ;">									
						날짜								
					</div>
					
					<div class="list-title-wrapper clearfix8" style="width:40px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold;">									
						삭제								
					</div>	
				
				 </li>
				<!-- append 종료시점 -->
			</ul>
		</div> 
							
		<input type="button" id="adminBoardDeleteBtn_select" class="btn btn-primary btn-sm" value="선택삭제" style="float: left;">
	</form>
</div>
</div>
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type = "text/javascript">
$(function(){	
	$.ajax({
		type : "post",
		url : "/semiproject/admin/getBoardAllList", 
		dataType : "json",
		success : function(data) {  // list
			console.log(JSON.stringify(data));
			$.each(data, function(index, item){
				
				var del = "삭제";
				
				var test = '<li class="list-group-item list-group-item-question list-group-has-note clearfix">'+
							'<input name="check" id="checkDelete" type="checkbox" style="float: left; margin-top: 10px;">'+
							'<div style = "float:left; width:100px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+item.board_id+'</div>'+
							'<div style = "float:left; width:100px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+item.board_cateid+'</div>'+
							'<div style ="float:left; width:160px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+item.board_title+'</div>'+
							'<div style ="float:left; width:120px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+item.board_cmt_cnt+'</div>'+
							'<div style ="float:left; width:110px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+item.board_view_cnt+'</div>'+
							'<div style ="float:left; width:150px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+item.board_uid+'</div>'+
							'<div style ="float:left; width:160px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+item.board_date_created+'</div>'+
							'<div style ="float:left; width:49px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+del+'</div>'
							'</li>';
				$(test).appendTo('.list-group');
			})
		},
		error : function(err) {
			console.log(err);
		} // error
	})
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