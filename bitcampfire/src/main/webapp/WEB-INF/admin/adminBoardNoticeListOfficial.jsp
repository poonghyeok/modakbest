<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 게시판 상단 공지  -->
<input type="hidden" value="${param.category}" id="category">
<div class="okkys-choice">
    <div class="panel panel-default">
    	<!-- 클래스명 같으면 같은 클래스에 다 달라붙어서 아이디값 부여 -->
    	<ul class="list-group" id="notice-group">
        <!-- 동적처리  -->
        </ul>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
//@@@@@ 게시판 상단 공지
$(function() {
    $.ajax({
	    type: 'post',
	    url: '/semiproject/admin/adminBoardNoticeListOfficial',
	    data: 'category=' + $('#category').val(),
	    dataType: 'json',
	    success: function(data) {
	        //alert(JSON.stringify(data));
	        //console.log(data);
	
	        $.each(data, function(index, items) { // 배열or객체 , function(키, 값)
					//제일 큰 틀 
                    $('<li/>', {
                            class: 'list-group-item list-group-item-question clearfix',
                            id: 'li' + items.board_id //전체공지: has note, 그외공지: no note
                        })
						//1번
                        .append(
                            $('<div/>', {
                                class: 'list-title-wrapper clearfix'                                
                            })
                            .append(
	                            $('<input/>', {
	                                type: 'hidden',
	                                id: 'board_uid'+items.board_id,
	                                value: items.board_uid                                
	                            })
                            )//유저 정보 가져오기 위해 board_uid 숨겨봄
                            .append(
                                $('<div/>', {
                                    class: 'list-tag clearfix'
                                })                                
                                .append(
                                    $('<span/>', {
                                        class: 'list-group-item-text article-id',
                                        text: items.board_id+'  '
                                    })
                                 )//list-group-item-text article-id
		                        .append(
		                            $('<a/>', {
		                                class: 'list-group-item-text item-tag label label-info',
		                                href: '#',
		                                id: 'board_cateid'+items.board_id,
		                                text: '  '+items.board_cateid+'  ' 
		                            })
	                            )//list-group-item-text item-tag label label-info		                            
		                        .append(
		                            $('<span/>', {
		                                class: 'list-group-item-text article-id'		                                
		                            })
		                            .append(
		                                $('<i/>', {
		                                    class: 'item-icon fa fa-eye',
		                                    text: '  '+items.board_view_cnt+'  '
		                                })
	                                )//item-icon fa fa-eye
	                        	)//list-group-item-text article-id		                        
	                		) //list-tag clearfix		                	
		                	
			                .append(
			                    $('<h5/>', {
			                        class: 'list-group-item-heading list-group-item-evaluate'
			                    })
			                    .append(
			                        $('<a/>', {
			                            href: '/semiproject/admin/getAdminBoardNoticeView?category=admin&board_id='+items.board_id+'&pg=1',
			                            text: items.board_title //위치확인 - 제목 누르면 가는느낌
			                        })
		                        ) //a
			                ) //h5
			            ) //class='list-title-wrapper clearfix'
  
			            .append(
			                $('<div/>', {
			                    class: 'list-group-item-author clearfix'			                    
			                })
			                .append(
			                    $('<div/>', {
			                        class: 'avatar clearfix avatar-list'
			                    })
			                    .append(
			                        $('<a/>', {
			                            class: 'avatar-photo',
			                            id: 'user_profile'+items.board_id,
			                            href: ''
			                        })
			                        .append(
			                            $('<img/>', {
			                                id: 'user_img'+items.board_id,
			                            	src: ''
		                            	})
		                            ) //img
	                   			) //avartar-photo
			                    .append(
			                        $('<div/>', {
			                            class: 'avatar-info'
			                        })
			                        .append(
			                            $('<a/>', {
			                                class: 'nickname',
			                                id: 'user_nickname'+items.board_id,
			                                text: '',
			                                href: ''
			                            })
			                        )//a-nickname
			                        .append(
			                            $('<div/>', {
			                                class: 'activity',
			                                text: 'lev'
                                        })
                                    	.append(
				                            $('<span/>', {
				                                class: 'fa fa-flash'	
	                                        })
                                      	)//fafa                                        
			                        )//activity
			                        .append(
			                            $('<div/>', {
			                                class: 'date-created'
			                            })
			                            .append(
			                                $('<span/>', {
			                                    class: 'timeago',
			                                    title: items.board_date_created,
			                                    text: items.board_date_created
			                                })
			                            ) //timeago
			                        ) //date-created						
			                    ) //avatar-info
			                ) //avatar clearfix avatar-list
			            ) //list-group-item-author clearfix
			            
			            //클래스명 같으면 같은 클래스에 다 달라붙어서 아이디값 부여
			            .appendTo($('#notice-group')); //마지막단 
			            
			            //전체공지: 파란불, 게시판별 공지: 회색불
			            $(document).ready(function(){
			               if($('#board_cateid'+items.board_id).text()!=6) {
								$('#li'+items.board_id).addClass("list-group-no-note");
			               }else{
								$('#li'+items.board_id).addClass("list-group-has-note");
			               }	               
			            });
	        			
	        			//cateid: 한글로 바꿔주기
			            $(document).ready(function(){
			            	if($('#board_cateid'+items.board_id).text()==1) {
			            		document.getElementById('board_cateid'+items.board_id).innerHTML = '취업정보';
			            	}
			            	else if($('#board_cateid'+items.board_id).text()==2){
			            		document.getElementById('board_cateid'+items.board_id).innerHTML = '후기';
			            	}
		            		else if($('#board_cateid'+items.board_id).text()==3){
			            		document.getElementById('board_cateid'+items.board_id).innerHTML = 'Q&nbsp;&&nbsp;A';
			            	}
            				else if($('#board_cateid'+items.board_id).text()==4){
			            		document.getElementById('board_cateid'+items.board_id).innerHTML = '자유게시판';
			            	}
            				else if($('#board_cateid'+items.board_id).text()==5){
			            		document.getElementById('board_cateid'+items.board_id).innerHTML = '학원전용게시판';
			            	}
       						else{
			            		document.getElementById('board_cateid'+items.board_id).innerHTML = '전체공지';
			            	}
			            });
	        
			          //유저 정보 가져오기
					  $(document).ready(function(){
					  	   $.ajax({
					 			type: 'post',
					 			url: '/semiproject/admin/getUserInfoForNoticeList',
					 			data: {'board_uid': $('#board_uid'+items.board_id).val()},
					 			success: function(data){
					 				//alert(JSON.stringify(data));					 				
					 				document.getElementById("user_profile"+items.board_id).href="/semiproject/user/userPage?user_id="+data.user_id;
					 				document.getElementById("user_img"+items.board_id).src="/semiproject/storage/userprofile/"+data.user_img;
					 				$('#user_nickname'+items.board_id).html(data.user_nickname);
					 				document.getElementById("user_nickname"+items.board_id).href="/semiproject/user/userPage?user_id="+data.user_id;        				
					  			},
					  			error: function(err){
					  				console.log(err);
					  			}
					  	   	});
						});   
				    }); //each
						
		    	}, //success
				error: function(err) {
				    console.log(err);
				}
	    }); //ajax
}); //function
</script>