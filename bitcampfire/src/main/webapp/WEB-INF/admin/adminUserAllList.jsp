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
				<div class="nav" role="navigation" style="float:right;">
					<input type="text" name="pg" id="searchPg" value="1">					
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
				<input type="text" id="pg" value="${pg }">
				<!-- @@@@@@@@@@ 연수 : 선택삭제 기능 추가 하기 : 소셜 로그인 사용자 토큰을 저장해야되남??(220716)  @@@@@@@@@@ -->
				<!-- 선택 삭제  폼 / 개별 삭제 버튼 폼을 폼 안에 넣으면 작동 안함 -->
				<form id="adminUserAllListForm" method="get" action="/semiproject/admin/adminUserDelete_select">		
							
				<div class="panel panel-default questions-panel">
					<ul class="list-group">
						
						<!-- append 시작점 -->
						<li class="list-group-item list-group-item-question list-group-has-note clearfix">							
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
//로그인 엔터키 이벤트 
$(document).ready(function() {
	$('#keyword').on('keyup', function(e){
		if(e.keyCode == 13) {
			$('#userSearchBtn').trigger('click');			
		}
	});
});
 
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
                    class: 'list-group-item list-group-item-question list-group-has-note clearfix' //추후 hasnote를 social 여부로 변경해볼지?
                })	

               	.append(
                     $('<div/>', {
                         class: 'list-title-wrapper clearfix1',
                         align: 'center',
                         text: items.user_id,
                         style: 'width:70px; height:35px; text-align:center; line-height:35px;'
                     })
                     .prepend($('<input/>', {
                         type: 'checkbox',
                         name: 'check',
                         id: 'checkDelete',
                         style: 'float: left; margin-top: 10px;',
                         disabled: false,
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
                         id: 'user_email',
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
                   		 $('<button/>',{
                                class: 'btn btn-danger btn-sm',
                                id: 'adminUserDeleteBtn_personal',
                                text: '삭제',
                                value: items.user_email
                            })
                         /* $('<input/>',{
                             class: 'btn btn-danger btn-sm',
                             id: 'adminUserDeleteBtn_personal',
                             type: 'button',								
                             disabled: false,
                             value: items.user_email
                         }) */
                         /*  $('<a/>', {
                         class: 'btn btn-danger btn-sm',
                         id: 'adminUserDeleteBtn_personal',
                         title: '삭제',
                         text: '삭제',
                         disabled: false,
                         value: items.user_email
                     }) */
                     )//btn btn-danger
                 )//list-title-wrapper clearfix7

               .appendTo($('.list-group')); //마지막단   

            });//each
         	 //페이징 처리 챙기기!
         	 $('#userAdminPagingDiv').html(data.userAdminPaging.pagingHTML);
        }, //success
        error: function (err) {
            console.log(err);
        }
    });//ajax
});//function

//관리자는 삭제 안되게 불가하게 만들기(버튼 숨기기?)
/* $('.btn btn-danger btn-sm').attr('disabled', true);
$('.btn btn-danger btn-sm').prop('disabled', true);

$('#adminUserDeleteBtn_personal').attr('disabled', true);
$('#adminUserDeleteBtn_personal').prop('disabled', true); */

//카카오 회원(인증토큰이 매번 갱신되어서 관리자 권한으로 삭제 불가)은 체크박스 비활성화 하기(실패함/ 다른방법 찾아보기) 220716
/* $(document).on(function(){
	if($('.list-title-wrapper clearfix6').text()!='X') {
		$('#checkDelete').hide();
		} 

	$('input[type=checkbox]').prop('disabled', true);//제목만 없어짐
	$('input[type=checkbox]').attr('disabled', true);
	
	$("input:checkbox[id='checkDelete']").prop("disabled", false);
	$("input:checkbox[name='check']").prop("disabled", false);
	
	$("input:checkbox[id='checkDelete']").attr("disabled", false);
	$("input:checkbox[name='check']").attr("disabled", false);
	
	$('input[name="check"]').prop('disabled', true);
	$('input[name="check"]').attr('disabled', true);

	$('#checkDelete').attr('disabled', true);
	$('#checkDelete').prop('disabled', true);
	
	$('#checkDelete').prop('readonly', true);
	$('#checkDelete').attr('readonly', true);
}); */

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

//개별삭제 : 이메일 로그인 회원만 가능함
/* $(document).on("click", "#adminUserDeleteBtn_personal", function(){	 
	if(confirm('정말로 삭제하시겠습니까?')){
	$.ajax({
		type: 'post',
		url: '/semiproject/admin/adminUserDelete',
		data: {'user_email': $('#adminUserDeleteBtn_personal').val()},
		success: function(){
			alert('선택하신 회원의 정보를 삭제하였습니다.');
			location.href = '/semiproject/admin/adminUserAllList';	
		},
		error: function(err){
			console.log(err);
		}
	});
	}
}); */

//서치페이징
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

//서치 list
$('#userSearchBtn').click(function(){
	if($('#keyword').val()==''){
		alert('검색어를 입력하세요!')	
	}else{
	    $.ajax({
	        type: 'post',
	        url: '/semiproject/admin/adminUserSearch',
	        data: $('#userSearchForm').serialize(),
	        dataType: 'json',
	        success: function (data) {
	            alert(JSON.stringify(data));
	            //테이블에서 기존의 목록 제거
			 	$('.list-group li:gt(0)').remove();

	            $.each(data.list, function (index, items) {

	                $('<li/>', {
	                    class: 'list-group-item list-group-item-question list-group-has-note clearfix' //추후 hasnote를 social 여부로 변경해볼지?
	                })	

	               	.append(
	                     $('<div/>', {
	                         class: 'list-title-wrapper clearfix1',
	                         align: 'center',
	                         text: items.user_id,
	                         style: 'width:70px; height:35px; text-align:center; line-height:35px;'
	                     })
	                     .prepend($('<input/>', {
	                         type: 'checkbox',
	                         name: 'check',
	                         id: 'checkDelete',
	                         style: 'float: left; margin-top: 10px;',
	                         disabled: false,
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
	                         id: 'user_email',
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
	                   		 $('<button/>',{
	                                class: 'btn btn-danger btn-sm',
	                                id: 'adminUserDeleteBtn_personal',
	                                text: '삭제',
	                                value: items.user_email
	                            })
	                     )//btn btn-danger
	                 )//list-title-wrapper clearfix7

	               .appendTo($('.list-group')); //마지막단   

	            });//each
	         	 //페이징 처리 챙기기!
	            $('#userAdminPagingDiv').html(data.userAdminPaging.pagingHTML);
	        }, //success
	        error: function (err) {
	            console.log(err);
	        }
	    });
	}//else	
});
</script>
</body>
</html>