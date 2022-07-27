/**
 * 
 */
function cateidToString(cateid){
	var result;
	if(cateid == '1'){
		result = 'info';
	}else if(cateid == '2'){
		result = 'review';
	}else if(cateid == '3'){
		result = 'qna';
	}else if(cateid == '4'){
		result = 'free';
	}
	
	console.log(result);
	return result;
}
function categoryToInt(category){
	let result;

	if(category == 'info'){
		result = 1;
	}else if(category == 'review'){
		result = 2;
	}else if(category == 'qna'){
		result = 3;
	}else if(category == 'free'){
		result = 4;
	}
	
	return result;
}

$('#board_cateid').change(function(){
	if(confirm('게시판을 변경하시겠습니까?')){
		$('#category').val(cateidToString($('#board_cateid option:selected').val()))
	}
});

//@@@@@ 연수 : boardedit - ckeditor 업로드  수정(220726)@@@@@
$(function(){
	
	$.ajax({
		type : 'get',
		url : '/semiproject/board/getBoard',
		data : {"board_id":$('#board_id').val(), "cateid" : categoryToInt($('#category').val())},
		success :function(data){
			console.log(JSON.stringify(data));
			$('#board_title').val(data.board_title);
			CKEDITOR.instances.content.setData(data.board_content); //연수 수정(220727)
			$('#board_cateid option:eq('+(data.board_cateid)+')').prop('selected', true);
		},
		error : function(err){
			console.log(err);
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
					url: '/semiproject/board/update',
					data: {'board_title' : $('#board_title').val(),
					       //'board_content' : $('div.ck-blurred').html(),
							'board_content': board_content,//연수수정(220727)
							'board_cateid' : $('#board_cateid option:selected').val(),
							'board_id' : $('#board_id').val()
					},
			       	success: function(){
			       		alert('게시글을 수정하였습니다.');
			            location.href='/semiproject/board/getBoardView?state=edit&category='+$('#category').val()+'&board_id='+$('#board_id').val();
					},
					error: function(e){
						console.log(e);
						/* 풍혁 0714 success 에서 location.href까지 먹히지 않아서 임시로 error 에도 location href를 써두었습니다~ */
					}
				});//ajax
			
	        }
		}
	});//$('#boardWriteBtn').click	
	//@@@@@ 연수 : boardedit - ckeditor 업로드  수정(220726)@@@@@
	
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