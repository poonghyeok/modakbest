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
				class : "dropdown "
			})
			.append(
				$('<a/>',{
					id : 'comment_manage',
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
							'data-id' : comment.cmt_id
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
							id : 'comment_delete',
							text : '삭제',
							style : 'cursor : pointer',
							'data-id' : comment.cmt_id
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
	)
	return li.append(form);
}

$(document).on("click", "#comment_manage", function() {
	let isOpen = JSON.parse($('#comment_manage').attr('aria-expanded'));
	
    if(!isOpen){
		$('div.dropdown').addClass('open ');
		$('#comment_manage').attr('aria-expanded', true);
	}else{
		$('div.dropdown').removeClass('open ');
		$('#comment_manage').attr('aria-expanded', false);
	}
    
});

$(document).on("click", "#comment_edit", function() {
	alert($(this).attr('data-id')+' 번 댓글 수정버튼클릭!');
	console.log($(this).siblings('div.content-body').addClass('test'));
});

$(document).on("click", "#comment_delete", function() {
	alert($(this).attr('data-id')+'번 댓글 삭제버튼클릭!');
});

$('#note-create').focus(function(){
	/*summerNote style 적용*/
	summernoteLoad();
	/*summerNote style 적용*/
	
	$('#note-create').hide();
	$('#commentContent').show();
	$('#note-create-cancel-btn').show();
	$('#btn-create-btn').attr('disabled', false);

})

$('#note-create-cancel-btn').click(function(){
	if(confirm('작성하던 내용을 모두 지워집니다. 정말 취소하시겠습니까?')){
		$('#summernote').summernote('reset');
		$('#note-create').show();
		$('#commentContent').hide();
		$('#note-create-cancel-btn').hide();
		$('#btn-create-btn').attr('disabled', true);
	}
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
