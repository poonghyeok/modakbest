<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/semiproject/resources/css/boardWriteForm.css">
<link rel="stylesheet" href="/semiproject/resources/css/userProfile.css">
<script src="https://cdn.ckeditor.com/4.9.2/standard/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/classic/ckeditor.js"></script>
</head>
<body>


<div>
	<h3>새 글 쓰기</h3>
	
	<div class="content-header">
	
		<div class="user-profile">
			<a href="#">
				<img src="/semiproject/resources/image/profile.png" id="profile-photo" alt="profile-img">
			</a>
		
			<div class="profile-info">
				 <h1>
                    <a href="#">
                        nickname
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
							  <select id="board_cateid" required>
							    <option value="" selected value="0" >게시판을 선택해 주세요</option>
							    <option name="board_cateid" value="1">IT News & 정보</option>
							    <option name="board_cateid" value="2">Tips & 강좌</option>
							  </select>
						</td>
					</tr>
					<tr>
						<td>
							<label for="title">제목</label>
							<div><input type="text" name="board_title" id="board_title" placeholder="제목을 입력해 주세요."></div>
							<div class="alertMsg" id="board_titleDiv"></div> 
						</td>
					</tr>
					<tr>
						<td>	
							<label for="Tags">태그</label>
							<div><input type="text" id="board_tags" name="board_tags" placeholder="Tags."></div>
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
				<div>
					<button type="reset" id="resetBtn">취소</button>
					<button type="button" id="boardWriteBtn">등록</button>
				</div>	
			
			</div>
		</form>

	</div>

</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	
	//에디터
	
	/*  if($('#board_title').focusout()){
		 $(this).removeClass('empty');
	 }
	 if($('#board_content').focusout()){
		 $('#board_content').removeClass('empty');
	 } */
	
	$('#boardWriteBtn').click(function(){
		
		const editorData = editor.getData();
		
		//비엇을때 진해지고 포커스아웃시 풀리고
		
		if($('#board_title').val()==''){
		//	$('#board_title').css('border','2px solid #1fb6ff');
			$('#board_title').addClass('empty');
			

		}/* else if($('#board_content').val()==''){
			alert("컨텐트공백");
	    	//$('#board_title').css('border','2px solid #1fb6ff');
	    	$('#board_title').removeClass('empty');
	    	$('#board_content').addClass('empty');
	    	
		} */
		else if(editor.getData()==''){
			alert("내용을 입력하세요");
		}
		else if( $('#board_cateid option:selected').val()==0){
			alert('카테고리를 선택하세요');
		}
		else{

			//글 등록 전 확인
	        if(!confirm('정말 저장하시겠습니까 ?')){
	            return false;
	        }	
	        else{
				
	        	    
				$.ajax({
					type: 'post',
					url: '/semiproject/board/write',
					data: {'board_title': $('#board_title').val(),
					       //'board_content': $('#board_content').val()
							'board_content': editorData,
							'board_cateid' : $('#board_cateid option:selected').val()
					},
			       	success: function(){
						alert('게시글을 등록하였습니다.');
			            location.href='/board/boardView';
					},
					error: function(e){
						console.log(e);
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


</body>
</html>