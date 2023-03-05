<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
	<div class="table-responsive p-3">
		<table class="table align-items-center table-flush table-hover">
			<thead class="thead-light" style="text-align: center;">
				<tr>	
					<th>
						<input type="checkbox" onclick='selectAll(this)' name="selectall">
					</th>
					<th>요청번호</th>
					<th>제목</th>
					<th>관련시스템</th>
					<th>등록자</th>
					<th>소속</th>
					<th>부서</th>
					<th>상태</th>
					<th>등록일</th>
					<th>중요</th>
				</tr>
			</thead>
			<tbody style="text-align: center;">
				<c:forEach var="examine" items="${examine}">
					<tr>
						
						<td>
							<input type="checkbox" name="examineCheck" value="${examine.srNo}" onclick='checkSelectAll(this)'>
						</td>
						<td onclick ="getSrDetail('${examine.srNo}')">${examine.srNo}</td>
						<td onclick ="getSrDetail('${examine.srNo}')">${examine.srTtl}</td>
						<td>${examine.sysNm}</td>
						<td>${examine.userNm}</td>
						<td>${examine.userOgdp}</td>
						<td>${examine.userDpNm}</td>
						<td>
							<c:if test="${examine.sttsNm eq '요청'}"><span class="badge badge-dark" style="font-size:100%">${examine.sttsNm}</span></c:if>
							<c:if test="${examine.sttsNm eq '검토중'}"><span class="badge badge-dark" style="font-size:100%">${examine.sttsNm}</span></c:if>
							<c:if test="${examine.sttsNm eq '반려'}"><span class="badge badge-danger" style="font-size:100%">${examine.sttsNm}</span></c:if>
							<c:if test="${examine.sttsNm eq '재검토'}"><span class="badge badge-warning" style="font-size:100%">${examine.sttsNm}</span></c:if>
						</td>
						<td>${examine.srRegDate}</td>
						<td>
							<c:if test="${examine.srPry eq '상'}"><span class="badge badge-danger" style="font-size:100%">${examine.srPry}</span></c:if>
							<c:if test="${examine.srPry eq '중'}"><span class="badge badge-primary" style="font-size:100%">${examine.srPry}</span></c:if>
							<c:if test="${examine.srPry eq '하'}"><span class="badge badge-secondary" style="font-size:100%">${examine.srPry}</span></c:if>
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
				<c:if test="${pager.totalRows >=1}">
					<c:if test="${pager.pageNo > 5}">
						<a onclick="examineListReset(1)" type="button" class="btn btn-outline-primary btn-sm m-1">처음</a>
					</c:if>
					<c:if test="${pager.groupNo > 1}">
						<a onclick="examineListReset(${pager.startPageNo-1})" type="button" class="btn btn-outline-info btn-sm m-1">이전</a>
					</c:if>
	
					<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
						<c:if test="${pager.pageNo != i}">
							<a onclick="examineListReset(${i})" type="button" class="btn btn-outline-info btn-sm m-1">${i}</a>
						</c:if>
						<c:if test="${pager.pageNo == i}">
							<a onclick="examineListReset(${i})" type="button" class="btn btn-primary btn-sm m-1">${i}</a>
						</c:if>
					</c:forEach>
	
					<c:if test="${pager.groupNo < pager.totalGroupNo }">
						<a onclick="examineListReset(${pager.endPageNo+1})" type="button" class="btn btn-outline-info btn-sm m-1">다음</a>
	
					</c:if>
					<c:if test="${pager.totalPageNo > 5 }">
						<a onclick="examineListReset(${pager.totalPageNo})" type="button" class="btn btn-outline-primary btn-sm m-1">맨끝</a>
					</c:if>
				</c:if>
			</div>
		</div>
		
		
	</div>