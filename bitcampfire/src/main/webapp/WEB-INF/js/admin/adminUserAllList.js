//@@@@@ 검색 엔터키 이벤트 
$(function(){		
	//Block Enter key events. 엔터키 이벤트 막기.		
	$(document).keypress(function (e) {			
		if (e.keyCode == 13) {
			e.preventDefault();		
			}	
	});		
	//검색 박스에서 에서 Enter키를 누를 때 검색 버튼을 클릭.		
	$('#keyword').keypress(function (e) {		 
		if(e.keyCode == 13) { 				
			$('#userSearchBtn').click();			
				return false;  		  
			}		
	});   	
});


//@@@@@ 회원 전체 리스트를 가져옴(서치 X)
$(function(){
    $.ajax({
        type: 'post',
        url: '/semiproject/admin/getUserAllList',
        data: 'pg=' + $('#pg').val(),
        dataType: 'json',
        success: function (data) {
            //alert(JSON.stringify(data));
            console.log(data);

            $.each(data.list, function (index, items) { // 배열or객체 , function(키, 값)

                $('<li/>', {
                    class: 'list-group-item list-group-item-question clearfix',
                    id: 'li'+items.user_id //소셜 로그인: has note, 일반 로그인 no note
                })	

               	.append(
                     $('<div/>', {
                         class: 'list-title-wrapper clearfix1',
                         align: 'center',
                         text: items.user_id,
                         id: 'user_id'+items.user_id,
                         style: 'width:70px; height:35px; text-align:center; line-height:35px;'
                     })
                     .prepend($('<input/>', {
                         type: 'checkbox',
                         name: 'check',
                         id: 'check'+items.user_id,
                         style: 'float: left; margin-top: 10px;',                         
                         value: items.user_email //일관성을 위해 id값 대신 email 값을 넣음
                     }))                                    
                    )//list-title-wrapper clearfix1
                 
                 .append(
                     $('<div/>', {
                         class: 'list-title-wrapper clearfix2',
                         style: 'width:200px; height:35px; text-align:center;'
                     })
                     .append(
                         $('<div/>', {
                             class: 'avatar clearfix avatar-list'
                         })
                         .append(
                             $('<a/>', {
                                 class: 'avatar-photo',
                                 //href: '/semiproject/user/userpage?user_id=' + items.user_id//접속 안됨, 확인 후 수정하기(220716)
                             })
                             .append(
                                 $('<img/>', {
                                     src: '/semiproject/storage/userprofile/' + items.user_img
                                 })
                             )//img
                         )//avartar-photo
                         .append(
                             $('<div/>', {
                                 class: 'avatar-info'
                             })
                            .append(
                                $('<a/>', {
                                    class: 'nickname',
                                    title: items.user_nickname,
                                    text: items.user_nickname
                                })
                            )
                            .append(
                                $('<div/>', {
                                    class: 'date-created',
                                })
                                .append(
                                    $('<span/>', {
                                        class: 'timeago',
                                        title: items.user_logtime,
                                        text: items.user_logtime
                                    })
                                )//timeago
                            )//date-created						
                         )//avatar-info
                     )//avatar clearfix avatar-list
                 )//list-title-wrapper clearfix2
                 
                 .append(
                     $('<div/>', {
                         class: 'list-title-wrapper clearfix3',
                         align: 'center',
                         text: items.user_name,
                         style: 'width:150px; height:35px; text-align:center; line-height:35px;'
                     })
                 )//list-title-wrapper clearfix3	
                 
                 .append(
                     $('<div/>', {
                         class: 'list-title-wrapper clearfix4',
                         id: 'user_email'+items.user_id,
                         align: 'center',
                         text: items.user_email,
                         style: 'width:200px; height:35px; text-align:center; line-height:35px;'
                     })
                 )//list-title-wrapper clearfix4

                 .append(
                     $('<div/>', {
                         class: 'list-title-wrapper clearfix5',
                         align: 'center',
                         text: items.user_classid,
                         style: 'width:100px; height:35px; text-align:center; line-height:35px;'
                     })
                 )//list-title-wrapper clearfix5

                 .append(
                     $('<div/>', {
                         class: 'list-title-wrapper clearfix6',
                         align: 'center',
                         text: items.user_social,
                         id: 'user_social'+items.user_id,                         
                         style: 'width:100px; height:35px; text-align:center; line-height:35px;'
                     })
                     .append(
                         $('<input/>', {
                             type: 'hidden',
                             name: 'user_kakaoId',
                             value: items.user_kakaoId,
                             style: 'width:100px; height:20px; text-align:center;'
                         })
                     )//user_accesstoken_kakao 숨김값	
                 )//list-title-wrapper clearfix6

                 .append(
                     $('<div/>', {
                         class: 'list-title-wrapper clearfix7',
                         style: 'width:82px; height:35px; text-align:center; line-height:35px;'
                     })
                     .append(
                    		/* 카카오 삭제 시 오류 */
                   		 $('<input/>',{
                                class: 'btn btn-danger btn-sm',
                                type: 'button',
                                id: 'adminUserDeleteBtn_personal'+items.user_id,
                                value: '삭제'
                            })                         
                     )//btn btn-danger
                 )//list-title-wrapper clearfix7

               .appendTo($('.list-group')); //마지막단   
               
			   //소셜 로그인 가입자는 선택삭제 체크 불가            
               if($('#user_social'+items.user_id).text()!='X') {
                	$('#check'+items.user_id).attr('disabled', true);
               	}
               
               //소셜 로그인 가입자는 파란불 들어오게, 아니면 회색불
               $(document).ready(function(){
	               if($('#user_social'+items.user_id).text()!='X') {
						$('#li'+items.user_id).addClass("list-group-no-note");
	               }else{
						$('#li'+items.user_id).addClass("list-group-has-note");
	               }	               
               });              	        
   			
               //관리자 권한을 가진 사람은 선택삭제/개별삭제 처리 못함
               if($('#user_id'+items.user_id).text()==0) {
               	$('#check'+items.user_id).attr('disabled', true);
               	$('#adminUserDeleteBtn_personal'+items.user_id).attr('disabled', true);
              	}
              	
               //개별 삭제버튼 실행(카카오톡 유저도 삭제 가능)
               $('#adminUserDeleteBtn_personal'+items.user_id).click(function(){	 
            		if(confirm('정말로 삭제하시겠습니까?')){
            		$.ajax({
            			type: 'post',
            			url: '/semiproject/admin/adminUserDelete',
            			data: {'user_email': $('#user_email'+items.user_id).text()},
            			success: function(){
            				alert('회원 정보를 삭제하였습니다.');
            				location.href = '/semiproject/admin/adminUserAllList?category=admin';	
            			},
            			error: function(err){
            				console.log(err);
            			}
            		});
            		}
            	});
            });//each
         	 //페이징 처리 챙기기!
         	 $('#userAdminPagingDiv').html(data.userAdminPaging.pagingHTML);
        }, //success
        error: function (err) {
            console.log(err);
        }
    });//ajax
});//function


//@@@@@ 체크박스 선택삭제 기능
//전체선택 또는 전체해제
$('#all').click(function(){
	if($('#all').prop('checked'))
		$('input[name="check"]').prop('checked', true);
	else
		$('input[name="check"]').prop('checked', false);
});

//선택삭제 : 이메일 로그인 회원만 가능함
$('#adminUserDeleteBtn_select').click(function(){
	var count = $('input[name="check"]:checked').length;
	
	if(count == 0) {
		alert('삭제할 항목을 선택하세요!');
	}else if(confirm('정말로 삭제하시겠습니까?')){
		$('#adminUserAllListForm').submit();
		alert('선택하신 회원의 정보를 삭제하였습니다.');
	}
});

//@@@@@ 페이징 처리
function userAdminPaging(pg2){	 
	var keyword = $('#keyword').val();
	
	if(keyword == ''){
		location.href = "/semiproject/admin/adminUserAllList?category=admin&pg="+pg2;
		
	}else{
		$('#searchPg').val(pg2); //searchPg가 1로 고정되어 있기 때문에
		$('#userSearchBtn').trigger('click'); //강제로 이벤트 발생
		
		//다시 검색 버튼을 누르면 1페이지로부터 검색할 수 있도록 searchPg를 1로 바꾸어야 한다.
		$('#searchPg').val(pg2);
	}
}

//@@@@@ 검색 시 띄우는 유저 리스트
$('#userSearchBtn').click(function(){
	if($('#keyword').val()==''){
		alert('검색어를 입력하세요!')
		location.href = "/semiproject/admin/adminUserAllList?category=admin&pg=1";
	}else{
	    $.ajax({
	        type: 'post',
	        url: '/semiproject/admin/adminUserSearch',
	        data: $('#userSearchForm').serialize(),
	        dataType: 'json',
	        success: function (data) {
	            //alert(JSON.stringify(data));
	            //리스트에서 기존의 목록 제거
			 	$('.list-group li:gt(0)').remove();

			 	 $.each(data.list, function (index, items) {

		                $('<li/>', {
		                    class: 'list-group-item list-group-item-question clearfix',
		                    id: 'li'+items.user_id //소셜 로그인: has note, 일반 로그인 no note
		                })	

		               	.append(
		                     $('<div/>', {
		                         class: 'list-title-wrapper clearfix1',
		                         align: 'center',
		                         text: items.user_id,
		                         id: 'user_id'+items.user_id,
		                         style: 'width:70px; height:35px; text-align:center; line-height:35px;'
		                     })
		                     .prepend($('<input/>', {
		                         type: 'checkbox',
		                         name: 'check',
		                         id: 'check'+items.user_id,
		                         style: 'float: left; margin-top: 10px;',                         
		                         value: items.user_email //일관성을 위해 id값 대신 email 값을 넣음
		                     }))                                    
		                    )//list-title-wrapper clearfix1
		                 
		                 .append(
		                     $('<div/>', {
		                         class: 'list-title-wrapper clearfix2',
		                         style: 'width:200px; height:35px; text-align:center;'
		                     })
		                     .append(
		                         $('<div/>', {
		                             class: 'avatar clearfix avatar-list'
		                         })
		                         .append(
		                             $('<a/>', {
		                                 class: 'avatar-photo',
		                                 href: '/semiproject/user/userpage?user_id=' + items.user_id//접속 안됨, 확인 후 수정하기(220716)
		                             })
		                             .append(
		                                 $('<img/>', {
		                                     src: '/semiproject/storage/userprofile/' + items.user_img
		                                 })
		                             )//img
		                         )//avartar-photo
		                         .append(
		                             $('<div/>', {
		                                 class: 'avatar-info'
		                             })
		                            .append(
		                                $('<a/>', {
		                                    class: 'nickname',
		                                    title: items.user_nickname,
		                                    text: items.user_nickname
		                                })
		                            )
		                            .append(
		                                $('<div/>', {
		                                    class: 'date-created',
		                                })
		                                .append(
		                                    $('<span/>', {
		                                        class: 'timeago',
		                                        title: items.user_logtime,
		                                        text: items.user_logtime
		                                    })
		                                )//timeago
		                            )//date-created						
		                         )//avatar-info
		                     )//avatar clearfix avatar-list
		                 )//list-title-wrapper clearfix2
		                 
		                 .append(
		                     $('<div/>', {
		                         class: 'list-title-wrapper clearfix3',
		                         align: 'center',
		                         text: items.user_name,
		                         style: 'width:150px; height:35px; text-align:center; line-height:35px;'
		                     })
		                 )//list-title-wrapper clearfix3	
		                 
		                 .append(
		                     $('<div/>', {
		                         class: 'list-title-wrapper clearfix4',
		                         id: 'user_email'+items.user_id,
		                         align: 'center',
		                         text: items.user_email,
		                         style: 'width:200px; height:35px; text-align:center; line-height:35px;'
		                     })
		                 )//list-title-wrapper clearfix4

		                 .append(
		                     $('<div/>', {
		                         class: 'list-title-wrapper clearfix5',
		                         align: 'center',
		                         text: items.user_classid,
		                         style: 'width:100px; height:35px; text-align:center; line-height:35px;'
		                     })
		                 )//list-title-wrapper clearfix5

		                 .append(
		                     $('<div/>', {
		                         class: 'list-title-wrapper clearfix6',
		                         align: 'center',
		                         text: items.user_social,
		                         id: 'user_social'+items.user_id,                         
		                         style: 'width:100px; height:35px; text-align:center; line-height:35px;'
		                     })
		                     .append(
		                         $('<input/>', {
		                             type: 'hidden',
		                             name: 'user_kakaoId',
		                             value: items.user_kakaoId,
		                             style: 'width:100px; height:20px; text-align:center;'
		                         })
		                     )//user_kakaoId 숨김값	
		                 )//list-title-wrapper clearfix6

		                 .append(
		                     $('<div/>', {
		                         class: 'list-title-wrapper clearfix7',
		                         style: 'width:82px; height:35px; text-align:center; line-height:35px;'
		                     })
		                     .append(
		                    		/* 카카오 삭제 시 오류 */
		                   		 $('<input/>',{
		                                class: 'btn btn-danger btn-sm',
		                                type: 'button',
		                                id: 'adminUserDeleteBtn_personal'+items.user_id,
		                                value: '삭제'
		                            })                         
		                     )//btn btn-danger
		                 )//list-title-wrapper clearfix7

		               .appendTo($('.list-group')); //마지막단   
		               
					   //소셜 로그인 가입자는 선택삭제 체크 불가            
		               if($('#user_social'+items.user_id).text()!='X') {
		                	$('#check'+items.user_id).attr('disabled', true);
		               	}
		               
		               //소셜 로그인 가입자는 파란불 들어오게, 아니면 회색불
		               $(document).ready(function(){
			               if($('#user_social'+items.user_id).text()!='X') {
								$('#li'+items.user_id).addClass("list-group-no-note");
			               }else{
								$('#li'+items.user_id).addClass("list-group-has-note");
			               }	               
		               });              	        
		   			
		               //관리자 권한을 가진 사람은 선택삭제/개별삭제 처리 못함
		               if($('#user_id'+items.user_id).text()==0) {
		               	$('#check'+items.user_id).attr('disabled', true);
		               	$('#adminUserDeleteBtn_personal'+items.user_id).attr('disabled', true);
		              	}
		              	
		               //개별 삭제버튼 실행(카카오톡 유저도 삭제 가능)
		               $('#adminUserDeleteBtn_personal'+items.user_id).click(function(){	 
		            		if(confirm('정말로 삭제하시겠습니까?')){
		            		$.ajax({
		            			type: 'post',
		            			url: '/semiproject/admin/adminUserDelete',
		            			data: {'user_email': $('#user_email'+items.user_id).text()},
		            			success: function(){
		            				alert('회원 정보를 삭제하였습니다.');
		            				location.href = '/semiproject/admin/adminUserAllList?category=admin';	
		            			},
		            			error: function(err){
		            				console.log(err);
		            			}
		            		});
		            		}
		            	});
		            });//each
		         	 //페이징 처리 챙기기!
		         	 $('#userAdminPagingDiv').html(data.userAdminPaging.pagingHTML);
		        }, //success
		        error: function (err) {
		            console.log(err);
		        }
		    });//ajax
	}//else	
});