<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
	<div class="table-responsive p-3">
	<div class="input-group-append float-right mb-3">
		<button class="btn btn-primary btn-sm mr-3" type="button" onclick="humanadd()">
			선택
		</button>
		<button class="btn btn-primary btn-sm" type="button" onclick="humanremove()">
			삭제
		</button>
	</div>
		<table class="table align-items-center table-flush table-hover">
			<thead class="thead-light">
				<tr>
					<th></th>
					<th>성명</th>
					<th>부서 명</th>
					<th>직책</th>
					<th>전화번호</th>
					<th>담당업무</th>
					<th>시작 날짜</th>
					<th>끝 날짜</th>
					<th>리더 여부</th>
				</tr>
			</thead>
			<c:forEach var="list" items="${hrList}">
				<tr>
					<th>
						<div class="custom-control custom-checkbox">
							<input name="hrcheck" value="${list.userNo}" type="checkbox" class="custom-control-input" id="SR+${list.userNo}">
							<label class="custom-control-label" for="SR+${list.userNo}"></label>
						</div>
					</th>
					<th>${list.userNm}</th>
					<th>${list.userDpNm}</th>
					<th>${list.userJbps}</th>
					<th>${list.userTelNo}</th>
					<th>${list.taskNm}</th>
					<th>${list.hrStartDate}</th>
					<th>${list.hrEndDate}</th>
					<th>${list.hrLeader}</th>
				</tr>
			</c:forEach>
		</table>
		<script>
		
		</script>
	</div>