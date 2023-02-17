<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
	<div class="table-responsive p-3">
		<table class="table align-items-center table-flush table-hover">
			<thead class="thead-light" style="text-align: center;">
				<tr>
					<th>No</th>	
					<th>
						<div class="custom-control custom-checkbox m-0">
							<input type="checkbox" class="custom-control-input" id="customCheck1">
							<label class="custom-control-label" for="customCheck1"></label>
						</div>
					</th>
					<th>요청번호</th>
					<th>제목</th>
					<th>관련시스템</th>
					<th>등록자</th>
					<th>소속</th>
					<th>부서</th>
					<th>상태</th>
					<th>등록일</th>
					<th>완료(예정)일</th>
					<th>중요</th>
					<th>상세보기</th>
				</tr>
			</thead>
			<tbody style="text-align: center;">
				<c:forEach var="examine" items="${examine}">
					<tr>
						<td>${examine.seq}</td>
						<td>
							<div class="custom-control custom-checkbox m-0">
								<input type="checkbox" class="custom-control-input" id="customCheck2">
								<label class="custom-control-label" for="customCheck2"></label>
							</div>
						</td>
						<td>${examine.srNo}</td>
						<td>${examine.srTtl}</td>
						<td>${examine.sysNm}</td>
						<td>${examine.userNm}</td>
						<td>${examine.userOgdp}</td>
						<td>${examine.userDpNm}</td>
						<td>${examine.sttsNm}</td>
						<td>${examine.srRegDate}</td>
						<td>${examine.srDdlnDate}</td>
						<td>${examine.srPry}</td>
						<td><a href="${pageContext.request.contextPath}/examine/detail?srNo=${examine.srNo}" class="btn btn-sm btn-info">상세보기</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${pager.totalRows != 0}">
			<div class="pager d-flex justify-content-center my-3">
				<div class="pagingButtonSet d-flex justify-content-center">
					<c:if test="${pager.pageNo > 1}">
						<a onclick="examineList(1)" type="button" class="btn btn-outline-primary btn-sm m-1">처음</a>
					</c:if>
					<c:if test="${pager.groupNo > 1}">
						<a onclick="examineList(${pager.startPageNo-1})" type="button" class="btn btn-outline-info btn-sm m-1">이전</a>
					</c:if>
	
					<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
						<c:if test="${pager.pageNo != i}">
							<a onclick="examineList(${i})" type="button" class="btn btn-outline-success btn-sm m-1">${i}</a>
						</c:if>
						<c:if test="${pager.pageNo == i}">
							<a onclick="examineList(${i})" type="button" class="btn btn-primary btn-sm m-1">${i}</a>
						</c:if>
					</c:forEach>
	
					<c:if test="${pager.groupNo < pager.totalGroupNo }">
						<a onclick="examineList(${pager.endPageNo+1})" type="button" class="btn btn-outline-info btn-sm m-1">다음</a>
	
					</c:if>
					<c:if test="${pager.pageNo < pager.totalPageNo }">
						<a onclick="examineList(${pager.totalPageNo})" type="button" class="btn btn-outline-primary btn-sm m-1">맨끝</a>
					</c:if>
				</div>
			</div>
		</c:if>
		
		
	</div>