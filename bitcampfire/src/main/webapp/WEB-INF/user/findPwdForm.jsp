<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>OKKY - All That Developer</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="_csrf_parameter" content="_csrf">
<meta name="_csrf_header" content="X-CSRF-TOKEN">
<meta name="_csrf" content="03c8d70f-65d7-480d-b5c5-0a61a07e163d">
<link rel="shortcut icon" href="/assets/images/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="/assets/images/icon_57x57.png">
<link rel="apple-touch-icon" sizes="114x114" href="/images/icon_114x114.png">
<meta property="og:image" content="https://okky.kr/assets/images/okky_logo_fb.png">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="/semiproject/css/application.css">
<script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script><script type="text/javascript" async="" src="https://www.googletagmanager.com/gtag/js?id=G-YB6VRG1VMM&amp;l=dataLayer&amp;cx=c"></script><script async="" src="https://www.googletagmanager.com/gtm.js?id=GTM-M52CW55"></script><script>

(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-M52CW55');</script>

<!--[if lt IE 9]>
	<script src="/js/libs/html5.js"></script>
	<script src="/assets/libs/respond.src.js"></script>
	<script src="/assets/libs/html5.js"></script>
<![endif]-->
		
<link rel="stylesheet" href="/assets/css/APW-style.css">
		
	<style type="text/css"></style>
</head>
	<body>
        <div class="layout-container">
            <div class="main ">
<div class="sidebar">
    <a href="javascript://" class="sidebar-header">
        <i class="fa fa-bars sidebar-header-icon"></i>
    </a>

    <h1><div class="logo"><a href="/"><img src="/assets/images/okjsp_logo.png" alt="OKKY" title="OKKY"></a></div></h1>

    <ul id="search-google-icon" class="nav nav-sidebar nav-sidebar-search-wrapper">
        <li class="nav-sidebar-search"><a href="javascript://" class="link" id="search-google" data-toggle="popover" data-trigger="click" data-original-title="" title=""><i class="fa fa-search"></i></a></li>
    </ul>

   <div class="nav-user nav-sidebar">
    	<c:if test="${sessionScope.userEmail == null }">
            <ul class="nav nav-sidebar">
                <li><a href="/semiproject/user/login" class="link"><i class="fa fa-sign-in"></i> <span class="nav-sidebar-label">로그인</span></a></li>
                <li><a href="/semiproject/user/userSignupForm" class="link"><i class="fa fa-user"></i> <span class="nav-sidebar-label">회원가입</span></a></li>
            </ul>
		</c:if>
		<c:if test="${sessionScope.userEmail != null }">
			<div class="nav-user nav-sidebar">

			<div class="avatar clearfix avatar-medium ">
					<a href="/semiproject/user/userInfo" class="avatar-photo"><img src="//www.gravatar.com/avatar/2a9f77fb6b421b904e6a3c0b17d03d93?d=identicon&amp;s=40"></a>
					<div class="avatar-info">
							<a class="nickname" href="/semiproject/user/userInfo" title="기지니기지니">${userNickname }</a>
								<div class="activity block"><span class="fa fa-flash"></span> 0</div>
					</div>
			</div>
            <div class="nav-user-action">
                <div class="nav-user-func">
                    <a href="javascript://" id="user-func" data-toggle="popover" data-trigger="click" tabindex="0" data-original-title="" title="">
                        <i id="user-func-icon" class="fa fa-cog"></i>
                    </a>
                </div>
                <div class="nav-user-func">
                    <a href="javascript://" id="user-notification" data-toggle="popover" data-trigger="click" tabindex="0" data-original-title="" title="">
                        <i id="user-notification-icon" class="fa fa-bell"></i>
                        <span id="user-notification-count" class="badge notification" style="display:none;">1</span>
                    </a>
                </div>
            </div>
            <form action="/semiproject/user/logOut" method="post" style="display:none;"><input type="submit" name="logoutButton" value="logoutButton" id="logoutButton"></form>

            <script id="setting-template" type="text/template">
                <div class="popover popover-fixed" role="tooltip"><div class="arrow"></div>
                    <h3 class="popover-title"></h3>
                    <div class="popover-footer clearfix" id="user-func-popover">
                        <label href="" for="logoutButton" class="popover-btn"><i class="fa fa-sign-out"></i> 로그아웃</label>
                        <a href="/user/edit" class="popover-btn"><i class="fa fa-user"></i> 정보수정</a>
                    </div>
                </div>
            </script>

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
		</c:if>
    </div>


    <ul class="nav nav-sidebar nav-main">
    	
    		<li><a href="/articles/questions" class="link"><i class="nav-icon fa fa-database"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Q&amp;A</span></a></li>
    		<li><a href="/articles/tech" class="link"><i class="nav-icon fa fa-code"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Tech</span></a></li>
    		<li><a href="/articles/community" class="link"><i class="nav-icon fa fa-comments"></i> <span class="nav-sidebar-label nav-sidebar-category-label">커뮤니티</span></a></li>
    		<li><a href="/articles/columns" class="link"><i class="nav-icon fa fa-quote-left"></i> <span class="nav-sidebar-label nav-sidebar-category-label">칼럼</span></a></li>
    		<li><a href="/articles/recruit?filter.jobType=CONTRACT" class="link"><i class="nav-icon fa fa-group"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Jobs</span></a></li>
    </ul>

    <ul class="nav nav-sidebar nav-bottom">
        <li><a href="https://github.com/okjsp/okky/issues" class="link" target="_blank"><i class="fa fa-github"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Github Issues</span></a></li>
    </ul>
</div>

<div id="create-user" class="content" role="main">
	<h3 class="content-header">계정 찾기</h3>
	<form action="/find/user/send" method="post">
			<input type="hidden" name="_csrf" value="03c8d70f-65d7-480d-b5c5-0a61a07e163d">
		<div class="col-sm-8 col-sm-offset-2">
		    <div class="panel panel-default panel-margin-10">
		        <div class="panel-body panel-body-content text-center">
		            <p class="lead">이메일 주소를 입력해 주세요.</p>
		            <p>회원 가입시 입력하신 이메일 주소를 입력하시면,<br> 해당 이메일로 아이디 및 비밀번호 변경 링크를 보내드립니다.</p>
		            <div class="form-group">
		                <input type="email" name="email" class="form-control form-control-inline text-center" placeholder="이메일 주소" value="">
		            </div>
		            <button type="submit" class="btn btn-primary">계정 찾기</button> <a href="/" class="btn btn-default">취소</a>
		        </div>
		    </div>
		</div>
	</form>
</div>
                <div class="right-banner-wrapper">
                </div>
                <div id="footer" class="footer" role="contentinfo">
<div class="row">
    <div class="col-sm-9">
        <div style="float: left;margin-right: 10px;height:100px;">
        	<img src="/assets/images/okky_logo_footer.png" alt="footer">
        </div>
        <div>
        	<a href="/intro/about">About OKKY</a>
            | <a href="/user/privacy" data-toggle="modal" data-target="#userPrivacy">개인정보보호</a>
            | <a href="/intro/ad">광고문의</a>
            | <a href="mailto:info@okky.kr">Contact</a>
            | <a href="https://www.facebook.com/okky.sns" target="_blank">Facebook</a>
            | <a href="https://github.com/okjsp/okky" target="_blank">Github</a>  v1.5.4
            <hr style="margin: 8px 0;">
            <strong>상호명</strong> : (주)오키코리아 | <strong>대표명</strong> : 노상범 | <strong>사업자등록번호</strong> : 592-87-02037 | <strong>문의</strong> : info@okky.kr
            <br> <strong>주소</strong> : 서울 강남구 봉은사로 303 TGL경복빌딩 502호 (06103)
            <br> @ 2022 <a href="http://www.ebrain.kr" target="_blank">(주)오키코리아</a>
        </div>
    </div>
    <div class="sponsor-banner col-sm-3">
        <div class="sponsor-banner-head">Sponsored by</div>
        <div class="sponsor-banner-images">
          <a href="https://www.inames.co.kr" target="_blank"><img src="/assets/images/spb_inames.png" alt="아이네임즈"></a>
          <a href="https://www.toast.com/" target="_blank"><img src="/assets/images/spb_nhncloud.png" alt="NHN Cloud"></a>
        </div>
    </div>
</div>
                </div>
            </div>
        </div>
        <script>
            var contextPath = "";
            var encodedURL = "%2Ffind%2Fuser%2Findex";
        </script>
        
        <script src="/assets/js/application.js" type="text/javascript"></script>
        <script src="/assets/js/apps/search.js" type="text/javascript"></script>

        <div id="userPrivacy" class="modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                </div>
            </div>
        </div>

        <div id="userAgreement" class="modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                </div>
            </div>
        </div>

    

</body>
</html>