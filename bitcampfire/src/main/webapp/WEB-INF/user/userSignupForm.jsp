<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/semiproject/css/user/signupForm.css">
</head>
<body>
<div class="layout-container">
 	<div class="main">
 	<!-- 연수(2207007) 사이드바 -->
 		<jsp:include page="/WEB-INF/user/userSideBar.jsp"/>	            
			<!-- 메인시작  -->	
			<div id="create-user" class="content" role="main">
				<jsp:include page="/WEB-INF/user/userSignupForm_main.jsp"/>

			</div>

			<!-- 메인끝 -->
<%-- 		<jsp:include page="/WEB-INF/global/footer.jsp"/>    --%> 
   	</div> <!-- main -->   
</div> <!-- layout-container -->

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type = "text/javascript" src="/semiproject/js/user/userSignupForm.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dc78e967df29d8230c51a513536953f8&libraries=services"></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>