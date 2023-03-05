<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
	<div class="table-responsive p-2">
		<table class="table table-flush table-hover" id="requestList" style="width:100%;">
			<thead class="thead-light">
				<tr>
					<th>
						<div class="custom-control custom-checkbox">
                  			<input type="checkbox" class="custom-control-input" id="customCheckAll" onclick='selectAll(this)' name="requestCheck">
                  			<label class="custom-control-label" for="customCheckAll"></label>
                		</div>
					</th>
					<th>SR번호</th>
					<th>제목</th>
					<th>관련시스템</th>
					<th>등록자</th>
					<th>소속회사</th>
					<th>개발부서</th>
					<th>상태</th>
					<th>등록일</th>
					<th>중요</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="request" items="${requestLists}">
					<tr>
						<td class="pr-0">
	                       <div class="custom-control custom-checkbox">
	                  			<input type="checkbox" class="custom-control-input" id="customCheck${request.srNo}" name="requestCheck" onclick='checkSelectAll(this)'>
	                  			<label class="custom-control-label" for="customCheck${request.srNo}"></label>
	                		</div>
						</td>
						<td><a onclick="getSrDetail('${request.srNo}')" style="cursor:pointer;" class="srNo">${request.srNo}</a></td>
						<td><a onclick="getSrDetail('${request.srNo}')" style="cursor:pointer;"><span class="requsetTtl">${request.srTtl}</span></a></td>
						<td>${request.sysNm}</td>
						<td>${request.userNm}</td>
						<td><span class="userOgdp">${request.userOgdp}</span></td>
						<td>${request.srDevDp}</td>
						<td>
						<span class="srStts">
							<c:if test="${request.sttsNm eq '요청'}"><span class="badge badge-dark" style="font-size:100%">${request.sttsNm}</span></c:if>
							<c:if test="${request.sttsNm eq '검토중'}"><span class="badge badge-dark" style="font-size:100%">${request.sttsNm}</span></c:if>
							<c:if test="${request.sttsNm eq '접수'}"><span class="badge badge-outline-primary" style="font-size:100%; border: 1px solid black;">${request.sttsNm}</span></c:if>
							<c:if test="${request.sttsNm eq '개발중'}"><span class="badge badge-info" style="font-size:100%">${request.sttsNm}</span></c:if>
							<c:if test="${request.sttsNm eq '개발 완료'}"><span class="badge badge-success" style="font-size:100%">개발완료</span></c:if>
							<c:if test="${request.sttsNm eq '반려'}"><span class="badge badge-danger" style="font-size:100%">${request.sttsNm}</span></c:if>
							<c:if test="${request.sttsNm eq '재검토'}"><span class="badge badge-warning" style="font-size:100%">${request.sttsNm}</span></c:if>
						</span>
						</td>
						<td>${request.srRegDate}</td>
						<td>
							<c:if test="${request.srPry eq '상'}"><span class="badge badge-danger" style="font-size:100%">${request.srPry}</span></c:if>
							<c:if test="${request.srPry eq '중'}"><span class="badge badge-primary" style="font-size:100%">${request.srPry}</span></c:if>
							<c:if test="${request.srPry eq '하'}"><span class="badge badge-secondary" style="font-size:100%">${request.srPry}</span></c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="pager d-flex justify-content-center my-3">
			<div class="pagingButtonSet d-flex justify-content-center">
				<c:if test="${pager.totalRows < 1}">
					<h2 class="m-3">
						SR 요청이 존재하지 않습니다.
					</h2>
				</c:if>
				<c:if test="${pager.totalRows >=1}">
					<c:if test="${pager.pageNo > 1}">
						<a onclick="requestList(1)" type="button" class="btn btn-outline-primary btn-sm m-1">처음</a>
					</c:if>
					<c:if test="${pager.groupNo > 1}">
						<a onclick="requestList(${pager.startPageNo-1})" type="button" class="btn btn-outline-info btn-sm m-1">이전</a>
					</c:if>
	
					<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
						<c:if test="${pager.pageNo != i}">
							<a onclick="requestList(${i})" type="button" class="btn btn-outline-info btn-sm m-1">${i}</a>
						</c:if>
						<c:if test="${pager.pageNo == i}">
							<a onclick="requestList(${i})" type="button" class="btn btn-primary btn-sm m-1">${i}</a>
						</c:if>
					</c:forEach>
	
					<c:if test="${pager.groupNo < pager.totalGroupNo }">
						<a onclick="requestList(${pager.endPageNo+1})" type="button" class="btn btn-outline-info btn-sm m-1">다음</a>
	
					</c:if>
					<c:if test="${pager.pageNo < pager.totalPageNo }">
						<a onclick="requestList(${pager.totalPageNo})" type="button" class="btn btn-outline-primary btn-sm m-1">맨끝</a>
					</c:if>
				</c:if>
			</div>
		</div>
	</div>
	
		