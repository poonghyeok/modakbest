<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>bitcampfire - 회원정보 수정</title>
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/semiproject/css/user/application.css">
</head>
<body>
<div class="layout-container">
 	<div class="main">
 		<jsp:include page="/WEB-INF/user/userSideBar.jsp"/>
 			<!-- 메인시작 -->
			<div id="create-user" class="content" role="main">
			    <h3 class="content-header">회원 탈퇴 완료</h3>
			    <div class="panel panel-default panel-margin-10">
			        <div class="panel-body panel-body-content text-center">
			            <p class="lead">지금까지 이용해 주셔서 감사합니다.</p>
			            <a href="/" class="btn btn-default">완료</a> <!-- 메인페이지로 이동  -->
			        </div>
			    </div>
			</div>
		 <!-- 메인끝  -->
 		<%-- <jsp:include page="/WEB-INF/global/footer.jsp"/>  --%>   
   </div> <!-- main -->   
</div> <!-- layout-container -->
</body>
</html>