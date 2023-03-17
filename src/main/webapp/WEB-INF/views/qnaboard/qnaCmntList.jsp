<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<c:forEach items="${list}" var="list">
	<div id="readCmnt">
		<div class="d-flex px-2 flex-row align-items-center justify-content-between">
			<div>
				<h6 style="color: #406882"><b>${list.userNm}</b></h6>
				<h6>${list.qstnCmntDate}</h6>
			</div>
			<div>
				<input type="hidden" id="qstnCmntNo" value="${list.qstnCmntNo}"/>
					<c:if test="${list.userNm eq sessionScope.loginUser.userNm}">
						<a id="updateToggle${list.qstnCmntNo}" onclick="updateCButton(${list.qstnCmntNo})" style="cursor:pointer;">수정</a> | <a onclick="deleteComment(${list.qstnCmntNo})" style="cursor:pointer;">삭제</a> 
					</c:if>
			</div>
		</div>
		<textarea id="commentContent${list.qstnCmntNo}" disabled="disabled" style="border: none; resize:none; width:90%; background-color: #dfdfe3">${list.qstnCmntCn}</textarea>
	<hr/>
	</div>
	</c:forEach>

</html>
