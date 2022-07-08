<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
		<link rel="stylesheet" href="/semiproject/css/board/application.css">
</head>

<body>
	<input type = "text" name = "board_id" value="${board_id}">
	<div class="layout-container">
    <div class="main ">
        <!--사이드바1,2-->        
                <jsp:include page="/WEB-INF/board/boardSideBar.jsp"/>
            
        <div class="nav" role="navigation">
            <a class="create btn btn-success btn-wide pull-right" href="/semiproject/board/write"><i class="fa fa-pencil"></i> 새 글 쓰기</a>
            <h4>${cateidToString}</h4>
        </div>

        <!--게시글-->
        <input type = "hidden" name = "board_id" value="${board_id}">

        <div class="panel panel-default clearfix fa-">
            <div class="panel-heading clearfix">
                <div class="avatar clearfix avatar-medium pull-left">
                    <a href="/user/info/34213" class="avatar-photo"><img src="//www.gravatar.com/avatar/c649774942c3c2ab78ed58379972c2f8?d=identicon&amp;s=40"></a>
                    <div class="avatar-info">
                    	<!-- 풍혁 220708 : 작성자 반영했습니다. -->
                            <a class="nickname" href="/user/info/34213" title="author">${author}</a>
                                <div class="activity"><span class="fa fa-flash"></span> 267</div>
                                <div class="date-created"><span class="timeago" title="2022-07-07T11:47:55">${dateToStr}</span>작성
                                    <span class="date-saperate">∙</span> <a href="/changes/2853281"><span class="timeago" title="2022-07-07 11:52:28">**글 수정한 날짜는 발표이후 구현**</span></a>
                                </div>
                    </div>
                </div>

                    <div class="content-identity pull-right">
                    <div class="content-identity-count"><i class="fa fa-comment"></i> ${boardDTO.board_cmt_cnt}</div>
                        <div class="content-identity-count"><i class="fa fa-eye"></i> ${boardDTO.board_view_cnt}</div>
                    </div>
            </div>
            <div class="content-container clearfix">
                    <div id="content-body" class="panel-body content-body pull-left">
                        <div class="content-tags">
                            <span class="list-group-item-text -id">${board_id}</span>
            <a href="/s/life" class="list-group-item-text item-tag label label-info"><i class="fa fa-comments"></i> ${boardDTO.board_cateid}</a>

                    <a href="/s/tagged/javascript" class="list-group-item-text item-tag label label-gray ">javascript</a>
                        </div>
                        <h2 class="panel-title">
                        ${boardDTO.board_title}
                        </h2>
                        <hr>
                        < class="content-text" itemprop="articleBody">
                                <p>${boardDTO.board_content}</p>
                        </article>

                    </div>
                    
                <!--추천수-->
				<div id="content-function" class="content-function pull-right text-center">
				        <div class="content-function-group">
						    <div class="note-evaluate-wrapper">
						        <a href="javascript://" class="note-vote-btn" role="button" data-type="assent" data-eval="true" data-id="2853281">
						            <i id="note-evaluate-assent-2853281" class="fa fa-angle-up note-evaluate-assent-assent" data-placement="left" data-toggle="tooltip" title="" data-original-title="추천"></i>
						        </a>
							    <div id="content-vote-count-2853281" class="content-eval-count">${boardDTO.board_vote_cnt}</div>
							
							        <a href="javascript://" class="note-vote-btn" role="button" data-type="dissent" data-eval="true" data-id="2853281">
							            <i id="note-evaluate-dissent-2853281" class="fa fa-angle-down note-evaluate-dissent-dissent" data-placement="left" data-toggle="tooltip" title="" data-original-title="반대"></i>
							        </a>
						        </div>
								
							</div>
						        
						 </div>
						    <!--페이스북-->
						    <div class="content-function-cog share-btn-wrapper">
						        <div class="dropdown">
						            <a href="http://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fokky.kr%2Farticle%2F1266491" class="btn-facebook-share"><i class="fa fa-facebook-square fa-fw" data-toggle="tooltip" data-placement="left" title="" data-original-title="페이스북 공유"></i></a>
						        </div>
						    </div>
		
		                   <div id="content-function" class="content-function pull-right text-center">
		                       <div class="content-function-group">
		                       </div>
		                   </div>
		        </div>


            <!--댓글 -->
            <ul class="list-group">
                <li id="note-title" class="list-group-item note-title">
                    <h3 class="panel-title">댓글 <span id="note-count">${boardDTO.board_cmt_cnt}</span></h3>
                </li>
                <li class="list-group-item note-form clearfix">
                    <form action="/article/addNote/1266491" method="post" class="note-create-form">
                        <input type="hidden" name="_csrf" value="42dc26cb-81c3-410c-8701-d0f0b774ff29">
                            <div class="content-body panel-body pull-left">
                                <div style="margin-left: 5px;">
                                    <div class="avatar clearfix avatar-medium ">
                                        <a href="/user/info/130245" class="avatar-photo"><img src="https://phinf.pstatic.net/contact/20210724_208/1627102562180dy98s_JPEG/%C8%AD%B8%E9_%C4%B8%C3%B3_2021-06-28_231234.jpg"></a>
                                        <div class="avatar-info">
                                                <a class="nickname" href="/user/info/130245" title="suu1006">${boardDTO.board_uid}</a>
                                                    <div class="activity block"><span class="fa fa-flash"></span></div>
                                        </div>
                                    </div>
                                </div>
                                <fieldset class="form">
                                    <input type="hidden" name="textType" value="HTML" id="note.textType">
                                    <textarea name="note.text" id="note-create" placeholder="댓글 쓰기" class="form-control"></textarea>
                                </fieldset>
                            </div>
                            <div class="content-function-cog note-submit-buttons clearfix">
                                <p><a href="javascript://" id="note-create-cancel-btn" class="btn btn-default btn-wide" style="display: none;">취소</a></p>
                                <input type="submit" name="create" id="btn-create-btn" class="btn btn-success btn-wide" value="등록" disabled="disabled">
                            </div>
                    </form>
                </li>
            </ul>
        </div>
        <!--footer-->        
        <jsp:include page="/WEB-INF/global/footer.jsp"/>
    </div>
</div>
	
 
<!--  댓글작성
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
</script>  --> 

</body>
</html> 