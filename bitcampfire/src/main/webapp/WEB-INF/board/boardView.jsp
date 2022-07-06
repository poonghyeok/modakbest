<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
		<title>OKKY - 기술력을 갖고 싶다면: 코딩을 겁나 하세요.</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="_csrf_parameter" content="_csrf" />
		<meta name="_csrf_header" content="X-CSRF-TOKEN" />
		<meta name="_csrf" content="87a42011-25d8-4990-9064-b978197d1ed4" />
		<link rel="shortcut icon" href="../image/favicon.ico" type="image/x-icon">
		<link rel="apple-touch-icon" href="../image/icon_57x57.png">
		<link rel="apple-touch-icon" sizes="114x114" href="/images/icon_114x114.png">
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
		<meta property="og:image" content="https://okky.kr/assets/images/okky_logo_fb.png">
		<link rel="stylesheet" href="../css/application.css">
	<script>
	window.dataLayer = window.dataLayer || [];window.dataLayer.push({'user_id': '112805','crm_id': '112805'});
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
<meta property="og:type" content="article">
<meta property="og:site_name" content="OKKY">
<meta property="og:url" content="https://okky.kr/article/1261756">
<meta property="og:description" content="  여러 언어/분야들을 많이 파보는게 좋을까요, 하나를 깊히 파보는게 좋을까요?  와 같은 질문을 많이 받습니다.     사실 두 경우 다 잘하는 사람을 봤고, 사람들은 다양한 종류로 잘하기 때문에 여기에 답은 없습니다. 다만 하나 확실한 것은, 겁나 많이 해야 한다는 것입니다. 제 사례를 공유합니다.             참고로 제 시대에는 게임 프로그래">
<meta property="og:title" content="OKKY | 기술력을 갖고 싶다면: 코딩을 겁나 하세요.">
<meta property="dable:item_id" content="1261756">
<meta property="dable:author" content="운체조교">
<meta property="article:section" content="columns">
<meta property="article:published_time" content="2022-07-01T09:43:17Z">
		
	</head>
</head>
	<body>
		<%--  <form name = "boardView" >
		 <input type = "hidden" class = "board_id" name = "board_id" value = "${board_id}">
			<table class="boardViewTable">
	  <thead>
	  <tr>
			    <th scope="cols" >
			    <img src="../image/finger.jpg" alt="손가락" name = "board_id" width = "50">
			    		 ${boardDTO.board_title}
				    	 ${boardDTO.board_id} <!-- 글번호 / userId -->
				    	 ${boardDTO.board_uid}
				    	<br>
				    	${boardDTO.board_date_created}<!-- 날짜 -->
				  	  <th scope="cols" img src="../image/finger.jpg">
				  	  ${boardDTO.board_vote_cnt}<!-- 추천수 -->
				  	  </th>
		  	  <th scope="cols"> ${boardDTO.board_view_cnt} 
		  	  <img src="../image/view.jpg" alt="돋보기" width = "50"><!-- 조회수 --></th>
		  </tr>
	  </thead>
  <tbody>
  <tr>
   
    <td height = "400"><!-- 내용 -->${boardDTO.board_content}</td>
    	
  </tr>
	  <tr>
	  
	    <th scope="row" width = "1000">
	    	추천수
	    	<br>조회수</th>
	  </tr>
  </tbody>
</table>

</form>	 --%>

<body>
        <div class="layout-container">
            <div class="main ">
<div class="sidebar sidebar-category">
    <a href="javascript://" class="sidebar-header">
        <i class="fa fa-bars sidebar-header-icon"></i>
    </a>

    <h1><div class="logo"><a href="/"><img src="../images/okjsp_logo.png" alt="OKKY" title="OKKY"></a></div></h1>

    <ul id="search-google-icon" class="nav nav-sidebar nav-sidebar-search-wrapper">
        <li class="nav-sidebar-search"><a href="javascript://" class="link" id="search-google" data-toggle="popover" data-trigger="click" data-original-title="" title=""><i class="fa fa-search"></i></a></li>
    </ul>

    <form id="search-google-form" name="searchMain" class="nav-sidebar-form" action="https://www.google.com/search">
        <div class="input-group">
            <input type="text" name="qt" class="form-control input-sm" placeholder="Google 검색">
            <input type="hidden" name="q">
            <span class="input-group-btn">
                <button class="btn btn-default btn-sm" type="submit"><i class="fa fa-search"></i></button>
            </span>
        </div>
    </form>

    <div class="nav-user nav-sidebar">
            <ul class="nav nav-sidebar">
                <li data-toggle="tooltip" data-container="body" title="" data-original-title="로그인"><a href="/login/auth?redirectUrl=%2Farticle%2F1261756" class="link"><i class="fa fa-sign-in"></i> <span class="nav-sidebar-label">로그인</span></a></li>
                <li data-toggle="tooltip" data-container="body" title="" data-original-title="회원가입"><a href="/user/register" class="link"><i class="fa fa-user"></i> <span class="nav-sidebar-label">회원가입</span></a></li>
            </ul>
    </div>

    <ul class="nav nav-sidebar nav-main">
    	
    		<li data-toggle="tooltip" data-placement="right" data-container="body" title="" data-original-title="Q&amp;A"><a href="/articles/questions" class="link"><i class="nav-icon fa fa-database"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Q&amp;A</span></a></li>
    		<li data-toggle="tooltip" data-placement="right" data-container="body" title="" data-original-title="Tech"><a href="/articles/tech" class="link"><i class="nav-icon fa fa-code"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Tech</span></a></li>
    		<li data-toggle="tooltip" data-placement="right" data-container="body" title="" data-original-title="커뮤니티"><a href="/articles/community" class="link"><i class="nav-icon fa fa-comments"></i> <span class="nav-sidebar-label nav-sidebar-category-label">커뮤니티</span></a></li>
    		<li class="active" data-toggle="tooltip" data-placement="right" data-container="body" title="" data-original-title="칼럼"><a href="/articles/columns" class="link"><i class="nav-icon fa fa-quote-left"></i> <span class="nav-sidebar-label nav-sidebar-category-label">칼럼</span></a></li>
    		<li data-toggle="tooltip" data-placement="right" data-container="body" title="" data-original-title="Jobs"><a href="/articles/recruit?filter.jobType=CONTRACT" class="link"><i class="nav-icon fa fa-group"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Jobs</span></a></li>
    </ul>

    <ul class="nav nav-sidebar nav-bottom">
        <li data-toggle="tooltip" data-placement="right" data-container="body" title="" data-original-title="Github Issues"><a href="https://github.com/okjsp/okky/issues" class="link" target="_blank"><i class="fa fa-github"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Github Issues</span></a></li>
    </ul>
</div>
<div class="sidebar-category-nav">
    <h3 class="sub-title">칼럼</h3>
    <ul class="nav">
            <li><a href="/articles/columns" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">All</span> <span class="nav-indicator nav-selected"><span class="nav-selected-dot"></span></span></a></li>
    </ul>
    <div class="special-nav">
    </div>
</div>



<form action="/article/dissent/1261756" method="post" name="note-dissent-form" id="note-dissent-form">
	<input type="hidden" name="_method" value="PUT" id="_method">
</form>
<div id="article" class="content" role="main">

	


				<div class="main-banner-wrapper">
                   <div class="main-banner">
                   	  <a href="/banner/stats/527" target="_i"><img src="//file.okky.kr/banner/1657005748618.png"></a>
                   </div>
                </div>

    <div class="nav" role="navigation">
        <a class="create btn btn-success btn-wide pull-right" href="/articles/columns/create"><i class="fa fa-pencil"></i> 새 글 쓰기</a>
        <h4>칼럼</h4>
    </div>

	

    <div class="panel panel-default clearfix fa-">
        <div class="panel-heading clearfix">

	
	

<div class="avatar clearfix avatar-medium pull-left">
		<a href="/user/info/133529" class="avatar-photo"><img src="//www.gravatar.com/avatar/9a316994cda85c56cd4f0c833ec511b6?d=identicon&amp;s=40"></a>
		<div class="avatar-info">
<!-- 유저아이디 -->  <a class="nickname" href="/user/info/133529" title="board_uid">${board_uid}</a>
					<div class="activity"><span class="fa fa-flash"></span> 2k</div>
<!-- 작성일 -->	<div class="date-created"><span class="timeago" title="board_date_created">${board_date_created }</span></div>
		</div>
</div>

            <div class="content-identity pull-right">
<!-- 댓글수 --> <div class="content-identity-count"><i class="board_cmt_cnt"></i>${board_cmt_cnt}</div>
<!-- 조회수 -->  <div class="content-identity-count"><i class="board_view_cnt"></i>${board_view_cnt}</div>
            </div>
        </div>
        <div class="content-container clearfix">
            <div id="content-body" class="panel-body content-body pull-left">
                <div class="content-tags">
<!-- 게시글 번호  --> <span class="board_id">${board_id}</span>
	<a href="/articles/columns" class="board_cateid"><i class="fa fa-quote-left"></i>${board_cateid}</a>
                </div>
                <h2 class="board_title">
<!-- 제목  -->          ${board_title}
                </h2>
                <hr>
                <article class="board_content" itemprop="articleBody">
<!-- 내용  -->     	<p>${board_content}</p>
                </article>

            </div>

            <div id="content-function" class="content-function pull-right text-center">
                <div class="content-function-group">
	
	
		
	
		<div class="note-evaluate-wrapper">
				<a href="javascript://" class="note-vote-btn" role="button" data-type="assent" data-eval="true" data-id="2845672">
					<i id="note-evaluate-assent-2845672" class="fa fa-angle-up note-evaluate-assent-assent" data-placement="left" data-toggle="tooltip" title="" data-original-title="추천"></i>
				</a>
			
<!-- 추천수 -->	<div id="content-vote-count-2845672" class="board_vote_cnt">${board_vote_cnt}</div>
			
				<a href="javascript://" class="note-vote-btn" role="button" data-type="dissent" data-eval="true" data-id="2845672">
					<i id="note-evaluate-dissent-2845672" class="fa fa-angle-down note-evaluate-dissent-dissent" data-placement="left" data-toggle="tooltip" title="" data-original-title="반대"></i>
				</a>
		</div>
                </div>
                <div class="content-function-group article-scrap-wrapper">
                    <a href="javascript://" id="article-scrap-btn" data-type="scrap"><i class="fa fa-bookmark " data-toggle="tooltip" data-placement="left" title="" data-original-title="스크랩"></i></a>
                    <div id="article-scrap-count" class="content-count">27</div>
                </div>
            </div>
            <div class="content-function-cog share-btn-wrapper">
                <div class="dropdown">
                    <a href="http://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fokky.kr%2Farticle%2F1261756" class="btn-facebook-share"><i class="fa fa-facebook-square fa-fw" data-toggle="tooltip" data-placement="left" title="" data-original-title="페이스북 공유"></i></a>
                </div>

            </div>
        </div>
    </div>


				<div class="main-banner-wrapper">
		            <script async="" src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
		            <!-- 728-90_Ressponsive -->
	            <ins class="adsbygoogle" style="display:inline-block;width:728px;height:90px" data-ad-client="ca-pub-8103607814406874" data-ad-slot="8622179990" data-adsbygoogle-status="done" data-ad-status="filled"><ins id="aswift_0_expand" style="border: medium none; height: 90px; width: 728px; margin: 0px; padding: 0px; position: relative; visibility: visible; background-color: transparent; display: inline-table;" tabindex="0" title="Advertisement" aria-label="Advertisement"><ins id="aswift_0_anchor" style="border: medium none; height: 90px; width: 728px; margin: 0px; padding: 0px; position: relative; visibility: visible; background-color: transparent; display: block;"><iframe id="aswift_0" name="aswift_0" style="left:0;position:absolute;top:0;border:0;width:728px;height:90px;" sandbox="allow-forms allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" src="https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-8103607814406874&amp;output=html&amp;h=90&amp;slotname=8622179990&amp;adk=3431456933&amp;adf=1152904402&amp;pi=t.ma~as.8622179990&amp;w=728&amp;lmt=1657092308&amp;psa=1&amp;format=728x90&amp;url=https%3A%2F%2Fokky.kr%2Farticle%2F1261756&amp;wgl=1&amp;dt=1657092307572&amp;bpp=5&amp;bdt=1415&amp;idt=232&amp;shv=r20220629&amp;mjsv=m202206300101&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3Db8daa0e1d60077f3-22a61ed110d500c1%3AT%3D1657092305%3ART%3D1657092305%3AS%3DALNI_MYTW7j70A9xsAWOxaZtYSihhA58aw&amp;gpic=UID%3D00000769b0777d0a%3AT%3D1657092305%3ART%3D1657092305%3AS%3DALNI_MaauRpTRRJsTDwMHGS-zvML_Bb6mw&amp;prev_fmts=0x0&amp;nras=1&amp;correlator=4390662194975&amp;frm=20&amp;pv=1&amp;ga_vid=830016841.1657092308&amp;ga_sid=1657092308&amp;ga_hid=2041460464&amp;ga_fc=1&amp;u_tz=540&amp;u_his=8&amp;u_h=720&amp;u_w=1280&amp;u_ah=680&amp;u_aw=1280&amp;u_cd=24&amp;u_sd=1.5&amp;adx=279&amp;ady=2789&amp;biw=1263&amp;bih=595&amp;scr_x=0&amp;scr_y=411&amp;eid=44759875%2C44759926%2C44759837%2C31067983%2C31068196%2C42531605%2C42531608%2C31064018&amp;oid=2&amp;pvsid=1348466370648807&amp;tmod=1005979026&amp;nvt=1&amp;ref=https%3A%2F%2Fokky.kr%2F&amp;eae=0&amp;fc=896&amp;brdim=-7%2C-7%2C-7%2C-7%2C1280%2C0%2C1295%2C695%2C1280%2C595&amp;vis=1&amp;rsz=%7C%7CeEbr%7C&amp;abl=CS&amp;pfx=0&amp;fu=0&amp;bc=31&amp;ifi=1&amp;uci=a!1&amp;btvi=1&amp;fsb=1&amp;xpc=2UNynQRPNT&amp;p=https%3A//okky.kr&amp;dtd=1314" data-google-container-id="a!1" data-google-query-id="CPDJ3vPd4_gCFYeJwgod2WsJMw" data-load-complete="true" width="728" height="90" frameborder="0"></iframe></ins></ins></ins>
	            <script>
	                 (adsbygoogle = window.adsbygoogle || []).push({});
	            </script>
	            </div>
	
    <div class="panel panel-default clearfix">
    
    
        <!-- List group -->
        <ul class="list-group">
            <li id="note-title" class="list-group-item note-title">
                <h3 class="panel-title">댓글 <span id="note-count">17</span></h3>
            </li>
            	<li class="list-group-item note-item clearfix" id="note-2846273">
            		<form action="/content/update/2846273" method="post" data-id="2846273" class="note-update-form">
            			<input type="hidden" name="_method" value="PUT" id="_method">
                        <div class="content-body panel-body pull-left">

	
	

<div class="avatar clearfix avatar-medium ">
		<a href="/user/info/98856" class="avatar-photo"><img src="//www.gravatar.com/avatar/64a017342a36c2d1cd40011d1a0e9115?d=identicon&amp;s=40"></a>
		<div class="avatar-info">
				<a class="nickname" href="/user/info/98856" title="jw_891">jw_891</a>
					<div class="activity"><span class="fa fa-flash"></span> 1k</div>
					<div class="date-created"><span class="timeago" title="board_date_created">${board_date_created}</span></div>
		</div>
</div>
                            <fieldset class="form">
                                <article id="note-text-2846273" class="list-group-item-text note-text">
				                    	<p>흔히 삽질 많이해야 는다고하죠..ㅎ&nbsp;</p><p>좀 사족이긴한데... 글쓴 분만큼 우직하게 하는사람이 흔치는 않지만 입문단계일수록 좀 단순무식하게 접근 할 필요도 있는 것 같습니다.&nbsp;</p>
                                </article>
                            </fieldset>
                        </div>

                        <div class="content-function pull-right text-center">
                            <div class="content-function-group">
	
	
		
	
		<div class="note-evaluate-wrapper">
				<a href="javascript://" class="note-vote-btn" role="button" data-type="assent" data-eval="true" data-id="2846273">
					<i id="note-evaluate-assent-2846273" class="fa fa-angle-up note-evaluate-assent-assent" data-placement="left" data-toggle="tooltip" title="" data-original-title="추천"></i>
				</a>
			
			<div id="content-vote-count-2846273" class="content-eval-count">1</div>
			
				<a href="javascript://" class="note-vote-btn" role="button" data-type="dissent" data-eval="true" data-id="2846273">
					<i id="note-evaluate-dissent-2846273" class="fa fa-angle-down note-evaluate-dissent-dissent" data-placement="left" data-toggle="tooltip" title="" data-original-title="반대"></i>
				</a>
		</div>
                            </div>
                        </div>
                    </form>
					<form action="/content/delete/2846273" method="post" id="note-delete-form-2846273">
							<input type="hidden" name="_csrf" value="37f07365-101b-4eae-b671-4278e93546c2">
						<input type="hidden" name="_method" value="DELETE" id="_method">
                    </form>
                </li>
            	<li class="list-group-item note-item clearfix" id="note-2846765">
            		<form action="/content/update/2846765" method="post" data-id="2846765" class="note-update-form">
            			<input type="hidden" name="_method" value="PUT" id="_method">
                        <div class="content-body panel-body pull-left">

	
	

<div class="avatar clearfix avatar-medium ">
		<a href="/user/info/81481" class="avatar-photo"><img src="//www.gravatar.com/avatar/adb695333886fb0dce0d079f6a3b11d2?d=identicon&amp;s=40"></a>
		<div class="avatar-info">
				<a class="nickname" href="/user/info/81481" title="현욱">현욱</a>
					<div class="activity"><span class="fa fa-flash"></span> 1k</div>
					<div class="date-created"><span class="timeago" title="2022-07-02T02:30:08">2022-07-02 02:30:08</span></div>
		</div>
</div>
                            <fieldset class="form">
                                <article id="note-text-2846765" class="list-group-item-text note-text">
				                    	<p>저는 글쓴분처럼 어렸을때 우직하게 하진 못했습니다. GW-BASIC으로 책 따라서 달력 만들다가 어디선가 오타 내서 안돌아가는걸 결국 디버깅 못해서 때려치고, Turbo-C도 몇번이나 공부하려다가 포인터 전후에서 포기를 몇번이나 했는지 모릅니다. 그래도 도스 세대라 config.sys도 만져보고, 게임 돌아가게 하려고 메모리 관리도 했던게 남아서 다른 친구들보다 파일 시스템이나 OS같은거 공부할 때 좀더 이해하기가 쉽더라구요.</p><p>말씀하신대로 학부 레벨에서의 공부는 이론적이다보니 스스로 이걸 왜 공부해야하는지 동기부여하기가 쉽지 않은 것 같습니다. 그렇기 때문에 학교 공부만 할 것이 아니라 인턴쉽이나 사이드 프로젝트를 (학교를 휴학해서라도) 통해 이론과 실전을 융합하는 노력이 많이 필요한게 아닌가 싶네요. 대부분의 학생은 학교 이전에 코딩 경험을 쌓지 못하고 들어오니까요.</p>
                                </article>
                            </fieldset>
                        </div>

                        <div class="content-function pull-right text-center">
                            <div class="content-function-group">
	
	
		
	
		<div class="note-evaluate-wrapper">
				<a href="javascript://" class="note-vote-btn" role="button" data-type="assent" data-eval="true" data-id="2846765">
					<i id="note-evaluate-assent-2846765" class="fa fa-angle-up note-evaluate-assent-assent" data-placement="left" data-toggle="tooltip" title="" data-original-title="추천"></i>
				</a>
			
			<div id="content-vote-count-2846765" class="content-eval-count">0</div>
			
				<a href="javascript://" class="note-vote-btn" role="button" data-type="dissent" data-eval="true" data-id="2846765">
					<i id="note-evaluate-dissent-2846765" class="fa fa-angle-down note-evaluate-dissent-dissent" data-placement="left" data-toggle="tooltip" title="" data-original-title="반대"></i>
				</a>
		</div>
                            </div>
                        </div>
                    </form>
					<form action="/content/delete/2846765" method="post" id="note-delete-form-2846765">
							<input type="hidden" name="_csrf" value="37f07365-101b-4eae-b671-4278e93546c2">
						<input type="hidden" name="_method" value="DELETE" id="_method">
                    </form>
                </li>
            	<li class="list-group-item note-item clearfix" id="note-2846979">
            		<form action="/content/update/2846979" method="post" data-id="2846979" class="note-update-form">
            			<input type="hidden" name="_method" value="PUT" id="_method">
                        <div class="content-body panel-body pull-left">

	
	

<div class="avatar clearfix avatar-medium ">
		<a href="/user/info/141187" class="avatar-photo"><img src="//www.gravatar.com/avatar/2cfff3aa2407cb5ca6defaead3a94c8c?d=identicon&amp;s=40"></a>
		<div class="avatar-info">
				<a class="nickname" href="/user/info/141187" title="코딩완전뉴비">코딩완전뉴비</a>
					<div class="activity"><span class="fa fa-flash"></span> 89</div>
					<div class="date-created"><span class="timeago" title="2022-07-02T13:41:24">2022-07-02 13:41:24</span></div>
		</div>
</div>
                            <fieldset class="form">
                                <article id="note-text-2846979" class="list-group-item-text note-text">
				                    	<p>좋은 글 감사합니다.</p>
                                </article>
                            </fieldset>
                        </div>

                        <div class="content-function pull-right text-center">
                            <div class="content-function-group">
	
	
		
	
		<div class="note-evaluate-wrapper">
				<a href="javascript://" class="note-vote-btn" role="button" data-type="assent" data-eval="true" data-id="2846979">
					<i id="note-evaluate-assent-2846979" class="fa fa-angle-up note-evaluate-assent-assent" data-placement="left" data-toggle="tooltip" title="" data-original-title="추천"></i>
				</a>
			
			<div id="content-vote-count-2846979" class="content-eval-count">0</div>
			
				<a href="javascript://" class="note-vote-btn" role="button" data-type="dissent" data-eval="true" data-id="2846979">
					<i id="note-evaluate-dissent-2846979" class="fa fa-angle-down note-evaluate-dissent-dissent" data-placement="left" data-toggle="tooltip" title="" data-original-title="반대"></i>
				</a>
		</div>
                            </div>
                        </div>
                    </form>
					<form action="/content/delete/2846979" method="post" id="note-delete-form-2846979">
							<input type="hidden" name="_csrf" value="37f07365-101b-4eae-b671-4278e93546c2">
						<input type="hidden" name="_method" value="DELETE" id="_method">
                    </form>
                </li>
            	<li class="list-group-item note-item clearfix" id="note-2847235">
            		<form action="/content/update/2847235" method="post" data-id="2847235" class="note-update-form">
            			<input type="hidden" name="_method" value="PUT" id="_method">
                        <div class="content-body panel-body pull-left">

	
	

<div class="avatar clearfix avatar-medium ">
		<a href="/user/info/145040" class="avatar-photo"><img src="//www.gravatar.com/avatar/dcbf6d79c2fe46bc80d722999b376631?d=identicon&amp;s=40"></a>
		<div class="avatar-info">
				<a class="nickname" href="/user/info/145040" title="나랑놀아">나랑놀아</a>
					<div class="activity"><span class="fa fa-flash"></span> 20</div>
					<div class="date-created"><span class="timeago" title="2022-07-03T01:52:03">2022-07-03 01:52:03</span></div>
		</div>
</div>
                            <fieldset class="form">
                                <article id="note-text-2847235" class="list-group-item-text note-text">
				                    	<p>아는 만큼 보인다고 하죠. 언매니지드 언어도 공부해야 이해가 깊어진다하는데 아직 주언어도 부족해서 엄두가 안나네요..ㅠ 좋은 글 감사합니다.</p>
                                </article>
                            </fieldset>
                        </div>

                        <div class="content-function pull-right text-center">
                            <div class="content-function-group">
	
	
		
	
		<div class="note-evaluate-wrapper">
				<a href="javascript://" class="note-vote-btn" role="button" data-type="assent" data-eval="true" data-id="2847235">
					<i id="note-evaluate-assent-2847235" class="fa fa-angle-up note-evaluate-assent-assent" data-placement="left" data-toggle="tooltip" title="" data-original-title="추천"></i>
				</a>
			
			<div id="content-vote-count-2847235" class="content-eval-count">0</div>
			
				<a href="javascript://" class="note-vote-btn" role="button" data-type="dissent" data-eval="true" data-id="2847235">
					<i id="note-evaluate-dissent-2847235" class="fa fa-angle-down note-evaluate-dissent-dissent" data-placement="left" data-toggle="tooltip" title="" data-original-title="반대"></i>
				</a>
		</div>
                            </div>
                        </div>
                    </form>
					<form action="/content/delete/2847235" method="post" id="note-delete-form-2847235">
							<input type="hidden" name="_csrf" value="37f07365-101b-4eae-b671-4278e93546c2">
						<input type="hidden" name="_method" value="DELETE" id="_method">
                    </form>
                </li>
            	<li class="list-group-item note-item clearfix" id="note-2847344">
            		<form action="/content/update/2847344" method="post" data-id="2847344" class="note-update-form">
            			<input type="hidden" name="_method" value="PUT" id="_method">
                        <div class="content-body panel-body pull-left">

	
	

<div class="avatar clearfix avatar-medium ">
		<a href="/user/info/127901" class="avatar-photo"><img src="https://lh3.googleusercontent.com/a-/AOh14Gj-bn4gmcv3Md2Bb4lHLTbayJku10m-Zgt-PEL2=s96-c"></a>
		<div class="avatar-info">
				<a class="nickname" href="/user/info/127901" title="Luna Jay">Luna Jay</a>
					<div class="activity"><span class="fa fa-flash"></span> 89</div>
					<div class="date-created"><span class="timeago" title="2022-07-03T11:39:19">2022-07-03 11:39:19</span></div>
		</div>
</div>
                            <fieldset class="form">
                                <article id="note-text-2847344" class="list-group-item-text note-text">
				                    	내공이 상당하신데 실례지만 개발 연차도 들려주실수 있을지요?&nbsp;
                                </article>
                            </fieldset>
                        </div>

                        <div class="content-function pull-right text-center">
                            <div class="content-function-group">
	
	
		
	
		<div class="note-evaluate-wrapper">
				<a href="javascript://" class="note-vote-btn" role="button" data-type="assent" data-eval="true" data-id="2847344">
					<i id="note-evaluate-assent-2847344" class="fa fa-angle-up note-evaluate-assent-assent" data-placement="left" data-toggle="tooltip" title="" data-original-title="추천"></i>
				</a>
			
			<div id="content-vote-count-2847344" class="content-eval-count">1</div>
			
				<a href="javascript://" class="note-vote-btn" role="button" data-type="dissent" data-eval="true" data-id="2847344">
					<i id="note-evaluate-dissent-2847344" class="fa fa-angle-down note-evaluate-dissent-dissent" data-placement="left" data-toggle="tooltip" title="" data-original-title="반대"></i>
				</a>
		</div>
                            </div>
                        </div>
                    </form>
					<form action="/content/delete/2847344" method="post" id="note-delete-form-2847344">
							<input type="hidden" name="_csrf" value="37f07365-101b-4eae-b671-4278e93546c2">
						<input type="hidden" name="_method" value="DELETE" id="_method">
                    </form>
                </li>
            	<li class="list-group-item note-item clearfix" id="note-2847694">
            		<form action="/content/update/2847694" method="post" data-id="2847694" class="note-update-form">
            			<input type="hidden" name="_method" value="PUT" id="_method">
                        <div class="content-body panel-body pull-left">

	
	

<div class="avatar clearfix avatar-medium ">
		<a href="/user/info/34213" class="avatar-photo"><img src="//www.gravatar.com/avatar/c649774942c3c2ab78ed58379972c2f8?d=identicon&amp;s=40"></a>
		<div class="avatar-info">
				<a class="nickname" href="/user/info/34213" title="드루이드">드루이드</a>
					<div class="activity"><span class="fa fa-flash"></span> 256</div>
					<div class="date-created"><span class="timeago" title="2022-07-04T05:42:31">2022-07-04 05:42:31</span></div>
		</div>
</div>
                            <fieldset class="form">
                                <article id="note-text-2847694" class="list-group-item-text note-text">
				                    	<p>글 잘읽었습니다. 저도 주변에서 프레임워크를 배우는 좋은 방법이 뭐냐고 물어보면 항상 프레임워크 없이 개발해 보는거라고 합니다. 스프링을 배우는 가장좋은 방법은 스프링없이 개발하는것 처럼요.&nbsp;</p>
                                </article>
                            </fieldset>
                        </div>

                        <div class="content-function pull-right text-center">
                            <div class="content-function-group">
	
	
		
	
		<div class="note-evaluate-wrapper">
				<a href="javascript://" class="note-vote-btn" role="button" data-type="assent" data-eval="true" data-id="2847694">
					<i id="note-evaluate-assent-2847694" class="fa fa-angle-up note-evaluate-assent-assent" data-placement="left" data-toggle="tooltip" title="" data-original-title="추천"></i>
				</a>
			
			<div id="content-vote-count-2847694" class="content-eval-count">0</div>
			
				<a href="javascript://" class="note-vote-btn" role="button" data-type="dissent" data-eval="true" data-id="2847694">
					<i id="note-evaluate-dissent-2847694" class="fa fa-angle-down note-evaluate-dissent-dissent" data-placement="left" data-toggle="tooltip" title="" data-original-title="반대"></i>
				</a>
		</div>
                            </div>
                        </div>
                    </form>
					<form action="/content/delete/2847694" method="post" id="note-delete-form-2847694">
							<input type="hidden" name="_csrf" value="37f07365-101b-4eae-b671-4278e93546c2">
						<input type="hidden" name="_method" value="DELETE" id="_method">
                    </form>
                </li>
            	<li class="list-group-item note-item clearfix" id="note-2847695">
            		<form action="/content/update/2847695" method="post" data-id="2847695" class="note-update-form">
            			<input type="hidden" name="_method" value="PUT" id="_method">
                        <div class="content-body panel-body pull-left">

	
	

<div class="avatar clearfix avatar-medium ">
		<a href="/user/info/66904" class="avatar-photo"><img src="//www.gravatar.com/avatar/807f826fd55ea6e328626108a4ce3115?d=identicon&amp;s=40"></a>
		<div class="avatar-info">
				<a class="nickname" href="/user/info/66904" title="프로구라무">프로구라무</a>
					<div class="activity"><span class="fa fa-flash"></span> 108</div>
					<div class="date-created"><span class="timeago" title="2022-07-04T06:26:29">2022-07-04 06:26:29</span></div>
		</div>
</div>
                            <fieldset class="form">
                                <article id="note-text-2847695" class="list-group-item-text note-text">
				                    	<p>좋은 글 감사드립니다.</p>
                                </article>
                            </fieldset>
                        </div>

                        <div class="content-function pull-right text-center">
                            <div class="content-function-group">
	
	
		
	
		<div class="note-evaluate-wrapper">
				<a href="javascript://" class="note-vote-btn" role="button" data-type="assent" data-eval="true" data-id="2847695">
					<i id="note-evaluate-assent-2847695" class="fa fa-angle-up note-evaluate-assent-assent" data-placement="left" data-toggle="tooltip" title="" data-original-title="추천"></i>
				</a>
			
			<div id="content-vote-count-2847695" class="content-eval-count">0</div>
			
				<a href="javascript://" class="note-vote-btn" role="button" data-type="dissent" data-eval="true" data-id="2847695">
					<i id="note-evaluate-dissent-2847695" class="fa fa-angle-down note-evaluate-dissent-dissent" data-placement="left" data-toggle="tooltip" title="" data-original-title="반대"></i>
				</a>
		</div>
                            </div>
                        </div>
                    </form>
					<form action="/content/delete/2847695" method="post" id="note-delete-form-2847695">
							<input type="hidden" name="_csrf" value="37f07365-101b-4eae-b671-4278e93546c2">
						<input type="hidden" name="_method" value="DELETE" id="_method">
                    </form>
                </li>
            	<li class="list-group-item note-item clearfix" id="note-2848359">
            		<form action="/content/update/2848359" method="post" data-id="2848359" class="note-update-form">
            			<input type="hidden" name="_method" value="PUT" id="_method">
                        <div class="content-body panel-body pull-left">

	
	

<div class="avatar clearfix avatar-medium ">
		<a href="/user/info/53225" class="avatar-photo"><img src="//www.gravatar.com/avatar/fede20f25ebc99cc041764076c3e4b4f?d=identicon&amp;s=40"></a>
		<div class="avatar-info">
				<a class="nickname" href="/user/info/53225" title="exexexe">exexexe</a>
					<div class="activity"><span class="fa fa-flash"></span> 455</div>
					<div class="date-created"><span class="timeago" title="2022-07-04T13:34:18">2022-07-04 13:34:18</span> 작성
						<span class="date-saperate">∙</span> <a href="/changes/2848359"><span class="timeago" title="2022-07-04 13:34:46">2022-07-04 13:34:46</span> 수정됨 </a>
					</div>
		</div>
</div>
                            <fieldset class="form">
                                <article id="note-text-2848359" class="list-group-item-text note-text">
				                    	<p>코딩에 익숙하고 싶다면, </p><p>겁나게 코딩하세요.</p><p><br></p><p>기술력을 갖고 싶다면, </p><p>책을 열심히 읽고 생각의 힘을 키우세요.</p>
                                </article>
                            </fieldset>
                        </div>

                        <div class="content-function pull-right text-center">
                            <div class="content-function-group">
	
	
		
	
		<div class="note-evaluate-wrapper">
				<a href="javascript://" class="note-vote-btn" role="button" data-type="assent" data-eval="true" data-id="2848359">
					<i id="note-evaluate-assent-2848359" class="fa fa-angle-up note-evaluate-assent-assent" data-placement="left" data-toggle="tooltip" title="" data-original-title="추천"></i>
				</a>
			
			<div id="content-vote-count-2848359" class="content-eval-count">0</div>
			
				<a href="javascript://" class="note-vote-btn" role="button" data-type="dissent" data-eval="true" data-id="2848359">
					<i id="note-evaluate-dissent-2848359" class="fa fa-angle-down note-evaluate-dissent-dissent" data-placement="left" data-toggle="tooltip" title="" data-original-title="반대"></i>
				</a>
		</div>
                            </div>
                        </div>
                    </form>
					<form action="/content/delete/2848359" method="post" id="note-delete-form-2848359">
							<input type="hidden" name="_csrf" value="37f07365-101b-4eae-b671-4278e93546c2">
						<input type="hidden" name="_method" value="DELETE" id="_method">
                    </form>
                </li>
            	<li class="list-group-item note-item clearfix" id="note-2848463">
            		<form action="/content/update/2848463" method="post" data-id="2848463" class="note-update-form">
            			<input type="hidden" name="_method" value="PUT" id="_method">
                        <div class="content-body panel-body pull-left">

	
	

<div class="avatar clearfix avatar-medium ">
		<a href="/user/info/115681" class="avatar-photo"><img src="http://k.kakaocdn.net/dn/d2Z7RT/btqWn1hCHYv/OKPnlB85nUdr2R9UyCgask/img_110x110.jpg"></a>
		<div class="avatar-info">
				<a class="nickname" href="/user/info/115681" title="Yous">Yous</a>
					<div class="activity"><span class="fa fa-flash"></span> 70</div>
					<div class="date-created"><span class="timeago" title="2022-07-04T14:11:54">2022-07-04 14:11:54</span></div>
		</div>
</div>
                            <fieldset class="form">
                                <article id="note-text-2848463" class="list-group-item-text note-text">
				                    	많은 분들에게 도움이 되는 글이네요
                                </article>
                            </fieldset>
                        </div>

                        <div class="content-function pull-right text-center">
                            <div class="content-function-group">
	
	
		
	
		<div class="note-evaluate-wrapper">
				<a href="javascript://" class="note-vote-btn" role="button" data-type="assent" data-eval="true" data-id="2848463">
					<i id="note-evaluate-assent-2848463" class="fa fa-angle-up note-evaluate-assent-assent" data-placement="left" data-toggle="tooltip" title="" data-original-title="추천"></i>
				</a>
			
			<div id="content-vote-count-2848463" class="content-eval-count">0</div>
			
				<a href="javascript://" class="note-vote-btn" role="button" data-type="dissent" data-eval="true" data-id="2848463">
					<i id="note-evaluate-dissent-2848463" class="fa fa-angle-down note-evaluate-dissent-dissent" data-placement="left" data-toggle="tooltip" title="" data-original-title="반대"></i>
				</a>
		</div>
                            </div>
                        </div>
                    </form>
					<form action="/content/delete/2848463" method="post" id="note-delete-form-2848463">
							<input type="hidden" name="_csrf" value="37f07365-101b-4eae-b671-4278e93546c2">
						<input type="hidden" name="_method" value="DELETE" id="_method">
                    </form>
                </li>
            	<li class="list-group-item note-item clearfix" id="note-2848732">
            		<form action="/content/update/2848732" method="post" data-id="2848732" class="note-update-form">
            			<input type="hidden" name="_method" value="PUT" id="_method">
                        <div class="content-body panel-body pull-left">

	
	

<div class="avatar clearfix avatar-medium ">
		<a href="/user/info/25900" class="avatar-photo"><img src="//www.gravatar.com/avatar/8162e5e910a842c798b35b7d9bd08278?d=identicon&amp;s=40"></a>
		<div class="avatar-info">
				<a class="nickname" href="/user/info/25900" title="코딩잘하기">코딩잘하기</a>
					<div class="activity"><span class="fa fa-flash"></span> 2k</div>
					<div class="date-created"><span class="timeago" title="2022-07-04T16:07:45">2022-07-04 16:07:45</span></div>
		</div>
</div>
                            <fieldset class="form">
                                <article id="note-text-2848732" class="list-group-item-text note-text">
				                    	<p>공감하고 갑니다. </p><p><br></p><p>밑바닥까지 파고면서 이론을 같이 갖추는게 중요하더라구요.&nbsp;</p><p><br></p><p>게임엔진쪽은 물리, 수학 (미분, 선형대수)도 잘 알아야하구요.&nbsp;</p>
                                </article>
                            </fieldset>
                        </div>

                        <div class="content-function pull-right text-center">
                            <div class="content-function-group">
	
	
		
	
		<div class="note-evaluate-wrapper">
				<a href="javascript://" class="note-vote-btn" role="button" data-type="assent" data-eval="true" data-id="2848732">
					<i id="note-evaluate-assent-2848732" class="fa fa-angle-up note-evaluate-assent-assent" data-placement="left" data-toggle="tooltip" title="" data-original-title="추천"></i>
				</a>
			
			<div id="content-vote-count-2848732" class="content-eval-count">0</div>
			
				<a href="javascript://" class="note-vote-btn" role="button" data-type="dissent" data-eval="true" data-id="2848732">
					<i id="note-evaluate-dissent-2848732" class="fa fa-angle-down note-evaluate-dissent-dissent" data-placement="left" data-toggle="tooltip" title="" data-original-title="반대"></i>
				</a>
		</div>
                            </div>
                        </div>
                    </form>
					<form action="/content/delete/2848732" method="post" id="note-delete-form-2848732">
							<input type="hidden" name="_csrf" value="37f07365-101b-4eae-b671-4278e93546c2">
						<input type="hidden" name="_method" value="DELETE" id="_method">
                    </form>
                </li>
            	<li class="list-group-item note-item clearfix" id="note-2848814">
            		<form action="/content/update/2848814" method="post" data-id="2848814" class="note-update-form">
            			<input type="hidden" name="_method" value="PUT" id="_method">
                        <div class="content-body panel-body pull-left">

	
	

<div class="avatar clearfix avatar-medium ">
		<a href="/user/info/52557" class="avatar-photo"><img src="//www.gravatar.com/avatar/f63f25c167d2ee1850f9b658df72537b?d=identicon&amp;s=40"></a>
		<div class="avatar-info">
				<a class="nickname" href="/user/info/52557" title="choju">choju</a>
					<div class="activity"><span class="fa fa-flash"></span> 1k</div>
					<div class="date-created"><span class="timeago" title="2022-07-04T16:54:16">2022-07-04 16:54:16</span></div>
		</div>
</div>
                            <fieldset class="form">
                                <article id="note-text-2848814" class="list-group-item-text note-text">
				                    	<p>굿굿... 진자 본질에 가까운것 같아요</p>
                                </article>
                            </fieldset>
                        </div>

                        <div class="content-function pull-right text-center">
                            <div class="content-function-group">
	
	
		
	
		<div class="note-evaluate-wrapper">
				<a href="javascript://" class="note-vote-btn" role="button" data-type="assent" data-eval="true" data-id="2848814">
					<i id="note-evaluate-assent-2848814" class="fa fa-angle-up note-evaluate-assent-assent" data-placement="left" data-toggle="tooltip" title="" data-original-title="추천"></i>
				</a>
			
			<div id="content-vote-count-2848814" class="content-eval-count">1</div>
			
				<a href="javascript://" class="note-vote-btn" role="button" data-type="dissent" data-eval="true" data-id="2848814">
					<i id="note-evaluate-dissent-2848814" class="fa fa-angle-down note-evaluate-dissent-dissent" data-placement="left" data-toggle="tooltip" title="" data-original-title="반대"></i>
				</a>
		</div>
                            </div>
                        </div>
                    </form>
					<form action="/content/delete/2848814" method="post" id="note-delete-form-2848814">
							<input type="hidden" name="_csrf" value="37f07365-101b-4eae-b671-4278e93546c2">
						<input type="hidden" name="_method" value="DELETE" id="_method">
                    </form>
                </li>
            	<li class="list-group-item note-item clearfix" id="note-2849492">
            		<form action="/content/update/2849492" method="post" data-id="2849492" class="note-update-form">
            			<input type="hidden" name="_method" value="PUT" id="_method">
                        <div class="content-body panel-body pull-left">

	
	

<div class="avatar clearfix avatar-medium ">
		<a href="/user/info/115635" class="avatar-photo"><img src="//www.gravatar.com/avatar/7f9638d3afbfa6f159b909ed8f0c5770?d=identicon&amp;s=40"></a>
		<div class="avatar-info">
				<a class="nickname" href="/user/info/115635" title="장독깨기">장독깨기</a>
					<div class="activity"><span class="fa fa-flash"></span> 5k</div>
					<div class="date-created"><span class="timeago" title="2022-07-05T08:49:03">2022-07-05 08:49:03</span> 작성
						<span class="date-saperate">∙</span> <a href="/changes/2849492"><span class="timeago" title="2022-07-05 08:50:36">2022-07-05 08:50:36</span> 수정됨 </a>
					</div>
		</div>
</div>
                            <fieldset class="form">
                                <article id="note-text-2849492" class="list-group-item-text note-text">
				                    	<p>좋은 글 입니다.</p><p>저 같은 경우 아주 오래된 사람인데 C언어로 시작했습니다. 비 전공이구요.</p><p>그 당시엔 선택지가 없었습니다. </p><p>ms-dos 에서 turbo-c 로 프로그래밍을 시작 했었죠.</p><p>너무 재미 있었고, 이래 저래 하고 싶은거 많이도 만들어 봤습니다.</p><p>지금은 선택지가 너무 많습니다.</p><p>이 부분이 지금의 저 같은 경우에는 큰 장점이 됩니다. 골라 쓸 수 있으니까요.</p><p>근데, 입문하시는 분들에게는 오히려 독이 되는거 같더군요.</p><p>프로그래밍 본질 보다는 너무 실행, 개발 환경에 집착하고, </p><p>이런 부분을 잘해야 실력이 좋은거라 오해도 많이 하는 거 같습니다.</p><p>일전에 본질을 궁금해 하는 분에게 프레임웍, 데이터베이스 없이 뭔가 만들어 보시라 조언했습니다.</p><p>근데, 몇몇 시니어 조차 의아하게 생각하는 분들이 있더군요. 답답한 노릇입니다.</p><p>가령, 스프링 프레임웍을 이용한다 해서 객체지향 프로그래밍을 한다라고 착각하면 곤란합니다.</p><p>객체지향 프로그래밍은 본인이 직접 클래스를 구조화하고 추상화할 수 있어야 하는거죠.</p><p><br></p><p>뭐 암튼, 특히 입문하시는 분들은 이 글을 꼭 새겨 들으면 좋겠습니다.</p>
                                </article>
                            </fieldset>
                        </div>

                        <div class="content-function pull-right text-center">
                            <div class="content-function-group">
	
	
		
	
		<div class="note-evaluate-wrapper">
				<a href="javascript://" class="note-vote-btn" role="button" data-type="assent" data-eval="true" data-id="2849492">
					<i id="note-evaluate-assent-2849492" class="fa fa-angle-up note-evaluate-assent-assent" data-placement="left" data-toggle="tooltip" title="" data-original-title="추천"></i>
				</a>
			
			<div id="content-vote-count-2849492" class="content-eval-count">1</div>
			
				<a href="javascript://" class="note-vote-btn" role="button" data-type="dissent" data-eval="true" data-id="2849492">
					<i id="note-evaluate-dissent-2849492" class="fa fa-angle-down note-evaluate-dissent-dissent" data-placement="left" data-toggle="tooltip" title="" data-original-title="반대"></i>
				</a>
		</div>
                            </div>
                        </div>
                    </form>
					<form action="/content/delete/2849492" method="post" id="note-delete-form-2849492">
							<input type="hidden" name="_csrf" value="37f07365-101b-4eae-b671-4278e93546c2">
						<input type="hidden" name="_method" value="DELETE" id="_method">
                    </form>
                </li>
            	<li class="list-group-item note-item clearfix" id="note-2849565">
            		<form action="/content/update/2849565" method="post" data-id="2849565" class="note-update-form">
            			<input type="hidden" name="_method" value="PUT" id="_method">
                        <div class="content-body panel-body pull-left">

	
	

<div class="avatar clearfix avatar-medium ">
		<a href="/user/info/99993" class="avatar-photo"><img src="//www.gravatar.com/avatar/2ce51e7eafdaaf2441999e1af37653eb?d=identicon&amp;s=40"></a>
		<div class="avatar-info">
				<a class="nickname" href="/user/info/99993" title="아구아구">아구아구</a>
					<div class="activity"><span class="fa fa-flash"></span> 120</div>
					<div class="date-created"><span class="timeago" title="2022-07-05T09:31:28">2022-07-05 09:31:28</span></div>
		</div>
</div>
                            <fieldset class="form">
                                <article id="note-text-2849565" class="list-group-item-text note-text">
				                    	<p>바닐라js로 리액트처럼 만들기 해본적있거등여? ㄹㅇㄹㅇ 첨엔 체인지 이벤트 썻다가 걍 이벤트에 원초 옵저버로 만들어보고 그랫는데 해보고나서 느낀건 개발하기 편한세상이 왔다는거에여 모든기능을 리액트처럼 구현은 할순없지만 바닐라로 해보고나서 걍 프레임워크가짱이구나 느꼇습니다 그 이후에 제이쿼리라는 프레임워크랑 vue를 훨훨 더잘쓰게 됬습니다. 응?(리액트 좀 공부하다가 뷰쓰니깐 뷰가 짱편하더라구요..)</p>
                                </article>
                            </fieldset>
                        </div>

                        <div class="content-function pull-right text-center">
                            <div class="content-function-group">
	
	
		
	
		<div class="note-evaluate-wrapper">
				<a href="javascript://" class="note-vote-btn" role="button" data-type="assent" data-eval="true" data-id="2849565">
					<i id="note-evaluate-assent-2849565" class="fa fa-angle-up note-evaluate-assent-assent" data-placement="left" data-toggle="tooltip" title="" data-original-title="추천"></i>
				</a>
			
			<div id="content-vote-count-2849565" class="content-eval-count">1</div>
			
				<a href="javascript://" class="note-vote-btn" role="button" data-type="dissent" data-eval="true" data-id="2849565">
					<i id="note-evaluate-dissent-2849565" class="fa fa-angle-down note-evaluate-dissent-dissent" data-placement="left" data-toggle="tooltip" title="" data-original-title="반대"></i>
				</a>
		</div>
                            </div>
                        </div>
                    </form>
					<form action="/content/delete/2849565" method="post" id="note-delete-form-2849565">
							<input type="hidden" name="_csrf" value="37f07365-101b-4eae-b671-4278e93546c2">
						<input type="hidden" name="_method" value="DELETE" id="_method">
                    </form>
                </li>
            	<li class="list-group-item note-item clearfix" id="note-2850226">
            		<form action="/content/update/2850226" method="post" data-id="2850226" class="note-update-form">
            			<input type="hidden" name="_method" value="PUT" id="_method">
                        <div class="content-body panel-body pull-left">

	
	

<div class="avatar clearfix avatar-medium ">
		<a href="/user/info/139731" class="avatar-photo"><img src="https://phinf.pstatic.net/contact/20190225_94/1551076747070IDoQC_PNG/image.png"></a>
		<div class="avatar-info">
				<a class="nickname" href="/user/info/139731" title="tttaaaammm">tttaaaammm</a>
					<div class="activity"><span class="fa fa-flash"></span> 456</div>
					<div class="date-created"><span class="timeago" title="2022-07-05T14:05:48">2022-07-05 14:05:48</span></div>
		</div>
</div>
                            <fieldset class="form">
                                <article id="note-text-2850226" class="list-group-item-text note-text">
				                    	<p>모 공부하려고 하는데요 강의 추천해주세요&nbsp;</p><p>라고 하는 모든 분들에게 읽어보라고 하고싶내요</p>
                                </article>
                            </fieldset>
                        </div>

                        <div class="content-function pull-right text-center">
                            <div class="content-function-group">
	
	
		
	
		<div class="note-evaluate-wrapper">
				<a href="javascript://" class="note-vote-btn" role="button" data-type="assent" data-eval="true" data-id="2850226">
					<i id="note-evaluate-assent-2850226" class="fa fa-angle-up note-evaluate-assent-assent" data-placement="left" data-toggle="tooltip" title="" data-original-title="추천"></i>
				</a>
			
			<div id="content-vote-count-2850226" class="content-eval-count">0</div>
			
				<a href="javascript://" class="note-vote-btn" role="button" data-type="dissent" data-eval="true" data-id="2850226">
					<i id="note-evaluate-dissent-2850226" class="fa fa-angle-down note-evaluate-dissent-dissent" data-placement="left" data-toggle="tooltip" title="" data-original-title="반대"></i>
				</a>
		</div>
                            </div>
                        </div>
                    </form>
					<form action="/content/delete/2850226" method="post" id="note-delete-form-2850226">
							<input type="hidden" name="_csrf" value="37f07365-101b-4eae-b671-4278e93546c2">
						<input type="hidden" name="_method" value="DELETE" id="_method">
                    </form>
                </li>
            	<li class="list-group-item note-item clearfix" id="note-2850578">
            		<form action="/content/update/2850578" method="post" data-id="2850578" class="note-update-form">
            			<input type="hidden" name="_method" value="PUT" id="_method">
                        <div class="content-body panel-body pull-left">

	
	

<div class="avatar clearfix avatar-medium ">
		<a href="/user/info/145003" class="avatar-photo"><img src="//graph.facebook.com/2007462219444911/picture?width=40&amp;height=40"></a>
		<div class="avatar-info">
				<a class="nickname" href="/user/info/145003" title="진돗개발령">진돗개발령</a>
					<div class="activity"><span class="fa fa-flash"></span> 2</div>
					<div class="date-created"><span class="timeago" title="2022-07-05T17:29:59">2022-07-05 17:29:59</span></div>
		</div>
</div>
                            <fieldset class="form">
                                <article id="note-text-2850578" class="list-group-item-text note-text">
				                    	<p>글쓴이님의 글에 너무나도 많은 공감이 됩니다.</p><p>코딩부터 하면 api의 사용방법 정도는 알 수는 있지만 깊은 내용을 모르기 때문에 다시 책을 보게 되고 다시 알게 되는 점들이 많죠</p>
                                </article>
                            </fieldset>
                        </div>

                        <div class="content-function pull-right text-center">
                            <div class="content-function-group">
	
	
		
	
		<div class="note-evaluate-wrapper">
				<a href="javascript://" class="note-vote-btn" role="button" data-type="assent" data-eval="true" data-id="2850578">
					<i id="note-evaluate-assent-2850578" class="fa fa-angle-up note-evaluate-assent-assent" data-placement="left" data-toggle="tooltip" title="" data-original-title="추천"></i>
				</a>
			
			<div id="content-vote-count-2850578" class="content-eval-count">0</div>
			
				<a href="javascript://" class="note-vote-btn" role="button" data-type="dissent" data-eval="true" data-id="2850578">
					<i id="note-evaluate-dissent-2850578" class="fa fa-angle-down note-evaluate-dissent-dissent" data-placement="left" data-toggle="tooltip" title="" data-original-title="반대"></i>
				</a>
		</div>
                            </div>
                        </div>
                    </form>
					<form action="/content/delete/2850578" method="post" id="note-delete-form-2850578">
							<input type="hidden" name="_csrf" value="37f07365-101b-4eae-b671-4278e93546c2">
						<input type="hidden" name="_method" value="DELETE" id="_method">
                    </form>
                </li>
            	<li class="list-group-item note-item clearfix" id="note-2851168">
            		<form action="/content/update/2851168" method="post" data-id="2851168" class="note-update-form">
            			<input type="hidden" name="_method" value="PUT" id="_method">
                        <div class="content-body panel-body pull-left">

	
	

<div class="avatar clearfix avatar-medium ">
		<a href="/user/info/22886" class="avatar-photo"><img src="//www.gravatar.com/avatar/f9c53162a7aa044e2fccf051bc4d77e6?d=identicon&amp;s=40"></a>
		<div class="avatar-info">
				<a class="nickname" href="/user/info/22886" title="yoohg75">yoohg75</a>
					<div class="activity"><span class="fa fa-flash"></span> 92</div>
					<div class="date-created"><span class="timeago" title="2022-07-06T09:32:56">2022-07-06 09:32:56</span></div>
		</div>
</div>
                            <fieldset class="form">
                                <article id="note-text-2851168" class="list-group-item-text note-text">
				                    	<p>사실 전에 아는 후배한테 들었던 얘기가 생각나네요...코딩을 많이 해보고 어떻게 하면 코드 중복을 줄이면서 재상용을 잘 할 수 있을까를 고민하다 보니...주기적으로 리팩토링을 했었고, 그 과정에서 중복을 줄이고 재사용 가능하도록 기능별로 프로그램을 쪼개고...</p><p>그래서 나중에 리팩토링 관련 책들을 보니 자기가 이미 하고 있던 게 꽤 많았다고 하더군요. 결국 운동이나 영어등도 마찬가지일 텐데 이론이 뛰어나다고 운동을 잘 하게 되거나 영어를 잘 하게 되는 게 아니듯이 결국은 코딩을 잘하려면 코딩을 많이 해보고 그 코딩이 돌아가는 거에 만족하지 않고, 좀 더 좋은 코드를 위해 고민하고 고쳐봐야 된다고 생각합니다. 그리고, 끓임없이 좋은 코딩을 위해 의심해 보는 게 필요할 것 같습니다.</p><p>좋은 글 잘 봤습니다. 솔직히 나이가 들고 경력이 쌓이면서 코딩을 열심히 하는 게 점점 더 귀찮아지고 편한 것만 찾으려고 하는 것 같습니다. 그런 마음에 큰 자극이 된 것 같네요.</p>
                                </article>
                            </fieldset>
                        </div>

                        <div class="content-function pull-right text-center">
                            <div class="content-function-group">
	
	
		
	
		<div class="note-evaluate-wrapper">
				<a href="javascript://" class="note-vote-btn" role="button" data-type="assent" data-eval="true" data-id="2851168">
					<i id="note-evaluate-assent-2851168" class="fa fa-angle-up note-evaluate-assent-assent" data-placement="left" data-toggle="tooltip" title="" data-original-title="추천"></i>
				</a>
			
			<div id="content-vote-count-2851168" class="content-eval-count">0</div>
			
				<a href="javascript://" class="note-vote-btn" role="button" data-type="dissent" data-eval="true" data-id="2851168">
					<i id="note-evaluate-dissent-2851168" class="fa fa-angle-down note-evaluate-dissent-dissent" data-placement="left" data-toggle="tooltip" title="" data-original-title="반대"></i>
				</a>
		</div>
                            </div>
                        </div>
                    </form>
					<form action="/content/delete/2851168" method="post" id="note-delete-form-2851168">
							<input type="hidden" name="_csrf" value="37f07365-101b-4eae-b671-4278e93546c2">
						<input type="hidden" name="_method" value="DELETE" id="_method">
                    </form>
                </li>
            	<li class="list-group-item note-item clearfix" id="note-2851557">
            		<form action="/content/update/2851557" method="post" data-id="2851557" class="note-update-form">
            			<input type="hidden" name="_method" value="PUT" id="_method">
                        <div class="content-body panel-body pull-left">

	
	

<div class="avatar clearfix avatar-medium ">
		<a href="/user/info/118727" class="avatar-photo"><img src="//www.gravatar.com/avatar/12af2331a5c7451be7f8bd8099e7b767?d=identicon&amp;s=40"></a>
		<div class="avatar-info">
				<a class="nickname" href="/user/info/118727" title="shirohoo">shirohoo</a>
					<div class="activity"><span class="fa fa-flash"></span> 2k</div>
					<div class="date-created"><span class="timeago" title="2022-07-06T13:00:44">2022-07-06 13:00:44</span></div>
		</div>
</div>
                            <fieldset class="form">
                                <article id="note-text-2851557" class="list-group-item-text note-text">
				                    	<p>1년 가까이 코드카타를 하고있는 입장에서 너무 공감되는 글입니다.&nbsp;</p><p><br></p>
                                </article>
                            </fieldset>
                        </div>

                        <div class="content-function pull-right text-center">
                            <div class="content-function-group">
	
	
		
	
		<div class="note-evaluate-wrapper">
				<a href="javascript://" class="note-vote-btn" role="button" data-type="assent" data-eval="true" data-id="2851557">
					<i id="note-evaluate-assent-2851557" class="fa fa-angle-up note-evaluate-assent-assent" data-placement="left" data-toggle="tooltip" title="" data-original-title="추천"></i>
				</a>
			
			<div id="content-vote-count-2851557" class="content-eval-count">0</div>
			
				<a href="javascript://" class="note-vote-btn" role="button" data-type="dissent" data-eval="true" data-id="2851557">
					<i id="note-evaluate-dissent-2851557" class="fa fa-angle-down note-evaluate-dissent-dissent" data-placement="left" data-toggle="tooltip" title="" data-original-title="반대"></i>
				</a>
		</div>
                            </div>
                        </div>
                    </form>
					<form action="/content/delete/2851557" method="post" id="note-delete-form-2851557">
							<input type="hidden" name="_csrf" value="37f07365-101b-4eae-b671-4278e93546c2">
						<input type="hidden" name="_method" value="DELETE" id="_method">
                    </form>
                </li>
            <li class="list-group-item note-form clearfix">
                	<div class="panel-body">
                        <h5 class="text-center"><a href="/login/auth?redirectUrl=%2Farticle%2F1261756" class="link">로그인</a>을 하시면 댓글을 등록할 수 있습니다.</h5>
                    </div>
            </li>
        </ul>
    </div>
</div><form action="/article/assent/1261756" method="post" name="note-assent-form" id="note-assent-form">
	<input type="hidden" name="_method" value="PUT" id="_method">
</form>
<form action="/article/unvote/1261756" method="post" name="note-unvote-form" id="note-unvote-form">
	<input type="hidden" name="_method" value="PUT" id="_method">
</form>
<form action="/article/selectNote/1261756" method="post" name="note-select-form" id="note-select-form">
	<input type="hidden" name="_method" value="PUT" id="_method">
</form>
<form action="/article/deselectNote/1261756" method="post" name="note-deselect-form" id="note-deselect-form">
	<input type="hidden" name="_method" value="PUT" id="_method">
</form>
<form action="/article/scrap/1261756" method="post" name="article-scrap-form" id="article-scrap-form">
</form>
                <div class="right-banner-wrapper">


				<div class="right-banner">
	                <a href="/banner/stats/526" target="_i"><img src="//file.okky.kr/banner/1655957330535.png" style="width:160px;"></a>
	            </div>


				<div class="google-ad">
					<a href="/banner/stats/536" target="o"><img src="//file.okky.kr/banner/1657087356712.png"></a>
				</div>
                </div>
                <div id="footer" class="footer" role="contentinfo">
<div class="row">
    <div class="col-sm-9">
        <div style="float: left;margin-right: 10px;height:100px;">
        	<img src="../images/okky_logo_footer.png" alt="footer">
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
          <a href="https://www.inames.co.kr" target="_blank"><img src="../images/spb_inames.png" alt="아이네임즈"></a>
          <a href="https://www.toast.com/" target="_blank"><img src="../images/spb_nhncloud.png" alt="NHN Cloud"></a>
        </div>
    </div>
</div>
                </div>
            </div>
        </div>
        <script>
            var contextPath = "";
            var encodedURL = "%2Farticle%2F1261756";
        </script>
        
        <script src="../js/application.js" type="text/javascript"></script>
        <script src="../js/apps/search.js" type="text/javascript"></script>
<div id="fb-root" class=" fb_reset"><div style="position: absolute; top: -10000px; width: 0px; height: 0px;"><div></div></div></div>
<script src="../js/libs/prism.js" type="text/javascript"></script>
<script src="../js/apps/note.js" type="text/javascript"></script>
<script src="../js/apps/vote.js" type="text/javascript"></script>
<script src="../js/apps/scrap.js" type="text/javascript"></script>
<script src="../js/apps/article.js" type="text/javascript"></script>
<script>
    (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&appId=1539685662974940&version=v2.0";
    fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
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

    

<ins class="adsbygoogle adsbygoogle-noablate" style="display: none !important;" data-adsbygoogle-status="done" data-ad-status="unfilled"><ins id="aswift_1_expand" style="border: medium none; height: 0px; width: 0px; margin: 0px; padding: 0px; position: relative; visibility: visible; background-color: transparent; display: inline-table;" tabindex="0" title="Advertisement" aria-label="Advertisement"><ins id="aswift_1_anchor" style="border: medium none; height: 0px; width: 0px; margin: 0px; padding: 0px; position: relative; visibility: visible; background-color: transparent; display: block;"><iframe id="aswift_1" name="aswift_1" style="left:0;position:absolute;top:0;border:0;width:undefinedpx;height:undefinedpx;" sandbox="allow-forms allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" src="https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-8103607814406874&amp;output=html&amp;adk=1812271804&amp;adf=3025194257&amp;lmt=1657092308&amp;plat=1%3A16778240%2C2%3A16778240%2C9%3A32776%2C16%3A8388608%2C17%3A32%2C24%3A32%2C25%3A32%2C30%3A1081344%2C32%3A32&amp;format=0x0&amp;url=https%3A%2F%2Fokky.kr%2Farticle%2F1261756&amp;ea=0&amp;pra=7&amp;wgl=1&amp;dt=1657092307581&amp;bpp=1&amp;bdt=1423&amp;idt=227&amp;shv=r20220629&amp;mjsv=m202206300101&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3Db8daa0e1d60077f3-22a61ed110d500c1%3AT%3D1657092305%3ART%3D1657092305%3AS%3DALNI_MYTW7j70A9xsAWOxaZtYSihhA58aw&amp;gpic=UID%3D00000769b0777d0a%3AT%3D1657092305%3ART%3D1657092305%3AS%3DALNI_MaauRpTRRJsTDwMHGS-zvML_Bb6mw&amp;nras=1&amp;correlator=4390662194975&amp;frm=20&amp;pv=2&amp;ga_vid=830016841.1657092308&amp;ga_sid=1657092308&amp;ga_hid=2041460464&amp;ga_fc=1&amp;u_tz=540&amp;u_his=8&amp;u_h=720&amp;u_w=1280&amp;u_ah=680&amp;u_aw=1280&amp;u_cd=24&amp;u_sd=1.5&amp;adx=-12245933&amp;ady=-12245933&amp;biw=1263&amp;bih=595&amp;scr_x=0&amp;scr_y=0&amp;eid=44759875%2C44759926%2C44759837%2C31067983%2C31068196%2C42531605%2C42531608%2C31064018&amp;oid=2&amp;pvsid=1348466370648807&amp;tmod=1005979026&amp;nvt=1&amp;ref=https%3A%2F%2Fokky.kr%2F&amp;eae=2&amp;fc=896&amp;brdim=-7%2C-7%2C-7%2C-7%2C1280%2C0%2C1295%2C695%2C1280%2C595&amp;vis=1&amp;rsz=%7C%7Cs%7C&amp;abl=NS&amp;fu=32768&amp;bc=31&amp;ifi=2&amp;uci=a!2&amp;fsb=1&amp;dtd=463" data-google-container-id="a!2" data-load-complete="true" frameborder="0"></iframe></ins></ins></ins><iframe src="https://www.google.com/recaptcha/api2/aframe" style="display: none;" width="0" height="0"></iframe></body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html> 


<script type="text/javascript"  src="http://code.jQuery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		type : 'post',
		url : '/bitcampfire/CommentView/getCommentContent', // controller 가서 데이터 가져와
		data : 'cmt_bid=' + $('input[name="cmt_bid"]').val(), // 글번호 
		// ------------요청----------------
		dataType : 'json', 
		success : function(data) {
			$('#board')
		}
		
	});
	
});
</script>  

<script type="text/javascript"  src="http://code.jQuery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		type : 'post',
		url : '/bitcampfire/CommentView/writeCommentContent', // controller 가서 데이터 가져와
		data: {},
		dataType : 'json', 
		success : function(data) {
			
			$('#cmt_img').text(data.CommentDTO.img);
			$('#cmt_user').text(data.CommentDTO.cmt_uid);
			$('#cmt_content').text(data.CommentDTO.cmt_content);
			$('#cmt_date').text(data.CommentDTO.cmt_date_created);
		}
		
	});
	
});
</script>



