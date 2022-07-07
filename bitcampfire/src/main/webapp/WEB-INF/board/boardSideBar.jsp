<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- sidebar1 -->
<div class="sidebar sidebar-category">
    <a href="javascript://" class="sidebar-header">
         <i class="fa fa-bars sidebar-header-icon"></i>
    </a>
    <h1>
        <div class="logo">
            <a href="/semiproject/">
                <img src="/semiproject/img/bit_small_logo.png" alt="OKKY" title="OKKY" style="width: 60px; height: 60px;">

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

    <div class="nav-user nav-sidebar">
        <ul class="nav nav-sidebar">
            <li data-toggle="tooltip" data-container="body" title="" data-original-title="로그인"><a href="/semiproject/user/login" class="link"><i class="fa fa-sign-in"></i> <span class="nav-sidebar-label">로그인</span></a></li>
            <li data-toggle="tooltip" data-container="body" title="" data-original-title="회원가입"><a href="/semiproject/user/userSignupForm" class="link"><i class="fa fa-user"></i> <span class="nav-sidebar-label">회원가입</span></a></li>
        </ul>
    </div>

    <ul class="nav nav-sidebar nav-main">
    	<!-- jquery 로 요소 선택했을 때 active class 추가되도록 해야된다. 	 -->
    	<li class="active" data-toggle="tooltip" data-placement="right" data-container="body" title="" data-original-title="Q&amp;A"><a href="/semiproject/board/list?pg=1" class="link"><i class="nav-icon fa fa-database"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Q&amp;A</span></a></li>
        <li data-toggle="tooltip" data-placement="right" data-container="body" title="" data-original-title="게시판1"><a href="/semiproject/board/list?pg=1" class="link"><i class="nav-icon fa fa-code"></i> <span class="nav-sidebar-label nav-sidebar-category-label">게시판1</span></a></li>
        <li data-toggle="tooltip" data-placement="right" data-container="body" title="" data-original-title="게시판2"><a href="/semiproject/board/list?pg=1" class="link"><i class="nav-icon fa fa-comments"></i> <span class="nav-sidebar-label nav-sidebar-category-label">게시판2</span></a></li>
        <li data-toggle="tooltip" data-placement="right" data-container="body" title="" data-original-title="게시판3"><a href="/semiproject/board/list?pg=1" class="link"><i class="nav-icon fa fa-quote-left"></i> <span class="nav-sidebar-label nav-sidebar-category-label">게시판3</span></a></li>
        <li data-toggle="tooltip" data-placement="right" data-container="body" title="" data-original-title="학원&반"><a href="/semiproject/board/list?pg=1" class="link"><i class="nav-icon fa fa-group"></i> <span class="nav-sidebar-label nav-sidebar-category-label">학원커뮤</span></a></li>
    </ul>

    <ul class="nav nav-sidebar nav-bottom">
        <li data-toggle="tooltip" data-placement="right" data-container="body" title="" data-original-title="Github Issues"><a href="https://github.com/poonghyeok/modakbest" class="link" target="_blank"><i class="fa fa-github"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Github Issues</span></a></li>
    </ul>
</div>

<!-- sdiebar2 -->
<div class="sidebar-category-nav">
    <h3 class="sub-title">Q&amp;A</h3>
    <ul class="nav">
            <li><a href="/semiproject/board/list?pg=1" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">All</span> <span class="nav-indicator nav-selected"><span class="nav-selected-dot"></span></span></a></li>
                    <!-- 풍혁 (220707 0847) : 여기 list는 게시판마다 달라지게 해야됨. 1. ajax 2. controller 에서 addobject ... -->
                    <li><a href="/semiproject/board/list?pg=1" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">Tech Q&amp;A</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
                    <li><a href="/semiproject/board/list?pg=1" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">Career Q&amp;A</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
    </ul>
    <div class="special-nav">
    </div>
</div>
<!-- 풍혁 (220707 0847) : board와 관련된 모든 jsp에 sidebar와 footer를 jsp include 하면되지 않을까 -->

<!-- 풍혁(220707) : sidebar에서 active 변경하기  -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$('ul.nav,.nav-sidebar,.nav-main a.link').click(function(){
		alert('접근성공!');
		var target = $('ul.nav,.nav-sidebar,.nav-main').children('li[data-toggle="tooltip"]')
		
		$(this).addClass("active");
		target.not($(this)).addClass("");
		
	})	
</script>

<!-- 풍혁(220707) : sidebar에서 active 변경하기  -->