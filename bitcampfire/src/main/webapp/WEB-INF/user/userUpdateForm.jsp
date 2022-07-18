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
	<!-- @@@ 연수 : 학원 검색 기능 수정중(0711) - selectbox 검색기능 @@@   -->
	<link rel="stylesheet" href="/semiproject/css/user/select2.css">
</head>			
<body>

<div class="layout-container">
 	<div class="main">
 		<jsp:include page="/WEB-INF/user/userSideBar.jsp"/>
 		
				<div id="create-user" class="content clearfix" role="main">
				<input type="hidden" id="user_social" value="${sessionScope.memSocial}">
				
				    <h3 class="content-header">회원 정보 수정</h3>
				    <div class="col-md-6 main-block-left">				    
				        <div class="panel panel-default">				                    		
				            <div class="panel-heading"> 				            
									<div class="avatar clearfix avatar-medium">											
										<a href="/semiproject/user/userMyPageForm" class='avatar-photo'><img src="/semiproject/storage/userprofile/${sessionScope.memImg}" id="show_user_image"/></a>
										<div class="avatar-info">
												<a class="user_nickname" href="/user/info/" title="">${sessionScope.memNickname}</a>
												<!-- <div class="activity block"><span class="fa fa-flash"></span> 10</div> 활동지수 삭제?-->
										</div>
									</div>				
																					
				           			<a id="edit-picture-btn">변경</a>					           				  						           	
	           			
					            <!-- user_imgUpdateForm -->
			           			<form id="update_userImgForm">				           			
			           				<div class="profile-picture-list" style="display:none; width: 153px;" id="user_imglist">			   						
					           			<div class="profile-picture selected" style="width: 130px;"><!-- id=profile-uploaded-image -->
						   					<span class="avatar-photo"><img src="/semiproject/storage/userprofile/${sessionScope.memImg}" id="uploaded_user_image"/></span>
						   					<span style="font-size: 15px;">my profile</span>
					   					</div> 
					   					
					   					<input type="button" class="btn btn-primary" id="profile-upload-btn" style="font-size: 12px; width: 130px; margin-bottom: 5px;" value="이미지 업로드">
					  					<input type="file" style="display:none;" name="user_image" accept="image/gif, image/jpg, image/jpeg, image/png" id="user_image"> <!-- files / profileImage -->
					  					
					  					<input type="button" class="btn btn-success picture-confirm-btn" id="update_userImgBtn" style="font-size: 12px; width: 130px;" value="확인" >
			           				</div><!-- profile-picture-list -->
	                 			</form>			            
					            
					            </div><!-- panel-heading -->
					            
			                <fieldset>
						       <!-- user_infoUpadateForm start -->			            
	            				<form id="upadate_userInfoForm" class="form-signup form-user panel-body">	
		            				<div class="alert alert-danger" id="check_alert">		                
	              					</div>
				                    <div class="form-group">
				                        <label class="control-label" for="user_name">이름</label>
				                        <input type="text" name="user_name" class="form-control input-sm" placeholder="이름" required="" value="" id="user_name">
				                    </div>								
									<div class="form-group">
										<label class="control-label" for="user_nickname">닉네임</label>
									<div class="row">										
										<div class="col-md-8">							                    	            									
										<input type="text" name="user_nickname" class="form-control input-sm" placeholder="닉네임" required="" value="" id="user_nickname" style="width: 270px">
										<input type="hidden" name="user_nickname_check" id="user_nickname_check" value="">
										</div>
										<div class="col-sm-2 col-xs-offset-1">			                                    		                                       			
										<button class="btn btn-primary btn-xm btn-sm" type="button" id="user_nickname_CheckBtn" style="visibility:visible; font-size:9pt;" disabled>중복체크</button>
										</div>	
									</div>
									</div>
									<div class="row" style="visibility:hidden;">줄맞춤을 위한 공간</div>                 
				                    
				                    <!-- @@@ 연수 : 학원 검색 기능 수정중(0711) @@@ -->		                    
				                    <div class="form-group">				                    					                    				                    
				                        <label class="control-label" for="class_academy">학원명</label>		
					                    <c:if test ="${!empty classList }">
								 		<select name="user_classid" class="form-control input-sm" id="user_classid" >
											<option value="0" selected>==선택안함==</option>							
											<c:forEach items="${classList }" var="classList">
												<option value="${classList.class_id}">${classList.class_academy}</option>
											</c:forEach>
										</select> 
										</c:if>
									</div>
									<!-- @@@ 연수 : 학원 검색 기능 수정중(0711) @@@ -->
			                        
			                        <!-- @@@ 연수 : 과정명 삭제(0711) @@@ -->
				                    <!-- <div class="form-group">
				                        <label class="control-label" for="class_class">과정명</label>
				                        <input type="text" name="class_class" class="form-control input-sm" placeholder="과정명" required="" value="" id="class_class">	
			                        </div> -->				                        
			                        		                                  
				                <input type="button" class="btn btn-primary btn-block" id="update_userInfoBtn" value="정보 수정">
				            	</form>
	                		</fieldset>
				        </div><!-- panel panel-default -->
				    </div><!-- col-md-6 main-block-left -->
				    
			        <div class="col-md-6 main-block-right">				       
				    	<div class="panel panel-default">
				    		<div class="panel-heading">
				                <h5 class="panel-header">이메일 변경</h5>
				            </div>
				            <!-- <div class="panel-body panel-margin"> -->										
				            	<!-- user_emailUpadateForm start -->			            
			            		<form id="upadate_userEmailForm" class="form-signup form-user panel-body" method="post">
			            				<div class="alert alert-danger" id="check_alert_userEmail">		                
  										</div>
					               		<div class="email-edit">
					               			<label class="control-label" for="user_email">이메일 주소</label>
						               		<div class="row">
						               			<div class="col-md-8">							                    	            									
							               			<input type="email" name="user_email" class="form-control input-sm" placeholder="이메일" required="" value="" id="user_email" style="width: 270px">
							               		   	<input type="hidden" name="user_email_check" id="user_email_check" value="">
						               			</div>
						               			<div class="col-sm-1 col-xs-offset-1">			                                    		                                       			
													<button class="btn btn-primary btn-xm btn-sm" type="button" id="emailBtn" style="font-size:9pt;" disabled id="emailCode_kakao">인증번호</button>
												</div>	
					               		   </div>
				               		 
						               		<div class="row" id="num_check_blank">
								            	<div class="col-md-8">							              		
										        	<input type="text" class="form-control input-sm" id="user_email_check_number" placeholder="인증번호 6자리" disabled="disabled" maxlength="6" style="width: 270px">
								            	</div>
								           		<div class="col-sm-1 col-xs-offset-1">													
											  		<button class="btn btn-success btn-xm btn-sm" type="button" id="mail-check-input" style="font-size:9pt;">번호인증</button>
							            	 	</div>		           	
						               		</div><!--num_check_blank  -->
						               		<div id="user_emailDiv" ></div>
					            		 </div> <!-- email-edit -->
									<br>
								<input type="button" class="btn btn-primary btn-block" id="update_userEmailBtn" value="이메일 변경">
								</form>
							<!-- </div>  panel-body panel-margin   -->
				    	</div><!-- panel panel-default -->				    	     
				        <!-- 비밀번호 변경  / 회원탈퇴 -->
		               <div class="panel panel-default">
            				<form class="form-signup form-user panel-body">			 
         				 		<!-- @@@ 연수 수정(220713) 카카오톡 가입자는 노출안됨 @@@ -->        
				                <a href="/semiproject/user/userPasswordChange" class="btn btn-info btn-block" id="pwdChange_kakao">비밀번호 변경</a>				                
				                <a href="/semiproject/user/userDeleteConfirm" class="btn btn-default btn-block">회원 탈퇴</a>				           
				        	</form>
		
				        </div> <!--panel panel-default -->				
			    	</div> <!-- col-md-6 main-block-right -->	
			    	   
			</div><!-- create-user -->  
		 <jsp:include page="/WEB-INF/global/footer.jsp"/>
   </div> <!-- main -->   
</div> <!-- layout-container -->

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- @@@ 연수 : 학원 검색 기능 수정중(0711) - selectbox 검색기능 @@@   -->
<script type="text/javascript" src="/semiproject/js/user/select2.js"></script>
<script type="text/javascript" src="/semiproject/js/user/userUpdateForm.js"></script>
</body>
</html>