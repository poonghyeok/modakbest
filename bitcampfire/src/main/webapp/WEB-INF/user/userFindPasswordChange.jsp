  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>bitcampfire - 비밀번호 변경</title>
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/semiproject/css/user/application.css">
</head>
<body>
<div class="layout-container">
 	<div class="main">
 		<jsp:include page="/WEB-INF/user/userSideBar.jsp"/>	
 		 
 		 	<!-- 메인시작 -->
			<div id="create-user" class="content clearfix" role="main">
			    <h3 class="content-header">비밀번호 변경</h3>
			    
				   <form id="userPwdChangeForm">
					
						<input type="hidden" name="_csrf" value="">
						<input type="hidden" name="user_email" id="user_email" value="${sessionScope.memEmail }">						
						  
						    <div class="col-sm-8 col-sm-offset-2">
						        <div class="panel panel-default panel-margin-10">
						            <div class="panel-body panel-body-content text-center">
						            
						                <p class="lead">변경하실 비밀번호를 입력해 주세요.</p>
							               	<div class="alert alert-danger" id="check_alert">		                
		              						</div>
						                
						                <div class="form-group">
						                    <input type="password" name="newPwd" id="newPwd" class="form-control form-control-inline text-center" placeholder="새 비밀번호" />
						                </div>
						                
						                <div class="form-group">
						                    <input type="password" name="newPwdCheck" id="newPwdCheck" class="form-control form-control-inline text-center" placeholder="새 비밀번호 확인" />
						                	<div id="newPwdCheckDiv"></div>
						                </div>
						                
						                <input type="button" id="userPwdChangeBtn" class="btn btn-primary" value="비밀번호 변경"> <!-- button -->
						                <a href="/semiproject/user/userLoginForm" class="btn btn-default">취소 </a><!--  button 메인으로 이동  -->
						            
						            </div><!-- panel-body panel-body-content text-center -->
						        </div><!-- panel panel-default panel-margin-10 -->
						    </div><!-- col-sm-8 col-sm-offset-2 -->
				   </form>
			</div><!-- create-user -->          
>
		<!-- 메인끝 -->
	  <jsp:include page="/WEB-INF/global/footer.jsp"/>   
   </div> <!-- main -->   
</div> <!-- layout-container -->

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/semiproject/js/user/userFindPasswordChange.js"></script>
</body>
</html>