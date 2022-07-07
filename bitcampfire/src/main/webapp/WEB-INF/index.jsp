<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html >
<!--[if lt IE 7 ]> <html lang="ko" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="ko" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="ko" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="ko" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="ko" class="no-js"><!--<![endif]-->
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	
	<!-- 상단탭 제목  -->
	<title>BITFIRE - All That BABY Developer</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="_csrf_parameter" content="_csrf" />
	<meta name="_csrf_header" content="X-CSRF-TOKEN" />
	<meta name="_csrf" content="21815342-f771-4b04-8209-478b31d12d7b" />
	<link rel="shortcut icon" href="./image/favicon.ico" type="image/x-icon">
	<link rel="apple-touch-icon" href="./image/icon_57x57.png">
	<link rel="apple-touch-icon" sizes="114x114" href="./image/icon_114x114.png">
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<meta property="og:image" content="https://okky.kr/assets/images/okky_logo_fb.png">
	
	<link rel="stylesheet" href="./css/user/application.css">
	
	<script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
	<script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
	
<script>
	/* 구글 태그 매니저 */
	(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
	new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
	j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
	'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
	})(window,document,'script','dataLayer','GTM-M52CW55');
</script>

	<!--[if lt IE 9]>
		<script src="/js/libs/html5.js"></script>
		<script src="/assets/libs/respond.src.js"></script>
		<script src="/assets/libs/html5.js"></script>
	<![endif]-->
<meta name="google-site-verification" content="DkGncyJVqYFVekHithdbYnKgklkyKVwruPZ18WUDjr0" />
</head>

<body>
<div class="layout-container">
 	<div class="main index">
	            
	<!-- 1. 좌측  메뉴바  -->            
	<div class="sidebar ">
	    <a href="javascript://" class="sidebar-header">
	        <i class="fa fa-bars sidebar-header-icon"></i>
	    </a>
		<!-- 메인 로고변경  로고/페이지명 필요-->
	    <h1><div class="logo"><a href="/semiproject/"><img src="./images/bitfire_logo.PNG" alt="OKKY" title="OKKY"></a></div></h1>

		<!-- 검색 창 하단 로그인/회원가입 이동 선을 못찾음  -->
	    <div class="nav-user nav-sidebar">
    	<c:if test="${sessionScope.user_email == null }">
            <ul class="nav nav-sidebar">
                <li><a href="/semiproject/user/loginForm" class="link"><i class="fa fa-sign-in"></i> <span class="nav-sidebar-label">로그인</span></a></li>
                <li><a href="/semiproject/user/userSignupForm" class="link"><i class="fa fa-user"></i> <span class="nav-sidebar-label">회원가입</span></a></li>
            </ul>
		</c:if>
		<c:if test="${sessionScope.user_email != null }">
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
	    		<!-- link 누르면 호버기능?  -->
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
	
	
	
	<!-- 2. 메인페이지 -->
	<!-- 상단 광고 - 클릭 시 광고페이지로 이동 -->
	<div class="main-banner-wrapper">
	     <div class="main-banner">
	     	  <a href="/banner/stats/528" target="_o"><img src="" /></a>
	     </div> <!-- main-banner -->
	</div> <!-- main-banner-wrapper -->
	
    
    
    <div>메인을 만들어주세욤!</div>


	
	<!-- 오른쪽 광고 영역 -->
	<div class="right-banner-wrapper">
		<div class="right-banner">
	             <a href="/banner/stats/519" target="_n"><img src="//file.okky.kr/banner/1655430555113.jpg" style="width:160px;"/></a>
	    </div> <!-- right-banner -->
	
		<div class="google-ad">
		        <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
		          <!-- okjspad_160x500 -->
		        <ins class="adsbygoogle"
		             style="display:inline-block;width:160px;height:500px"
		             data-ad-client="ca-pub-8103607814406874"
		             data-ad-slot="6573675943"></ins>
		        <script>
		             (adsbygoogle = window.adsbygoogle || []).push({});
		        </script>
		 </div> <!-- google-ad -->
	 </div> <!-- right-banner-wrapper -->
	    
			<!-- footer  -->    
			<div id="footer" class="footer" role="contentinfo">
				<div class="row">
				    <div class="col-sm-9">
				        <div style="float: left;margin-right: 10px;height:100px;">
				        	<img src="./images/okky_logo_footer.png" alt="footer">
				        </div>
				        <div> <!-- info -->
				        	<a href="/intro/about">About OKKY</a>
				            | <a href="/user/privacy" data-toggle="modal" data-target="#userPrivacy">개인정보보호</a>
				            | <a href="/intro/ad">광고문의</a>
				            | <a href="mailto:info@okky.kr">Contact</a>
				            | <a href="https://www.facebook.com/okky.sns" target="_blank">Facebook</a>
				            | <a href="https://github.com/okjsp/okky" target="_blank">Github</a>  v1.5.4
				            <hr style="margin: 8px 0;"/>
				            <strong>상호명</strong> : (주)오키코리아 | <strong>대표명</strong> : 노상범 | <strong>사업자등록번호</strong> : 592-87-02037 | <strong>문의</strong> : info@okky.kr
				            <br/> <strong>주소</strong> : 서울 강남구 봉은사로 303 TGL경복빌딩 502호 (06103)
				            <br/> @ 2022 <a href="http://www.ebrain.kr" target="_blank">(주)오키코리아</a>
				        </div> <!-- info -->
				    </div><!-- col-sm-9 -->
					    <div class="sponsor-banner col-sm-3">
					        <div class="sponsor-banner-head">Sponsored by</div>
					        <div class="sponsor-banner-images">
					          <a href="https://www.inames.co.kr" target="_blank"><img src="./images/spb_inames.png" alt="아이네임즈"></a>
					          <a href="https://www.toast.com/" target="_blank"><img src="./images/spb_nhncloud.png" alt="NHN Cloud"></a>
				        </div> <!-- sponsor-banner-images -->
				    </div> <!-- sponsor-banner col-sm-3 -->
				</div> <!-- row -->
			 </div> <!-- footer -->
	        
	        
	  </div> <!-- main index -->
</div> <!-- layout-container  -->

<script>
    var contextPath = "";
    var encodedURL = "%2F";
</script>

<!-- <script src="./js/application.js" type="text/javascript"></script>
<script src="./js/apps/search.js" type="text/javascript"></script>
<script src="./js/apps/notification.js" type="text/javascript"></script>
<script src="./js/libs/typeahead.bundle.js"></script>
 -->
<script>
       $(function () {
         $('.timeago').timeago();
       });
  </script>

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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    </body>
</html>
