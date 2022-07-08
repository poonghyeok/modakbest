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

			<div id="user" class="content clearfix" role="main">
			  	<div class="panel panel-default">
				      <div class="panel-body">
				
							<div class="avatar clearfix avatar-big col-sm-3 text-center">
									<a href="/user/info/145021" class='avatar-photo'><img id="myProfile" src="/semiproject/storage/${sessionScope.memImg}"/></a>
							</div>
								<div class="user-info col-sm-9">
								    <div class="clearfix"> 
								        <h2 class="pull-left" id="myEmail">${memEmail }</h2>
								        <button class="btn btn-success pull-right btn-wide disabled"><i class="fa fa-plus"></i> 팔로우</button>
								    </div>
								    <div class="user-points">
								        <div class="user-point">
								            <div class="user-point-label"><i class="fa fa-flash"></i> 활동점수</div>
								            <div class="user-point-num"><a href="/user/info/145021/activity">0</a></div>
								        </div>
								        <div class="user-point">
								            <div class="user-point-label"><i class="fa fa-user"></i> 팔로잉</div>
								            <div class="user-point-num"><a href="#">0</a></div>
								        </div>
								        <div class="user-point">
								            <div class="user-point-label"><i class="fa fa-users"></i> 팔로워</div>
								            <div class="user-point-num"><a href="#">0</a></div>
								        </div>
								    </div>
								</div>
					  </div>
				</div>
				<div class="col-sm-2 user-info-nav pull-right">
				    <ul class="nav">
				        <li class="active"><a href="/user/info/145021/activity">최근 활동</a> </li>
				        <li class=""><a href="/user/info/145021/articles">게시물 </a></li>
				        <li class=""><a href="/user/info/145021/scrapped">스크랩 </a></li>
				    </ul>
				</div>
				<div class="col-sm-10 main-block-left pull-left">
					<ul class="list-group">
					
					</ul>
					<div class="text-center">
					</div>
				</div>
			</div>
	        
    	<jsp:include page="/WEB-INF/global/footer.jsp"/>   
   </div> <!-- main -->   
</div> <!-- layout-container -->  
<script type="text/javascript" src="/semiproject/js/user/userMyPageForm.js"></script>
 
    </body>
</html>
