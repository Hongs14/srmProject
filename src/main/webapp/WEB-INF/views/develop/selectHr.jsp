<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="users" items="${pickName}">
	<div class="row  d-flex text-center m-0 py-2">
		<div class="col-sm-1">
			<span class="badge badge-warning ml-3">N</span>
		</div>
		<div id="devNameInput" class="col-sm-1 col-form-label text-center">
			<input name="userNo" id="userNo" type="hidden" value="${users.userNo}"/>
			<input name="hrLeader" type="hidden" value="N"/>
			<div id="pickDevNm">${users.userNm}</div>
		</div>
		<div class="col-sm-2 text-center">
			<select name="taskNo" class="form-control-sm">
				<option>작업구분</option>
				<option value="2">설계</option>
				<option value="1">개발</option>
				<option value="3">테스트</option>
			</select>
		</div>
		<div class="col-sm-4 text-center">
			<input name="hrStartDate" type="date" class="form-control-sm"/>
		</div>
			
		<div class="col-sm-4 text-center">
			<input name="hrEndDate" type="date" class="form-control-sm"/>
			<a href="#" class="deleteHr text-right" id='${users.userNo}' style="color: red;">x</a>
		</div>
		<hr class="my-0"/>
	</div>
	
</c:forEach>