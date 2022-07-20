<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- sidebar1 -->
<div class="sidebar sidebar-category">
    <a href="javascript://" class="sidebar-header">
         <i class="fa fa-bars sidebar-header-icon"></i>
    </a>
    <h1>
        <div class="logo">
            <a href="/semiproject/">
                <img src="/semiproject/img/bit_small_logo.png" alt="OKKY" title="OKKY" style="width: 40px; height: 40px;">

            </a>
        </div>
    </h1>

    <ul id="search-google-icon" class="nav nav-sidebar nav-sidebar-search-wrapper">
        <li class="nav-sidebar-search">
            <a href="javascript://" class="link" id="search-google" data-toggle="popover" data-trigger="click" data-original-title="" title="">
                <i class="fa fa-search"></i>
            </a>
        </li>
    </ul>

    <form id="search-google-form" name="searchMain" class="nav-sidebar-form" action="https://www.google.com/search">
        <div class="input-group">
            <input type="text" name="qt" class="form-control input-sm" placeholder="Google 검색">
            <!-- 풍혁 (220707 2039) : Google 검색은 살려만 두고 안 쓸 예정 or 전체 게시판 검색용도로 사용할 예정 -->
            <input type="hidden" name="q">
            <span class="input-group-btn">
                <button class="btn btn-default btn-sm" type="submit">
                    <i class="fa fa-search"></i>
                </button>
            </span>
        </div>
    </form>

   	<!-- @@@@@@ 연수 : 사이드바 링크 연결(로그인 여부  X: 로그인/회원가입 / 로그인 여부  O: 정보수정/로그아웃)  -->
	<!-- 로그인 X -->    
    <div class="nav-user nav-sidebar">
    	<c:if test="${sessionScope.memEmail == null }">
        <ul class="nav nav-sidebar">
            <li data-toggle="tooltip" data-container="body" title="로그인" data-original-title="로그인"><a href="/semiproject/user/userLoginForm" class="link"><i class="fa fa-sign-in"></i> <span class="nav-sidebar-label">로그인</span></a></li>
            <li data-toggle="tooltip" data-container="body" title="회원가입" data-original-title="회원가입"><a href="/semiproject/user/userSignupForm" class="link"><i class="fa fa-user"></i> <span class="nav-sidebar-label">회원가입</span></a></li>
        </ul>
        </c:if>
    </div>
    <!-- 로그인 O -->    
    <div class="nav-user nav-sidebar">
    	<c:if test="${sessionScope.memEmail != null }">
        <ul class="nav nav-sidebar">
            <li data-toggle="tooltip" data-container="body" title="정보수정" data-original-title="정보수정"><a href="/semiproject/user/userUpdateForm" class="link"><i class="fa fa-pencil-square-o"></i> <span class="nav-sidebar-label">정보수정</span></a></li>
            <!-- 카카오 로그인 X-->
            <c:if test="${sessionScope.memAccessToken == null}">
            <li data-toggle="tooltip" data-container="body" title="로그아웃" data-original-title="로그아웃"><a class="link" id="logoutBtn1"><i class="fa fa-sign-out"></i> <span class="nav-sidebar-label">로그아웃</span></a></li>
        	</c:if>
        	<!-- 카카오 로그인 O-->
        	<c:if test="${sessionScope.memAccessToken != null}">
            <li data-toggle="tooltip" data-container="body" title="로그아웃" data-original-title="로그아웃" ><a href="https://kauth.kakao.com/oauth/logout?client_id=a8101df81b25dcd4c9803f7ffd553284&logout_redirect_uri=http://localhost:8080/semiproject/user/logout" class="link" id="logoutBtn2"><i class="fa fa-sign-out"></i> <span class="nav-sidebar-label">로그아웃</span></a></li>
        	</c:if>
        </ul>
        </c:if>
    </div>
    <!-- @@@@@@ 연수  수정 끝(220714) -->

    <ul class="nav nav-sidebar nav-main">
    	<!-- jquery 로 요소 선택했을 때 active class 추가되도록 해야된다. 	 -->

    	<li class="sideIcon " data-toggle="tooltip" data-placement="right" data-container="body" title="" data-original-title="info"><a href="/semiproject/board/list?category=info&pg=1&sortOption=date" class="link"><i class="nav-icon fa fa-database"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Q&amp;A</span></a></li>
        <li class="sideIcon " data-toggle="tooltip" data-placement="right" data-container="body" title="" data-original-title="review"><a href="/semiproject/board/list?category=review&pg=1&sortOption=date" class="link"><i class="nav-icon fa fa-code"></i> <span class="nav-sidebar-label nav-sidebar-category-label">게시판1</span></a></li>
        <li class="sideIcon " data-toggle="tooltip" data-placement="right" data-container="body" title="" data-original-title="qna"><a href="/semiproject/board/list?category=qna&pg=1&sortOption=date" class="link"><i class="nav-icon fa fa-comments"></i> <span class="nav-sidebar-label nav-sidebar-category-label">게시판2</span></a></li>
        <li class="sideIcon " data-toggle="tooltip" data-placement="right" data-container="body" title="" data-original-title="free"><a href="/semiproject/board/list?category=free&pg=1&sortOption=date" class="link"><i class="nav-icon fa fa-quote-left"></i> <span class="nav-sidebar-label nav-sidebar-category-label">게시판3</span></a></li>

        <!-- @@@@@@@@@@@@@@ 연수 : 어드민 페이지  수정 중  / 관리자는 각자 DB에 user_id = 0으로 등록 후 사용(220715)  @@@@@@@@@@@@@@-->
        <%-- <c:if test="${sessionScope.memId == 0 }"> --%>
        <li data-toggle="tooltip" data-placement="right" data-container="body" title="관리자페이지" data-original-title="admin"><a href="/semiproject/admin/adminUserAllList" class="link"><i class="nav-icon fa fa-lock"></i> <span class="nav-sidebar-label nav-sidebar-category-label">관리자페이지</span></a></li>
    	<%-- </c:if> --%>
    	<!-- @@@@@@@@@@@@@@ 연수 : 어드민 페이지  수정 중  / 관리자는 각자 DB에 user_id = 0으로 등록 후 사용(220715)  @@@@@@@@@@@@@@-->

        <li data-toggle="tooltip" data-placement="right" data-container="body" title="" data-original-title="class"><a href="/semiproject/board/list?pg=1&sortOption=date" class="link"><i class="nav-icon fa fa-group"></i> <span class="nav-sidebar-label nav-sidebar-category-label">학원커뮤니티</span></a></li>

    </ul>

    <ul class="nav nav-sidebar nav-bottom">
        <li data-toggle="tooltip" data-placement="right" data-container="body" title="" data-original-title="Github Issues"><a href="https://github.com/poonghyeok/modakbest" class="link" target="_blank"><i class="fa fa-github"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Github Issues</span></a></li>
    </ul>
</div>

<!-- sdiebar2 -->
<div class="sidebar-category-nav">
    <h3 class="sub-title">Q&amp;A</h3>
    <ul class="nav">
            <li><a href="#" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">All</span> <span class="nav-indicator nav-selected"><span class="nav-selected-dot"></span></span></a></li>
            <!-- 풍혁 (220707 0847) : 여기 list는 게시판마다 달라지게 해야됨. 1. ajax 2. controller 에서 addobject ... -->
            <li><a href="#" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">Tech Q&amp;A</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
            <li><a href="#" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">Career Q&amp;A</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
    </ul>
    <div class="special-nav">
    </div>
</div>
<!-- 풍혁 (220707 0847) : board와 관련된 모든 jsp에 sidebar와 footer를 jsp include 하면되지 않을까 -->

<!-- 풍혁(220707) : sidebar에서 active 변경하기  -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
/* 	$('ul.nav,.nav-sidebar,.nav-main a.link').click(function(){
		alert('접근성공!');
		var target = $('ul.nav,.nav-sidebar,.nav-main').children('li[data-toggle="tooltip"]')
		
		$(this).addClass("active");
		target.not($(this)).addClass("");
		
	})	
 */
/* @@@@@@@ 연수 : 시작 @@@@@@@*/
/* 일반 로그인 회원 로그아웃 기능(220714) */
$('#logoutBtn1').click(function(){
	$.ajax({
		type: 'post',
		url: '/semiproject/user/logout',
		success: function(data){
			alert("로그아웃 되었습니다.")
			location.href = "/semiproject/";
			},
			error: function(err){
				console.log(err);
			},
		});
	});
 /* @@@@@@@ 연수 : 시작 @@@@@@@*/
 
 /* ################ 풍혁 풍혁 시작 시작 ################# */
 /* 풍혁0719 : sidebar에서 category 변경할 때마다 active 효과적용하기  일단 4개의 category에 대해서만, 관리자랑 학원도 필요하다면 추후에*/

 $(function(){
	 let category = $('#category').val();
	 $('li.sideIcon[data-original-title='+category+']').addClass('active');
	 
 })
 /* ################ 풍혁 풍혁 시작 시작 ################# */
</script>

<!-- 풍혁(220707) : sidebar에서 active 변경하기  -->