<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
	<div class="table-responsive p-3">
		<table class="table align-items-center table-flush table-hover">
			<thead class="thead-light" style="text-align: center;">
				<tr>	
					<th>
						<input type="checkbox" onclick='selectAll(this)' name="devleopCheck">
					</th>
					<th>SR번호</th>
					<th>제목</th>
					<th>관련시스템</th>
					<th>등록자</th>
					<th>소속</th>
					<th>개발부서</th>
					<th>상태</th>
					<th>등록일</th>
					<th>완료예정일</th>
					<th>중요도</th>
				</tr>
			</thead>
			<tbody style="text-align: center;">
				<c:forEach var="develop" items="${develop}">
					<tr>
						<td>
							<input type="checkbox" onclick="checkSelectAll(this)" name="devleopCheck" value="${develop.srNo}">
						</td>
						<td><a href="${pageContext.request.contextPath}/develop/view/${develop.srNo}">${develop.srNo}</a></td>
		                <td><a href="${pageContext.request.contextPath}/develop/view/${develop.srNo}" class="srdTtl">${develop.srTtl}</a></td>
                       	<td>${develop.sysNm}</td>
						<td>${develop.userNm}</td>
						<td>${develop.userOgdp}</td>
						<td>${develop.srDevDp}</td>
						<td>
							<c:if test="${develop.sttsNm eq '접수'}"><span class="badge badge-warning" style="font-size:100%;">${develop.sttsNm}</span></c:if>
							<c:if test="${develop.sttsNm eq '개발계획'}"><span class="badge text-white" style="background-color:#476A6F; font-size:100%">${develop.sttsNm}</span></c:if>
						</td>
						<td>${develop.srRegDate}</td>
						<td>${develop.srDdlnDate}</td>
						<td>
							<c:if test="${develop.srPry eq '상'}"><span class="badge badge-danger" style="font-size:100%">${develop.srPry}</span></c:if>
							<c:if test="${develop.srPry eq '중'}"><span class="badge badge-primary" style="font-size:100%">${develop.srPry}</span></c:if>
							<c:if test="${develop.srPry eq '하'}"><span class="badge badge-secondary" style="font-size:100%">${develop.srPry}</span></c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="pager d-flex justify-content-center my-3">
			<div class="pagingButtonSet d-flex justify-content-center">
				<c:if test="${pager.totalRows < 1}">
					<h6 class="m-3">
						SR 요청이 존재하지 않습니다.
					</h6>
				</c:if>
				<c:if test="${pager.totalRows >= 1}">
					<c:if test="${pager.pageNo > 1 && pager.totalPageNo > 5 }">
						<a onclick="developList(1)" type="button" class="btn btn-outline-primary btn-sm m-1">처음</a>
					</c:if>
					<c:if test="${pager.groupNo > 1}">
						<a onclick="developList(${pager.startPageNo-1})" type="button" class="btn btn-outline-info btn-sm m-1">이전</a>
					</c:if>
	
					<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
						<c:if test="${pager.pageNo != i}">
							<a onclick="developList(${i})" type="button" class="btn btn-outline-info btn-sm m-1">${i}</a>
						</c:if>
						<c:if test="${pager.pageNo == i}">
							<a onclick="developList(${i})" type="button" class="btn btn-primary btn-sm m-1">${i}</a>
						</c:if>
					</c:forEach>
	
					<c:if test="${pager.groupNo < pager.totalGroupNo }">
						<a onclick="developList(${pager.endPageNo+1})" type="button" class="btn btn-outline-info btn-sm m-1">다음</a>
	
					</c:if>
					<c:if test="${pager.pageNo < pager.totalPageNo && pager.totalPageNo > 5 }">
						<a onclick="developList(${pager.totalPageNo})" type="button" class="btn btn-outline-primary btn-sm m-1">맨끝</a>
					</c:if>
				</c:if>
			</div>
		</div>
	</div>