<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.Enumeration" %>
<% session.removeAttribute("message"); %>
    
<!DOCTYPE html>
	<!-- 모달 창 -->
	<div class="modal fade" id="ChangeRequestModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
		<div class="modal-dialog modal-md modal-dialog-centered modal-dialog-scrollable" role="document">
			<div class="modal-content">
				<div id="changeRequestModal"></div>
			</div>
		</div>
	</div>

	<div class="table-responsive">
		<div id="changeRequestModalView">
			<div class="input-group-append float-right mb-3">
				<c:if test="${!(sttsNm == '완료요청' || sttsNm == '개발 완료' || sttsNm == '계획조정')}">
					<c:if test="${check}">
						<a type="button" class="btn btn-primary btn-sm mr-2" href="${pageContext.request.contextPath}/resources/text/extension_application.hwp">기간연장신청서 다운로드</a>
						<button class="btn btn-primary btn-sm mr-2" type="button" onclick="changeRequest()">
							기간 추가 신청
						</button>
					</c:if>
				</c:if>
			</div>
			<table class="table align-items-center table-flush table-hover">
				<thead class="thead-light">
					<tr>
						<th>신청 제목</th>
						<th>신청 날짜</th>
						<th>신청 결과</th>
						<th>근거 파일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${changeRequestList}">
						<tr>
							<th>
								<a onclick="changeRequestDetail(${list.crNo})" data-toggle="modal" data-target="#ChangeRequestModal">
									${list.crTtl}
								</a>
							</th>
							<th>${list.crRegDate}</th>
							<th>${list.crResult}</th>
							<th>${list.crFileActlNm}</th>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

<script>
	function changeRequest() {
		var srNo = "${srNo}";
		
		$.ajax({
			url : "changeRequestList/" + srNo,
			method : "post"
		}).done((data) => {
			$("#changeRequestModalView").html(data)
		});
	}
	
	function changeRequestDetail(crNo) {
		$.ajax({
			url : "changeRequestDetail/" + crNo,
			method : "post"
		}).done((data) => {
			$("#changeRequestModal").html(data)
		});
	}
</script>