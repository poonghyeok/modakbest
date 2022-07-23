<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bitcampfire - 회원관리</title>
		
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="/semiproject/css/board/boardList.css">
<link rel="stylesheet" href="/semiproject/css/board/boardList2.css">

</head>
<body>

<div class="layout-container">
	<div class="main">
		<!-- 풍혁0721 사이드 통일-->
		<jsp:include page="/WEB-INF/board/boardSideBar.jsp"/>
		<input id="category" type = 'text' value ='${param.category}'/>
		<!-- 풍혁0721 사이드 통일-->
	
		<!-- 풍혁 (220704) : 고정 (공지)list -->
		<div class="okkys-choice">
		    <div class="panel panel-default">
		        <!-- Table -->
		        <ul class="list-group">
		
		
		            <li class="list-group-item list-group-item-question list-group-has-note clearfix">
		
		                <div class="list-title-wrapper clearfix">
		                    <div class="list-tag clearfix">
		                        <span class="list-group-item-text article-id">board_id</span>
		                        <a href="/articles/tech-qna" class="list-group-item-text item-tag label label-info"><i
		                                class="fa fa-database"></i>자유주제</a>
		
		                        <a href="/articles/tagged/OKKY"
		                            class="list-group-item-text item-tag label label-gray ">CAMPFIRE</a>
		                    </div>
		
		                    <h5 class="list-group-item-heading list-group-item-evaluate">
		                        <a href="/article/423650">
		                            [태그 잊지말고 달기] Q&amp;A BITCAMPFIRE!
		                        </a>
		                    </h5>
		                </div>
		
		                <div class="list-summary-wrapper clearfix">
		                    <div class="list-group-item-summary clearfix">
		                        <ul>
		                            <li class=""><i class="item-icon fa fa-comment "></i> 27</li>
		                            <li class="">
		                                <i class="item-icon fa fa-thumbs-up"></i> 5
		                            </li>
		                            <li class=""><i class="item-icon fa fa-eye"></i> 4k</li>
		                        </ul>
		                    </div>
		                </div>
		                <!-- <div class="list-summary-wrapper clearfix">
				        <div class="item-evaluate-wrapper pull-right clearfix">
				            <div class="item-evaluate">
				                <div class="item-evaluate-icon">
				                    <i class="item-icon fa fa-thumbs-o-up"></i>
				                </div>
				                <div class="item-evaluate-count">
				                    	10
				                </div>
				            </div>
				            <div class="item-evaluate item-evaluate-has-note">
				                <div class="item-evaluate-icon">
				                        <i class="item-icon fa fa-exclamation-circle"></i>
				                </div>
				                <div class="item-evaluate-count">
				                    	10
				                </div>
				            </div>
				        </div>
				</div> -->
		
		                <div class="list-group-item-author clearfix">
		
		
		                    <div class="avatar clearfix avatar-list ">
		                        <a href="#" class="avatar-photo"><img
		                                src="//www.gravatar.com/avatar/b66da5ef6099211f5db8f5f7a3b4c36b?d=identicon&amp;s=30"></a>
		                        <div class="avatar-info">
		                            <a class="nickname" href="/user/info/45597" title="OKKY">BIRCAMPFIRE</a>
		                            <div class="activity"><span class="fa fa-flash"></span> 레벨</div>
		                            <div class="date-created"><span class="timeago"
		                                    title="2017-11-06T11:25:10">2017-11-06T11:25:10</span></div>
		                        </div>
		                    </div>
		                </div>
		            </li>
		        </ul>
		    </div>
		</div>
		<!-- 풍혁 (220704) : 고정 (공지)list -->
	
		
			
		<jsp:include page="/WEB-INF/global/footer.jsp"/>
	</div> <!-- main -->   
</div> <!-- layout-container -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/semiproject/js/admin/adminUserAllList.js"></script>
</body>
</html>
