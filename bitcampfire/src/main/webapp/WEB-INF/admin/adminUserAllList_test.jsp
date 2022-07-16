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
	
	<link rel="stylesheet" href="/semiproject/css/board/boardList.css">
	<link rel="stylesheet" href="/semiproject/css/board/boardList2.css">
</head>			
<body>

<div class="layout-container">
	<div class="main">
		<!-- 풍혁 (220707) : 보드 고정 사이드바 jsp include -->
		<%@ include file="/admin/adminSidebar.jsp" %>
		<%-- <jsp:include page="/WEB-INF/board/boardSideBar.jsp"/> --%>
		<!-- 풍혁 (220707) : 보드 고정 사이드바 jsp include -->
		
			<!-- conten tscaffold-list clearfix -->
			<!-- <div id="list-article" class="content scaffold-list tech-list" role="main"> -->
			<!-- <div id="index" class="content scaffold-list clearfix" role="main"> -->
			<!-- 풍혁0709 : div 내의 내용은 jquery가 구성한다. --> 
               <div class="panel panel-default questions-panel">
                    <ul class="list-group">
						<li class="list-group-item list-group-item-question clearfix">
						 <div class="list-title-wrapper clearfix" style="background-color:blue; width:200px;">
						  <div class="avatar clearfix avatar-list ">
						            <a href="/user/info/146096" class="avatar-photo"><img
						                    src="https://lh3.googleusercontent.com/a-/AFdZucoFQs_c0M6ifIe9Dgx1QJH6Hz4z1PVoLq1yu7JG=s96-c"></a>
						            <div class="avatar-info">
						                <a class="nickname" href="/user/info/146096" title="여울님">여울님</a>
						                <div class="activity"><span class="fa fa-flash"></span> 30</div>
						                <div class="date-created"><span class="timeago" title="2022-07-15T11:34:40">2022-07-15 11:34:40</span>
						                </div>
						            </div>
						        </div>
						 </div>	
	
						   <!--  <div class="list-title-wrapper clearfix">
						        <div class="list-tag clearfix">
						            <span class="list-group-item-text article-id">#1273483</span>
						            <a href="/articles/news" class="list-group-item-text item-tag label label-info"><i class="fa fa-code"></i>
						                IT News &amp; 정보</a>
						            <a href="/articles/tagged/%EC%96%B4%ED%94%8C" class="list-group-item-text item-tag label label-gray ">어플</a>
						            <a href="/articles/tagged/%EC%BA%94%EB%B2%84%EC%8A%A4"
						                class="list-group-item-text item-tag label label-gray ">캔버스</a>
						            <a href="/articles/tagged/it" class="list-group-item-text item-tag label label-gray ">it</a>
						        </div>
						
						        <h5 class="list-group-item-heading list-group-item-evaluate">
						            <a href="/article/1273483">
						                &lt; Ycombinator 투자받은 핫한 앱 Haptabase 사용 후기 &gt;
						            </a>
						        </h5>
						    </div>
						
						    <div class="list-summary-wrapper clearfix">
						        <div class="list-group-item-summary clearfix">
						            <ul>
						                <li class=""><i class="item-icon fa fa-comment "></i> 2</li>
						                <li class="item-icon-disabled">
						                    <i class="item-icon fa fa-thumbs-up"></i> 0
						                </li>
						                <li class=""><i class="item-icon fa fa-eye"></i> 174</li>
						            </ul>
						        </div>
						    </div>
						
						    <div class="list-group-item-author clearfix">
						        <div class="avatar clearfix avatar-list ">
						            <a href="/user/info/146096" class="avatar-photo"><img
						                    src="https://lh3.googleusercontent.com/a-/AFdZucoFQs_c0M6ifIe9Dgx1QJH6Hz4z1PVoLq1yu7JG=s96-c"></a>
						            <div class="avatar-info">
						                <a class="nickname" href="/user/info/146096" title="여울님">여울님</a>
						                <div class="activity"><span class="fa fa-flash"></span> 30</div>
						                <div class="date-created"><span class="timeago" title="2022-07-15T11:34:40">2022-07-15 11:34:40</span>
						                </div>
						            </div>
						        </div>
						    </div> -->
					
						</li><!--  list-group-item list-group-item-question list-group-has-note clearfix -->
						                       
                    </ul> <!-- //list group --> 
                </div> <!-- //panel panel-default tech-panel -->
                
			<!-- </div> -->
			
		<jsp:include page="/WEB-INF/global/footer.jsp"/>
	</div> <!-- main -->   
</div> <!-- layout-container -->

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- @@@ 연수 : 학원 검색 기능 수정중(0711) - selectbox 검색기능 @@@   -->
<script type="text/javascript" src="/semiproject/js/user/select2.js"></script>
<script type="text/javascript">

$('#check_alert').hide();
$('#check_alert_userEmail').hide();
//회원정보 수정 - 데이터가져오기
$(function(){
	$.ajax({
		type: 'post',
		url: '/semiproject/user/getUser',
		data: {'user_email' : $('#user_email2').val()},
		dataType: 'json',
		success: function(data){
			//alert(JSON.stringify(data));		
 					
			$('#user_name').val(data.user_name);
			$('#user_nickname').val(data.user_nickname);
			$('input[name="user_nickname_check"]').val(data.user_nickname);
			if(data.user_classid == '0'){
				$('#user_classid').val();
			}else{
				$('#user_classid').val(data.user_classid).select2();
			};
			//$('#user_classid').val(data.user_classid).select2();
			$('#user_email').val(data.user_email); 
			//$('select[name="user_classid"]').val(data.user_classid);
			//$('#class_academy').val(data.class_academy);
			//$('#class_class').val(data.class_class);
			
		},
		error: function(err){
			console.log(err);
		}
	});
}); 	  


</script>
</body>
</html>