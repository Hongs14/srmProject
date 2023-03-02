<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="users" items="${pickName}">
	<div class="row">
		<div id="devNameInput" class="col-sm-2 col-form-label">
			<input name="userNo" id="userNo" type="hidden" value="${users.userNo}"/>
			<input name="hrLeader" type="hidden" value="N"/>
			<div id="pickDevNm">${users.userNm}</div>
		</div>
		<div class="col-sm-2">
			<select name="taskNo" class="form-control">
				<option>작업구분</option>
				<option value="2">설계</option>
				<option value="1">개발</option>
				<option value="3">테스트</option>
			</select>
		</div>
		<div class="col-8">
			<div class="row">
				<div class="col-sm-2 col-form-label"><h6 class="m-0 font-weight-bold text-primary">시작일</h6></div>
	          		<div class="col-sm-4">
	             		<input name="hrStartDate" type="date" class="form-control"/>
	          	 	</div>
	             	<div class="col-sm-2 col-form-label"><h6 class="m-0 font-weight-bold text-primary">종료일</h6></div>
	              	<div class="col-sm-4">
	               	<input name="hrEndDate" type="date" class="form-control"/>
	             	</div>
	           </div>
		</div>
	</div>
</c:forEach>
