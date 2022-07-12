<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/summernote3/summernote-lite.css">
</head>
<body>
<div class="container">
  <textarea class="summernote" name="editordata"></textarea>    
</div>

<script type="text/javascript"  src="http://code.jQuery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- 서머노트를 위해 추가해야할 부분 -->
<script src="${pageContext.request.contextPath}/summernote3/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/summernote3/summernote-ko-KR.js"></script>

<script>
$('.summernote').summernote({
	height: 300,                 // 에디터 높이
	minHeight: null,             // 최소 높이
	maxHeight: null,             // 최대 높이
	focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	lang: "ko-KR",					// 한글 설정
	placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
});
</script>

</body>
</html>