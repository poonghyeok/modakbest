  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>bitcampfire - 비밀번호 변경</title>
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/semiproject/css/user/application.css">
<!-- 	<style type="text/css">
	#user_pwdDiv, #newPwdDiv, #newPwdCheckDiv{
		color: red;
		font-size: 8pt;
		font-weight: bold;
		}
	</style> -->
</head>
<body>
	<body>
        <div class="layout-container">
            <div class="main ">
<div class="sidebar ">
    <a href="javascript://" class="sidebar-header">
        <i class="fa fa-bars sidebar-header-icon"></i>
    </a>

    <h1><div class="logo"><a href="/"><img src="/assets/images/okjsp_logo.png" alt="OKKY" title="OKKY"></a></div></h1>

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
        </div>
    </form>

    <div class="nav-user nav-sidebar">

	
	

<div class="avatar clearfix avatar-medium ">
		<a href="/user/info/145381" class='avatar-photo'><img src="//file.okky.kr/profile/2022/1657443995289.png"/></a>
		<div class="avatar-info">
				<a class="nickname" href="/user/info/145381" title="tralalala">tralalala</a>
					<div class="activity block"><span class="fa fa-flash"></span> 0</div>
		</div>
</div>
            <div class="nav-user-action">
                <div class="nav-user-func">
                    <a href="javascript://" id="user-func" data-toggle="popover" data-trigger="click" tabindex="0">
                        <i id="user-func-icon" class="fa fa-cog"></i>
                    </a>
                </div>
                <div class="nav-user-func">
                    <a href="javascript://" id="user-notification" data-toggle="popover" data-trigger="click" tabindex="0">
                        <i id="user-notification-icon" class="fa fa-bell"></i>
                        <span id="user-notification-count" class="badge notification" style="display:none;">1</span>
                    </a>
                </div>
            </div>
            <form action="/logout" method="post" style="display:none;"><input type="submit" name="logoutButton" value="logoutButton" id="logoutButton"></form>

            <!-- <script id="setting-template" type="text/template"> -->
                <div class="popover popover-fixed" role="tooltip"><div class="arrow"></div>
                    <h3 class="popover-title"></h3>
                    <div class="popover-footer clearfix" id="user-func-popover">
                        <label href="" for="logoutButton" class="popover-btn"><i class="fa fa-sign-out"></i> 로그아웃</label>
                        <a href="/user/edit" class="popover-btn"><i class="fa fa-user"></i> 정보수정</a>
                    </div>
                </div>
            <!-- </script> -->

            <script id="notification-template" type="text/template">
                <div class="popover popover-fixed" role="tooltip"><div class="arrow"></div>
                    <h3 class="popover-title"></h3>
                    <div class="popover-content" id="notification-popover"></div>
                </div>
            </script>

            <script id="search-google-template" type="text/template">
                <div class="popover popover-fixed" role="tooltip"><div class="arrow"></div>
                    <h3 class="popover-title">Google 검색</h3>
                    <div class="popover-content" id="search-google-popover">
                        <form id="search-google-form" name="searchMain" class="nav-sidebar-form" action="https://www.google.com/search" onsubmit="searchMain.q.value='site:okky.kr '+searchMain.qt.value;">
                            <div class="input-group">
                                <input type="text" name="qt" class="form-control input-sm" placeholder="Google 검색" />
                                <input type="hidden" name="q" />
                                <span class="input-group-btn">
                                    <button class="btn btn-default btn-sm" type="submit"><i class="fa fa-search"></i></button>
                                </span>
                            </div>
                        </form>
                    </div>
                </div>
            </script>
    </div>

    <ul class="nav nav-sidebar nav-main">
    	
    		<li  ><a href="/articles/questions" class="link"><i class="nav-icon fa fa-database"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Q&A</span></a></li>
    		<li  ><a href="/articles/tech" class="link"><i class="nav-icon fa fa-code"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Tech</span></a></li>
    		<li  ><a href="/articles/community" class="link"><i class="nav-icon fa fa-comments"></i> <span class="nav-sidebar-label nav-sidebar-category-label">커뮤니티</span></a></li>
    		<li  ><a href="/articles/columns" class="link"><i class="nav-icon fa fa-quote-left"></i> <span class="nav-sidebar-label nav-sidebar-category-label">칼럼</span></a></li>
    		<li  ><a href="/articles/recruit?filter.jobType=CONTRACT" class="link"><i class="nav-icon fa fa-group"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Jobs</span></a></li>
    </ul>

    <ul class="nav nav-sidebar nav-bottom">
        <li ><a href="https://github.com/okjsp/okky/issues" class="link" target="_blank"><i class="fa fa-github"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Github Issues</span></a></li>
    </ul>
</div>
</div>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$('#user-func').click(function(){
	$('#user-func-popover').show();
	
});

</script>
</body>
</html>