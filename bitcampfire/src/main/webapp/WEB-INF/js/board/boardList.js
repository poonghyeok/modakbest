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
	location.href="/semiproject/board/search?sortOption=date&keyword="+$('#search-field').val();
})

$('#boardWriteBtnAtList').click(function(){
	if(!$('#session_email').val()){
		alert('로그인 먼저해주세요');
		location.href="/semiproject/user/userLoginForm";
	}else{
		location.href="/semiproject/board/write";
	}
})
	
$('.category-sort-link').click(function(){
	let searchKeyword = $('#searchKeyword').val();
	let sortOption = $(this).attr('id').substring(4);
	
	/*	console.log('sortOption : ' + sortOption + ' searchKeyword : ' + searchKeyword);*/
	
	if(searchKeyword){
		//풍혁0714 : searchKeword가 있을 경우
		location.href="/semiproject/board/search?pg=1&sortOption="+sortOption+"&keyword="+searchKeyword;
	}else{
		location.href="/semiproject/board/list?pg=1&sortOption="+sortOption;
	}
	
})
	


