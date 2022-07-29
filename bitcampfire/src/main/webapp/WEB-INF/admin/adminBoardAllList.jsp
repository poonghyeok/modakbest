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
	<input id="searchTarget" type = 'hidden' value ='${param.target}'/>
	<input id="searchKeyword" type = 'hidden' value ='${param.keyword}'/>
	
	<!-- 풍혁0721 사이드 통일 + active 효과적용 위해 category 표시-->
	
	<h3>게시글 관리</h3>
	<!-- 검색 기능-->
	<form id="BoardSearchForm">
	<div class="nav" role="navigation" style="margin-left:600px;">
		<input type="hidden" name="pg" id="searchPg" value="1">					
			<div class="job-filter-container" style="width:300px; text-align:center; margin: auto;">
			<select class="job-filter-btn" name="searchOption" id="searchOption" style="border-color: #DBDCE1; font-size: 10pt; color: black ;">
		       <option value="board_title" id="board_title">제목</option>
		       <!-- <option value="board_cateid" id="board_cateid">카테고리</option> -->
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
		<ul class="pagination pagination-sm" id="boardSearchPgDiv">
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

	function cateidToKorean(cateid){
		let result;
		if(cateid == 1){
			result = '취업정보';
		}else if(cateid == 2){
			result = '후기';
		}else if(cateid == 3){
			result = 'Q&A';
		}else if(cateid == 4){
			result = '자유게시판';
		}
		return result;
	}
	
	

	// list view에 뿌리기
	$(function(){
		var searchTarget = $('#searchTarget').val();
		var searchKeyword = $('#searchKeyword').val();
		/* 풍혁0729 검색조건이 없을 경우 */
		if( !searchKeyword){
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
							
						var board_title = item.board_title;
						if(board_title.length > 12){
							board_title = board_title.substring(0,10) + '...';
						}
						var test = '<li class="list-group-item list-group-item-question list-group-has-note clearfix">'+						
							'<div id = "board_id'+item.board_id+'"class="list-title-wrapper clearfix1" style ="width:100px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+item.board_id+'</div>'+
							'<div id = "board_cateid'+item.board_id+'" class="list-title-wrapper clearfix2" style ="width:100px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+cateidToKorean(item.board_cateid)+'</div>'+
							'<div class="list-title-wrapper clearfix3" style =" width:150px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+
							'<a href = "/semiproject/board/getBoardView?category='+cateidToString(item.board_cateid)+'&board_id=' + item.board_id+ '">' + board_title +'</a></div>'+
							'<div class="list-title-wrapper clearfix4" style ="width:75px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+item.board_cmt_cnt+'</div>'+
							'<div class="list-title-wrapper clearfix5" style ="width:75px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+item.board_view_cnt+'</div>'+
							'<div id = "userNickname" class="list-title-wrapper clearfix6" style ="width:120px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;"><a href = "/semiproject/user/userPage?user_id='+item.board_uid+'">'+ userNickname+'</a></div>'+
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
									data : {'board_id': $('#board_id'+item.board_id).text(),
											'board_cateid': item.board_cateid
											},
									success : function(data) {
											alert("관리자페이지에서 삭제완료")
											$(this).parent().remove();
											location.reload();
									
									}, error : function(err) {
											console.log(err);
									} 
								}) // ajax 
							} // if 
						});  // click
					}) // each
				}, 
				error : function(err) {
					console.log(err);
				} // error
			})
			
		}else{
			$('#keyword').val(searchKeyword);
			$('#searchOption option[value='+searchTarget+']').prop('selected', 'selected').change();
			
			$('.list-group li:gt(0)').remove();
			 
			 $.ajax({
				type : "get",
				url : "/semiproject/admin/adminBoardSearch",
				data : {
						target : searchTarget, // searchOption 값 
						keyword : searchKeyword, // 키워드
						pg : $('#searchPg').val()
						},
				success : function(data) {
				
					$.each(data, function(index, item){ //board_uid
					console.log('검색결과 ' + index +  '회차 ');
					
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
						
						var board_title = item.board_title;
						if(board_title.length > 12){
							board_title = board_title.substring(0,10) + '...';
						}
								
						var test = '<li class="list-group-item list-group-item-question list-group-has-note clearfix">'+						
						'<div id = "board_id'+item.board_id+'"class="list-title-wrapper clearfix1" style ="width:100px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+item.board_id+'</div>'+
						'<div id = "board_cateid'+item.board_id+'" class="list-title-wrapper clearfix2" style ="width:100px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+cateidToKorean(item.board_cateid)+'</div>'+
						'<div class="list-title-wrapper clearfix3" style =" width:150px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+
						'<a href = "/semiproject/board/getBoardView?category='+cateidToString(item.board_cateid)+'&board_id=' +item.board_id+ '">' + board_title +'</a></div>'+
						'<div class="list-title-wrapper clearfix4" style ="width:75px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+item.board_cmt_cnt+'</div>'+
						'<div class="list-title-wrapper clearfix5" style ="width:75px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;">'+item.board_view_cnt+'</div>'+
						'<div id = "userNickname" class="list-title-wrapper clearfix6" style ="width:120px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold; background-color: white;"><a href = "/semiproject/user/userPage?user_id='+item.board_uid+'">'+ userNickname+'</a></div>'+
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
										data :	{'board_id': $('#board_id'+item.board_id).text(),
												'board_cateid': item.board_cateid
												},
										success : function(data) {
												alert("관리자페이지에서 삭제완료");
												$(this).parent().remove();
												location.reload();
										
										}, error : function(err) {
												console.log(err);
										} 
									}) // ajax 
								} // if 
							});  // click
							
							}) // each
							
							
						}, error : function(err) {	
							console.log(err);
						}  
					});
		}
		
		
		
	});

	$(document).ready(function() {
		$('input').on('keyup', function(e){
			if(e.keyCode == 13) {
				$('#BoardSearchBtn').trigger('click');			
			}
		});
	});
		
			
	/* 검색 버튼 눌렀을 때 */	
	 $('#BoardSearchBtn').click(function(){
		 var target = $('#searchOption').val(); // target 안에 searchOption 값 담겨있음.
		 var keyword = $('#keyword').val();
		 console.log(target,keyword);
		 var pg = $('#searchPg').val();
		/*  var target = target.options[target.selectedIndex].value; // searchOption 값 
		var keyword = $('#keyword').val(); */
			if($('#keyword').val()=='') { // 입력하지 않으면  
				alert('검색어를 입력하세요.') // ok
				location.reload(); // 새로고침
			} else {
				location.href = "http://localhost:8080/semiproject/admin/adminBoardSearchAllList?category=admin&pg=1&target="+target+"&keyword="+keyword; 
			} 
		 });
			

/* 		//@@@@@ 페이징 처리
		function boardAdminPaging(pg){	 
			var keyword = $('#keyword').val();
			
			if(keyword == ''){
				location.href = "http://localhost:8080/semiproject/admin/adminBoardAllList?category=admin&pg="+pg;
				
			}else{
				$('#searchPg').val(pg2); //searchPg가 1로 고정되어 있기 때문에
				$('#BoardSearchBtn').trigger('click'); //강제로 이벤트 발생
				
				//다시 검색 버튼을 누르면 1페이지로부터 검색할 수 있도록 searchPg를 1로 바꾸어야 한다.
				$('#searchPg').val(pg2);
			}
		} */


		
		
		</script>
</body>
</html>