<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="row">
	<div class="col-1"><input type="checkbox" onclick="selectAll(this)" id="allcheck" class="selectall"/></div>
	<div class="col-1">직책</div>
	<div class="col-2">성명</div>
	<div class="col-2">전화번호</div>
	<div class="col-6">현재 업무사항</div>
</div>
<hr/>
<c:forEach var="users" items="${devlistByDp}">
 <div class="row"> 
	<div class="col-1"><input type="checkbox" onclick="checkSelectAll(this)" class="selectall" name="devName" id="${users.userNo}" value="${users.userNo}"></div> 
 	<div class="col-1">${users.userJbps}</div> 
 	<div class="col-2">${users.userNm}&nbsp;[${users.devList.size()}건]</div> 

	<div class="col-2">${users.userTelno}</div> 
 	<div class="col-6"> 
		<c:if test="${users.devList.size() != 0}">
			<c:forEach var="devlist" items="${users.devList}">
				<div class="row">
					<div style="text-color:#406882"><b><fmt:formatDate value="${devlist.hrEndDate}" pattern="yyyy/MM/dd"/></b></div>
					 ~<div style="text-color:#406882"><b><fmt:formatDate value="${devlist.hrEndDate}" pattern="yyyy/MM/dd"/></b></div>
					&nbsp;<div>${devlist.srTtl}</div>
					&nbsp;/&nbsp;<div>${devlist.taskNm}</div>
				</div>
			</c:forEach> 
		</c:if>
	</div>
</div>
<hr/>
</c:forEach>
