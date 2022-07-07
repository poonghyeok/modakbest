<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
      <%--  <jsp:include page="/WEB-INF/user/userSideBar.jsp"/> --%> 

				<div id="user" class="content clearfix" role="main">
				  <div class="panel panel-default">
				    <div class="panel-body">
				
						<div class="avatar clearfix avatar-big col-sm-3 text-center">
								<a href="/user/info/145021" class='avatar-photo'><img id="myProfile" src=""/></a>
						</div>
				        <div class="user-info col-sm-9">
		              		<div class="clearfix">
			                  <h2 class="pull-left" id="myEmail"></h2>
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
				</div>
            </div>
        </div>
    <%-- <jsp:include page="/WEB-INF/global/footer.jsp"/>  --%>   
   </div> <!-- main -->   
</div> <!-- layout-container -->  
<script type="text/javascript" src="../js/user/userMyPageForm.js"></script>
 

    </body>
</html>
