
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
	    		<h3>새 글 쓰기</h3>
	    		<input type = "hidden" value="${param.category}" id="category">
			</div>
			
			<div class="content-header">
				<div class="user-profile">
					<a href="/semiproject/user/userMyPageForm?user_id=${sessionScope.memId}">
						<img src="/semiproject/storage/userprofile/${sessionScope.memImg}" id="profile-photo" alt="profile-img">
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
									  <select class="eunhye" id="board_cateid" required>
									    <option value="" selected value="0" >게시판을 선택해 주세요</option>
									    <option name="board_cateid" value="1">취업정보</option>
									    <option name="board_cateid" value="2">후기</option>
									    <option name="board_cateid" value="3">Q &amp; A</option>
									    <option name="board_cateid" value="4">자유게시판</option>
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
									<!-- @@@@@ 연수 : boardwrite - ckeditor 업로드  수정(220726)@@@@@	 -->	 									                        
			                        <!-- id값을  content로 해줘야 ckeditor가 적용됨  -->
			                        <textarea rows="5" cols="50" id="content" name="content"></textarea>
			                        <script type="text/javascript">													
									 CKEDITOR.replace('content',
										/* 이미지 업로드 컨트롤러 실행  */	 
										{filebrowserUploadUrl:'/semiproject/board/uploadImageFileByCk'
										});
									</script>
									<!-- @@@@@ 연수 : boardwrite - ckeditor 업로드  수정(220726)@@@@@	 -->
								</td>
							</tr>		
						</table>
						
						<!-- 풍혁(220707) : 이렇게 요소에 style로 들어오면 안될거 같깉한데.. 일단 display 해야하니깐 ... -->	
						<fieldset class="buttons" style="width: 630px; margin-top: 10px;">
	                       <!-- 풍혁 (220707) : 취소했을 경우 보던 게시판으로 나가자  -->
	                       <a href="/semiproject/board/list?pg=1" class="btn btn-default btn-wide" onclick="return confirm('정말로 취소하시겠습니까?')">취소</a>
	                       <input type="button" name="create" class="create btn btn-success btn-wide pull-right" action="create" value="등록" id="boardWriteBtn">
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
//풍혁0718 : 일단 글쓰기 했을때 카테고리는 반영돼서 들어오는데 유저가 카테고리를 변경할 수도 있으니 변경함에 따라 카테고리 반영하기위해서..
function categoryToInt(category){
	let cateid;
	
	if(category ===  'info'){
		cateid = 1;
	}else if(category === 'review'){
		cateid = 2;
	}else if(category === 'qna'){
		cateid = 3;
	}else if(category === 'free'){
		cateid = 4;
	}
	
	return cateid
};

function cateidToString(cateid){
	let category;
	
	if(cateid ==  1){
		category = 'info';
	}else if(cateid == 2){
		category = 'review';
	}else if(cateid == 3){
		category = 'qna';
	}else if(cateid == 4){
		category = 'free';
	}
	return category;
}

$(function(){
	/* 풍혁 0718 */
	let category = $('#category').val();
	let cateid = categoryToInt(category);
	
	/* $('#board_cateid option:eq(0)').prop('selected',false); */
	$('#board_cateid option:eq('+cateid+')').prop('selected',true);
});

$(document).on('change','#board_cateid', function(){
	alert('select change..!');
	let cateid = $('#board_cateid option:selected').val();
	let category = cateidToString(cateid);
	console.log('changed category : ' + category);
	
	$('#category').val(category);
})
//풍혁0718 : 일단 글쓰기 했을때 카테고리는 반영돼서 들어오는데 유저가 카테고리를 변경할 수도 있으니 변경함에 따라 카테고리 반영하기위해서..
	
	//에디터
	
	/*  if($('#board_title').focusout()){
		 $(this).removeClass('empty');
	 }
	 if($('#board_content').focusout()){
		 $('#board_content').removeClass('empty');
	 } */
	
	//@@@@@ 연수 : boardwrite - ckeditor 업로드  수정(220726)@@@@@
	$('#boardWriteBtn').click(function(){		
		var board_content = CKEDITOR.instances.content.getData(); 
		//alert(board_content);
		//alert("click!")
		 
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
	
		else if(board_content ==''){	
			alert("내용을 입력하세요");
		}
		
		else if( $('#board_cateid option:selected').val()==''){
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
					url: '/semiproject/board/write',
					data: {'board_title': $('#board_title').val(),
					       //'board_content': $('#board_content').val()
							'board_content': board_content,//연수수정(220726)
							'board_cateid' : $('#board_cateid option:selected').val()
					},
			       	success: function(){
						alert('게시글을 등록하였습니다.');
			            //풍혁220714 : list로 갈 때 param으로 sortOption 을 적어줘야 한다( 기본은 date )
						location.href='/semiproject/board/list?state=write&category='+$('#category').val()+'&pg=1&sortOption=date';
					},
					error: function(e){
						console.log(e);
					}
				});//ajax
			
	        }
		}
	});//$('#boardWriteBtn').click	
	//@@@@@ 연수 : boardwrite - ckeditor 업로드  수정(220726)@@@@@
	
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
	

</script>


</body>
</html>