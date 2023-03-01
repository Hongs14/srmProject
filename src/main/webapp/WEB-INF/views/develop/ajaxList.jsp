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
					<th>요청번호</th>
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
						<td class="pr-0">
							<input type="checkbox" class="custom-control-input" name="devleopCheck" value="${develop.srNo}">
						</td>
						<td><a href="${pageContext.request.contextPath}/develop/view?srNo=${SrDevelopDto.srNo}">${develop.srNo}</a></td>
		                <td><a href="${pageContext.request.contextPath}/develop/view?srNo=${SrDevelopDto.srNo}">${develop.srTtl}</a></td>
                       	<td>${develop.sysNm}</td>
						<td>${develop.userNm}</td>
						<td>${develop.userOgdp}</td>
						<td>${develop.userDpNm}</td>
						<td>
							<c:if test="${SrDevelopDto.sttsNm eq '접수'}"><span class="badge badge-outline-primary" style="font-size:100%; border: 1px solid black;">${SrDevelopDto.sttsNm}</span></c:if>
							<c:if test="${SrDevelopDto.sttsNm eq '개발중'}"><span class="badge badge-info" style="font-size:100%">${SrDevelopDto.sttsNm}</span></c:if>
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
		
		<c:if test="${pager.totalRows != 0}">
			<div class="pager d-flex justify-content-center my-3">
				<div class="pagingButtonSet d-flex justify-content-center">
					<c:if test="${pager.pageNo > 1}">
						<a onclick="devleopList(1)" type="button" class="btn btn-outline-primary btn-sm m-1">처음</a>
					</c:if>
					<c:if test="${pager.groupNo > 1}">
						<a onclick="devleopList(${pager.startPageNo-1})" type="button" class="btn btn-outline-info btn-sm m-1">이전</a>
					</c:if>
	
					<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
						<c:if test="${pager.pageNo != i}">
							<a onclick="devleopList(${i})" type="button" class="btn btn-outline-info btn-sm m-1">${i}</a>
						</c:if>
						<c:if test="${pager.pageNo == i}">
							<a onclick="devleopList(${i})" type="button" class="btn btn-primary btn-sm m-1">${i}</a>
						</c:if>
					</c:forEach>
	
					<c:if test="${pager.groupNo < pager.totalGroupNo }">
						<a onclick="devleopList(${pager.endPageNo+1})" type="button" class="btn btn-outline-info btn-sm m-1">다음</a>
	
					</c:if>
					<c:if test="${pager.pageNo < pager.totalPageNo }">
						<a onclick="devleopList(${pager.totalPageNo})" type="button" class="btn btn-outline-primary btn-sm m-1">맨끝</a>
					</c:if>
				</div>
			</div>
		</c:if>
		
		
	</div>