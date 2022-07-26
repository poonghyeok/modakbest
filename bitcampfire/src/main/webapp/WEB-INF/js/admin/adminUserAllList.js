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
                    id: 'li'+items.user_id //소셜 로그인: has note, 일반 로그인 no note, 관리자 success
                })	

               	.append(
                     $('<div/>', {
                         class: 'list-title-wrapper clearfix0',
                         align: 'center',
                         text: items.user_id,
                         id: 'user_id'+items.user_id,
                         style: 'width:70px; height:35px; text-align:center; line-height:35px;'
                     })
                     .prepend($('<input/>', {
                    	 //class 추가(220725)
                    	 class: 'check_select',
                         type: 'checkbox',
                         name: 'check',
                         id: 'check'+items.user_id,
                         style: 'float: left; margin-top: 10px;',                         
                         value: items.user_email //일관성을 위해 id값 대신 email 값을 넣음
                     }))                                    
                    )//list-title-wrapper clearfix0
                 //@@@ 회원등급 추가(220724)
                 .append(
                     $('<div/>', {
                         class: 'list-title-wrapper clearfix1',
                         align: 'center',
                         text: items.user_grade,
                         id: 'user_grade'+items.user_id,
                         style: 'width:60px; height:35px; text-align:center; line-height:35px;'
                     })
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
                                 href: '/semiproject/user/userPage?user_id=' + items.user_id//접속 안됨, 확인 후 수정하기(220716) => 수정 완료(0723)
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
                                    text: items.user_nickname,
                                    href: '/semiproject/user/userPage?user_id=' + items.user_id//접속 안됨, 확인 후 수정하기(220716) => 수정 완료(0723)
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
                         style: 'width:120px; height:35px; text-align:center; line-height:35px;'
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
                         id: 'user_classid'+items.user_id,
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
                         style: 'width:80px; height:35px; text-align:center; line-height:35px;'
                     })
                 )//list-title-wrapper clearfix6

                 .append(
                     $('<div/>', {
                         class: 'list-title-wrapper clearfix7',
                         style: 'width:62px; height:35px; text-align:center; line-height:35px;'
                     })
                     .append(
                    		
                   		 $('<input/>',{
                                class: 'btn btn-danger btn-sm',
                                type: 'button',
                                id: 'adminUserDeleteBtn_personal'+items.user_id,
                                value: '삭제'
                            })                         
                     )//btn btn-danger
                 )//list-title-wrapper clearfix7

               .appendTo($('.list-group')); //마지막단   
               
			   //관리자 vs 소셜로그인 vs 일반회원(기존에 나누어져있던 조건을 하나로 합침: doucument~ 갑자기 안됨)(220724)         
               if($('#user_social'+items.user_id).text()!='X') { //관리자 이더라도 소셜 로그인 가입자라면, 아래의 소셜로그인 조건이 먼저 적용되도록 설정
	               $('#check'+items.user_id).attr('disabled', true); //소셜 로그인 가입자 > 선택삭제 체크 불가
	               $('#li'+items.user_id).addClass("list-group-no-note"); //소셜 로그인 가입자 > li 회색 불
               }else if($('#user_grade'+items.user_id).text()=='A'){
                   $('#li'+items.user_id).addClass("list-group-success"); //관리자 권한 > li 초록색 불
                   //$('#check'+items.user_id).attr('disabled', true); //관리자 권한 등록해제를 위해 선택삭제(체크박스) 기능 열어둠(220724)
	               $('#adminUserDeleteBtn_personal'+items.user_id).attr('disabled', true); //관리자 권한 > 개별삭제 처리 불가
			   }else{
				   $('#li'+items.user_id).addClass("list-group-has-note"); //이메일 가입자 > 개별삭제/선택삭제 가능/li 파랑불
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
               
               //어드민 페이지> 유저리스트 > 학원명 한글로 바꾸기(220723)
               $(document).ready(function(){
            	   $.ajax({
           			type: 'post',
           			url: '/semiproject/admin/getUserClass',
           			data: {'user_classid': $('#user_classid'+items.user_id).text()},
           			success: function(data){
           				//alert(JSON.stringify(data));
           				if($('#user_classid'+items.user_id).text()!=0){
           					document.getElementById('user_classid'+items.user_id).innerHTML = data.class_academy;
           				}else{
           					document.getElementById('user_classid'+items.user_id).innerHTML = '선택안함';
           				}           				
	           			},
	           			error: function(err){
	           				console.log(err);
	           			}
            	   	});
       			});  
        	   	//어드민 페이지> 유저리스트 > 소셜로그인 한글로 바꾸기(220723)        	  	   
        	    if($('#user_social'+items.user_id).text()=='K') {   
        		    document.getElementById('user_social'+items.user_id).innerHTML = 'kakao';
        	    } else{
        	    	document.getElementById('user_social'+items.user_id).innerHTML = 'email';
        	    }
        	    //어드민 페이지> 유저리스트 > 회원등급 한글로 바꾸기(220724)
        	    if($('#user_grade'+items.user_id).text()=='A') {   
        		    document.getElementById('user_grade'+items.user_id).innerHTML = '관리자';
        	    } else{
        	    	document.getElementById('user_grade'+items.user_id).innerHTML = '일반회원';
        	    }
               
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
//전체선택 또는 전체해제, 개별 체크박스 상태변화에 따른 전체선택 및 해제
$(function(){
	$('#all').click(function(){ //all click 안에 넣으면 기능 적용되지만 한번 all 체크를 해줘야 함..
		if($('#all').prop('checked'))			
			//disabled 처리된 것은 체크 안되게 변경
			$("input[type=checkbox]:not(:disabled)").prop("checked",true);
		else
			$('input[name="check"]').prop('checked', false);		
	}); //$('#all').click(function()
	//@@@ $(document).on()~~ 수정(0725)
	$(document).on('click', '.check_select', function(){
	//$(document).on('click', 'input[name="check"]', function() {	
		if($("input[name='check']:disabled").length > 0) {
			var total = $("input[name='check']:not(:disabled)").length;	
			var checked = $('input[name="check"]:checked').length;
			
			if(total != checked) $('#all').prop('checked', false);
			else $("#all").prop('checked', true); 
		}else {
			var total = $('input[name="check"]').length;
			var checked = $('input[name="check"]:checked').length;
			
			if(total != checked) $('#all').prop('checked', false);
			else $("#all").prop('checked', true); 
		}
	}); //$('input[name="check"]').click(function()
});

//@@@연수 : 동일한 form으로 선택삭제/관리자 등록 및 해제 기능 구현(220724)
//선택삭제 : 이메일 로그인 회원만 가능함 
$('#adminUserDeleteBtn_select').click(function(){
	$('#adminUserAllListForm').attr('action', '/semiproject/admin/adminUserDelete_select');
	
	var count = $('input[name="check"]:checked').length;
	
	if(count == 0) {
		alert('삭제할 항목을 선택하세요!');
	}else if(confirm('정말로 삭제하시겠습니까?')){
		$('#adminUserAllListForm').submit();
		alert('선택하신 회원의 정보를 삭제하였습니다.');
	}
});
//관리자 선택 등록(220724)
$('#adminRegisterBtn').click(function(){
	$('#adminUserAllListForm').attr('action', '/semiproject/admin/adminRegister');
	
	var count = $('input[name="check"]:checked').length;
	
	if(count == 0) {
		alert('관리자 권한을 등록할 회원을 선택하세요!');
	}else if(confirm('정말로 등록하시겠습니까?')){
		$('#adminUserAllListForm').submit();
		alert('선택하신 회원을 관리자로 등록하였습니다.');
	}
});

//관리자 선택 등록해제(220724)
$('#adminRegisterCancelBtn').click(function(){
	$('#adminUserAllListForm').attr('action', '/semiproject/admin/adminRegisterCancel');
	
	var count = $('input[name="check"]:checked').length;
	
	if(count == 0) {
		alert('관리자 권한을 해제할 회원을 선택하세요!');
	}else if(confirm('정말로 해제하시겠습니까?')){
		$('#adminUserAllListForm').submit();
		alert('선택하신 회원의 관리자 권한을 해제하였습니다.');
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

			 	 $.each(data.list, function (index, items) { // 배열or객체 , function(키, 값)
			 		 	
			 		  	//여기부터는 전체 수정사항 반영하여 전체 코드 다시 붙여넣음(220724 기준)
		                $('<li/>', {
		                    class: 'list-group-item list-group-item-question clearfix',
		                    id: 'li'+items.user_id //소셜 로그인: has note, 일반 로그인 no note, 관리자 success
		                })	

		               	.append(
		                     $('<div/>', {
		                         class: 'list-title-wrapper clearfix0',
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
		                    )//list-title-wrapper clearfix0
		                 //@@@ 회원등급 추가(220724)
		                 .append(
		                     $('<div/>', {
		                         class: 'list-title-wrapper clearfix1',
		                         align: 'center',
		                         text: items.user_grade,
		                         id: 'user_grade'+items.user_id,
		                         style: 'width:60px; height:35px; text-align:center; line-height:35px;'
		                     })
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
		                                 href: '/semiproject/user/userPage?user_id=' + items.user_id//접속 안됨, 확인 후 수정하기(220716) => 수정 완료(0723)
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
		                                    text: items.user_nickname,
		                                    href: '/semiproject/user/userPage?user_id=' + items.user_id//접속 안됨, 확인 후 수정하기(220716) => 수정 완료(0723)
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
		                         style: 'width:120px; height:35px; text-align:center; line-height:35px;'
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
		                         id: 'user_classid'+items.user_id,
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
		                         style: 'width:80px; height:35px; text-align:center; line-height:35px;'
		                     })
		                 )//list-title-wrapper clearfix6

		                 .append(
		                     $('<div/>', {
		                         class: 'list-title-wrapper clearfix7',
		                         style: 'width:62px; height:35px; text-align:center; line-height:35px;'
		                     })
		                     .append(
		                    		
		                   		 $('<input/>',{
		                                class: 'btn btn-danger btn-sm',
		                                type: 'button',
		                                id: 'adminUserDeleteBtn_personal'+items.user_id,
		                                value: '삭제'
		                            })                         
		                     )//btn btn-danger
		                 )//list-title-wrapper clearfix7

		               .appendTo($('.list-group')); //마지막단   
		               
					   //관리자 vs 소셜로그인 vs 일반회원(기존에 나누어져있던 조건을 하나로 합침: doucument~ 갑자기 안됨)(220724)         
		               if($('#user_social'+items.user_id).text()!='X') { //관리자 이더라도 소셜 로그인 가입자라면, 아래의 소셜로그인 조건이 먼저 적용되도록 설정
			               $('#check'+items.user_id).attr('disabled', true); //소셜 로그인 가입자 > 선택삭제 체크 불가
			               $('#li'+items.user_id).addClass("list-group-no-note"); //소셜 로그인 가입자 > li 회색 불
		               }else if($('#user_grade'+items.user_id).text()=='A'){
		                   $('#li'+items.user_id).addClass("list-group-success"); //관리자 권한 > li 초록색 불
		                   //$('#check'+items.user_id).attr('disabled', true); //관리자 권한 등록해제를 위해 선택삭제(체크박스) 기능 열어둠(220724)
			               $('#adminUserDeleteBtn_personal'+items.user_id).attr('disabled', true); //관리자 권한 > 개별삭제 처리 불가
					   }else{
						   $('#li'+items.user_id).addClass("list-group-has-note"); //이메일 가입자 > 개별삭제/선택삭제 가능/li 파랑불
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
		               
		               //어드민 페이지> 유저리스트 > 학원명 한글로 바꾸기(220723)
		               $(document).ready(function(){
		            	   $.ajax({
		           			type: 'post',
		           			url: '/semiproject/admin/getUserClass',
		           			data: {'user_classid': $('#user_classid'+items.user_id).text()},
		           			success: function(data){
		           				//alert(JSON.stringify(data));
		           				if($('#user_classid'+items.user_id).text()!=0){
		           					document.getElementById('user_classid'+items.user_id).innerHTML = data.class_academy;
		           				}else{
		           					document.getElementById('user_classid'+items.user_id).innerHTML = '선택안함';
		           				}           				
			           			},
			           			error: function(err){
			           				console.log(err);
			           			}
		            	   	});
		       			});  
		        	   	//어드민 페이지> 유저리스트 > 소셜로그인 한글로 바꾸기(220723)        	  	   
		        	    if($('#user_social'+items.user_id).text()=='K') {   
		        		    document.getElementById('user_social'+items.user_id).innerHTML = 'kakao';
		        	    } else{
		        	    	document.getElementById('user_social'+items.user_id).innerHTML = 'email';
		        	    }
		        	    //어드민 페이지> 유저리스트 > 회원등급 한글로 바꾸기(220724)
		        	    if($('#user_grade'+items.user_id).text()=='A') {   
		        		    document.getElementById('user_grade'+items.user_id).innerHTML = '관리자';
		        	    } else{
		        	    	document.getElementById('user_grade'+items.user_id).innerHTML = '일반회원';
		        	    }
		               
		            });//each
		         	 //페이징 처리 챙기기!
		         	 $('#userAdminPagingDiv').html(data.userAdminPaging.pagingHTML);
		        }, //success
		        error: function (err) {
		            console.log(err);
		        }
		    });//ajax
		}//else
	});//function