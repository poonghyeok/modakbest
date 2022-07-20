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
	<%@ include file = "/admin/adminSidebar.jsp" %>
	
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
			
				<!-- append 시작점 -->
				<li class="list-group-item list-group-item-question list-group-has-note clearfix" style="background-color: blue;" >							
					<!-- board_id  -->
					<div class="list-title-wrapper clearfix1" style="width:70px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: yellow;">									
						<input type="checkbox" id="all" style="float:left; margin-top: 10px;">번호 									
					</div>
													
					<!-- board_cateid -->	
					<div class="list-title-wrapper clearfix2" style="width:90px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: yellow;"> 
						<p style="height:5px;">카테고리</p>
					</div>
																			
					<!-- board_title  -->
					<div class="list-title-wrapper clearfix3" style="width:90px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: yellow;">									
						제목									
					</div>
					
					<!-- board_cmt_cnt  -->
					<div class="list-title-wrapper clearfix4" style="width:90px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: yellow;">									
						댓글수								
					</div>
					
					<!-- board_view_cnt  -->
					<div class="list-title-wrapper clearfix5" style="width:90px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: yellow;">									
						조회수								
					</div>
					
					<!-- board_uid  -->								
					<div class="list-title-wrapper clearfix6" style="width:90px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: yellow;">									
						작성자						
					</div>
					
					<!-- board_date_created  -->
					<div class="list-title-wrapper clearfix7" style="width:90px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: yellow;">									
						날짜								
					</div>									
				</li>
				<!-- append 종료시점 -->
				<br>
				<br>				
				<input type="button" id="adminBoardDeleteBtn_select" class="btn btn-primary btn-sm" value="선택삭제" style="float: left;">
			</ul>
		</div>	
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
		success : function(data) {  // map
			
 			$.each(freeList, function(index, items){// $(선택한 요소).append(새 요소)  
				
				$('<li/>',{
					class : 'list-group-item list-group-item-question list-group-has-note clearfix'
				})
				.append(
	                $('<div/>', {
	                    class: 'list-title-wrapper clearfix1',
	                    align: 'center',
	                    text: items.board_id
	                   //style: 'width:70px; height:35px; text-align:center; line-height:35px;'
	                })
	                .prepend($('<input/>', {
	                    type: 'checkbox',
	                    name: 'check',
	                    id: 'checkDelete',
	                    style: 'float: left; margin-top: 10px;',
	                    disabled: false,
	                    value: items.board_cateid //일관성을 위해 id값 대신 email 값을 넣음
	                }))                                    
               )//list-title-wrapper clearfix1
			 
            .appendTo($('.list-group')); //마지막단   
        });//each
			 
			
		}, error : function(err) {
			console.log(err);
		}
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