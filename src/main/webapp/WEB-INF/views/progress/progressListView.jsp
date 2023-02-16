<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
	<div class="table-responsive p-3">
		<table class="table align-items-center table-flush table-hover">
			<thead class="thead-light">
				<tr>
					<th>SR 번호</th>
					<th>시스템 구분</th>
					<th>업무 구분</th>
					<th>SR 명</th>
					<th>요청자</th>
					<th>완료 예정일</th>
					<th>진행 상태</th>
					<th>중요도</th>
				</tr>
			</thead>
			<c:forEach var="list" items="${ProgressList}">
				<tbody onclick="location.href='${pageContext.request.contextPath}/progress/detail/${list.srNo}'">
				<tr>
					<th>${list.srNo}</th>
					<th>${list.sysNm}</th>
					<th>${list.srTypeNm}</th>
					<th>${list.srTtl}</th>
					<th>${list.userNm}</th>
					<th>${list.srDdlnDate}</th>
					<th>${list.sttsNm}</th>
					<th>${list.srPry}</th>
				</tr>
				</tbody>
			</c:forEach>
		</table>
		
		<c:if test="${pager.totalRows != 0}">
			<div class="pager d-flex justify-content-center my-3">
				<div class="pagingButtonSet d-flex justify-content-center">
					<c:if test="${pager.pageNo > 1}">
						<a onclick="progressList(1)" type="button" class="btn btn-outline-primary btn-sm m-1">처음</a>
					</c:if>
					<c:if test="${pager.groupNo > 1}">
						<a onclick="progressList(${pager.startPageNo-1})" type="button" class="btn btn-outline-info btn-sm m-1">이전</a>
					</c:if>
	
					<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
						<c:if test="${pager.pageNo != i}">
							<a onclick="progressList(${i})" type="button" class="btn btn-outline-success btn-sm m-1">${i}</a>
						</c:if>
						<c:if test="${pager.pageNo == i}">
							<a onclick="progressList(${i})" type="button" class="btn btn-primary btn-sm m-1">${i}</a>
						</c:if>
					</c:forEach>
	
					<c:if test="${pager.groupNo < pager.totalGroupNo }">
						<a onclick="progressList(${pager.endPageNo+1})" type="button" class="btn btn-outline-info btn-sm m-1">다음</a>
	
					</c:if>
					<c:if test="${pager.pageNo < pager.totalPageNo }">
						<a onclick="progressList(${pager.totalPageNo})" type="button" class="btn btn-outline-primary btn-sm m-1">맨끝</a>
					</c:if>
				</div>
			</div>
		</c:if>
	</div>