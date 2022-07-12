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
/*
<li id="note-title" class="list-group-item note-title">
   <h3 class="panel-title">댓글 <span id="note-count">${boardDTO.board_cmt_cnt}</span></h3> 
</li>
*/             
function getCommentBanner(){
	let commentBanner;
	commentBanner = 
		$('<li/>',{
			id : 'note-title',
			class : 'list-group-item note-title'
		}).append(
			$('<h3/>',{
				class : "panel-title",
				text : '댓글'
					
			}).append(
				$('<span/>',{
					id : 'note-count',
					text : $('#board_baord_cmt_cnt').val()
				})
			)
		);
	
	return commentBanner;
}


$(function(){
	$.ajax({
		type : 'post',
		url : '/semiproject/comment/getCommentListByBoardId',
		data : {'cmt_bid' : $('#board_id').val()},
		dataType : 'json',
		async : false,
		success : function(data){
			console.log(JSON.stringify(data));
			jsonArrayToCommentList(data);
		},
		error : function(err){
			console.log(err);
		}
	})
	
	$('#comment_list').prepend(getCommentBanner());
});


/* 풍혁 220711 : list 를 띄우기 위한 부품들 시작점 =====*/
	/* 풍혁220711 : comment_list에서 span nickname*/
function getCommentList_nickname(comment_uid){
	let nickname = ''
	$.ajax({
		type : 'post',
		url : '/semiproject/comment/getNicknameByUserId',
		data : {user_id : comment_uid},
		dataType : 'text',
		async : false,
		success : function(data){
			nickname = data;
		},
		error : function(err){
			console.log(err);
		}
	})
	
	return nickname;
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
	let user_nickname = getCommentList_nickname(comment.cmt_uid);
	
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
						title : user_nickname,
						text : user_nickname
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
							title : comment.cmt_date_created,
							text : comment.cmt_date_created
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
