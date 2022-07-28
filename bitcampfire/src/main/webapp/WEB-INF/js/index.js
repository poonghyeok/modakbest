/**
 * 
 */
/*풍혁220708 home의 list를 제이쿼리로 불러보겠습니다.*/
/*풍혁220710 div를 순차적으로 불러오는 방법을 모르겠다. */

/*풍혁220708 : 인덱스 페이지에서 글 목록을 제이쿼리로 불러보려했는데 실패 ..*/
/*풍혁220709 : 성공 ..!*/

$(function(){
	makeIndexDiv(1,5,'left', 'info');
	makeIndexDiv(1,5,'right', 'review');
	makeIndexDiv(1,8,'left', 'qna');
	makeIndexDiv(1,10,'left', 'free');
//	addGif();
})

/*function addGif(){
	$('#index')
	.append(
		$('<div />',{
			class : 'col-sm-4 main-block-right'
		})
		.append(
			$('<div />',{
				class : 'main-block'
			})
			.append(
				$('<img />',{
					src : '/semiproject/img/undo.gif',
					style : 'width:200px;'
				})	
			)
		)
		.append(
			$('<div />',{
				class : 'main-block'
			})
			.append(
				$('<img />',{
					src : '/semiproject/img/face.gif',
					style : 'width:200px;'
				})	
			)
		)
		.append(
			$('<div />',{
				class : 'main-block'
			})
			.append(
				$('<img />',{
					src : '/semiproject/img/CavernousWhiteBufflehead-max-1mb.gif',
					style : 'width:200px;'
				})	
			)
		)
	)
}*/
/* 풍혁220709 function 분리하기 */
function makeIndexDiv(startNum, endNum, location, category){
	//var categoryDiv = categoryOuter(category, location);
	//풍혁 0719 : category에 따라 controller를 다르게 태워야하나 
	var mainBlock = '';
	
	$.ajax({
		type : 'post',
		url : '/semiproject/board/jsonTest',
		data : {
			startNum : startNum,
			endNum : endNum,
			category : category
			},
		async 	: false,
		success : function(data){
			/*console.log(JSON.stringify(data));*/
			$('#index').append(categoryOuter(category,location)	.append(getMainBlock(data, category)))
			
		},
		error : function(err){
			console.log(err);	
		}
	})
	
	
	//return categoryDiv;
}

/*풍혁 0709 : idnex div 안으로 col-sm-6 ~~ 의 클래스를 가진 div 로 이루어져 있다. */
/*풍혁 0709 : 가장 바깥 div(class = col-sm-6 main-block~)*/
function categoryOuter(category, location){
	
	var colNum = 0;
	
	if(category.indexOf('info') >= 0){
		colNum = 6;
	}else if(category.indexOf('review') >= 0){
		colNum = 6;
	}else if(category.indexOf('qna') >= 0){
		colNum = 8;
	}else if(category.indexOf('free') >= 0){
		colNum = 8;
	}else if(category.indexOf('ad') >= 0){
		colNum = 4;
	}
	
	var categoryOuter = 
		$('<div/>',{
			class : "col-sm-"+colNum+" main-block-"+location
		});
	
	return categoryOuter;
}

/*풍혁 0709 : 한단계 안 div(class = main block)*/
/*풍혁 0709 : 말 그대로 main이다 여기 글 리스트인 ul tag가 담겨이있다. 커뮤니티와 QnA는 두개의 메인블럭이 하나의 div로 묶여서 들어간다. */
function getMainBlock(data, category){
	
	var icon = '';
	
	if(category.indexOf('info') >= 0){
		icon = 'flag';
	}else if(category.indexOf('review') >= 0){
		icon = 'star';
	}else if(category.indexOf('qna') >= 0){
		icon = 'database';
	}else if(category.indexOf('free') >= 0){
		icon = 'comment';
	}
	let boardCategory;
	if(category == 'info'){
		boardCategory = '취업정보';
	}else if(category == 'review'){
		boardCategory = '후기';
	}else if(category == 'qna'){
		boardCategory = 'Q&A';
	}else if(category == 'free'){
		boardCategory = '자유게시판';
	}
	
	var mainBlock =
		$('<div/>',{
			class : "main-block"
		})
		.append(
			$('<h4/>',{
				class : "main-header",
				text : boardCategory
			})
			.prepend(
				$('<i/>',{
					class : "fa fa-"+icon
				})	
			)
			.append(
				getBoardListlink(category) //풍혁0709 : (OKKY)기준QNA와 커뮤니티에만 게시판으로 이동하는 --- 링크 만들어주는 부분
			)
		)
		.append(
			$('<div/>',{
				class : "panel panel-default"
			})
			.append(
				listJsonToTag(data, category)
			)
		);

	return mainBlock;
}

/*풍혁0709 : category가 qna이거나 커뮤니티인 경우만 append*/
function getBoardListlink(category){
	var linkTag = $('<a/>',{
//		풍혁0719 : category는 url에 맞게 추후에 고칠 예정, 일단 indexList를 띄우자
		href : "/semiproject/board/list?pg=1&sortOption=date&category="+category,
		class : "main-more-btn pull-right"
	});
	
	linkTag.append($('<i/>',{
			class : "fa fa-ellipsis-h"
		})
	);
	
	if( (category.indexOf('qna') >= 0) || (category.indexOf('free') >=0) ){
		return linkTag;
	}else{
		return null;
	}
	
}

/*풍혁 0714 : board_uid로 user의 img 받아오는 function 만들기*/ 
function getUserImgByBoardUid(board_uid){
	let user_img;
	$.ajax({
		type : 'post',
		url : '/semiproject/board/getUserImgByBoardUid',
		async : false,
		data : { 'user_id' : board_uid},
		success : function(data){
			user_img = data;
		},
		error : function(err){
			console.log(err);
		}
	})
	
	return user_img;
}

/*AJAX에서 BoardDTO 여러개가 들어있는 데이터를 JSON으로 받았을 때*/
/*여러개의 li tag로 이루어진 ul tag 만들기*/
function listJsonToTag(data){ /*여기서 data는 json배열 */
	
	var panel = $('<ul/>',{ class : "list-group" });
		for(var i = 0; i < data.boardList.length; i++){ /*여기서 item은 json */
			let board_title = data.boardList[i].board_title;
			let board_uid = data.boardList[i].board_uid;
			let user_img = getUserImgByBoardUid(board_uid);
			
			if(board_title.length > 15){
				board_title = board_title.substring(0,15) + '...'
			}
			panel.append(
				$('<li/>',{
					class : "list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix"
				})
				.append(
					$('<div/>',{
						class : "list-title-wrapper"
					})
					.append(
						$('<h5/>',{
							class : "list-group-item-heading"
						})
						.append(
							$('<a/>',{
								href : '/semiproject/board/getBoardView?category='+cateidToString(data.boardList[i].board_cateid)+'&board_id='+data.boardList[i].board_id,
								text : board_title
							})	
						)
						.append(
							$('<div/>',{
								class : "list-group-item-author pull-right clearfix"
							}).append(
								$('<div/>',{
									class : "avatar clearfix avatar-x-small"
								})
								.append(
									$('<a/>',{
										href : "/semiproject/user/userPage?user_id="+data.boardList[i].board_uid,
										class : "avatar-photo"
									})
									.append(
										$('<img/>',{
											src : "/semiproject/storage/userprofile/"+user_img 
										})
									)
								)
								.append(
									$('<div/>',{
										class : "avatar-info"
									})
									.append(
										$('<a/>',{
											class : "nickname",
											href : "/semiproject/user/userPage?user_id="+data.boardList[i].board_uid,
											title : data.authorArray[i],
											text : data.authorArray[i],
										})
									)
									.append(
										$('<div/>',{
											class : "activity",
										})
										.append(
											$('<span/>',{
												class : "fa fa-flash"
											})	
										)
										.append(
											$('<span/>',{
												text : "lev"
											})	
										)
									)
									.append(
										$('<div/>',{
											class : "date-created"
										})
										.append(
											$('<span/>',{
												class : "timeago",
												title : data.boardList[i].board_date_created,
												text : getBoardBeforedayString(data.boardList[i].board_date_created)
											})	
										)
									)
								)
							)
						)	
					)
				)
			)
		}
	
	
	return panel;

}

/* 풍혁 0709 : 현재시간을 기준으로 n분전, n시간전, n일전, n주전을 구하는 function을 만들어보겠수다*/ 
function getBoardBeforedayString(board_date){
	
	var now = new Date();

	/*console.log('board date : ' + board_date + ' now : ' + now);*/
	/*풍혁0709 : 가장 작은 단위 분으로 시작*/
	var diff = Math.floor((now - new Date(board_date))/(1000 * 60));
	
	if(diff < 60 && diff >= 1){
		return (diff + '분 전');
	}else if( diff < 1){
		/*풍혁0709 : 1분 보다 미만일 경우 방금 전으로 표시*/
		return ('방금 전');
	}else{
		/*풍혁0709 : 60분 보다 커졌을 경우 시간 단위*/ 
		var diff = Math.floor(diff / 60);
		if(diff < 24){
			return (diff + '시간 전');
		}else{
			/*풍혁0709 : 24시간보다 더커졌을 경우 일 단위*/
			var diff = Math.floor(diff / 24);
			if( diff < 30 ){
				if(diff < 7){
					return (diff + '일 전');
				}else{
					var diff = Math.floor(diff / 7);
					return (diff + '주 전');
				}
			}else{
				/*풍혁0709 : 30일 보다 클 경우 달 단위*/
				var diff = Math.floor(diff / 4);
				return (diff + '달 전');
				/*풍혁0709 : 일단 가장 큰 단위는 달로 해두고, 더 큰 단위 필요해질 경우 변경*/
			}
		}
	}
	
}

function cateidToString(cateid){
	let result;
	if(cateid == 1){
		result = 'info';
	}else if(cateid == 2){
		result = 'review';
	}else if(cateid == 3){
		result = 'qna';
	}else if(cateid == 4){
		result = 'free';
	}
	
	return result;
}

function categoryToInt(category){
	let result;

	if(cateid == 'info'){
		result = 1;
	}else if(cateid == 'review'){
		result = 2;
	}else if(cateid == 'qna'){
		result = 3;
	}else if(cateid == 'free'){
		result = 4;
	}
	
	return result;
}


