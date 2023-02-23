<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<div class="table-responsive p-3">
	<table class="table align-items-center table-flush table-hover">
    	<thead class="thead-light">
	    	<tr>
	      		<th>카테고리</th>
	      		<th>글번호</th>
	      		<th>글제목</th>
	      		<th>작성자</th>
	      		<th>작성일</th>
	      		<th>조회수</th>
	    	</tr>
    	</thead>
		<tbody>
			<c:forEach var="notice" items="${noticeListAjax}">
				<tr onclick="location.href='${pageContext.request.contextPath}/notice/detail?ntcNo=${notice.ntcNo}'" style="cursor:pointer;">
					<td>공지사항</td>
					<td>${notice.ntcNo}</td>
					<td>${notice.ntcTtl}</td>
					<td>${notice.userId}</td>
					<td>${notice.ntcWrtDate}</td>
					<td>${notice.ntcInqCnt}</td>
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
