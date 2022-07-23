<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 게시판 공지  -->
<input type="text" value="${param.category}" id="category"> 
<div class="okkys-choice">
    <div class="panel panel-default">
    	${adminNoticeOfficialTableList}	
    </div>
</div>