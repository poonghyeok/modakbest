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
	    		<h3>글 수정하기</h3>
			</div>
		<input type="text" id="memClassid" value="${sessionScope.memClassid }">
		<input type="text" id="memClass_academy" value="${sessionScope.memClass_academy }">
		<input type = "hidden" id = "board_id" class = "board_id" value = "${param.board_id}">
			<div class="content-header">
				<div class="user-profile">
					<a href="/semiproject/user/userMyPageForm?user_id=${sessionScope.memId}">
						<img src="#" id="profile-photo" alt="profile-img">
					</a>
				
					<div class="profile-info">
						 <h1 class="eunhye">
		                    <a href="/semiproject/user/userMyPageForm?user_id=${sessionScope.memId}">
		                    	${sessionScope.memNickname} <!-- author nickname -->
		                    </a>
		                </h1>
		                <span aria-label="">point</span>
					</div>
				</div>
			</div>
			
			<div class="content-body">
				<form name="boardWriteForm" id="boardWriteForm">
		
					<div class="content-body-article">
						<table name="boardWriteTable" id="boardWriteTable" >
							<tr>
								<td>
									  <select class="eunhye" id="board_classid" required>
									    <option value="" selected value="0" >게시판을 선택해 주세요</option>
									     <option name="board_classid" value="${sessionScope.memClassid }">${sessionScope.memClass_academy }</option>
									  </select>
								</td>
							</tr>
							<tr>
								<td>
									<label for="title" class="eunhye">제목</label>
									<div><input type="text" name="board_title" class="board_title" id="board_title" ></div>
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
										 <!-- <textarea name="board_content" id="board_content" cols="60" rows="20" ></textarea> --> 
									</div>
									
										<script>
											 let editor;							    
											
											 ClassicEditor
											  .create(document.querySelector( '#editor' ), {
											    language: 'ko'
											  })
											  .then( newEditor => {
											    editor = newEditor;
											  } )
											  .catch( error => {
											    console.error( error );
											  } );
											  
											
									</script>
								</td>
							</tr>		
						</table>
						
						<!-- 풍혁(220707) : 이렇게 요소에 style로 들어오면 안될거 같깉한데.. 일단 display 해야하니깐 ... -->	
						<fieldset class="buttons" style="width: 630px; margin-top: 10px;">
	                       <!-- 풍혁 (220707) : 취소했을 경우 보던 게시판으로 나가자  -->
	                       <a href="/semiproject/board/boardClassList?pg=1&sortOption=date&class_id=${sessionScope.memClassid }&class_academy=${sessionScope.memClass_academy }" class="btn btn-default btn-wide" onclick="return confirm('정말로 취소하시겠습니까?')">취소</a>
	                       <input type="button" name="create" class="create btn btn-success btn-wide pull-right" action="create" value="수정" id="boardUpdateBtn">
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
		url : '/semiproject/board/getBoardClass',
		data : {"board_id":$('#board_id').val()},
		success :function(data){
			console.log(JSON.stringify(data));
			$('#board_title').val(data.board_title);
			editor.setData(data.board_content);
			$('#board_classid option:eq('+(data.board_classid)+')').prop('selected', true);
		}
	})

	//에디터
	
	/*  if($('#board_title').focusout()){
		 $(this).removeClass('empty');
	 }
	 if($('#board_content').focusout()){
		 $('#board_content').removeClass('empty');
	 } */
	
	$('#boardUpdateBtn').click(function(){
		const editorData = editor.getData();
		
		//비엇을때 진해지고 포커스아웃시 풀리고
		
		if($('#board_title').val()==''){
		//	$('#board_title').css('border','2px solid #1fb6ff');
			alert('제목을 입력해주세요.');
			$('#board_title').addClass('empty');
			

		}/* else if($('#board_content').val()==''){
			alert("컨텐트공백");
	    	//$('#board_title').css('border','2px solid #1fb6ff');
	    	$('#board_title').removeClass('empty');
	    	$('#board_content').addClass('empty');
	    	
		} */
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
					url: '/semiproject/board/boardClassUpdate',
					data: {'board_title' : $('#board_title').val(),
					       'board_content' : $('div.ck-blurred').html(),
							'board_classid' : $('#board_classid option:selected').val(),
							'board_id' : $('#board_id').val()
					},
			       	success: function(){
						alert('게시글을 수정하였습니다.');
			            location.href='/semiproject/board/getBoardClassView?board_id='+$('#board_id').val()+"&class_id="+$('#memClassid').val()+"&class_academy="+$('#memClass_academy').val();
					},
					error: function(e){
						console.log(e);
						/* 풍혁 0714 success 에서 location.href까지 먹히지 않아서 임시로 error 에도 location href를 써두었습니다~ */
						location.href='/semiproject/board/getBoardClassView?board_id='+$('#board_id').val()+"&class_id="+$('#memClassid').val()+"&class_academy="+$('#memClass_academy').val();
					}
				});//ajax
			
	        }
		}
	});//$('#boardWriteBtn').click
	
	
	
	//취소 버튼 눌렀을 때
	$('#resetBtn').click(function(){
	        if(confirm('정말 입력을 취소하시겠습니까 ?')){
	        	//$('#boardWriteForm').reset();
	        
	            return true;
	        }
	 });
	
	
	
	$('#board_title').focusout(function(){
		$('#board_title').removeClass('empty');
	});
	//텍스트에디터 사용하니 적용 안됌
/* 	$('#board_content').focusout(function(){
		$('#board_content').removeClass('empty');
	}); */
	
});
</script>

<script type="text/javascript" src="http://code.jQuery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/semiproject/js/board/boardClassEditForm.js"></script>

</body>
</html>