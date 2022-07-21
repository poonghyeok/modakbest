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

<div class="layout-container">
	<div class="main">
		<input type="text" id="memClassid" value="${sessionScope.memClassid }">
		<input type="text" id="memClass_academy" value="${sessionScope.memClass_academy }">
		<input type = "text" id = "board_watcher" name = "board_watcher" value="${sessionScope.memId}">
		<input type="text" value="${sessionScope.memEmail}" id="session_email"> 
		<input type="hidden" value="${param.sortOption}" id="sortOption"> 
		<input type="hidden" value="${keyword}" id="searchKeyword"> 
		<!-- 풍혁 (220707) : 보드 고정 사이드바 jsp include -->
		<jsp:include page="/WEB-INF/board/boardSideBar.jsp"/>
		<!-- 풍혁 (220707) : 보드 고정 사이드바 jsp include -->
		
		<!-- 풍혁 (220704) : 상단 네비게이션 --> 
		<div class="nav" role="navigation">
			    <a class="create btn btn-success btn-wide pull-right" id = "boardClassWriteBtnAtList"><i class="fa fa-pencil"></i> 새 글 쓰기</a>
			    
			    <h4>${sessionScope.memClass_academy } 전용 게시판</h4>
			    <form id="category-filter-form" name="category-filter-form" method="get" action="/board/questions"> <!-- 풍혁(220704) : 검색 url 태워야합니다.   -->
				    <div class="category-filter-wrapper">
			            <div class="category-filter-query pull-right">
			                <div class="input-group input-group-sm">
			                    <input type="text" name="query" id="search-field" class="form-control" placeholder="검색어" value="">
			                    <span class="input-group-btn">
			                        <input type="button" class="btn btn-default" value = "검색"><!-- <i class="fa fa-search"></i> -->
			                    </span>
			                </div>
			            </div>
			            <ul class="list-sort pull-left">
			            	<!-- 정렬할 때  -->
			            	<!-- 풍혁 -->
<!-- 			            <li><a href="/semiproject/board/list?pg=1&sortOption=date" data-sort="id" id = "sortdate" data-order="desc" class="category-sort-link ">최신순</a></li>
			                <li><a href="/semiproject/board/list?pg=1&sortOption=vote" data-sort="voteCount" id = "sortvote" data-order="desc" class="category-sort-link ">추천순</a></li>
			                <li><a href="/semiproject/board/list?pg=1&sortOption=view" data-sort="viewCount" id = "sortview" data-order="desc" class="category-sort-link ">조회순</a></li>
 -->			            <li><a data-sort="id" id = "sortdate" data-order="desc" class="category-sort-link " style = "cursor: pointer;">최신순</a></li>
			                <li><a data-sort="voteCount" id = "sortvote" data-order="desc" class="category-sort-link " style = "cursor: pointer;">추천순</a></li>
			                <li><a data-sort="viewCount" id = "sortview" data-order="desc" class="category-sort-link " style = "cursor: pointer;">조회순</a></li>
			            </ul>
			            <input type="hidden" name="sort" id="category-sort-input" value="id"> <!-- 실제로 hidden type을 사용하네요  -->
			            <input type="hidden" name="order" id="category-order-input" value="desc">
				    	<!-- 풍혁(220704) : jquery로 value를 변경해가면서 list 변경하기? -->
				    </div>
				</form>
			</div>
		<!-- 풍혁 (220704) : 상단 네비게이션 --> 
		
		<!-- 풍혁 (220704) : 고정 (공지)list -->
		<div class="okkys-choice">
		    <div class="panel panel-default">
		        <!-- Table -->
		        <ul class="list-group">
		
		
				<li class="list-group-item list-group-item-question list-group-has-note clearfix">
		
				<div class="list-title-wrapper clearfix">
		    		<div class="list-tag clearfix">
		        		<span class="list-group-item-text article-id">board_id</span>
						<a href="/articles/tech-qna" class="list-group-item-text item-tag label label-info"><i class="fa fa-database"></i>자유주제</a>
		    
		        <a href="/articles/tagged/OKKY" class="list-group-item-text item-tag label label-gray ">CAMPFIRE</a>
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
		    <a href="#" class="avatar-photo"><img src="//www.gravatar.com/avatar/b66da5ef6099211f5db8f5f7a3b4c36b?d=identicon&amp;s=30"></a>
		    <div class="avatar-info">
		            <a class="nickname" href="/user/info/45597" title="OKKY">BIRCAMPFIRE</a>
		                <div class="activity"><span class="fa fa-flash"></span> 레벨</div>
		                <div class="date-created"><span class="timeago" title="2017-11-06T11:25:10">2017-11-06T11:25:10</span></div>
		    </div>
		</div>
		</div>
		</li>
		        </ul>
		    </div>
		</div>
		<!-- 풍혁 (220704) : 고정 (공지)list -->
		
		<!-- 풍혁(220714) : 중간광고 -->
		<div class="main-banner-wrapper">
           <div class="main-banner">
           	  <a href="/banner/stats/527" target="_i"><img src="//file.okky.kr/banner/1657005748618.png"></a>
           </div>
        </div>
		<!-- 풍혁(220714) : 중간광고 -->


		
		<!-- 풍혁(220705) : 유저작성 list-->
			<!-- 풍혁(220705) : 댓글이 있는 글 없는 글 li class 다름 -->
				<!-- 풍혁(220704) : table tag에서 okky 따라서 ul tag로 수정해보겠습니다.  -->
		<div class="panel panel-default questions-panel">
			<ul class="list-group">
				${userClassWriteTableList}
			</ul>
		</div>
		<!-- 풍혁(220705) : 유저작성 list-->
		
		<!-- 풍혁(220706) : page list -->
		<div class="text-center"> 
			<ul class="pagination pagination-sm">
				${boardClassPagingList}
			</ul>
		</div>
		<!-- 풍혁(220706) : page list -->
		
		<!-- 풍혁0714 우측광고, 추후 학원전용 채팅방으로 변경 예정 -->

		<!-- 풍혁0714 우측광고, 추후 학원전용 채팅방으로 변경 예정 -->
		
		<!-- 풍혁 (220707) : 보드 유저 공용 푸터 jsp include -->
			<jsp:include page="/WEB-INF/global/footer.jsp"/>
		<!-- 풍혁 (220707) : 보드 유저 공용 푸터 jsp include -->
		
	</div>
</div>

<!-- 풍혁(220705) : table 초기 ver -->
<!-- <table id ="boardlistTable">
	<tr>
		<th class = "notice_th" id = "thSubject">
			<span id = "tdSeq">#seqNo.162263</span><span id = "categoryTag"> TechQnA </span> <br>
			<span id = "boardSubject">[태그 잊지말고 달기] Q&A 좋은 답글 달리는 꿀팁!</span>
		</th>
		<th class = "notice_th" id = "thRecommend">
			<span id = "boardRecommend"><img alt="thumbs_up.jpg" src="#">rcmd_num(ex86</span>
		</th>
		<th class = "notice_th" id = "thState">
			<span id = "boardState">bootstrapState</span>
		</th>
		<th class = "notice_th" id = "thAuthor">
			<span id = "boardAuthor"> <img alt="user_icon.jpg" src="#"> master_id<br><span id = "boardLogdate">2017-11-06 11:25:10</span> </span>
		</th>
	</tr>
	
</table>
 -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/semiproject/js/board/boardClassList.js"></script>
</body>
</html>