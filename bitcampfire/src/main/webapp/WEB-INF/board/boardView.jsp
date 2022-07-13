<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
		<link rel="stylesheet" href="/semiproject/css/board/application.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/summernote3/summernote-lite.css">
</head>

<body>

	<div class="layout-container">
    <div class="main ">
        <!--사이드바1,2-->        
                <jsp:include page="/WEB-INF/board/boardSideBar.jsp"/>
    		
        <div class="nav" role="navigation"></div>
            <a class="create btn btn-success btn-wide pull-right" id = "boardWriteBtn" ><i class="fa fa-pencil"></i> 새 글 쓰기</a>
            <h4>${cateidToString}</h4>
        </div>

        <!--게시글-->

        <input type = "hidden" name = "board_id" id = "board_id" value="${board_id}">

        <input type = "text" id ="board_id" name = "board_id" value="${board_id}">
        <input type = "text" id = "board_uid" name = "board_uid" value="${boardDTO.board_uid}">
        <input type = "text" id = "board_baord_cmt_cnt" name = "board_baord_cmt_cnt" value="${boardDTO.board_cmt_cnt}">
        <input type = "text" id = "board_author"  name = "board_author" value="${author}">
        <input type = "text" id = "board_cateid" name = "board_cateid" value="${boardDTO.board_cateid}">
        <input type = "text" id = "board_watcher" name = "board_watcher" value="${sessionScope.memId}">
        

        <div class="panel panel-default clearfix fa-">
            <div class="panel-heading clearfix">
                <div class="avatar clearfix avatar-medium pull-left"> 
            	    <!-- 07/11 user page를 위해 href를 user 수정하였습니다 -->
                    <a href="/semiproject/user/userPage?user_id=${boardDTO.board_uid}" class="avatar-photo"><img src="//www.gravatar.com/avatar/c649774942c3c2ab78ed58379972c2f8?d=identicon&amp;s=40"></a>
                    <div class="avatar-info">
                    	<!-- 풍혁 220708 : 작성자 반영했습니다. -->
                            <a class="nickname" href="/semiproject/user/userMyPageForm?user_id=${boardDTO.board_cmt_cnt}" title="author">${author}</a>
                            <div class="activity">
                            	<span class="fa fa-flash"></span> 
                            	lev
                           	</div>
                            <div class="date-created"><span class="timeago" title="2022-07-07T11:47:55">${dateToStr}</span>작성
                                <span class="date-saperate">∙</span> 
                                <a href="/changes/2853281">
                                	<span class="timeago" title="2022-07-07 11:52:28">**글 수정한 날짜는 발표이후 구현**</span>
                               	</a>
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
							<span class="list-group-item-text -id">${board_id}</span> <a
								href="/s/life"
								class="list-group-item-text item-tag label label-info"> <i
								class="fa fa-comments"></i>${cateidToString}
							</a> <a href="/s/tagged/javascript"
								class="list-group-item-text item-tag label label-gray ">javascript</a>

						</div>
						<h2 class="panel-title">${boardDTO.board_title}</h2>
						<hr>
						<article class="content-text" itemprop="articleBody">
							${boardDTO.board_content}
						</article>
					</div>

					<!--추천수-->
					<div id="content-function"
						class="content-function pull-right text-center">
						<div class="content-function-group">
							<div class="note-evaluate-wrapper">
								<a href="javascript://" class="note-vote-btn" role="button" 
									data-type="assent" data-eval="true" data-id="2853281"> <i
									id="note-evaluate-assent-2853281"
									class="fa fa-angle-up note-evaluate-assent-assent"
									data-placement="left" data-toggle="tooltip" title=""
									data-original-title="추천"></i>
								</a>
								<div id="content-vote-count-2853281" class="content-eval-count">${boardDTO.board_vote_cnt}</div>

								<a href="javascript://" class="note-vote-btn" role="button"
									data-type="dissent" data-eval="true" data-id="2853281"> <i
									id="note-evaluate-dissent-2853281"
									class="fa fa-angle-down note-evaluate-dissent-dissent"
									data-placement="left" data-toggle="tooltip" title=""
									data-original-title="반대"></i>
								</a>
							</div>
						</div>
					</div>
					
				<!-- 글 수정 / 삭제 -->
			
			<!-- 페이스북  / 글 수정 삭제  -->
            <div class="content-function-cog share-btn-wrapper">
	             <div class="dropdown">
	                 <a href="http://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fokky.kr%2Farticle%2F1271479" class="btn-facebook-share"><i class="fa fa-facebook-square fa-fw" data-toggle="tooltip" data-placement="left" title="" data-original-title="페이스북 공유"></i></a>
	             </div>
	            <div class="dropdown">
	            	<form action="/article/delete/1271479" method="post" name="article-delete-form" id="article-delete-form">
						<input type="hidden" name="_csrf" value="984fb4e0-2a17-412c-8e1e-2390b8c53d86">
	           			<input type="hidden" name="_method" value="DELETE" id="_method">
		                    <div class="dropdown">
	                        	<a href="javascript://" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-cog" data-toggle="tooltip" data-placement="left" title="" data-original-title="게시물 설정"></i></a>
		                        <ul class="" role="menu">
		                            <li><a href="/article/edit/1271479" class="edit"><i class="fa fa-edit fa-fw"></i> 수정 </a></li>
		                                <li><a href="javascript://" id="article-delete-btn"><i class="fa fa-trash-o fa-fw"></i> 삭제 </a></li>   
		                        </ul>
		                  </div>
	                </form>
	            </div>
            </div>
					
			<div id="content-function"
				class="content-function pull-right text-center">
				<div class="content-function-group"></div>
			</div>
		</div>
				
				
			
			<!-- 댓글 div --> 
			<div class="panel panel-default clearfix">
				<jsp:include page="/WEB-INF/comment/commentWriteForm.jsp"></jsp:include>
			</div>
			<!-- 댓글 div -->

        </div>
      	
        <!--footer-->     
        <jsp:include page="/WEB-INF/global/footer.jsp"/>
    </div>
</div>

<script type="text/javascript" src="/semiproject/js/board/boardView.js"></script>
<script type="text/javascript" src="http://code.jQuery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/summernote3/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/summernote3/summernote-ko-KR.js"></script>

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

/* 풍혁 220711 : list 를 띄우기 위한 부품들 시작점 =====*/
	/* 풍혁220711 : comment_list에서 span nickname*/
var each_user_nickname = ''
function getCommentList_nickname(comment_uid){
	
	$.ajax({
		type : 'post',
		url : '/semiproject/comment/getNicknameByUserId',
		data : {user_id : comment_uid},
		dataType : 'text',
		success : function(data){
			console.log('comment_uid : ' + comment_uid );
			console.log('user_nickname22 : ' + data);
			each_user_nickname = data;
		},
		error : function(err){
			console.log(err);
		}
	})
	
	/* return '<span class="nickname" title="'+user_nickname+'">'+user_nickname+'</span>' */

}
	/* 풍혁0712 : 댓글을 작성한 시간 받아오기 */
/* function getCommentList_date(comment_uid){
	var date;
	
	$.ajax({
		type : 'post',
		url : '/semiproject/comment/getCommentDateBy',
		data : {user_id : comment_uid},
		success : function(userNickname){
			console.log('comment_uid : ' + comment_uid );
			console.log('user_nickname : ' + userNickname);
			user_nickname = userNickname;
		},
		error : function(err){
			console.log(err);
		}
	})
	
	return '<span class="nickname" title="'+user_nickname+'">'+user_nickname+'</span>'
} */
/* 풍혁 220711 : list 를 띄우기 위한 부품들 끝 =====*/
function jsonArrayToCommentList(jsonArray){
	for(var i = 0; i < jsonArray.length; i++){
		$('#comment_list').prepend(jsonToComment(jsonArray[i]));
	}
}	
	
function jsonToComment(comment){
	console.log('user_nickname : ' + each_user_nickname);
	var li = $('<li/>',{
		class : "list-group-item note-item clearfix"
	});

	var form =
	$('<form/>',{
		class : 'note-update-form'
	})
	.append(
		$('<input/>',{
			type : 'hidden',
			name : '_method',
			id : '_method',
			value : 'PUT'
		})		
	)
	.append(
		$('<div/>',{
			class : "content-body panel-body pull-left"
		}).append(
			$('<div/>',{
				class : "avatar clearfix avatar-medium "
			}).append(
				$('<a/>',{
					class : "avatar-photo",
					href : "#"
				}).append(
					$('<img/>',{
						src : "https://phinf.pstatic.net/contact/20190225_94/1551076747070IDoQC_PNG/image.png"
					})		
				)
			).append(
				$('<div/>',{
					class : "avatar-info"
				}).append(
					$('<a/>',{
						class : "nickname",
						title : each_user_nickname,
						text : each_user_nickname
					})				
				).append(
					$('<div/>',{
						class : "activity",
					}).append(
						$('<span/>',{
							class : "fa fa-lock",
							text : 'lev'
						})			
					)
				).append(
					$('<div/>',{
						class : "date-created",
					}).append(
						$('<span/>',{
							class : "timeago",
							title : each_user_nickname,
							text : each_user_nickname
						})		
					)		
				)
			)		
		)
		.append(
			$('<fieldset/>',{
				class : 'form'
			}).append(
				$('<article/>',{
					id : "note-text-2857406",
					class : "list-group-item-text note-text"
				}).append(
					$('<p/>',{
						html : comment.cmt_content
					})		
				)
			)
		)
	);
	
	return li.append(form);
}

$(function(){
	$.ajax({
		type : 'post',
		url : '/semiproject/comment/getCommentListByBoardId',
		data : {'cmt_bid' : $('#board_id').val()},
		dataType : 'json',
		success : function(data){
			console.log(JSON.stringify(data));
			jsonArrayToCommentList(data);
		},
		error : function(err){
			console.log(err);
		}
	})
});

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

$('#note-create').focus(function(){
	$('#commentFormChange').html('<form id="commentContent"><textarea id="summernote" name="editordata"></textarea></form>');
	setTimeout('summernoteLoad()',0);
})

function summernoteLoad(){
	$('#summernote').summernote({
		  height: 50,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
	});
}

$('#btn-create-btn').click(function(){
	var content_with_tag = $('div.note-editable').html();
	var content_without_tag = $('div.note-editable').text();
	if(!content_without_tag){
		alert('댓글 내용을 입력하세요!');
	}else{
		/*  'dsard=dasr=s=rs=a=d'.substring('dsard=dasr=s=rs=a=d'.indexOf('=')+1); */
		/* var equalIndex = $('#summernote').serialize.indexOf('=') + 1;
		content = content.substirng(equalIndex);
		 */
		console.log('content : ' + content_with_tag);
		console.log('cmt_uid : ' + $('#board_watcher').val());
		console.log('cmt_cateid : ' + $('#board_cateid').val());
		console.log('cmt_bid : ' + $('#board_id').val());
	 	$.ajax({
			type : 'post',
			url : '/semiproject/comment/write',
			data : {
				'cmt_uid' : $('#board_watcher').val(),
				'cmt_cateid' : $('#board_cateid').val(),
				'cmt_bid' : $('#board_id').val(),
				'cmt_content' : content_with_tag,
			},
			success : function(){
				location.href = "/semiproject/board/getBoardView?board_id="+$('#board_id').val();
			},
			error : function(err){
				console.log(err);
			}
		}) 
	}
})

</script>

 
</body>
</html> 