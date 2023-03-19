<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<div class="table-responsive  px-5" id="qstnTable">
	<table class="table align-items-center table-flush table-hover" style="width:100%">
    	<thead class="thead-light">
	    	<tr>
	    		<th class="col-sm-1">No.</th>
	      		<th class="col-sm-1">카테고리</th>
	      		<th class="col-sm-5">글제목</th>
	      		<th class="col-sm-2">작성자 </i></th>
	      		<th class="col-sm-2">작성일</th>
	      		<th class="col-sm-1 text-center">조회수</th>
	    	</tr>
    	</thead>
		<tbody>
			<c:forEach var="qstn" items="${qnalist}">
				<tr>
					<td class="col-sm-1" onclick="qnaDetail(${qstn.qstnNo})" style="cursor:pointer;">${qstn.rnum}</td>
					<td class="col-sm-1">질문사항</td>
					<c:if test="${qstn.qstnSecret eq 'N'}">
						<td class="qstnTtl" onclick="qnaDetail(${qstn.qstnNo})" style="cursor:pointer;"><b id="sizeTtl"><c:if test='${qstn.qstnSecret eq "Y"}'><i style="color:orange" class="mr-2 fa-solid fa-lock"></i></c:if>${qstn.qstnTtl}</b></td>
					</c:if>
					<c:if test="${qstn.qstnSecret eq 'Y'}">
						<c:choose> 
							<c:when test="${qstn.userNm eq sessionScope.loginUser.userNm or sessionScope.loginUser.userType eq '관리자' or sessionScope.loginUser.userType eq '개발자'}">
								<td class="qstnTtl" onclick="qnaDetail(${qstn.qstnNo})" style="cursor:pointer;"><b id="sizeTtl"><c:if test='${qstn.qstnSecret eq "Y"}'><i style="color:orange" class="mr-2 fa-solid fa-lock"></i></c:if>${qstn.qstnTtl}</b></td>
							</c:when>
							<c:otherwise>
								<td class="qstnTtl" onclick="qnaSecret(${qstn.qstnNo})" style="cursor:pointer;"><b id="sizeTtl"><c:if test='${qstn.qstnSecret eq "Y"}'><i style="color:orange" class="mr-2 fa-solid fa-lock"></i></c:if>${qstn.qstnTtl}</b></td>
							</c:otherwise>
						</c:choose>
					</c:if>
					<td class="col-sm-2">${qstn.userNm}</td>
					<td class="col-sm-2">${qstn.qstnWrtDate}</td>
					<td class="col-sm-1 text-center">${qstn.qstnInqCnt}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pager d-flex justify-content-center my-3">
		<div class="pagingButtonSet d-flex justify-content-center">
			<c:if test="${pager.totalRows < 1}">
				<h6 class="m-3">
					게시글이 존재하지 않습니다.
				</h6>
			</c:if>
			<c:if test="${pager.totalRows >=1}">
				<c:if test="${pager.pageNo > 5}">
					<a onclick="searchQnaList(1)" type="button" class="btn btn-outline-primary btn-sm m-1">처음</a>
				</c:if>
				<c:if test="${pager.groupNo > 1}">
					<a onclick="searchQnaList(${pager.startPageNo-1})" type="button" class="btn btn-outline-info btn-sm m-1">이전</a>
				</c:if>

				<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
					<c:if test="${pager.pageNo != i}">
						<a onclick="searchQnaList(${i})" type="button" class="btn btn-outline-info btn-sm m-1">${i}</a>
					</c:if>
					<c:if test="${pager.pageNo == i}">
						<a onclick="searchQnaList(${i})" type="button" class="btn btn-primary btn-sm m-1">${i}</a>
					</c:if>
				</c:forEach>

				<c:if test="${pager.groupNo < pager.totalGroupNo }">
					<a onclick="searchQnaList(${pager.endPageNo+1})" type="button" class="btn btn-outline-info btn-sm m-1">다음</a>

				</c:if>
				<c:if test="${pager.totalPageNo > 5 }">
					<a onclick="searchQnaList(${pager.totalPageNo})" type="button" class="btn btn-outline-primary btn-sm m-1">맨끝</a>
				</c:if>
			</c:if>
		</div>
	</div>
</div>

</html>
