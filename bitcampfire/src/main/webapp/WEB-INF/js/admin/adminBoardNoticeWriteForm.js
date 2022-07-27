//@@@@@ 연수 : admin > boardclasswrite - ckeditor 업로드  수정(220727)@@@@@	
$(function(){
	$('#adminBoardNoticeWriteBtn').click(function(){
		var board_content = CKEDITOR.instances.content.getData(); 
		//alert(board_content);
		//alert("click!")
		var category = $('#category').val();
		
		//비엇을때 진해지고 포커스아웃시 풀리고
		
		if($('#board_title').val()==''){
			alert('제목을 입력해주세요.');
			$('#board_title').addClass('empty');			

		}else if(board_content ==''){	
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
					url: '/semiproject/admin/adminBoardNoticeWrite',
					data: {'board_title': $('#board_title').val(),
					       //'board_content': $('#board_content').val()
							'board_content': board_content,//연수수정(220727)
							'board_cateid' : $('#board_cateid option:selected').val()
						  },
			       	success: function(){
						alert('게시글을 등록하였습니다.');
						location.href='/semiproject/admin/adminBoardNoticeList?category='+category+'&pg=1';
						//풍혁220714 : list로 갈 때 param으로 sortOption 을 적어줘야 한다( 기본은 date )
						//location.href='/semiproject/board/list?pg=1&sortOption=date';
					},
					error: function(e){
						console.log(e);
					}
				});//ajax
			
	        }
		}
	});//$('#adminBoardNoticeWriteBtn').click	
	
	//$('#resetBtn').click(function() 삭제 상단 버튼에서 온클릭으로 이미 처리가 되는 듯(연수_0722)
	
	$('#board_title').focusout(function(){
		$('#board_title').removeClass('empty');
	});
});