<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<head>
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/semiproject/css/user/application.css">
</head>
<!-- 1. 좌측  메뉴바  -->     
<input type="hidden" id="memEmail" value="${sessionScope.memEmail}">
<input type="hidden" id="memUser_classid" value="${sessionScope.memClassId}"> 
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


						<a href="/semiproject/user/userMyPageForm" class='avatar-photo' style="margin-left: 25px;"><img src="/semiproject/storage/userprofile/${sessionScope.memImg}" id="MyPg_user_image"></a>
						<div class="avatar-info" style="width: 500px;">
								<a class="user_nickname" href="/semiproject/user/userMyPageForm" title="">${sessionScope.memNickname}</a>
						</div>
				</div>
			</ul>
			<ul class="nav nav-sidebar">
                <li ><a href="/semiproject/user/userUpdateForm" class="link"><i class="fa fa-pencil-square-o"></i> <span class="nav-sidebar-label">정보수정</span></a></li>
                <c:if test="${sessionScope.memAccessToken == null}">
                <li ><a class="link" id="logoutBtn1" ><i class="fa fa-sign-out"></i> <span class="nav-sidebar-label">로그아웃</span></a></li>
				</c:if>
				<c:if test="${sessionScope.memAccessToken != null}">
				<li ><a class="link" id="logoutBtn2" href="https://kauth.kakao.com/oauth/logout?client_id=a8101df81b25dcd4c9803f7ffd553284&logout_redirect_uri=http://localhost:8080/semiproject/user/logout"><i class="fa fa-sign-out"></i> <span class="nav-sidebar-label">로그아웃</span></a></li>
            	</c:if>          
            </ul>            
            </c:if>
    </div><!-- nav-user nav-sidebar -->
  
    <ul class="nav nav-sidebar nav-main">

    		<!-- link 누르면 호버기능?  -->
    		<!-- 풍혁220714 : list로 url에는 pg와  sortOption이 있어야 한다. sortOption은 기본이 date다. -->
    		<!-- 풍혁220718 : url에 category를 추가했습니다. 게시판이 4개로 늘어났기 때문에 어떤 게시판에서 data를 받아올 것인지 결정해야합니다.  -->
    		<li  ><a href="/semiproject/board/list?category=info&pg=1&sortOption=date" class="link"><i class="nav-icon fa fa-database"></i> <span class="nav-sidebar-label nav-sidebar-category-label">취업정보</span></a></li>
    		<li  ><a href="/semiproject/board/list?category=review&pg=1&sortOption=date" class="link"><i class="nav-icon fa fa-code"></i> <span class="nav-sidebar-label nav-sidebar-category-label">후기</span></a></li>
    		<li  ><a href="/semiproject/board/list?category=qna&pg=1&sortOption=date" class="link"><i class="nav-icon fa fa-comments"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Q&A</span></a></li>
    		<li  ><a href="/semiproject/board/list?category=free&pg=1&sortOption=date" class="link"><i class="nav-icon fa fa-quote-left"></i> <span class="nav-sidebar-label nav-sidebar-category-label">자유게시판</span></a></li>

    		<li  id="class_boardBtn"><a href="#" class="link"><i class="nav-icon fa fa-group"></i> <span class="nav-sidebar-label nav-sidebar-category-label">학원전용 게시판</span></a></li>
    		<!-- @@@@@@@@@@@@@@ 연수 : 어드민 페이지  수정 중  / 관리자는 각자 DB에 user_id = 0으로 등록 후 사용(220715)  @@@@@@@@@@@@@@-->
    		<%-- <c:if test="${sessionScope.memId == 0 }"> --%>
    		<li  ><a href="/semiproject/admin/adminUserAllList" class="link"><i class="nav-icon fa fa-lock"></i> <span class="nav-sidebar-label nav-sidebar-category-label">관리자페이지</span></a></li>
			<%-- </c:if> --%>
			<!-- @@@@@@@@@@@@@@ 연수 : 어드민 페이지  수정 중  / 관리자는 각자 DB에 user_id = 0으로 등록 후 사용(220715)  @@@@@@@@@@@@@@-->

    </ul>

	<!-- okky-깃허브에 연동 -->
    <ul class="nav nav-sidebar nav-bottom">
        <li ><a href="https://github.com/poonghyeok/modakbest/issues" class="link" target="_blank"><i class="fa fa-github"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Github Issues</span></a></li>
    </ul>
</div> <!-- sidebar  -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/semiproject/js/user/userSideBar.js"></script>


<script type="text/javascript">
////////////////////////유진추가0715//////////////////////////////

$('#class_boardBtn').click(function(){
	if($('#memEmail').val() == ''){
		alert("로그인이 필요한 게시판입니다.");
		location.href = "/semiproject/user/userLoginForm";
	}
	else if($('#memUser_classid').val()=='' || $('#memUser_classid').val()=='0'){
		alert("학원 전용 게시판입니다.\n이용을 원하시면 학원을 등록하세요.");
		location.href = "/semiproject/user/userUpdateForm";
	}
	else {
		location.href = "/semiproject/board/boardClassList?class_id="+$('#memUser_classid').val();
	}
});
</script>

