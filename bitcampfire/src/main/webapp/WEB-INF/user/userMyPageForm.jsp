<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>bitcampfire - 마이페이지</title>
   <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
   <link rel="stylesheet" href="/semiproject/css/user/application.css">   
</head>

<body>
<div class="layout-container">
    <div class="main">
		<jsp:include page="/WEB-INF/user/userSideBar.jsp"/> 		
		
			<div id="user" class="content clearfix" role="main" >
				<div class="panel panel-default" style="height:180px;" >
					<div class="panel-body">
						<div class="avatar clearfix avatar-big col-sm-3 text-center">

							<a href="/semiproject/user/userMyPageForm" class='avatar-photo'><img id="myProfile" src="/semiproject/storage/userprofile/${sessionScope.memImg}"/></a>

            </div><!-- avatar clearfix avatar-big col-sm-3 text-center -->
						<div class="user-info col-sm-9">
							<div class="clearfix">
								<h2 class="pull-left" style="font-size:18pt;">${memNickname }</h2>
								<button class="btn btn-success pull-right btn-wide disabled" ><i class="fa fa-plus"></i> 팔로우</button>
							</div><!-- clearfix -->
						
							<div class="user_activity" style="height:100px;">
							<div class="user-points" style="margin-top:70px; margin-right:30px;">
						         <div class="user-point" >
						             <div class="user-point-label"><i class="fa fa-flash"></i> 활동점수</div>
						             <div class="user-point-num"><a href="#">0</a></div>
						         </div>
						         <div class="user-point" >
						             <div class="user-point-label"><i class="fa fa-user"></i> 팔로잉</div>
						             <div class="user-point-num"><a href="#">0</a></div> 
						         </div>
						         <div class="user-point" >
						             <div class="user-point-label"><i class="fa fa-users"></i> 팔로워</div>
						             <div class="user-point-num"><a href="#">0</a></div> 
						         </div>
							</div><!-- user-points -->
							</div>
						</div><!-- user-info col-sm-9 -->
					</div>
				</div>
				<div class="col-sm-2 user-info-nav pull-right">
					<ul class="nav">
						<li class="active"><a href="#">최근 활동</a> </li> <!-- /user/info/145381/activity -->
						<li class=""><a href="#">게시물 </a></li> <!-- /user/info/145381/articles -->
						<li class=""><a href="#">스크랩 </a></li> <!-- /user/info/145381/scrapped -->
					</ul>
				</div>
				<!-- 본인이 쓴 글자리  -->
				<div class="col-sm-10 main-block-left pull-left">
			      <ul class="list-group"></ul>
			      <div class="text-center"></div>
				</div>
			</div> <!-- content clearfix -->
	        
		<jsp:include page="/WEB-INF/global/footer.jsp"/>   	
	</div> <!-- main -->   
</div> <!-- layout-container -->  
<script type="text/javascript" src="/semiproject/js/user/userMyPageForm.js"></script>
</body>
</html>
