<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>bitcampfire - 회원정보 수정</title>
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/semiproject/css/user/application.css">
</head>			
<body>
<!-- @@@@ 이게 진짜(연수 220707) @@@@  -->
<div class="layout-container">
 	<div class="main">
 		<jsp:include page="/WEB-INF/user/userSideBar.jsp"/>
	
			<!-- 2. 메인페이지 -->
			<!-- 상단 광고 - 클릭 시 광고페이지로 이동 -->
			<div class="main-banner-wrapper">
			     <div class="main-banner">
			     	  <a href="/banner/stats/528" target="_o"><img src="" /></a>
			     </div> <!-- main-banner -->
			</div> <!-- main-banner-wrapper -->
			
			<!-- 메인페이지 제일 큰 틀 -->
			<div id="index" class="content scaffold-list clearfix" role="main">
			<!-- Editor's Choice  -->
			  	<div class="col-sm-6 main-block-left">
			    	  <div class="main-block">
			    	  	  <!-- 섹션제목 -->
			        	  <h4 class="main-header"><i class="fa fa-flag"></i> Editor's Choice</h4>
							<!-- Editor's Choice 섹션 리스트 시작  -->
							${list1}
			      </div> <!-- main-block -->
			  </div> <!-- col-sm-6 main-block-left -->
			 
			 
			<!-- Weekly Best -->  
			  <div class="col-sm-6 main-block-right">
			      <div class="main-block">
			          <h4 class="main-header"><i class="fa fa-star"></i> Weekly Best</h4>
						${list2}		
			  		      </div> <!-- main-block -->
		  	</div> <!-- col-sm-6 main-block-right -->
			
			
			<!-- Q&A  -->
			  <div class="col-sm-8 main-block-left">
			      <div class="main-block">
			          <h4 class="main-header"><i class="fa fa-database"></i> Q&A <a href="/semiproject/board/list?pg=1" class="main-more-btn pull-right"><i class="fa fa-ellipsis-h"></i></a></h4>
						${list3}
				</div> <!-- main-block -->
			 </div> <!-- col-sm-8 main-block-left -->      
			 
			<!-- 풍혁220708 : 일단 제외.. 커뮤니티       
			 <div class="main-block">
			     <h4 class="main-header"><i class="fa fa-comment"></i> 자유게시판 <a href="/semiproject/board/list?pg=1" class="main-more-btn pull-right"><i class="fa fa-ellipsis-h"></i></a></h4>
					
			     </div> main-header
			 </div> main-block -->
			  
			  <!--오른쪽 광고  안넣는다면  tech 게시판 위치 위로 --> 
			  <div class="col-sm-4 main-block-right">
			  			 <!-- 오른쪽 광고 -->
			    		 <div class="main-block">
				                <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
				                okkyad_250x250
				                <ins class="adsbygoogle"
				                     style="display:inline-block;width:250px;height:250px"
				                     data-ad-client="ca-pub-8103607814406874"
				                     data-ad-slot="4095178752"></ins> 
				                <script>
				                (adsbygoogle = window.adsbygoogle || []).push({});
				                </script>
			  			 </div> <!-- 오른쪽 광고 main-block -->
			
					 	  <!-- tech -->	
					      <div class="main-block">
					          <h4 class="main-header"><i class="fa fa-code"></i> Tech <a href="/semiproject/board/list?pg=1" class="main-more-btn pull-right"><i class="fa fa-ellipsis-h"></i></a></h4>
					              <div class="panel panel-default">
					                  <div class="panel-body">
					                  	  <div class="article-middle-block clearfix">
					                          <div class="list-tag clearfix" style="">
												<a href="/semiproject/board/list?pg=1" class="list-group-item-text item-tag label label-info"><i class="fa fa-code"></i> Tips & 강좌</a>
												<a href="# class="list-group-item-text item-tag label label-gray ">--</a>
												<a href="#" class="list-group-item-text item-tag label label-gray ">css</a>
												<a href="#" class="list-group-item-text item-tag label label-gray ">custom-property</a>
												<a href="#" class="list-group-item-text item-tag label label-gray ">double-hypen</a>
					                          </div> <!-- list-tag clearfix -->
						                          <h5>
						                          	<a href="/semiproject/board/getBoardView?board_id=42">VSCode에서 CSS custom property 주로 작업 하시는 분들</a>
						                          </h5>
					                          <div class="list-group-item-author clearfix">
													<div class="avatar clearfix avatar-x-small pull-right">
															<a href="#" class='avatar-photo'><img src="//file.okky.kr/profile/2022/1656014244006.jpg"/></a>
															<div class="avatar-info">
																	<a class="nickname" href="#" title="__flow__">__flow__</a>
																		<div class="activity"><span class="fa fa-flash"></span> 579</div>
																		<div class="date-created"><span class="timeago" title="2022-06-29T22:38:13">2022-06-29 22:38:13</span></div>
															</div><!--  avatar-info -->
													</div> <!-- list-group-item-author clearfix -->
					                          </div> <!-- article-middle-block clearfix -->
					                      </div> <!-- article-middle-block clearfix -->
					                  </div> <!-- panel panel-default -->
					              </div> <!-- main-header -->
					      </div> <!-- tech main-block -->
					
						  <!-- 칼럼  -->
					      <div class="main-block">
					          <h4 class="main-header"><i class="fa fa-quote-left"></i> 칼럼 <a href="/semiproject/board/list?pg=1" class="main-more-btn pull-right"><i class="fa fa-ellipsis-h"></i></a></h4>
					              <div class="panel panel-default">
					                  <div class="panel-body">
					                      <h5><a href="/semiproject/board/getBoardView?board_id=6">Scalability에 대해 (부제: 아마존 개발자는 왜 돈을 많이 받나)</a></h5>
					                      <p class="main-block-desc">&nbsp;<a href="/semiproject/getBoardView?board_id=2">  예전에 제 개인 페이스북에 올렸던 글을 공유합니다. 때문에 반말인 점은 양해 부탁 드립니다.             아침에 동전 세탁방에서 세탁을 돌려 놓고 Software En...</a></p>
					                  </div> <!-- panel panel-default -->
					              </div> <!-- main-header -->
					      </div> <!-- 칼럼 main-block -->
					      
					      <!-- 학원 홍보  -->
					      <div class="main-block">
							<h4 class="main-header"><i class="fa fa-book"></i> 학원/홍보 <a href="/semiproject/board/getBoardView?board_id=8" class="main-more-btn pull-right"><i class="fa fa-ellipsis-h"></i></a></h4>
							<div class="panel panel-default">
							    <ul class="list-group">
							            <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
							                <div class="list-title-wrapper">
							                    <h5 class="list-group-item-heading">
							                        <a href="/semiproject/board/getBoardView?board_id=43">merge하고 돌리기~!~!~!!</a>
							                        <div class="list-group-item-author pull-right clearfix">
											<div class="avatar clearfix avatar-x-small ">
													<a href="#" class='avatar-photo'><img src="//www.gravatar.com/avatar/7c8fcee3b37452bdfd7feb1a7e40e059?d=identicon&s=10"/></a>
													<div class="avatar-info">
															<a class="nickname" href="#" title="RedCoding">RedCoding</a>
																<div class="activity"><span class="fa fa-flash"></span> 110</div>
																<div class="date-created"><span class="timeago" title="2022-06-28T15:48:25">2022-06-28 15:48:25</span></div>
													</div>
											</div>
							                       </div>
							                   </h5>
							               </div>
							            </li>
				
								    </ul>
								</div>
					        </div>
					    </div> <!-- main-block -->
			 </div> <!-- col-sm-4 main-block-right -->
			
			
			<!-- 오른쪽 광고 영역 -->
			<div class="right-banner-wrapper">
				<div class="right-banner">
			             <a href="#" target="_n"><img src="//file.okky.kr/banner/1655430555113.jpg" style="width:160px;"/></a>
			    </div> <!-- right-banner -->
			
				<div class="google-ad">
				        <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
				          <!-- okjspad_160x500 -->
				        <ins class="adsbygoogle"
				             style="display:inline-block;width:160px;height:500px"
				             data-ad-client="ca-pub-8103607814406874"
				             data-ad-slot="6573675943"></ins>
				        <script>
				             (adsbygoogle = window.adsbygoogle || []).push({});
				        </script>
				 </div> <!-- google-ad -->
			 </div> <!-- right-banner-wrapper -->
	    
	        
	    <!-- 메인끝  -->
 		 <jsp:include page="/WEB-INF/global/footer.jsp"/>  
   </div> <!-- main -->   
</div> <!-- layout-container -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>
<!-- @@@@ 이게 진짜(연수 220707) @@@@  -->
