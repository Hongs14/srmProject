<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<div class="table-responsive p-3">
	<table class="table align-items-center table-flush table-hover">
    	<thead class="thead-light">
	    	<tr>
	    		<th>No.</th>
	      		<th>카테고리</th>
	      		<th>글제목</th>
	      		<th>작성자</th>
	      		<th>작성일</th>
	      		<th>조회수</th>
	    	</tr>
    	</thead>
		<tbody>
			<c:forEach var="notice" items="${noticeListAjax}">
				<c:choose>
					<c:when test="${notice.ntcPry eq 'Yes'}">
						<tr onclick="getNoticeDetail('${notice.ntcNo}')" style="cursor:pointer; background-color: RGB(239 240 240);">
					</c:when>
					<c:when test="${notice.ntcPry ne 'Yes'}">
						<tr onclick="getNoticeDetail('${notice.ntcNo}')" style="cursor:pointer;">
					</c:when>
				</c:choose>
					<td>
						<c:choose>
							<c:when test="${notice.ntcPry eq 'Yes'}">
								<span class="badge text-danger" style="font-size:100%; ">${notice.seq}</span>
							</c:when>
							<c:when test="${notice.ntcPry ne 'Yes'}">
								${notice.seq}
							</c:when>
						</c:choose>
						
					</td>
					<td>
						<c:choose>
							<c:when test="${notice.ntcPry eq 'Yes'}">
								<span class="badge text-danger" style="font-size:100%; border:1px solid red;">공지사항</span>
							</c:when>
							<c:when test="${notice.ntcPry ne 'Yes'}">
								공지사항
							</c:when>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${notice.ntcPry eq 'Yes'}">
								<span style="color:red;">${notice.ntcTtl}</span>
							</c:when>
							<c:when test="${notice.ntcPry ne 'Yes'}">
								${notice.ntcTtl}
							</c:when>
						</c:choose>
					</td>
					<td>
						${notice.userId}	
					</td>
					<td>
						${notice.ntcWrtDate}	
					</td>
					<td>
						${notice.ntcInqCnt}
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<c:if test="${pager.totalRows != 0}">
		<div class="pager d-flex justify-content-center my-3">
			<div class="pagingButtonSet d-flex justify-content-center">
				<c:if test="${pager.pageNo > 1}">
					<a onclick="searchNoticeList(1)" type="button" class="btn btn-outline-primary btn-sm m-1">처음</a>
				</c:if>
				<c:if test="${pager.groupNo > 1}">
					<a onclick="searchNoticeList(${pager.startPageNo-1})" type="button" class="btn btn-outline-info btn-sm m-1">이전</a>
				</c:if>

				<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
					<c:if test="${pager.pageNo != i}">
						<a onclick="searchNoticeList(${i})" type="button" class="btn btn-outline-success btn-sm m-1">${i}</a>
					</c:if>
					<c:if test="${pager.pageNo == i}">
						<a onclick="searchNoticeList(${i})" type="button" class="btn btn-primary btn-sm m-1">${i}</a>
					</c:if>
				</c:forEach>

				<c:if test="${pager.groupNo < pager.totalGroupNo }">
					<a onclick="searchNoticeList(${pager.endPageNo+1})" type="button" class="btn btn-outline-info btn-sm m-1">다음</a>

				</c:if>
				<c:if test="${pager.pageNo < pager.totalPageNo }">
					<a onclick="searchNoticeList(${pager.totalPageNo})" type="button" class="btn btn-outline-primary btn-sm m-1">맨끝</a>
				</c:if>
			</div>
		</div>
	</c:if>
</div>


</html>
