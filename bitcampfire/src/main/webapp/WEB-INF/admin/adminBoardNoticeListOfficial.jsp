<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 게시판 상단 공지  -->
<input type="hidden" value="${param.category}" id="category">
<div class="okkys-choice">
    <div class="panel panel-default">
    	<!-- 클래스명 같으면 같은 클래스에 다 달라붙어서 아이디값 부여 -->
    	<ul class="list-group" id="notice-group">
        <!-- 동적처리  -->
        </ul>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 연수 : js파일 별도 생성 (220726) -->
<script type="text/javascript" src="/semiproject/js/admin/adminBoardNoticeListOfficial.js"></script>
