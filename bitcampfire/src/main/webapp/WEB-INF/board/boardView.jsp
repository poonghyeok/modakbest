<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
		<link rel="stylesheet" href="/semiproject/css/board/application.css">
</head>

<body>
	
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
                    <a href="/semiproject/user/userMyPageForm?user_id=${boardDTO.board_uid}" class="avatar-photo"><img src="//www.gravatar.com/avatar/c649774942c3c2ab78ed58379972c2f8?d=identicon&amp;s=40"></a>
                    <div class="avatar-info">
                    	<!-- 풍혁 220708 : 작성자 반영했습니다. -->
                            <a class="nickname" href="/semiproject/user/userMyPageForm?user_id=${boardDTO.board_cmt_cnt}" title="author">${author}</a>
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
							<a href="/s/life" class="list-group-item-text item-tag label label-info">
								<i class="fa fa-comments"></i> ${cateidToString}</a> 
								<a href="/s/tagged/javascript" class="list-group-item-text item-tag label label-gray ">javascript</a>
												
						</div>
						<h2 class="panel-title">${boardDTO.board_title}</h2>
						<hr>
		                <article class="content-text" itemprop="articleBody">
							<p>${boardDTO.board_content}</p>
						</article>

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
<!-- 댓글 개수 -->       <h3 class="panel-title">댓글 <span id="note-count">${boardDTO.board_cmt_cnt}</span></h3> 
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
                                    <textarea name="note.text" id="note-create" placeholder="댓글 쓰기" class="form-control">${cmt_content}</textarea>
                                </fieldset>
                            </div>
                             <div class="content-function-cog note-submit-buttons clearfix">
        						<p><a href="javascript:/board/boardList" id="note-create-cancel-btn" class="btn btn-default btn-wide" style="display: none;">취소</a></p>
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

<script type="text/javascript"  src="http://code.jQuery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

/* $('#btn btn-success btn-wide').click(function(){ // 등록 버튼을 눌렀을때  
	$.ajax({
		  type:'post',
		  url:'/semiproject/comment/writeCommentContent',
		  data: JSON.stringify(queryString), //{서버로 전송할 데이터}
		  dataType: 'json', //'서버에서 전송받을 데이터 형식'
		  success: { //정상 요청, 응답 시 처리 작업
		     
		  },
		  error : function(xhr,status,error) {
		      //오류 발생 시 처리
		 },
	});
}); */

$('#btn btn-success btn-wide').click(function(){ //댓글버튼 눌렀을때
	function to_ajax(){
			var queryString = $("form[name=testForm]").serialize(); // 키 값 을 묶어서 
		
				$.ajax({
					type : 'post',
					url : '/semiproject/comment/writeCommentContent', 
					data : JSON.stringify(queryString), // 
					dataType : 'json',
					error: function(xhr, status, error){
						alert(error);
					},
					success : function(json){
						alert(json.data);
						location.href="/board/getCommentContent"
					}
				});
		}
});
</script>

</body>
</html> 