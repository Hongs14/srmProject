<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <script>
	$(document).ready(function compare() {
			let leader =  $("#pickDevNm").text();
		    console.log("aa "+leader);
		
	});
</script>
<c:if test="${leader ne '김태희' }"> --%>
	<c:forEach var="users" items="${pickName}">
		<c:if test="${users.userNo != leader}"></c:if>
		<div class="row mb-1">
			<div id="devNameInput" class="col-sm-2 col-form-label">
				<input name="userNo" type="hidden" value="${users.userNo}"/>
				<div id="pickDevNm">${users.userNm}</div>
			</div>
			<div class="col-sm-2">
				<select class="form-control">
					<option>작업구분</option>
					<option>설계</option>
					<option>구현</option>
					<option>테스트</option>
				</select>
			</div>
			<div class="col-8">
				<div class="row">
					<div class="col-sm-2 col-form-label"><h6 class="m-0 font-weight-bold text-primary">시작일</h6></div>
	           		<div class="col-sm-4">
	              		<input type="date" class="form-control"/>
	           	 	</div>
	              	<div class="col-sm-2 col-form-label"><h6 class="m-0 font-weight-bold text-primary">종료일</h6></div>
	               	<div class="col-sm-4">
	                	<input type="date" class="form-control"/>
	              	</div>
	            </div>
			</div>
		</div>
	</c:forEach>
<%-- </c:if> --%>