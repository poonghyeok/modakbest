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
							<div class="panel panel-default">
						    	<ul class="list-group">
						    	
						    		<!-- 글제목  -->
						            <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
						                <div class="list-title-wrapper">
						                    <h5 class="list-group-item-heading">
						                        <a href="/article/1257142">파이탱</a>
						                        <div class="list-group-item-author pull-right clearfix">
				
					
												<!-- 개인아이콘 닉네임 -->
												<div class="avatar clearfix avatar-x-small ">
														<!-- 개인 아이콘 -->
														<a href="/user/info/45597" class='avatar-photo'><img src="//www.gravatar.com/avatar/b66da5ef6099211f5db8f5f7a3b4c36b?d=identicon&s=10"/></a>
														<div class="avatar-info">
																<!-- 닉네임 -->
																<a class="nickname" href="/user/info/45597" title="OKKY">비트캠프파이어</a>
																	<!-- 팔로운가? -->
																	<div class="activity"><span class="fa fa-flash"></span> 4k</div>
																	<!-- 글생성 날짜 -->
																	<div class="date-created"><span class="timeago" title="2022-06-24T15:25:55">2022-06-24 15:25:55</span></div>
														</div> <!-- avatar-info -->
												</div> <!-- avatar clearfix avatar-x-small -->
			                        
						                        </div> <!-- list-group-item-author pull-right clearfix -->
						                    </h5> <!-- list-group-item-heading  -->
						                </div> <!-- list-title-wrapper -->
						            </li> <!-- list-group-item list-group-item-small --> 
						    </ul> <!-- list-group -->
						</div> <!-- panel panel-default -->
			      </div> <!-- main-block -->
			  </div> <!-- col-sm-6 main-block-left -->
			 
			 
			<!-- Weekly Best -->  
			  <div class="col-sm-6 main-block-right">
			      <div class="main-block">
			          <h4 class="main-header"><i class="fa fa-star"></i> Weekly Best</h4>
						<div class="panel panel-default">
						    <ul class="list-group">
						            <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
						                <div class="list-title-wrapper">
						                    <h5 class="list-group-item-heading">
						                        <a href="/article/1256795">주 92시간 시대가 열리고</a>
						                        <div class="list-group-item-author pull-right clearfix">
						
													<div class="avatar clearfix avatar-x-small ">
															<a href="/user/info/22487" class='avatar-photo'><img src="//www.gravatar.com/avatar/6e61e0bff69a035c0dbd4795e504a749?d=identicon&s=10"/></a>
															<div class="avatar-info">
																	<a class="nickname" href="/user/info/22487" title="조용히살자">조용히살자</a>
																		<div class="activity"><span class="fa fa-flash"></span> 5k</div>
																		<div class="date-created"><span class="timeago" title="2022-06-24T09:53:27">2022-06-24 09:53:27</span></div>
															</div> <!-- avatar-info -->
													</div> <!-- avatar clearfix avatar-x-small -->
						                        </div> <!-- list-group-item-author pull-right clearfix -->
						                    </h5> <!-- list-group-item-heading -->
						                </div> <!-- list-title-wrapper -->
						            </li> <!-- list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix -->
							    </ul> <!-- list-group -->
							</div> <!-- main-header -->
					      </div> <!-- main-block -->
					  </div> <!-- col-sm-6 main-block-right -->
			
			
			<!-- Q&A  -->
			  <div class="col-sm-8 main-block-left">
			      <div class="main-block">
			          <h4 class="main-header"><i class="fa fa-database"></i> Q&A <a href="/articles/questions" class="main-more-btn pull-right"><i class="fa fa-ellipsis-h"></i></a></h4>
							<div class="panel panel-default">
							    <ul class="list-group">
							            <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
							                <div class="list-title-wrapper">
							                    <h5 class="list-group-item-heading">
							                        <a href="/article/1261184">타입스크립트 질문드립니다.</a>
							                        <div class="list-group-item-author pull-right clearfix">	
							
															<div class="avatar clearfix avatar-x-small ">
																	<a href="/user/info/6470" class='avatar-photo'><img src="//www.gravatar.com/avatar/0b864b1a19602af64b02d8c87243efe4?d=identicon&s=10"/></a>
																	<div class="avatar-info">
																			<a class="nickname" href="/user/info/6470" title="takin17">takin17</a>
																				<div class="activity"><span class="fa fa-flash"></span> 4k</div>
																				<div class="date-created"><span class="timeago" title="2022-06-30T14:24:14">2022-06-30 14:24:14</span></div>
														     </div> <!-- avatar-info -->
														 </div> <!--  avatar clearfix avatar-x-small -->
							                        </div> <!-- list-group-item-author pull-right clearfix -->
							                    </h5> <!-- list-group-item-heading -->
							                </div> <!-- list-title-wrapper -->
							            </li> <!-- list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix -->
				    </ul> <!-- main-header -->
				</div> <!-- main-block -->
			 </div> <!-- col-sm-8 main-block-left -->      
			 
			<!-- 커뮤니티   -->     
			 <div class="main-block">
			     <h4 class="main-header"><i class="fa fa-comment"></i> 커뮤니티 <a href="/articles/community" class="main-more-btn pull-right"><i class="fa fa-ellipsis-h"></i></a></h4>
					<div class="panel panel-default">
					    <ul class="list-group">
					            <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
					                <div class="list-title-wrapper">
					                    <h5 class="list-group-item-heading">
					                        <a href="/article/1261185">자율주행 로봇 관제 서버 개발 직무에 관하여...질문</a>
					                        <div class="list-group-item-author pull-right clearfix">									
											
											<div class="avatar clearfix avatar-x-small ">
													<a href="/user/info/119026" class='avatar-photo'><img src="//www.gravatar.com/avatar/e28c45d10c2c24884465b3f0c0c2e8ca?d=identicon&s=10"/></a>
													<div class="avatar-info">
															<a class="nickname" href="/user/info/119026" title="tojaeung">tojaeung</a>
																<div class="activity"><span class="fa fa-flash"></span> 1k</div>
																<div class="date-created"><span class="timeago" title="2022-06-30T14:24:36">2022-06-30 14:24:36</span></div>
													 </div> <!-- avatar-info -->
												</div>	<!-- avatar clearfix avatar-x-small -->
							              </div> <!-- list-group-item-author pull-right clearfix -->
				                    </h5> <!-- list-group-item-heading -->
				                </div> <!-- list-title-wrapper -->
				            </li> <!-- list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix -->
			
			   			</ul> <!-- list-group -->
					</div> <!-- panel panel-default -->
			     </div> <!-- main-header -->
			 </div> <!-- main-block -->
			  
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
					          <h4 class="main-header"><i class="fa fa-code"></i> Tech <a href="/articles/tech" class="main-more-btn pull-right"><i class="fa fa-ellipsis-h"></i></a></h4>
					              <div class="panel panel-default">
					                  <div class="panel-body">
					                  	  <div class="article-middle-block clearfix">
					                          <div class="list-tag clearfix" style="">
												<a href="/articles/tips" class="list-group-item-text item-tag label label-info"><i class="fa fa-code"></i> Tips & 강좌</a>
												<a href="/articles/tagged/--" class="list-group-item-text item-tag label label-gray ">--</a>
												<a href="/articles/tagged/css" class="list-group-item-text item-tag label label-gray ">css</a>
												<a href="/articles/tagged/custom-property" class="list-group-item-text item-tag label label-gray ">custom-property</a>
												<a href="/articles/tagged/double-hypen" class="list-group-item-text item-tag label label-gray ">double-hypen</a>
					                          </div> <!-- list-tag clearfix -->
						                          <h5>
						                          	<a href="/article/1260600">VSCode에서 CSS custom property 주로 작업 하시는 분들</a>
						                          </h5>
					                          <div class="list-group-item-author clearfix">
													<div class="avatar clearfix avatar-x-small pull-right">
															<a href="/user/info/109065" class='avatar-photo'><img src="//file.okky.kr/profile/2022/1656014244006.jpg"/></a>
															<div class="avatar-info">
																	<a class="nickname" href="/user/info/109065" title="__flow__">__flow__</a>
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
					          <h4 class="main-header"><i class="fa fa-quote-left"></i> 칼럼 <a href="/articles/columns" class="main-more-btn pull-right"><i class="fa fa-ellipsis-h"></i></a></h4>
					              <div class="panel panel-default">
					                  <div class="panel-body">
					                      <h5><a href="/article/1258842">Scalability에 대해 (부제: 아마존 개발자는 왜 돈을 많이 받나)</a></h5>
					                      <p class="main-block-desc">&nbsp;<a href="/article/1258842">  예전에 제 개인 페이스북에 올렸던 글을 공유합니다. 때문에 반말인 점은 양해 부탁 드립니다.             아침에 동전 세탁방에서 세탁을 돌려 놓고 Software En...</a></p>
					                  </div> <!-- panel panel-default -->
					              </div> <!-- main-header -->
					      </div> <!-- 칼럼 main-block -->
					      
					      <!-- 학원 홍보  -->
					      <div class="main-block">
							<h4 class="main-header"><i class="fa fa-book"></i> 학원/홍보 <a href="/articles/promote" class="main-more-btn pull-right"><i class="fa fa-ellipsis-h"></i></a></h4>
							<div class="panel panel-default">
							    <ul class="list-group">
							            <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
							                <div class="list-title-wrapper">
							                    <h5 class="list-group-item-heading">
							                        <a href="/article/1259409">초등 청소년 게임으로 배우는 온라인 일대일 자바 코딩수업</a>
							                        <div class="list-group-item-author pull-right clearfix">
											<div class="avatar clearfix avatar-x-small ">
													<a href="/user/info/142094" class='avatar-photo'><img src="//www.gravatar.com/avatar/7c8fcee3b37452bdfd7feb1a7e40e059?d=identicon&s=10"/></a>
													<div class="avatar-info">
															<a class="nickname" href="/user/info/142094" title="RedCoding">RedCoding</a>
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
			             <a href="/banner/stats/519" target="_n"><img src="//file.okky.kr/banner/1655430555113.jpg" style="width:160px;"/></a>
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
