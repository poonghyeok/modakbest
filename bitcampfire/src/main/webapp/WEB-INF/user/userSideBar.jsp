<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<head>
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/semiproject/css/user/application.css">
</head>

<body>	            
<!-- 1. 좌측  메뉴바  -->            
<div class="sidebar">
    <a href="javascript://" class="sidebar-header">
        <i class="fa fa-bars sidebar-header-icon"></i>
    </a>
	<!-- 메인 로고변경  로고/페이지명 필요-->
    <h1><div class="logo"><a href="/semiproject/"><img src="../img/bitfire_logo.png" alt="OKKY" title="OKKY" style="width: 140px; height: 45px;"></a></div></h1>

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

	<!-- 검색 창 하단 로그인/회원가입 이동 선을 못찾음  -->
    <div class="nav-user nav-sidebar">
		<c:if test="${sessionScope.user_email == null }">
            <ul class="nav nav-sidebar">
                <li><a href="/semiproject/user/userLoginForm" class="link"><i class="fa fa-sign-in"></i> <span class="nav-sidebar-label">로그인</span></a></li>
                <li><a href="/semiproject/user/userSignupForm" class="link"><i class="fa fa-user"></i> <span class="nav-sidebar-label">회원가입</span></a></li>
            </ul>
		</c:if>
			<c:if test="${sessionScope.user_email != null }">			
			<div class="avatar clearfix avatar-medium ">
				<a href="/semiproject/user/userInfo" class="avatar-photo"><img src="//www.gravatar.com/avatar/2a9f77fb6b421b904e6a3c0b17d03d93?d=identicon&amp;s=40"></a>
				<div class="avatar-info">
					<a class="nickname" href="/semiproject/user/userInfo" title="기지니기지니">${userNickname }</a>
					<div class="activity block"><span class="fa fa-flash"></span> 0</div>
				</div>
			</div>
            <div class="nav-user-action">
                <div class="nav-user-func">
                    <a href="/semiproject/user/userUpdateForm">정보수정</a>
                    <a href="javascript://" id="user-func" data-toggle="popover" data-trigger="click" tabindex="0" data-original-title="" title="">
                        <i id="user-func-icon" class="fa fa-cog"></i>
                    </a>
            	</div>
	            <div class="nav-user-func">
	                <a href="/semiproject/user/userLogOut">로그아웃</a>
	                <a href="javascript://" id="user-notification" data-toggle="popover" data-trigger="click" tabindex="0" data-original-title="" title="">
	                    <i id="user-notification-icon" class="fa fa-bell"></i>
	                    <span id="user-notification-count" class="badge notification" style="display:none;">1</span>
	                </a>
	            </div>		
           	</div>
           	<form action="/semiproject/user/logOut" method="post" style="display:none;"><input type="submit" name="logoutButton" value="logoutButton" id="logoutButton"></form>
			</c:if>
    </div> <!-- nav-user nav-sidebar -->	 

    <ul class="nav nav-sidebar nav-main">
    		<!-- link 누르면 호버기능/url 바꾸기  -->
    		<li  ><a href="/articles/questions" class="link"><i class="nav-icon fa fa-database"></i> <span class="nav-sidebar-label nav-sidebar-category-label">취업정보</span></a></li>
    		<li  ><a href="/articles/tech" class="link"><i class="nav-icon fa fa-code"></i> <span class="nav-sidebar-label nav-sidebar-category-label">후기</span></a></li>
    		<li  ><a href="/articles/community" class="link"><i class="nav-icon fa fa-comments"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Q&A</span></a></li>
    		<li  ><a href="/articles/columns" class="link"><i class="nav-icon fa fa-quote-left"></i> <span class="nav-sidebar-label nav-sidebar-category-label">자유게시판</span></a></li>
    </ul>

	<!-- okky-깃허브에 연동 -->
    <ul class="nav nav-sidebar nav-bottom">
        <li ><a href="https://github.com/okjsp/okky/issues" class="link" target="_blank"><i class="fa fa-github"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Github Issues</span></a></li>
    </ul>
</div> <!-- sidebar  -->
</body>
</html>
