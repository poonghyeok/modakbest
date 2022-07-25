<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/semiproject/css/board/boardWriteForm.css">
<link rel="stylesheet" href="/semiproject/css/board/userProfile.css">

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="/semiproject/css/board/application.css">
<script src="https://cdn.ckeditor.com/4.9.2/standard/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/classic/ckeditor.js"></script>
</head>
<body>

<div class="layout-container">
	<div class="main">
		<!-- 풍혁 (220707) : 보드 고정 사이드바 jsp include -->
			 <jsp:include page="/WEB-INF/board/boardSideBar.jsp"/>
		<!-- 풍혁 (220707) : 보드 고정 사이드바 jsp include -->
		
		<!-- 풍혁(220707) : 보드 작성 폼 -->
		<div id="article-create" class="content" role="main">
			<!-- 풍혁(220707) : css 분리 적용을 위해, class eunhye를 추가하겠습니다. -->
			<div class="content-header">
	    		<h3>공지사항 수정</h3>
				<input type = "hidden" id = "board_id" class = "board_id" value = "${param.board_id}">
				<input type = "hidden" id = "category" class = "category" value = "${param.category}"> 
			</div>
			<div class="content-header">
				<div class="user-profile">
					<!-- 연수 : 세션값 아니고 DTO로 값 넣어주기!  -->
					<a id="user_imgDiv" href="">
						<img src="" id="profile-photo" alt="profile-img">
					</a>
					
					<div class="profile-info">
						 <h1 class="eunhye">
		                    <a id="user_nicknameDiv" href="">
		                    	 <!-- author nickname --> 
		                    </a>
		                </h1>
		                <span aria-label="">point</span>
					</div>
				</div>
			</div>
			
			<div class="content-body">
				<form name="adminBoardNoticeWriteForm" id="adminBoardNoticeWriteForm">
		
					<div class="content-body-article">
						<table name="adminBoardNoticeWriteTable" id="adminBoardNoticedWriteTable" >
							<tr>
								<td>
									  <select class="eunhye" id="board_cateid" required>
									    <option value="" selected value="0" >게시판을 선택해 주세요</option>
									    <option value="6">전체공지</option>
									    <option value="1">취업정보</option>
									    <option value="2">후기</option>
									    <option value="3">Q &amp; A</option>
									    <option value="4">자유게시판</option>
									    <option value="5">학원전용게시판</option>
									  </select>        
								</td>
							</tr>
							<tr>
								<td>
									<label for="title" class="eunhye">제목</label>
									<div><input type="text" name="board_title" class="eunhye" id="board_title" placeholder="제목을 입력해 주세요."></div>
									<div class="alertMsg" id="board_titleDiv"></div> 
								</td>
							</tr>
							<tr>
								<td>	
									<label for="Tags">태그</label>
									<div><input type="text" class="eunhye" id="board_tags" name="board_tags" placeholder="Tags." ></div>
								</td>
							</tr>
							<tr>
								<td>
									<div id="editor">
										<!-- <textarea name="board_content" id="board_content" cols="60" rows="20"></textarea> -->
									</div>
									
										<script>
											let editor;							    
											ClassicEditor
										        .create( document.querySelector( '#editor' ) )
										        .then(newEditor => {							        	
										        	editor = newEditor
										        })
										        .catch( error => {
										            cnsole.error( error );
										        });
										</script>
									
								</td>
							</tr>		
						</table>
						
						<!-- 풍혁(220707) : 이렇게 요소에 style로 들어오면 안될거 같깉한데.. 일단 display 해야하니깐 ... -->	
						<fieldset class="buttons" style="width: 630px; margin-top: 10px;">
	                       <!-- 연수 : 취소했을 경우 다시 view 페이지로  -->
	                       <a href="/semiproject/admin/getAdminBoardNoticeView?category=${param.category}&board_id=${param.board_id}" class="btn btn-default btn-wide" onclick="return confirm('정말로 취소하시겠습니까?')">취소</a>
	                       <input type="button" name="create" class="create btn btn-success btn-wide pull-right" action="create" value="등록" id="adminBoardNoticeUpdateBtn">
	                    </fieldset>
							
					</div>
				</form>
			</div>
		</div>
		<!-- 풍혁(220707) : 보드 작성 폼 -->
			
		<!-- 풍혁 (220707) : 보드 유저 공용 푸터 jsp include -->
			<jsp:include page="/WEB-INF/global/footer.jsp"/>
		<!-- 풍혁 (220707) : 보드 유저 공용 푸터 jsp include -->
		
	</div> <!-- <div class="main"> -->
</div> <!-- <div class="layout-container"> -->

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$.ajax({
		type : 'get',
		url : '/semiproject/admin/getAdminBoardNotice_edit',
		data : {"board_id":$('#board_id').val()},
		success :function(data){
			console.log(JSON.stringify(data));
			$('#board_title').val(data.boardDTO.board_title);
			editor.setData(data.boardDTO.board_content);
			//연수 option value값  기준으로 선택되도록 변경
			$('#board_cateid').val(data.boardDTO.board_cateid).prop('selected', true);
			//$('#category').val(data.boardDTO.board_cateid);
			//관리자는 로그인 정보(본인글 여부)에 상관없이 글을 수정할 수 있게 하려고 로그인 유저의 세션값이 아닌 실제 작성자별 정보를 넣어줌
			$('#user_nicknameDiv').html(data.user_nickname);
			document.getElementById("profile-photo").src = "/semiproject/storage/userprofile/"+data.user_img;
			document.getElementById("user_imgDiv").href="/semiproject/user/userPage?user_id="+data.boardDTO.board_uid;
			document.getElementById("user_nicknameDiv").href="/semiproject/user/userPage?user_id="+data.boardDTO.board_uid;
		},
		error : function(err){
			console.log(err);
		}
	})
});	
 
$(function(){
	$('#adminBoardNoticeUpdateBtn').click(function(){
		const editorData = editor.getData();
		var category = $('#category').val()
		//비엇을때 진해지고 포커스아웃시 풀리고
		
		if($('#board_title').val()==''){
		//	$('#board_title').css('border','2px solid #1fb6ff');
			alert('제목을 입력해주세요.');
			$('#board_title').addClass('empty');
			

		}
		else if(!editor.getData()){
			alert("내용을 입력하세요");
		}
		else if( $('#board_classid option:selected').val()==''){
			alert('카테고리를 선택하세요');
		}
		else{
			//글 등록 전 확인
	        if(!confirm('정말 등록하시겠습니까?')){
	            return false;
	        }	
	        else{
				$.ajax({
					type: 'post',
					url: '/semiproject/admin/adminBoardNoticeUpdate',
					data: {'board_title' : $('#board_title').val(),
						   'board_content' : $('div.ck-blurred').html(),
						   'board_cateid' : $('#board_cateid option:selected').val(),
						   'board_id' : $('#board_id').val()
					},
			       	success: function(){
						alert('게시글을 수정하였습니다.');
			            location.href='/semiproject/admin/getAdminBoardNoticeView?category='+category+'&board_id='+$('#board_id').val();
					},
					error: function(e){
						console.log(e);
						/* 풍혁 0714 success 에서 location.href까지 먹히지 않아서 임시로 error 에도 location href를 써두었습니다~ */
						location.href='/semiproject/admin/getAdminBoardNoticeView?category='+category+'&board_id='+$('#board_id').val();
					}
				});//ajax					
	        }
		}
	});//$('#adminBoardNoticeUpdateBtn').click	
	
	//$('#resetBtn').click(function() 삭제 상단 버튼에서 온클릭으로 이미 처리가 되는 듯(연수_0722)
	
	$('#board_title').focusout(function(){
		$('#board_title').removeClass('empty');
	});
});

</script>

</body>
</html>