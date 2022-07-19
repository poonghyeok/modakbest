<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 풍혁 (220704) : okky 에서 복붙 -->		
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="/semiproject/css/board/boardList.css">
<link rel="stylesheet" href="/semiproject/css/board/boardList2.css">
<!-- 풍혁 (220704) : okky 에서 복붙 -->
</head>
<body>
<!-- 풍혁(220707) :  div layout container, div main 추가 -->
<div class="layout-container">
	<div class="main">
			<%@ include file="/admin/adminSidebar.jsp" %>
				<!-- <div id="index" class="content scaffold-list clearfix" role="main"> footer가 위로 올라오지 않게하는 폼/리스트 크기가 작아짐 -->		
				
				<!-- 메뉴제목  -->
				<h4>회원관리</h4>
				<!-- @@@@@@@@@@ 연수 : 검색 기능 추가 하기(220716)  @@@@@@@@@@ -->
				<form id="userSearchForm">
				<input type="hidden" name="pg" id="searchPg" value="1" >
				<div class="nav" role="navigation" style="margin-left:600px;">										
						<div class="job-filter-container" style="width:300px; text-align:center; margin: auto;">
							<select class="job-filter-btn" name="searchOption" id="searchOption" style="border-color: #DBDCE1; font-size: 10pt; color: #656667;">
						       <option value="user_name" id="user_name">이름</option>
						       <option value="user_email" id="user_email">이메일</option>
						       <option value="user_nickname" id="user_nickname">닉네임</option>         
					   		</select>
		                    <input type="search" id="keyword" name="keyword" class="form-control" placeholder="검색어" value="" style="border-color: #DBDCE1;">
		                    <span class="input-group-btn"> 
		                        <input type="button" id="userSearchBtn" class="btn btn-default" style="border-color: #DBDCE1; font-size: 10pt; color: #656667;" value="검색">
		                    </span>
		                </div>
	            </div>
	            </form>
				<br>
				<!-- @@@@@@@@@@ 연수 : 검색 기능 추가 하기(220716)  @@@@@@@@@@ -->
				<input type="hidden" id="pg" value="${pg }">
				<!-- @@@@@@@@@@ 연수 : 선택삭제 기능 추가 하기 : 소셜 로그인 사용자 토큰을 저장해야되남??(220716)  @@@@@@@@@@ -->
				<!-- 선택 삭제  폼 / 개별 삭제 버튼 폼을 폼 안에 넣으면 작동 안함 -->
				<form id="adminUserAllListForm" method="get" action="/semiproject/admin/adminUserDelete_select">		
							
				<div class="panel panel-default questions-panel">
					<ul class="list-group">
						
						<!-- append 시작점 -->
						<li class="list-group-item list-group-item-question clearfix">							
							<!-- user_id  -->
							<div class="list-title-wrapper clearfix1" style="width:70px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold;">									
								<input type="checkbox" id="all" style="float:left; margin-top: 10px;">아이디									
							</div>
															
							<!-- user_img & nickname & logtime -->
							<div class="list-title-wrapper clearfix2" style="width:200px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold;"> 
								<p style="height:5px;">프로필</p>
								<p style="font-size:5pt; height:5px; color: #8F9193;">(사진/닉네임/가입 또는 정보수정일)</p>
							</div>
																					
							<!-- user_name  -->
							<div class="list-title-wrapper clearfix3" style="width:150px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold;">									
								이름									
							</div>
							
							<!-- user_email  -->
							<div class="list-title-wrapper clearfix4" style="width:200px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold;">									
								이메일								
							</div>
							
							<!-- user_class  -->
							<div class="list-title-wrapper clearfix5" style="width:100px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold;">									
								학원								
							</div>
							
							<!-- user_social  -->								
							<div class="list-title-wrapper clearfix6" style="width:100px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold;">									
								소셜로그인						
							</div>
							
							<!-- user_delete  -->
							<div class="list-title-wrapper clearfix7" style="width:82px; height:35px; text-align:center; line-height:35px; font-size:11pt; font-weight: bold;">									
								삭제								
							</div>							
						</li>
						<!-- append 종료시점 -->	
											
						<!-- 동적 처리   -->										
					</ul>
				</div>
				<input type="button" id="adminUserDeleteBtn_select" class="btn btn-primary btn-sm" value="선택삭제" style="float: left;">
					
				<!-- 페이징 : 동적 처리 -->
				<div class="text-center"> 
					<ul class="pagination pagination-sm" id="userAdminPagingDiv">
					<!-- @@@@@@@@@@ 연수 : 페이징 처리 기능 추가(220717) - 동적처리 @@@@@@@@@@ -->
					</ul>
				</div>				
				
			</form><!-- deleteform --> 	
			<!-- </div> -->
		<jsp:include page="/WEB-INF/global/footer.jsp"/>
	</div> <!-- main -->   
</div> <!-- layout-container -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
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
						$('#li'+items.user_id).addClass("list-group-has-note");
	               }else{
						$('#li'+items.user_id).addClass("list-group-no-note");
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
            				location.href = '/semiproject/admin/adminUserAllList';	
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
		location.href = "/semiproject/admin/adminUserAllList?pg="+pg2;
		
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
		location.href = "/semiproject/admin/adminUserAllList?pg=1";
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
								$('#li'+items.user_id).addClass("list-group-has-note");
			               }else{
								$('#li'+items.user_id).addClass("list-group-no-note");
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
		            				location.href = '/semiproject/admin/adminUserAllList';	
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
</script>
</body>
</html>
