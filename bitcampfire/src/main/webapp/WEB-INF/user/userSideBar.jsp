<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<head>
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/semiproject/css/user/application.css">
</head>
<!-- 1. 좌측  메뉴바  -->            
<div class="sidebar">
    <a href="javascript://" class="sidebar-header">
        <i class="fa fa-bars sidebar-header-icon"></i>
    </a>
    
	<!-- 메인 로고변경  로고/페이지명 필요-->
    <h1><div class="logo"><a href="/semiproject/"><img src="/semiproject/img/bitfire_logo.PNG" alt="OKKY" title="OKKY" style="width: 140px; height: 45px;"></a></div></h1>


	<!-- 검색창을 구글 연동 없이 게시판과 동일하게 간다면 수정 필요  -->
	<ul id="search-google-icon" class="nav nav-sidebar nav-sidebar-search-wrapper">
        <li class="nav-sidebar-search"><a href="javascript://" class="link" id="search-google" data-toggle="popover" data-trigger="click"><i class="fa fa-search"></i></a></li>
    </ul>

    <form id="search-google-form" name="searchMain" class="nav-sidebar-form" action="https://www.google.com/search">
        <div class="input-group">
            <input type="text" name="qt" class="form-control input-sm" placeholder="Google 검색" />
            <input type="hidden" name="q" />
            <span class="input-group-btn">
                <button class="btn btn-default btn-sm" type="submit"><i class="fa fa-search"></i></button>
            </span>
        </div> <!-- input-group -->
    </form>

	<!-- @@@ 연수 수정 @@@  -->
	<!-- 검색 창 하단 로그인/회원가입 이동 선을 못찾음  -->
    <div class="nav-user nav-sidebar">
    		<!-- 로그아웃 상태 -->
    	    <c:if test="${sessionScope.memEmail == null }">
            <ul class="nav nav-sidebar">
                <li ><a href="/semiproject/user/userLoginForm" class="link"><i class="fa fa-sign-in"></i> <span class="nav-sidebar-label">로그인</span></a></li>
                <li ><a href="/semiproject/user/userSignupForm" class="link"><i class="fa fa-user"></i> <span class="nav-sidebar-label">회원가입</span></a></li>
            </ul>
            </c:if>
            <!-- 로그인 상태 -->
         	<c:if test="${sessionScope.memEmail != null }">
            <ul class="nav nav-sidebar">
	      		<div class="avatar clearfix avatar-medium">				
						<!-- 이동 경로가 회원번호 같은디? -->
						<!-- img src 불러오기 다시 -->
						
						<a href="/semiproject/user/userMyPageForm" class='avatar-photo' style="margin-left: 25px;"><img src="/semiproject/storage/${sessionScope.memImg}" id="MyPg_user_image"></a>
						<div class="avatar-info" style="width: 500px;">
								<a class="user_nickname" href="/semiproject/user/userMyPageForm" title="">${sessionScope.memNickname}</a>
						</div>
						<!-- 확인용 삭제하기 
						<div style="margin-left: 100px;">${sessionScope.memImg}</div>-->		
				</div>
			</ul>
			<ul class="nav nav-sidebar">
                <li ><a href="/semiproject/user/userUpdateForm" class="link"><i class="fa fa-sign-in"></i> <span class="nav-sidebar-label">정보수정</span></a></li>
                <li ><a class="link" id="logoutBtn"><i class="fa fa-user"></i> <span class="nav-sidebar-label">로그아웃</span></a></li>
            </ul>            
            </c:if>
    </div><!-- nav-user nav-sidebar -->
    <!-- @@@ 연수 수정 @@@  -->
 


    <ul class="nav nav-sidebar nav-main">
    		<!-- link 누르면 호버기능?  -->
    		<li  ><a href="/semiproject/board/list?pg=1" class="link"><i class="nav-icon fa fa-database"></i> <span class="nav-sidebar-label nav-sidebar-category-label">취업정보</span></a></li>
    		<li  ><a href="/semiproject/board/list?pg=1" class="link"><i class="nav-icon fa fa-code"></i> <span class="nav-sidebar-label nav-sidebar-category-label">후기</span></a></li>
    		<li  ><a href="/semiproject/board/list?pg=1" class="link"><i class="nav-icon fa fa-comments"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Q&A</span></a></li>
    		<li  ><a href="/semiproject/board/list?pg=1" class="link"><i class="nav-icon fa fa-quote-left"></i> <span class="nav-sidebar-label nav-sidebar-category-label">자유게시판</span></a></li>
    </ul>

	<!-- okky-깃허브에 연동 -->
    <ul class="nav nav-sidebar nav-bottom">
        <li ><a href="https://github.com/poonghyeok/modakbest/issues" class="link" target="_blank"><i class="fa fa-github"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Github Issues</span></a></li>
    </ul>
</div> <!-- sidebar  -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$('#logoutBtn').click(function(){
	$.ajax({
		type: 'post',
		url: '/semiproject/user/userLogout',
		success: function(data){
			alert("로그아웃 되었습니다.")
			location.href = "/semiproject/";
			},
			error: function(err){
				console.log(err);
			},
		});
	});

</script>

