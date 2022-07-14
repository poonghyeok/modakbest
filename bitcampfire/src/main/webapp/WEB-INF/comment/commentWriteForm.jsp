<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
		<!--댓글 -->
            <ul class="list-group" id = "comment_list">
                <li class="list-group-item note-form clearfix">
					<c:if test="${empty sessionScope.memEmail}">
						<div class="panel-body">
							<h5 class="text-center">
								<a href="/semiproject/user/userLoginForm" class="link">로그인</a>을 하시면
								답변을 등록할 수 있습니다.
							</h5>
						</div>
					</c:if>
					
					<c:if test="${not empty sessionScope.memEmail}">
					        <input type="hidden" name="_csrf" value="ab6da558-cc37-43f0-b598-0633d3b791f1">
					        <div class="content-body panel-body pull-left">
					            <div style="margin-left: 5px;">
					                <div class="avatar clearfix avatar-medium ">
					                    <a href="/user/info/133376" class="avatar-photo"><img
					                            src="/semiproject/storage/userprofile/${sessionScope.memImg}"></a>
					                    <div class="avatar-info">
					                        <a class="nickname" href="/user/info/133376" title="${sessionScope.memNickname}">${sessionScope.memNickname}</a>
					                        <div class="activity block"><span class="fa fa-flash"></span> 0</div>
					                    </div>
					                </div>
					            </div>
					            <fieldset class="form" id="commentFormChange">
					                <input type="hidden" name="textType" value="HTML" id="note.textType">
					                <textarea name="note.text" id="note-create" placeholder="댓글 쓰기" class="form-control"></textarea>
				            		<form id="commentContent" style="display:none"><textarea id="summernote" name="editordata"></textarea></form>
					            </fieldset>
					        </div>
					        <div class="content-function-cog note-submit-buttons clearfix">
					            <p><span id="note-create-cancel-btn" class="btn btn-default btn-wide">취소</a></span>
					            <input type="button" name="create" id="btn-create-btn" class="btn btn-success btn-wide" value="등록">
					        </div>
				    </c:if>
				</li>
			</ul>
	
