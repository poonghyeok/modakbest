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
		<div class="main index">
		<!-- 연수 테스트용(220713) -->
		<input type="text" value="${sessionScope.memName }"/>
		<input type="text" value="${sessionScope.memNickname }"/>
		<input type="text" value="${sessionScope.memEmail }"/>
		<input type="text" value="${sessionScope.memAccessToken }"/>
		
			<!-- sidebar -->
			<jsp:include page="/WEB-INF/user/userSideBar.jsp" />
			<!-- sidebar -->
			<!-- main_banner -->
			<div class="main-banner-wrapper">
				<div class="main-banner">
					<a href="https://aihub.or.kr/" target="_i"><img src="/semiproject/img/okky_main_top_ad.jpg"></a>
				</div>
			</div>
			<!-- main_banner -->

			<!-- conten tscaffold-list clearfix -->
			<div id="index" class="content scaffold-list clearfix" role="main">
				<!-- 풍혁0709 : div 내의 내용은 jquery가 구성한다. --> 
			</div>
			<!-- conten tscaffold-list clearfix -->

			<div class="right-banner-wrapper">			
			</div>	
			
			<!-- footer -->
			<jsp:include page="/WEB-INF/global/footer.jsp"/>
			<!-- footer -->
				
		</div><!-- main-index -->
	</div><!-- layout-container -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/semiproject/js/index.js"></script>
</body>
</html>
