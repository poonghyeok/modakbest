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
		<!-- 풍혁 (220707) : 보드 고정 사이드바 jsp include -->
		<jsp:include page="/WEB-INF/board/boardSideBar.jsp"/>
		<!-- 풍혁 (220707) : 보드 고정 사이드바 jsp include -->
		
		<!-- 풍혁 (220704) : 상단 네비게이션 --> 
		<div class="nav" role="navigation">
			    <a class="create btn btn-success btn-wide pull-right" href="/semiproject/board/write"><i class="fa fa-pencil"></i> 새 글 쓰기</a>
			    
			    <h4>Q&amp;A</h4>
			    <form id="category-filter-form" name="category-filter-form" method="get" action="/board/questions"> <!-- 풍혁(220704) : 검색 url 태워야합니다.   -->
				    <div class="category-filter-wrapper">
			            <div class="category-filter-query pull-right">
			                <div class="input-group input-group-sm">
			                    <input type="search" name="query" id="search-field" class="form-control" placeholder="검색어" value="">
			                    <span class="input-group-btn">
			                        <button type="button" class="btn btn-default"><i class="fa fa-search"></i></button>
			                    </span>
			                </div>
			            </div>
			            <ul class="list-sort pull-left">
			            	<!-- 정렬할 때  -->
			            	<!-- 풍혁 -->
			            	<li><a href="#" data-sort="id" data-order="desc" class="category-sort-link active">최신순</a></li>
			                <li><a href="#" data-sort="voteCount" data-order="desc" class="category-sort-link ">추천순</a></li>
			                <li><a href="#" data-sort="viewCount" data-order="desc" class="category-sort-link ">조회순</a></li>
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
						<a href="/articles/tech-qna" class="list-group-item-text item-tag label label-info"><i class="fa fa-database"></i> 자유주제</a>
		    
		        <a href="/articles/tagged/OKKY" class="list-group-item-text item-tag label label-gray ">CAMPFIRE</a>
		    </div>
		
		    <h5 class="list-group-item-heading list-group-item-evaluate">
		        <a href="/article/423650">
		            [태그 잊지말고 달기] Q&amp;A BITCAMPFIRE!
		        </a>
		    </h5>
		</div>
		
		<div class="list-summary-wrapper clearfix">
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
		    
		</div>
		
		<div class="list-group-item-author clearfix">
		
		
		<div class="avatar clearfix avatar-list ">
		    <a href="/user/info/45597" class="avatar-photo"><img src="//www.gravatar.com/avatar/b66da5ef6099211f5db8f5f7a3b4c36b?d=identicon&amp;s=30"></a>
		    <div class="avatar-info">
		            <a class="nickname" href="/user/info/45597" title="OKKY">BIRCAMPFIRE</a>
		                <div class="activity"><span class="fa fa-flash"></span> 레벨</div>
		                <div class="date-created"><span class="timeago" title="2017-11-06T11:25:10">여긴 공지 작성 시간 들어와야 됨</span></div>
		    </div>
		</div>
		</div>
		</li>
		        </ul>
		    </div>
		</div>
		<!-- 풍혁 (220704) : 고정 (공지)list -->
		
		<!-- 풍혁(220705) : 유저작성 list-->
			<!-- 풍혁(220705) : 댓글이 있는 글 없는 글 li class 다름 -->
				<!-- 풍혁(220704) : table tag에서 okky 따라서 ul tag로 수정해보겠습니다.  -->
		<div class="panel panel-default questions-panel">
			<ul class="list-group">
				${userWriteTableList}
			</ul>
		</div>
		<!-- 풍혁(220705) : 유저작성 list-->
		
		<!-- 풍혁(220706) : page list -->
		<div class="text-center"> 
			<ul class="pagination pagination-sm">
				${boardPagingList}
			</ul>
		</div>
		<!-- 풍혁(220706) : page list -->
		
		<!-- 풍혁 (220707) : 보드 고정 사이드바 jsp include -->
			<jsp:include page="/WEB-INF/global/footer.jsp"/>
		<!-- 풍혁 (220707) : 보드 고정 사이드바 jsp include -->
		
	</div>
</div>



<!-- <h3>Q&A</h3>
<input type="button" value="새 글 쓰기">

<div id = "sortConditionList" >
	<span id = "sortListByTime" class = "sortCondition"><a href="#">최신순 </a></span>
	<span id = "sortListByRecommend" class = "sortCondition"><a href="#">추천순</a></span>
	<span id = "sortListByScrap" class = "sortCondition"><a href="#">스크랩순</a></span>
	<span id = "sortListByView" class = "sortCondition"><a href="#">조회순</a></span>
	
	<span><input type="text" placeholder="검색어" id = "listSearchKeyword"><input type="button" value="검색하기" id = "listSearchButton"></span>
</div>
 -->



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
<script type="text/javascript" src="/semiproject/js/board/boardList.js"></script>
</body>
</html>

<!-- 1.state랑 글 td의 색을 통일하고 있다. --> 