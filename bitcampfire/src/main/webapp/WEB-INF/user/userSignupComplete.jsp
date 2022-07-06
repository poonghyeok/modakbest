<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html >
<!--[if lt IE 7 ]> <html lang="ko" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="ko" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="ko" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="ko" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="ko" class="no-js"><!--<![endif]-->
	<head>
        <meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>OKKY - 회원정보 등록</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="_csrf_parameter" content="_csrf" />
		<meta name="_csrf_header" content="X-CSRF-TOKEN" />
		<meta name="_csrf" content="398c45f1-19ab-40ff-8a3c-9ca9269eae00" />
		<link rel="shortcut icon" href="/assets/images/favicon.ico" type="image/x-icon">
		<link rel="apple-touch-icon" href="/assets/images/icon_57x57.png">
		<link rel="apple-touch-icon" sizes="114x114" href="/images/icon_114x114.png">
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
		<meta property="og:image" content="https://okky.kr/assets/images/okky_logo_fb.png">
		
		<link rel="stylesheet" href="../css/application.css">
	<script>
	
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
		
		
	</head>
	<body>
        <div class="layout-container">
            <div class="main ">

				<div id="create-user" class="content" role="main">
				    <h3 class="content-header">회원가입</h3>
				    <div class="panel panel-default panel-margin-10">
				        <div class="panel-body panel-body-content text-center">
				            <p class="lead"><strong>${user_email }</strong> 로 인증 요청 메일을 보냈습니다.<br/>
				                해당 이메일을 확인 하시고, 인증 확인 링크를 눌러 주시기 바랍니다.</p>
				            <p>이메일 인증이 완료 되지 않을 경우 사이트 이용에 제한이 있습니다.</p>
				            <p><strong>※ 서비스에 따라 스팸으로 분류 되있을 수도 있습니다. 스팸함도 꼭 확인해 주시기 바랍니다.</strong></p>
				
				            <a href="/semiproject/user/userLoginForm" class="btn btn-primary">로그인</a>
				
				        </div>
				    </div>
				</div>
               
            </div>
        </div>
        <script>
            var contextPath = "";
            var encodedURL = "%2Fuser%2Fcomplete";
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
