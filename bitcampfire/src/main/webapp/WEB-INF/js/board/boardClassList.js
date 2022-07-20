$(function(){
	let sort = $('#sortOption').val();
	$('#sort'+sort).addClass('active');
});

$('button.btn btn-default').click(function(){
	alert('button clicked..!');
});

/*title 이나, content 로 검색한 결과를 list로 표시하는 기능을 구현해보겠다.*/ 
$('button.btn,.btn-default').click(function(){ 
	location.href="/semiproject/board/boadClassSearchList?sortOption=date&keyword="+$('#search-field').val()+"&class_id="+$('#memClassid').val()+"&class_academy="+$('#memClass_academy').val();
});

$('#boardClassWriteBtnAtList').click(function(){
		location.href="/semiproject/board/classWrite?class_id="+$('#memClassid').val()+"&class_academy="+$('#memClass_academy').val();
});
	
$('.category-sort-link').click(function(){
	let searchKeyword = $('#searchKeyword').val();
	let sortOption = $(this).attr('id').substring(4);
	
	/*	console.log('sortOption : ' + sortOption + ' searchKeyword : ' + searchKeyword);*/
	 
	if(searchKeyword){
		//풍혁0714 : searchKeword가 있을 경우
		location.href="/semiproject/board/boadClassSearchList?pg=1&sortOption="+sortOption+"&keyword="+searchKeyword +"&class_id="+$('#memClassid').val()+"&class_academy="+$('#memClass_academy').val();
	}else{
		location.href="/semiproject/board/boardClassList?pg=1&sortOption="+sortOption+"&class_id="+$('#memClassid').val()+"&class_academy="+$('#memClass_academy').val();
	}
	
});
	


