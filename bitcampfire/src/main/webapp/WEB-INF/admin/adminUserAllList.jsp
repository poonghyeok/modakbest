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
		<!-- 풍혁 (220707) : 보드 고정 사이드바 jsp include -->
		<%@ include file="/admin/adminSidebar.jsp" %>
		<%-- <jsp:include page="/WEB-INF/board/boardSideBar.jsp"/> --%>
		<!-- 풍혁 (220707) : 보드 고정 사이드바 jsp include -->
		
			<!-- conten tscaffold-list clearfix -->
			<div id="index" class="content scaffold-list clearfix" role="main">
				<!-- 풍혁0709 : div 내의 내용은 jquery가 구성한다. --> 
			</div>
			
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