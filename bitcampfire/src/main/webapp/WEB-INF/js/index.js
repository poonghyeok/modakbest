/**
 * 
 */
/*풍혁220708 : 인덱스 페이지에서 글 목록을 제이쿼리로 불러보려했는데 실패 ..*/
$(function(){
	$.ajax({
		type : 'post',
		url : '/semiproject/board/jsonTest',
		data : {
			startNum : 1,
			endNum : 5
			},
		success : function(data){
			console.log(JSON.stringify(data));
			$('#index').append(outerDiv().append(listJsonToTag(data, 5)));
		},
		error : function(err){
			console.log(err);
		}
	})
})
/*풍혁220708 home의 list를 제이쿼리로 불러보겠습니다.*/
function outerDiv(){
	
	var outer =
		$('<div/>',{
			class : "col-sm-6 main-block-left"
		})
		.append(
			$('<div/>',{
				class : "main-block"
			})
			.append(
				$('<h4/>',{
					class : "main-header",
					text : "Editor's choice"
				})
				.append(
					$('<i/>',{
						class : "fa fa-flag"
					})	
				)
			)
			.append(
				$('<div/>',{
					class : "panel panel-default"
				})
			)
		);

	return outer;
}


/*AJAX에서 BoardDTO 여러개가 들어있는 데이터를 JSON으로 받았을 때*/
/*여러개의 li tag로 이루어진 ul tag 만들기*/
function listJsonToTag(data, boardNum){ /*여기서 data는 json배열 */
	
	var panel = $('<ul/>',{ class : "list-group" });
	
	for(var i = 0; i < boardNum; i++){
		for(dto in data){ /*여기서 item은 json */
			panel.appned(
				$('<li/>',{
					class : "list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix"
				})
				.append(
					$('<h5/>',{
						class : "list-group-item-heading"
					})
					.append(
						$('<a/>',{
							href : '/semiproject/board/getBoardView?board_id='+dto.board_id,
							text : dto.board_title
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
									href : "/semiproject/user/userMyPageForm?user_id="+dto.board_uid,
									class : "avatar-photo"
								})
								.append(
									$('<img/>',{
										src : "/semiproject/storage/${sessionScope.memImg}"
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
										href : "/semiproject/user/userMyPageForm?user_id="+dto.board_uid,
										title : '작성자',
										text : '작성자어떻게넣지',
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
											title : dto.board_date_created.toLocaleString(),
											text : '7일전'
										})	
									)
								)
							)
						)
					)
				)
			)
		}
	}
	
	return panel;

}
