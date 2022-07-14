/**
 * 풍혁 ( 220706 ) : jquery 를 이용한 list sort로 구현 
 * 					: 검색은 원래 배웠던대로 
 * 
 */
$(function(){
	let sort = $('#sortOption').val();
	$('#sort'+sort).addClass('active');
})

$('button.btn btn-default').click(function(){
	alert('button clicked..!');
})

/*title 이나, content 로 검색한 결과를 list로 표시하는 기능을 구현해보겠다.*/ 
$('button.btn,.btn-default').click(function(){ 
	location.href="/semiproject/board/search?keyword="+$('#search-field').val();
})

$('#boardWriteBtnAtList').click(function(){
	if(!$('#session_email').val()){
		alert('로그인 먼저해주세요');
		location.href="/semiproject/user/userLoginForm";
	}else{
		location.href="/semiproject/board/write";
	}
})
	

	


