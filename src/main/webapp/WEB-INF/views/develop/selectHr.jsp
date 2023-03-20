<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="users" items="${pickName}">
	<div class="row  d-flex text-center m-0 py-2">
		<div class="col-sm-1 pt-2">
			<span class="badge badge-secondary">Dev</span>
		</div>
		<div id="devNameInput" class="col-sm-1 col-form-label text-center">
			<input name="userNo" id="userNo" type="hidden" value="${users.userNo}"/>
			<input name="hrLeader" type="hidden" value="N"/>
			<div id="pickDevNm">${users.userNm}</div>
		</div>
		<div class="col-sm-3 text-center">
			<select name="taskNo" class="form-control">
				<option disabled selected>작업구분</option>
				<option value="2">설계</option>
				<option value="1">개발</option>
				<option value="3">테스트</option>
			</select>
		</div>
		<div class="col-sm-3 text-center">
			<input name="hrStartDate" type="date" class="form-control"/>
		</div>
			
		<div class="col-sm-3 text-center">
			<input name="hrEndDate" type="date" class="form-control"/>
		</div>
		<div class="col-sm-1 pt-2">
			<i class="fa-solid fa-delete-left deleteHr text-danger p-0" id='${users.userNo}' style="cursor:pointer;"></i>
		</div>
		<hr class="my-0"/>
	</div>
</c:forEach>
<script>
	let mindate = $('#srStartDate').val();
	let maxdate = $('#hrEndDate').val();
	console.log($('#srStartDate').val());
	$("input[name='hrStartDate']").attr("min",mindate);
	$("input[name='hrEndDate']").attr("max",maxdate);
</script>