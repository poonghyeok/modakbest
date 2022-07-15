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
	/*댓글창 summernote 숨기고 시작하기, focus 했을 경우 summernote로 변경됨*/
	$('#commentContent').hide();
	/*댓글작성 취소버튼 숨기고 시작하기 */
	$('#note-create-cancel-btn').hide();
	/*댓글작성 등록버튼 사용불가능한 상태로 만들어두고 시작*/
	$('#btn-create-btn').attr('disabled',true);
	
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

function getUserImgByCommentUid(comment_uid){
	let user_img;

	$.ajax({
		type : 'post',
		/*풍혁0714 : indexjs function 이름만 변경해서 재사용*/
		url : '/semiproject/board/getUserImgByBoardUid',
		async : false,
		data : { 'user_id' : comment_uid},
		success : function(data){
			user_img = data;
		},
		error : function(err){
			console.log(err);
		}
	})
	
	return user_img;
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
	let user_image = getUserImgByCommentUid(comment.cmt_uid);

	/*풍혁0715 댓글에도 정보를 표시해주기 위해서 input hidden 생성해두겠습니다*/

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
		$('<input/>',{
			type : 'hidden',
			class : 'comment_info',
			/* 풍혁 */
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
					href : "/semiproject/user/userpage?user_id="+comment.cmt_uid
				}).append(
					$('<img/>',{
						src : "/semiproject/storage/userprofile/"+user_image
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
				class : 'form',
				id : 'comment-'+comment.cmt_id
			}).append(
				$('<article/>',{
					class : "list-group-item-text note-text",
					'data-id' : comment.cmt_id
				}).append(
					$('<p/>',{
						html : comment.cmt_content
					})		
				)
			)
			.append(
				$('<form/>',{
					id : 'commentUpdate',
					style : "display:none"
				})
				.append(
					$('<textarea/>',{
						id : 'summernoteUpdate',
						name : 'editordataUpdate'
					})
				)
			)		
		)
	)
	.append(
		/*풍혁 0713 : 댓글 추천 삭제 관리*/
		$('<div/>',{
			class : "content-function pull-right text-center" 
		})
		.append(
			$('<div/>',{
				class : "content-function-group"
			})
			.append(
				$('<div/>',{
					class : "note-evaluate-wrapper"
				})
				.append(
					$('<span/>',{
						style : "cursor : pointer",
						class : "note-vote-btn",
					})
					.append(
						$('<i/>',{
							class : "fa fa-angle-up note-evaluate-assent-assent",
							title : '추천'
						})
					)
				)
				.append(
					$('<div/>',{
						class : "content-eval-count",
						text : 0
					})
				)
				.append(
					$('<span/>',{
						style : "cursor : pointer",
						class : "note-vote-btn",
					})
					.append(
						$('<i/>',{
							class : "fa fa-angle-down note-evaluate-dissent-dissent",
							title : '반대'
						})
					)
				)
			)
		)
	)
	.append(  
		$('<div/>',{
			class : "content-function-cog",
			
		})
		.append(
			$('<div/>',{
				class : "dropdown ",
				'data-id' : comment.cmt_id,
				'data-uid' : comment.cmt_uid
			})
			.append(
				$('<a/>',{
					class : 'comment_manage',
					'data-id' : comment.cmt_id,
					'data-uid' : comment.cmt_uid,
					'aria-expanded' : false,
					style : 'cursor : pointer'
				})
				.append(
					$('<i/>',{
						class : "fa fa-cog",
						'data-toggle' : "tooltip",
						'data-placement' : "left",
						'data-original-title' : "게시물 설정" 
					})
				)
			)
			.append(
				$('<ul/>',{
					class : "dropdown-menu",
					role : 'menu'
				})
				.append(
					$('<li/>')
					.append(
						$('<a/>',{
							class : "note-edit-btn",
							id : 'comment_edit',
							'text' : '수정',
							style : 'cursor : pointer',
							'data-id' : comment.cmt_id,
							'data-bid' : comment.cmt_bid
						})
						.append(
							$('<i/>',{
								class : "fa fa-edit fa-fw"
							})
						)
					)
				)
				.append(
					$('<li/>')
					.append(
						$('<a/>',{
							class : "note-delete-btn",
							id : 'commentDeleteBtn',
							text : '삭제',
							style : 'cursor : pointer',
							'data-id' : comment.cmt_id,
							'data-bid' : comment.cmt_bid,
						})
						.append(
							$('<i/>',{
								class : "fa fa-trash-o fa-fw"
							})
						)
					)
				)
			)
		)
		.append(
			$('<div/>',{
				class : "buttons",
				style : "display:none"
			})
			.append(
				$('<p/>',{
					
				})
				.append(
					$('<a/>',{
						id : 'commentUpdateCancelBtn',
						class : "btn btn-default btn-wide note-edit-cancel-btn",
						style : "cursor : pointer",
						'data-id' : comment.cmt_id,
						'data-bid' : comment.cmt_bid,
						text : '취소'
					})	
				)
			)
			.append(
				$('<p/>',{
					
				})
				.append(
					$('<input/>',{
						type : 'button',
						name : 'commentUpdateBtn',
						class : "btn btn-success btn-wide",
						'data-id' : comment.cmt_id,
						'data-bid' : comment.cmt_bid,
						value : "저장",
						id : 'commentUpdateBtn'
					})	
				)
			)
		)
	)
	return li.append(form);
}

//댓글 톱니바퀴 버튼 눌렀을 때
$(document).on("click", ".comment_manage", function() {
	let user_id = $('#board_watcher').val();
	let comment_uid = $(this).attr('data-uid');
	
	
	let comment_id = $(this).attr('data-id');

	console.log('user_id : ' + user_id);
	console.log('comment_uid : ' + comment_uid);
	console.log('comment_id : ' + comment_id);
	console.log('isOpen : ' + $(this).attr('aria-expanded'));
	let isOpen = JSON.parse($(this).attr('aria-expanded'));
	
	if(user_id == comment_uid){
		if(!isOpen){
			$('div.dropdown[data-id='+comment_id+']').addClass('open ');
			$(this).attr('aria-expanded', true);
		}else{
			$('div.dropdown[data-id='+comment_id+']').removeClass('open ');
			$(this).attr('aria-expanded', false);
		}
	}else{
		alert('본인의 글만 수정삭제가 가능합니다!');
	}
    
});

function getCommentContentByCommendId(comment_id){
	let comment_content;
	
	$.ajax({
		type : 'post',
		url : '/semiproject/comment/getCommentContentById',
		data : {cmt_id : comment_id},
		async : false,
		success : function(data){
			comment_content = data;
		},
		error : function(err){
			console.log(err);
		}
	})
	
	return comment_content;
}

$(document).on("click", "#comment_edit", function() {
	//풍혁0715 : 수정할 때에도 editor 사용하기. 기존의 내용을 넣어줘야한다.  
	summernoteLoad('#summernoteUpdate');
	
	let comment_id = $(this).attr('data-id');
	let comment_content = $('#summernoteUpdate').summernote('code', getCommentContentByCommendId(comment_id));

	
	//풍혁0715 수정이나 삭제 버튼 클릭했으면 톱니바퀴 드랍다운은 사라지도록
	$('div.dropdown').removeClass('open ');
	$('.comment_manage').attr('aria-expanded', false);
	//
	
	$('fieldset#comment-'+comment_id+' article').hide();
	$('#commentUpdate').show();
	$('div.buttons').show();
	
});


//풍혁0715 : 댓글 수정 취소 눌렀을 때
$(document).on('click','#commentUpdateCancelBtn', function(){
	let comment_id = $(this).attr('data-id');
	
	if(confirm('작성하던 내용을 모두 지워집니다. 정말 취소하시겠습니까?')){
		$('#summernoteUpdate').summernote('reset');
		$('fieldset#comment-'+comment_id+' article').show();
		$('#commentUpdate').hide();
		$('div.buttons').hide();
	}
})
//

//풍혁0715 : 댓글 수정하고 수정버튼 눌렀을 때
$(document).on('click','#commentUpdateBtn', function(){
	let comment_id = $(this).attr('data-id');
	let comment_content_update = $('#commentUpdate div.note-editable').html();
	
	if(confirm('댓글을 수정하시겠습니까?')){
		$.ajax({
			type : 'post',
			url : '/semiproject/comment/update',
			data : {'cmt_id' : comment_id, 'cmt_content' : comment_content_update},
			async : false,
			success : function(){
				alert('댓글 수정을 완료하였습니다.');
				location.reload();
			},
			error : function(err){
				console.log(err);
				return;
			}
		})
	}
})
//

//풍혁0715 : 댓글 삭제버튼눌렀을 때
$(document).on('click','#commentDeleteBtn', function(){
	let comment_id = $(this).attr('data-id');
	let comment_bid = $(this).attr('data-bid');
	
	if(confirm('댓글을 정말 삭제하시겠습니까?')){
		$.ajax({
			type : 'post',
			url : '/semiproject/comment/delete',
			data : {'cmt_id' : comment_id, 'cmt_bid' : comment_bid},
			async : false,
			success : function(){
				alert('댓글을 삭제 하였습니다.');
				location.reload();
			},
			error : function(err){
				console.log(err);
				return;
			}
		})
	}
})
//

//풍혁0713 : 댓글 작성하려고 칸에 마우스 올렸을 때
$('#note-create').focus(function(){
	/*summerNote style 적용*/
	summernoteLoad('#summernote');
	/*summerNote style 적용*/
	
	$('#note-create').hide();
	$('#commentContent').show();
	$('#note-create-cancel-btn').show();
	$('#btn-create-btn').attr('disabled', false);
	

	})

/*풍혁0715 : 댓글 작성 취소버튼 클릭했을 때*/
$('#note-create-cancel-btn').click(function(){
	if(confirm('작성하던 내용을 모두 지워집니다. 정말 취소하시겠습니까?')){
		$('#summernote').summernote('reset');
		$('#note-create').show();
		$('#commentContent').hide();
		$('#note-create-cancel-btn').hide();
		$('#btn-create-btn').attr('disabled', true);
	}
})
//

function summernoteLoad(param){
	$(param).summernote({
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
		
		/*console.log('content : ' + content_with_tag);
		console.log('cmt_uid : ' + $('#board_watcher').val());
		console.log('cmt_cateid : ' + $('#board_cateid').val());
		console.log('cmt_bid : ' + $('#board_id').val());
	 	*/
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
