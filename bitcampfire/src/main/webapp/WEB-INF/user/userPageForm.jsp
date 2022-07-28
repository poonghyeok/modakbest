<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>bitcampfire - 마이페이지</title>
   <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
   <link rel="stylesheet" href="/semiproject/css/user/application.css"><base>   
</head>


<body>
<div class="layout-container">
    <div class="main">
		<jsp:include page="/WEB-INF/user/userSideBar.jsp"/> 		
		
			<div id="user" class="content clearfix" role="main" >
				<div class="panel panel-default" style="height:180px;" >
					<div class="panel-body">
						<div class="avatar clearfix avatar-big col-sm-3 text-center">
							<%-- <input type="hidden" value="${user_id }"> --%>
							<a href="#" class='avatar-photo'><img id="myProfile" src="/semiproject/storage/userprofile/${userPageInfo.userPage_img}"/></a>
							<%-- <input type="text" id="memClassid" value="${sessionScope.memClassid }"> --%>
						</div><!-- avatar clearfix avatar-big col-sm-3 text-center -->
						<div class="user-info col-sm-9">
							<div class="clearfix">
								<h2 class="pull-left" style="font-size:18pt;">${userPageInfo.userPage_nickname}</h2>
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
						<li class="active">최근 활동</li>
					<!-- 	<li class=""><a href="#">게시물 </a></li>
						<li class=""><a href="#">스크랩 </a></li> -->
					</ul>
				</div>
				<!-- 본인이 쓴 글자리  -->
				<div class="col-sm-10 main-block-left pull-left">
			      <ul class="list-group">
			      	<c:forEach items="${list}" var="boardDTO"> 
				        <li class="list-group-item list-group-item-small list-group-no-note clearfix">
			               <div class="list-icon-wrapper pull-left">
			           
							<c:choose>
										               
							<c:when test="${boardDTO.board_cateid == '1'}">		
								              <i>     	
				               		<img style="widht: 20px; height: 20px;" id="articleIcon" src="/semiproject/img/icon_inform.png"/>
				               		 </i>
						               </div>
						               <div class="list-title-wrapper list-activity">
						                   <div class="list-activity-desc">
						                       <span class="list-activity-desc-text">
						                           <a href="#" class="list-group-item-text item-tag label label-info">
						                           		
						                               <i class="fa fa-comments">취업정보</i>	
													                               
													</a>에 # ${boardDTO.board_id } 게시물을 작성하였습니다.
						                       </span>
						                       <span class="timeago" title=" ${boardDTO.board_date_created } "> ${boardDTO.board_date_created } </span>
						                   </div>
						                   <h5 class="list-group-item-heading">
						                   <a href="/semiproject/board/getBoardView?category=info&board_id=${boardDTO.board_id }">${boardDTO.board_title}</a>			               		
				               	
							</c:when>
											               	
							<c:when test="${boardDTO.board_cateid == '2'}">
										    <i>               	
			               		<img style="widht: 20px; height: 20px;" id="articleIcon" src="/semiproject/img/icon_review.png"/>
			               		</i>
					               </div>
					               <div class="list-title-wrapper list-activity">
					                   <div class="list-activity-desc">
					                       <span class="list-activity-desc-text">
					                           <a href="#" class="list-group-item-text item-tag label label-info">
					                           		
					                               <i class="fa fa-comments">후기</i>	
									           </a>에 # ${boardDTO.board_id } 게시물을 작성하였습니다.
					                       </span>
					                       <span class="timeago" title=" ${boardDTO.board_date_created } "> ${boardDTO.board_date_created } </span>
					                   </div>
					                   <h5 class="list-group-item-heading">
					                   <a href="/semiproject/board/getBoardView?category=review&board_id=${boardDTO.board_id }">${boardDTO.board_title}</a>
			                   
							</c:when>
											               	
							<c:when test="${boardDTO.board_cateid == '3'}">		  
							    <i>             	
				               		<img style="widht: 20px; height: 20px;" id="articleIcon" src="/semiproject/img/icon_qna.png"/>
				               		</i>
						               </div>
						               <div class="list-title-wrapper list-activity">
						                   <div class="list-activity-desc">
						                       <span class="list-activity-desc-text">
						                           <a href="#" class="list-group-item-text item-tag label label-info">
						                           		
						                               <i class="fa fa-comments">Q&A</i>	
											      </a>에 # ${boardDTO.board_id } 게시물을 작성하였습니다.
							                       </span>
							                       <span class="timeago" title=" ${boardDTO.board_date_created } "> ${boardDTO.board_date_created } </span>
							                   </div>
							                   <h5 class="list-group-item-heading">
		                					   <a href="/semiproject/board/getBoardView?category=qna&board_id=${boardDTO.board_id }">${boardDTO.board_title}</a>
							</c:when>
							
							<c:when test="${boardDTO.board_cateid == '4'}">	
							    <i>	               	
				               		<img style="widht: 20px; height: 20px;" id="articleIcon" src="/semiproject/img/icon_free.png"/>
				               		</i>
						               </div>
						               <div class="list-title-wrapper list-activity">
						                   <div class="list-activity-desc">
						                       <span class="list-activity-desc-text">
						                           <a href="#" class="list-group-item-text item-tag label label-info">
						                           		
						                               <i class="fa fa-comments">자유게시판</i>
													</a>에 # ${boardDTO.board_id } 게시물을 작성하였습니다.
						                       </span>
						                       <span class="timeago" title=" ${boardDTO.board_date_created } "> ${boardDTO.board_date_created } </span>
						                   </div>
						                   <h5 class="list-group-item-heading">
						                   <a href="/semiproject/board/getBoardView?category=free&board_id=${boardDTO.board_id }">${boardDTO.board_title}</a>
							</c:when>
							
							<c:when test="${boardDTO.board_cateid == '5'}">		
							    <i>               	
				               		<img style="widht: 20px; height: 20px;" id="articleIcon" src="/semiproject/img/icon_class.png"/>
				               		</i>
						               </div>
						               <div class="list-title-wrapper list-activity">
						                   <div class="list-activity-desc">
						                       <span class="list-activity-desc-text">
						                           <a href="#" class="list-group-item-text item-tag label label-info">
						                           		
						                               <i class="fa fa-comments">학원전용</i>
									             </a>에 # ${boardDTO.board_id } 게시물을 작성하였습니다.
						                       </span>
						                       <span class="timeago" title=" ${boardDTO.board_date_created } "> ${boardDTO.board_date_created } </span>
						                   </div>
						                   <h5 class="list-group-item-heading">
						                   
						                   <a href="/semiproject/board/getBoardClassView?category=class&board_id=${boardDTO.board_id }&pg=1&class_id=${userPageInfo.userPage_classid }">${boardDTO.board_title}</a>
						                   
						                 <%--   <a href="/semiproject/board/boardClassList?category=class&class_id=${boardDTO.board_classid }">${boardDTO.board_title}</a> --%>
						                 
								</c:when>
												               	
								</c:choose>

			           <%--                 </a>에 # ${boardDTO.board_id } 게시물을 작성하였습니다.
			                       </span>
			                       <span class="timeago" title=" ${boardDTO.board_date_created } "> ${boardDTO.board_date_created } </span>
			                   </div>
			                   <h5 class="list-group-item-heading">
			                   <a href="/semiproject/board/getBoardView?category=${boardDTO.board_cateid }&board_id=${boardDTO.board_id }">${boardDTO.board_title}</a> --%>
			                   <div class="list-group-item-author pull-right clearfix">
			                       <div class="avatar clearfix avatar-x-small ">
			                           <a href="/semiproject/user/userPage?user_id=${userPageInfo.userPage_id}" class="avatar-photo">
			                               <img src="/semiproject/storage/userprofile/${userPageInfo.userPage_img}">
			                           </a>
			                           <div class="avatar-info">
			                               <a class="nickname" href="/semiproject/user/userPage?user_id=${userPageInfo.userPage_id}" title="${userPageInfo.userPage_nickname }">${userPageInfo.userPage_nickname }</a>
			                               <div class="activity ">
			                                   <span class="fa fa-flash"></span> 22
			                               </div>
			                           </div>
			                       </div>
			                   </div>
			                   </h5>
							</div>
						</li> 
					</c:forEach>
					
			      </ul>
			      <div class="text-center">
					<ul class="pagination pagination-sm">
						${userPagePagingList }
			
					</ul>
				</div>				
				</div>
			</div> <!-- content clearfix -->


	        
		<jsp:include page="/WEB-INF/global/footer.jsp"/>   	
	</div> <!-- main -->   
</div> <!-- layout-container -->  
<!-- <script type="text/javascript">
$(function(){
	$.ajax({
		type: 'post',
		url: '/semiproject/user/getUserPageInfo',
		dataType: 'json',
		success: function(data){
			alert(JSON.stringify(data) );
			$('#myEmail').html(data.user_email);
			$('#myProfile').val(data.user_img);
		},
		error : function(err){
				console.log(err);
		}
	});
});

</script> -->
</body>
</html>
