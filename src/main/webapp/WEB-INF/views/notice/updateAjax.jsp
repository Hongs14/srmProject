<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
										
<c:forEach var="noticeFile" items="${noticeFile}">
	<div id="file${noticeFile.ntcFileNo}" class="filebox row">
		<span>
			<a class="delete col-1" onclick="deleteFile(${noticeFile.ntcFileNo})"><i class="far fa-minus-square"></i></a>
		</span>
		<span class="name col-11 text-left">${noticeFile.ntcFileActlNm}</span>
	</div>
</c:forEach>

