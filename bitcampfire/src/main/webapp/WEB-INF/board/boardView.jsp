<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
		<link rel="stylesheet" href="/semiproject/css/board/application.css">

</head>

<body>
<div class="panel panel-default clearfix fa-">
        <div class="panel-heading clearfix">
	<div class="avatar clearfix avatar-medium pull-left">
			<a href="/user/info/34213" class="avatar-photo"><img src="//www.gravatar.com/avatar/c649774942c3c2ab78ed58379972c2f8?d=identicon&amp;s=40"></a>
			<div class="avatar-info">
					<a class="nickname" href="/user/info/34213" title="드루이드">드루이드</a>
						<div class="activity"><span class="fa fa-flash"></span> 267</div>
						<div class="date-created"><span class="timeago" title="2022-07-07T11:47:55">2022-07-07 11:47:55</span> 작성
							<span class="date-saperate">∙</span> <a href="/changes/2853281"><span class="timeago" title="2022-07-07 11:52:28">2022-07-07 11:52:28</span> 수정됨 </a>
						</div>
			</div>
	</div>

            <div class="content-identity pull-right">
            <div class="content-identity-count"><i class="fa fa-comment"></i> 0</div>
                <div class="content-identity-count"><i class="fa fa-eye"></i> 237</div>
            </div>
        </div>
        <div class="content-container clearfix">
            <div id="content-body" class="panel-body content-body pull-left">
                <div class="content-tags">
                    <span class="list-group-item-text article-id">#1266491</span>
                    <a class="create btn btn-success btn-wide pull-right" href="/board/write"><i class="fa fa-pencil"></i> 새 글 쓰기</a>
	<a href="/articles/life" class="list-group-item-text item-tag label label-info"><i class="fa fa-comments"></i> 사는얘기</a>

		
			<a href="/articles/tagged/javascript" class="list-group-item-text item-tag label label-gray ">javascript</a>
                </div>
                <h2 class="panel-title">
                    한국사람들이 싫어할듯한 javascript 책
                </h2>
                <hr>
                <article class="content-text" itemprop="articleBody">
                    	<p>음 우연히 자바스크립트 책을 검색하다 발견했는데 우리나라 사람들이 싫어할만한 표지를 가지고 있군요…&nbsp;</p><p><a href="https://www.amazon.com/How-JavaScript-Works-Douglas-Crockford/dp/1949815005/ref=mp_s_a_1_60?crid=2GCH9CDM5J52I&amp;keywords=javascript&amp;qid=1657161876&amp;sprefix=javascript%2Caps%2C136&amp;sr=8-60#aw-udpv3-customer-reviews_feature_div" rel="nofollow">https://www.amazon.com/dp/B07NLM78D9?ref=KC_GS_GB_US</a> <a href="https://www.amazon.com/How-JavaScript-Works-Douglas-Crockford/dp/1949815005/ref=mp_s_a_1_60?crid=2GCH9CDM5J52I&amp;keywords=javascript&amp;qid=1657161876&amp;sprefix=javascript%2Caps%2C136&amp;sr=8-60#aw-udpv3-customer-reviews_feature_div" target="_blank" title="새창으로 열기"><i class="fa fa-external-link"></i></a><br></p>
                </article>

            </div>

            <div id="content-function" class="content-function pull-right text-center">
                <div class="content-function-group">
	
	
		
	
		<div class="note-evaluate-wrapper">
				<a href="javascript://" class="note-vote-btn" role="button" data-type="assent" data-eval="true" data-id="2853281">
					<i id="note-evaluate-assent-2853281" class="fa fa-angle-up note-evaluate-assent-assent" data-placement="left" data-toggle="tooltip" title="" data-original-title="추천"></i>
				</a>
			
			<div id="content-vote-count-2853281" class="content-eval-count">0</div>
			
				<a href="javascript://" class="note-vote-btn" role="button" data-type="dissent" data-eval="true" data-id="2853281">
					<i id="note-evaluate-dissent-2853281" class="fa fa-angle-down note-evaluate-dissent-dissent" data-placement="left" data-toggle="tooltip" title="" data-original-title="반대"></i>
				</a>
		</div>
                </div>
                <div class="content-function-group article-scrap-wrapper">
                    <a href="javascript://" id="article-scrap-btn" data-type="scrap"><i class="fa fa-bookmark " data-toggle="tooltip" data-placement="left" title="" data-original-title="스크랩"></i></a>
                    <div id="article-scrap-count" class="content-count">0</div>
                </div>
            </div>
            <div class="content-function-cog share-btn-wrapper">
                <div class="dropdown">
                    <a href="http://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fokky.kr%2Farticle%2F1266491" class="btn-facebook-share"><i class="fa fa-facebook-square fa-fw" data-toggle="tooltip" data-placement="left" title="" data-original-title="페이스북 공유"></i></a>
                </div>

            </div>
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



