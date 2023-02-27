 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
	<div class="table-responsive p-3">
		<table class="table align-items-center table-hover border">
			<thead class="thead-light">
				<tr>
					<th>
                       <div class="custom-control custom-checkbox">
                  			<input type="checkbox" class="custom-control-input" id="customCheckAll">
                  			<label class="custom-control-label" for="customCheckAll"></label>
                		</div>
					</th>
					<th>SR 번호</th>
					<th>시스템 구분</th>
					<th>업무 구분</th>
					<th>SR 명</th>
					<th>요청자</th>
					<th>완료 예정일</th>
					<th>진행 상태</th>
					<th>중요도</th>
					<th>상세</th>
				</tr>
			</thead>
			<c:forEach var="list" items="${ProgressList}">
				<tbody>
					<tr>
						<td class="pr-0">
	                       <div class="custom-control custom-checkbox">
	                  			<input type="checkbox" class="custom-control-input" id="customCheck${list.srNo}">
	                  			<label class="custom-control-label" for="customCheck${list.srNo}"></label>
	                		</div>
						</td>
						<td>${list.srNo}</td>
						<td>${list.sysNm}</td>
						<td>${list.srTypeNm}</td>
						<td>${list.srTtl}</td>
						<td>${list.userNm}</td>
						<td>${list.srDdlnDate}</td>
						<td>
							<c:if test="${list.sttsNm eq '개발중'}"><span class="badge badge-info" style="font-size:100%">${list.sttsNm}</span></c:if>
							<c:if test="${list.sttsNm eq '개발 완료'}"><span class="badge badge-success" style="font-size:100%">${list.sttsNm}</span></c:if>
							<c:if test="${list.sttsNm eq '완료요청'}"><span class="badge text-white" style="font-size:100%; background-color:#a33bff;">${list.sttsNm}</span></c:if>
						</td>
						<td>
							<c:if test="${list.srPry eq '상'}"><span class="badge badge-danger" style="font-size:100%">${list.srPry}</span></c:if>
							<c:if test="${list.srPry eq '중'}"><span class="badge badge-primary" style="font-size:100%">${list.srPry}</span></c:if>
							<c:if test="${list.srPry eq '하'}"><span class="badge badge-secondary" style="font-size:100%">${list.srPry}</span></c:if>
						</td>
						<td><a href="${pageContext.request.contextPath}/progress/detail/${list.srNo}" class="btn btn-sm btn-primary">상세보기</a></td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
		
		<c:if test="${pager.totalRows != 0}">
			<div class="pager d-flex justify-content-center my-3">
				<div class="pagingButtonSet d-flex justify-content-center">
					<c:if test="${pager.totalPageNo > 5}">
						<a onclick="progressList(1)" type="button" class="btn btn-outline-primary btn-sm m-1">처음</a>
					</c:if>
					<c:if test="${pager.groupNo > 1}">
						<a onclick="progressList(${pager.startPageNo-1})" type="button" class="btn btn-outline-info btn-sm m-1">이전</a>
					</c:if>
	
					<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
						<c:if test="${pager.pageNo != i}">
							<a onclick="progressList(${i})" type="button" class="btn btn-outline-info btn-sm m-1">${i}</a>
						</c:if>
						<c:if test="${pager.pageNo == i}">
							<a onclick="progressList(${i})" type="button" class="btn btn-primary btn-sm m-1">${i}</a>
						</c:if>
					</c:forEach>
	
					<c:if test="${pager.groupNo < pager.totalGroupNo }">
						<a onclick="progressList(${pager.endPageNo+1})" type="button" class="btn btn-outline-info btn-sm m-1">다음</a>
	
					</c:if>
					<c:if test="${pager.totalPageNo > 5}">
						<a onclick="progressList(${pager.totalPageNo})" type="button" class="btn btn-outline-primary btn-sm m-1">맨끝</a>
					</c:if>
				</div>
			</div>
		</c:if>
	</div>