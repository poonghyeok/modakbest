<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
		<link rel="stylesheet" href="/semiproject/css/board/application.css">
		
		
        <meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		
		<title>OKKY - 한국사람들이 싫어할듯한 javascript 책</title>
		
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
		<meta property="og:image" content="https://okky.kr/assets/images/okky_logo_fb.png">
		<link rel="stylesheet" href="/assets/css/application.css">
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
<meta property="og:url" content="https://okky.kr/article/1266491">
<meta property="og:description" content=" 음 우연히 자바스크립트 책을 검색하다 발견했는데 우리나라 사람들이 싫어할만한 표지를 가지고 있군요…    https://www.amazon.com/dp/B07NLM78D9?ref KC_GS_GB_US   ">
<meta property="og:title" content="OKKY | 한국사람들이 싫어할듯한 javascript 책">
<meta property="dable:item_id" content="1266491">
<meta property="dable:author" content="드루이드">
<meta property="article:section" content="life">
<meta property="article:published_time" content="2022-07-07T11:47:55Z">
		
	
</head>


<body>
    <div class="panel-heading clearfix">
    	<div class="avatar clearfix avatar-medium pull-left">
            <a href="/user/info/133529" class="avatar-photo"><img src="//www.gravatar.com/avatar/9a316994cda85c56cd4f0c833ec511b6?d=identicon&amp;s=40"></a>
            <div class="avatar-info">
   <!-- 유저아이디 -->  <a class="board_uid" href="/user/info/133529" title="board_uid">${board_uid}</a>
                        <div class="activity"><span class="fa fa-flash"></span> 2k
                        </div>
    <!-- 작성일 -->	<div class="date-created"><span class="board_date_created" title="board_date_created">${board_date_created }</span></div>
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
        <a href="/articles/columns" class="board_cateid"><i class="board_cateid"></i>${board_cateid}</a>
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

</body>
</html> 

<!-- 댓글작성 -->
<script type="text/javascript"  src="http://code.jQuery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
/* $(function(){
	$.ajax({
		type : 'post',
		url : '/semiproject/board/getBoardView', // controller 가서 한사람의 글을 가져와라
		data : '=' + $('input[name="cmt_bid"]').val(), // 글번호 
		// ------------요청----------------
		dataType : 'json', 
		success : function(data) {
		
		}
		
	});
	
}); */

$('#writeCommentBtn').click(function(){
	$.ajax({
		type : 'post',
		url : '/semiproject/CommentView/writeCommentContent', // controller 가서 데이터 가져와
		data: {},
		dataType : 'json', 
		success : function(data) {
			
			$('#cmt_img').text(data.CommentDTO.img);
			$('#cmt_user').text(data.CommentDTO.cmt_uid);
			$('#cmt_content').text(data.CommentDTO.cmt_content);
			$('#cmt_date').text(data.CommentDTO.cmt_date_created);
		}
		
	
	
});
</script>  



