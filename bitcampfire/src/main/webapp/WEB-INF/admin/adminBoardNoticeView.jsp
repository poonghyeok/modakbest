<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
		<link rel="stylesheet" href="/semiproject/css/board/application.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/summernote3/summernote-lite.css">
</head>

<body>
<div class="layout-container">
    <div class="main ">
		<!-- 사이드바 완성되면 바꿔넣기  -->
		<%@ include file="/admin/adminSidebar.jsp" %> 
   		
    	<div id="article" class="content" role="main">	
	       
	        <!-- main-banner -->
	   		<div class="main-banner-wrapper">
		        <div class="main-banner">
		            <a href="#" target="_i"><img src="//file.okky.kr/banner/1657005748618.png"></a>
		        </div>
	        </div><!-- <div class="main-banner-wrapper"> -->
	        
	   		<!-- main-banner -->  
        
        	<!-- 글 카테고리, 새글쓰기  -->
	        <div class="nav" role="navigation">	        
	            <input type="button" value="공지등록 " class="create btn btn-success btn-wide pull-right" id = "adminNoticeWriteBtnAtView"><i class="fa fa-pencil"></i>
	            <h4>${boardDTO.noticeCateidToString()}</h4>
	        </div><!-- <div class="nav" role="navigation"> -->
			<!-- 글 카테고리, 새글쓰기  -->
			
	        <!-- controller에 필요한 정보들 찍어보기 및 숨기기-->	    	
			<input type = "hidden" id ="board_id" name = "board_id" value="${board_id}">
	        <input type = "hidden" id = "board_uid" name = "board_uid" value="${boardDTO.board_uid}">	       
	        <input type = "hidden" id = "board_author"  name = "board_author" value="${author}">
	        <input type = "hidden" id = "board_cateid" name = "board_cateid" value="${boardDTO.board_cateid}">
	        <input type = "hidden" id = "board_watcher" name = "board_watcher" value="${sessionScope.memId}">
	        <!-- controller에 필요한 정보들 찍어보기 및 숨기기-->
	
			<!-- 본격 글 내용 (ㄴ작성자 ~ 페이스북 ) -->
	        <div class="panel panel-default clearfix fa-">
	        	<!-- 글 작성자 , 댓글수, 조회수 -->
	            <div class="panel-heading clearfix">
	                <div class="avatar clearfix avatar-medium pull-left"> 
	            	    <!-- 07/11기진: user page를 위해 href를 user 수정하였습니다  -> 현재 제대로 이동되지 않아 다시 확인 필요(연수_220721)-->
	                    <a href="/semiproject/user/userPage?user_id=${boardDTO.board_uid}" class="avatar-photo"><img src="/semiproject/storage/userprofile/${user_img}"></a>
	                    <div class="avatar-info">
	                    	<!-- 풍혁 220708 : 작성자 반영했습니다. -->
                            <a class="nickname" href="/semiproject/user/userPage?user_id=${boardDTO.board_uid}" title="author">${author}</a>
                            <div class="activity">
                            	<!-- lev 어쩌지? -->
                            	<span class="fa fa-flash"></span> 
                            	lev
                           	</div>
                            <div class="date-created"><span class="timeago" title="2022-07-07T11:47:55">${dateToStr}</span>작성
                                <span class="date-saperate">∙</span> 
                                <a href="#">
   <!-- 글 수정 날짜 -->         	<span class="timeago" title="2022-07-07 11:52:28"></span>
                               	</a>
                            </div>
	                  	</div>
                  	</div>
					<div class="content-identity pull-right">						
						<div class="content-identity-count"><i class="fa fa-eye"></i> ${boardDTO.board_view_cnt}</div>
	                </div>
            	</div><!--  <div class="panel-heading clearfix"> -->
	            <!-- 글 작성자 , 댓글수, 조회수 -->
	            
	            <!-- 글번호, 글카테고리, 글내용, 관리자 페이지 생략 -> (글추천수, 글스크랩수) -->
				<div class="content-container clearfix">
					<div id="content-body" class="panel-body content-body pull-left">
						<div class="content-tags">
							<span class="list-group-item-text -id">${board_id}</span> 
							<a href="#" class="list-group-item-text item-tag label label-info"> 
							<i class="fa fa-comments"></i>
							<!-- 관리자 페이지는 기본 게시판 카테고리랑 다르게 설정함  -->
							${boardDTO.noticeCateidToString()}
							</a>							
						</div>
						<h2 class="panel-title">${boardDTO.board_title}</h2>
						<hr>
						<article class="content-text" itemprop="articleBody">
							${boardDTO.board_content}
						</article>
					</div>

					<!--추천수 삭제 : 관리자 페이지는 생략 -->
					<div id="content-function" class="content-function pull-right text-center">
						<div class="content-function-group">
				
						</div>
					</div>
					<!--페이스북, 글관리-->
					<div class="content-function-cog note-submit-buttons clearfix">

	                    <p><input type = "button" id="boardDelete" value = "삭제" class="btn btn-default btn-wide"></p>

	                    <input type="button" name="boardUpdate" id="boardUpdateFormBtn" class="btn btn-success btn-wide" value="수정">
                    </div>
		            <!--페이스북, 글관리-->
		            
				</div> <!-- <div class="content-container clearfix"> -->
			</div><!-- <div class="panel panel-default clearfix fa-"> -->
			
			<!-- 중간배너광고 -->
			<div class="main-banner-wrapper">
	            <script async="" src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
	            <!-- 728-90_Ressponsive -->
            <ins class="adsbygoogle" style="display:inline-block;width:728px;height:90px" data-ad-client="ca-pub-8103607814406874" data-ad-slot="8622179990" data-adsbygoogle-status="done" data-ad-status="filled"><ins id="aswift_0_expand" tabindex="0" title="Advertisement" aria-label="Advertisement" style="border: none; height: 90px; width: 728px; margin: 0px; padding: 0px; position: relative; visibility: visible; background-color: transparent; display: inline-table;"><ins id="aswift_0_anchor" style="border: none; height: 90px; width: 728px; margin: 0px; padding: 0px; position: relative; visibility: visible; background-color: transparent; display: block;"><iframe id="aswift_0" name="aswift_0" style="left:0;position:absolute;top:0;border:0;width:728px;height:90px;" sandbox="allow-forms allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" width="728" height="90" frameborder="0" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" src="https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-8103607814406874&amp;output=html&amp;h=90&amp;slotname=8622179990&amp;adk=3431456933&amp;adf=1152904402&amp;pi=t.ma~as.8622179990&amp;w=728&amp;lmt=1657627321&amp;psa=1&amp;format=728x90&amp;url=https%3A%2F%2Fokky.kr%2Farticle%2F1270690&amp;wgl=1&amp;uach=WyJXaW5kb3dzIiwiMTAuMC4wIiwieDg2IiwiIiwiMTAzLjAuNTA2MC4xMTQiLFtdLG51bGwsbnVsbCwiNjQiLFtbIi5Ob3QvQSlCcmFuZCIsIjk5LjAuMC4wIl0sWyJHb29nbGUgQ2hyb21lIiwiMTAzLjAuNTA2MC4xMTQiXSxbIkNocm9taXVtIiwiMTAzLjAuNTA2MC4xMTQiXV0sZmFsc2Vd&amp;dt=1657627321231&amp;bpp=2&amp;bdt=136&amp;idt=38&amp;shv=r20220707&amp;mjsv=m202207070101&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3D6626918e45448ba0-2224f3e324d30035%3AT%3D1652251063%3ART%3D1652251063%3AS%3DALNI_MY6C-odsqHmOL9v7hJEaGIF7MjTGQ&amp;gpic=UID%3D0000058c7fdc8bfe%3AT%3D1652916217%3ART%3D1657606326%3AS%3DALNI_MZMgoeMHJRCSPgXFzb4J_BfYC9WVQ&amp;correlator=6678620449836&amp;frm=20&amp;pv=2&amp;ga_vid=158964670.1657505156&amp;ga_sid=1657627321&amp;ga_hid=2060735238&amp;ga_fc=1&amp;u_tz=540&amp;u_his=4&amp;u_h=864&amp;u_w=1536&amp;u_ah=824&amp;u_aw=1536&amp;u_cd=24&amp;u_sd=1.375&amp;dmc=8&amp;adx=279&amp;ady=600&amp;biw=1381&amp;bih=406&amp;scr_x=0&amp;scr_y=0&amp;eid=44759875%2C44759926%2C44759842%2C42531606%2C42531607%2C31064018&amp;oid=2&amp;pvsid=3046111821366929&amp;tmod=1986128824&amp;uas=0&amp;nvt=1&amp;ref=https%3A%2F%2Fokky.kr%2Farticles%2Fquestions&amp;eae=0&amp;fc=896&amp;brdim=0%2C0%2C0%2C0%2C1536%2C0%2C1536%2C824%2C1396%2C406&amp;vis=1&amp;rsz=%7C%7CeEbr%7C&amp;abl=CS&amp;pfx=0&amp;fu=0&amp;bc=31&amp;ifi=1&amp;uci=a!1&amp;btvi=1&amp;fsb=1&amp;xpc=r0Dl4RgCjI&amp;p=https%3A//okky.kr&amp;dtd=47" data-google-container-id="a!1" data-google-query-id="CPXfi_2m8_gCFSjEFgUd174HpQ" data-load-complete="true"></iframe></ins></ins></ins>
            <script>
                 (adsbygoogle = window.adsbygoogle || []).push({});
            </script>
            </div>	
			<!-- 중간배너광고 -->

			<!-- 댓글 div : 관리자 페이지는 생략-->		

			</div><!-- <div id="article" class="content" role="main"> -->
		<jsp:include page="/WEB-INF/global/footer.jsp"/>
    </div><!-- <div class="main "> -->
    <!--footer 시작 -->     
	<!--footer 시작 -->
</div><!-- <div class="layout-container"> -->


<script type="text/javascript" src="/semiproject/js/board/boardView.js"></script>
<script type="text/javascript" src="/semiproject/js/board/boardView2.js"></script>
<script type="text/javascript" src="http://code.jQuery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/summernote3/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/summernote3/summernote-ko-KR.js"></script>

<script type="text/javascript">
/* 뷰에서 공지등록하러 가기  */
$('#adminNoticeWriteBtnAtView').click(function(){
	location.href="/semiproject/admin/adminBoardNoticeWriteForm";
});

/* function noticeCateidToString(cateid){
	let result;
	if(cateid == 0){
		result = 'notice';
	}else if(cateid == 1){
		result = 'info';
	}else if(cateid == 2){
		result = 'review';
	}else if(cateid == 3){
		result = 'qna';
	}else if(cateid == 4){
		result = 'free';
	}else if(cateid == 5){
		result = 'class';
	}
	
	return result;
}

function stringNoticeCateToInt(category){
	let result;
	
	if(cateid == 'notice'){
		result = 0;
	}else if(cateid == 'info'){
		result = 1;
	}else if(cateid == 'review'){
		result = 2;
	}else if(cateid == 'qna'){
		result = 3;
	}else if(cateid == 'free'){
		result = 4;
	}else if(cateid == 'class'){
		result = 5;
	}
	
	return result;
} */
</script>

</body>
</html> 