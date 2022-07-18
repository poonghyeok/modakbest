<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
		
			<div class="nav" role="navigation">
				<span class="list-group-item-text article-id">${boardAllDTO.board_id}</span>
					<div class="list-title-wrapper clearfix">
						<h5 class="list-group-item-heading list-group-item-evaluate">
							<a href="/semiproject/board/getBoardView?board_id=56&amp;pg=1">aaaa</a>
						</h5>
					</div>
					
					
					
					<div class="list-group-item-author clearfix">
						<div class="avatar clearfix avatar-list ">
							<a href="/semiproject/user/userPage?user_id=35" class="avatar-photo"><img src="/semiproject/storage/userprofile/null"></a>
								<div class="avatar-info">
									<a class="nickname" href="#" title="꾸꾸">꾸꾸</a>
										<div class="date-created">
											<span class="timeago" title="2022-07-15 10:19:28">2022-07-15 10:19:28</span>
									</div>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type = "text/javascript">
$(function(){
	$.ajax({
		type : "post",
		url : "/semiproject/admin/getBoardAllList", // 전체 데이터json반환
		dataType : "json",
		success : function(data) {
			alert(JSON.stringify(data)); // stringify 메소드는 json 객체를 String 객체로 변환
			//console.log(data)
			var dataList = {
				data : "data"
			}
			$.each(dataList, function(idx, item) {
				// div 를 반복문 안에서 하나 만든다. 
				// div 안에 받아온 item 의 property 를 할당한다.
				$('.list-group-item-text article-id').append (`<div>${data.board_id}</div>`) // 백틱 = 자바스크립트 문법 
				$('.nickname').append (`<div>${data.board_uid}</div>`) 
				$('.list-group-item-heading list-group-item-evaluate').append (`<div>${data.board_title}</div>`)
				$('.timeago').append (`<div>${data.board_date_created}</div>`)
			})
			
		}, error : function(err) {
			console.log(err);
		}
	})
});

</script>	
</body>
</html>