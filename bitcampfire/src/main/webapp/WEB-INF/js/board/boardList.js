''/**
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
	if(!$('#search-field').val()){
		alert('검색어를 입력해주세요!');
		$('#search-field').focus();
	}else{
		location.href="/semiproject/board/search?category="+$('#category').val()+"&sortOption=date&keyword="+$('#search-field').val();
	}
})

$('#boardWriteBtnAtList').click(function(){
	if(!$('#session_email').val()){
		alert('로그인 먼저해주세요');
		location.href="/semiproject/user/userLoginForm";
	}else{
		location.href="/semiproject/board/write?category="+$('#category').val();
	}
})
	
$('.category-sort-link').click(function(){
	let searchKeyword = $('#searchKeyword').val();
	let sortOption = $(this).attr('id').substring(4);
	
	/*	console.log('sortOption : ' + sortOption + ' searchKeyword : ' + searchKeyword);*/
	
	if(searchKeyword){
		//풍혁0714 : searchKeword가 있을 경우
		location.href="/semiproject/board/search?category="+$('#category').val()+"&pg=1&sortOption="+sortOption+"&keyword="+searchKeyword;
	}else{
		location.href="/semiproject/board/list?category="+$('#category').val()+"&pg=1&sortOption="+sortOption;
	}
	
})

//@@@@@ 연수 검색 엔터키 이벤트 추가(220719) 
$(function(){		
	//Block Enter key events. 엔터키 이벤트 막기.		
	$(document).keypress(function (e) {			
		if (e.keyCode == 13) {
			e.preventDefault();		
			}	
	});		
	//검색 박스에서 에서 Enter키를 누를 때 검색 버튼을 클릭.		
	$('#search-field').keypress(function (e) {		 
		if(e.keyCode == 13) { 				
			$('#boardSearchBtn').click();			
				return false;  		  
			}		
	});   	
});
	


