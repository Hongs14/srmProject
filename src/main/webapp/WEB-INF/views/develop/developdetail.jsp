<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/common/head.jsp"%>
<link href="${pageContext.request.contextPath}/resources/vendor/select2/dist/css/select2.min.css" rel="stylesheet" type="text/css">
	<style>
		select option[value=""][disabled] {
           display: none;
        }
	</style>
	<script>
		function selectDev(obj) {
			//개발담당자 선택
			let pickDp = obj.value.toString();
	
			$.ajax({
				url : '<c:url value="/develop/devLeader?userNo=' + pickDp + '"/>',
				method : "get",
				dataType : "json",
				success : function(data) {
					console.log(data);
					console.log(data[0].userDpNm);
					$('#srDevDp').val(data[0].userDpNm);
					$('#pickDevNm').empty();
					$('#leaderNo').val(data[0].userNo);
					$('#pickDevNm').append(data[0].userNm);
				},
				error : function(request, status, error) {
					console.log("실패");
					alert("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
				}
			});
		};
		
		function registerDevelop(){
			console.log("개발계획 등록");
			let srDevDp = $('#srDevDp').val();
			let srDdlnDate = $('#srDdlnDate').val();
			let srStartDate = $('#srStartDate').val();
			let srEndDate = $('#srEndDate').val();
			
			$('#modalBody').empty();
			$('#modalBody').append('<div><h5>[' + srDevDp + ']</h5></div>');
			$('#leaderSdate').val(srStartDate);
			$('#leaderEdate').val(srEndDate);
			
			selectList();
	
		}
	
		function selectList() {
			//모달리스트 띄우기
			console.log("aa");
			let userDpNm = $('#srDevDp').val();
			let startDate = $('#leaderSdate').val();
			let endDate = $('#leaderEdate').val(); 
			let userNo = $('#srDLeader').val();
			console.log(userDpNm);
			let data = {
				userDpNm : userDpNm,
				userNo : userNo,
				hrStartDate : startDate,
				hrEndDate : endDate
			};
			console.log(data);
	
			$.ajax({
				url : '<c:url value="/develop/devlist"/>',
				type : "post",
				dataType : "html",
				data : JSON.stringify(data),
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					console.log(data);
					$("#modalContent").html(data);
				},
				error : function(request, status, error) {
					console.log("실패");
					alert("status : " + request.status + ", message : "
							+ request.responseText + ", error : " + error);
				}
			});
		};
	
		function submitDev() {
			//HR리스트에 일반개발자 등록
			var checkBoxArr = [];
			var srNo = '${dlist.srNo}';
			$("input:checkbox[name='devName']:checked").each(function(i) {
				//체크박스값 배열에 넣기
				var userNo = $(this).val();
				var data = {
					userNo : userNo,
					srNo : srNo
				};
			
				checkBoxArr.push(data);
				$("input:checkbox[name='devName']").prop("checked", false);
			});
	
			console.log(checkBoxArr);
	
			$.ajax({
				url : '<c:url value="/develop/selectNm"/>',
				type : 'post',
				data : JSON.stringify(checkBoxArr),
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					console.log(data);
					$('#HrList').html(data);
				}
			});
	
		};
	</script>

</head>

<body id="page-top">
	<div id="wrapper">
		<!-- Sidebar -->
		<%@include file="/WEB-INF/views/common/sidebar.jsp"%>

		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<!-- TopBar -->
				<%@include file="/WEB-INF/views/common/topbar.jsp"%>

				<!-- 메인 컨테이너 Container Fluid-->
				<div class="container-fluid" id="container-wrapper">
					<div class="d-sm-flex align-items-end justify-content-between">
						<div class="bg-primary px-3 py-2"
							style="border-top-left-radius: 10px; border-top-right-radius: 10px;">
							<h6 class="mb-0 text-white">SR 개발관리</h6>
						</div>
						<ol class="breadcrumb">
							<li class="breadcrumb-item">SR 관리</li>
							<li class="breadcrumb-item active" aria-current="page">SR
								개발관리</li>
						</ol>
					</div>

					<!-- Row -->
					<div class="row">
						<div class="col-lg-12">
							<div class="card mb-4 px-5">
								<div class="mb-1 mt-4">
									<div class="align-items-center justify-content-between">
										<div class="row">
											<div class="col-6">
												<div class="row">
													<div class="col-sm-4">
														<h6 class="m-0 font-weight-bold text-primary">등록자</h6>
													</div>
													<div class="col-sm-8">${dlist.userNm}</div>
												</div>
												<div class="row">
													<div class="col-sm-4">
														<h6 class="m-0 font-weight-bold text-primary">등록일</h6>
													</div>
													<div class="col-sm-8">${dlist.srRegDate}</div>
												</div>
											</div>
											<div class="col-6">
												<div class="row">
													<div class="col-sm-4">
														<h6 class="m-0 font-weight-bold text-primary">소속</h6>
													</div>
													<div class="col-sm-8">${dlist.userOgdp}</div>
												</div>
												<div class="row">
													<div class="col-sm-4">
														<h6 class="m-0 font-weight-bold text-primary">관련시스템</h6>
													</div>
													<div class="col-sm-8">${dlist.sysNm}</div>
												</div>
											</div>
										</div>
									</div>

									<div id="srContent">
										<hr />
										<div class="row mb-1">
											<div class="col-sm-2">
												<h6 class="m-0 font-weight-bold text-primary">SR제목</h6>
											</div>
											<div class="col-sm-10">${dlist.srTtl}</div>
										</div>
										<div class="row mb-1">
											<div class="col-sm-2">
												<h6 class="m-0 font-weight-bold text-primary">관련근거(목적)</h6>
											</div>
											<div class="col-sm-10">${dlist.srStd}</div>
										</div>
										<div class="row mb-1">
											<div class="col-sm-2">
												<h6 class="m-0 font-weight-bold text-primary">SR내용</h6>
											</div>
											<div class="col-sm-10">${dlist.srCn}</div>
										</div>
										<div class="row mb-1">
											<div class="col-sm-2">
												<h6 class="m-0 font-weight-bold text-primary">첨부파일</h6>
											</div>
											<div class="col-sm-10">
												<div class="row" >
													<c:forEach items="${dlist.srDevelopFile}" var="file">
														<div>${file.srFileActlNm}</div>&nbsp;/&nbsp;
													</c:forEach>
												</div>
											</div>
										</div>
									</div>
								</div>
								<hr />
								<!-- SR내용 -->

								<!-- 개발단계 관련 내용 -->
								<div class="mr-3"><h6 class="text-danger text-right">*는 필수입력항목</h6></div>
								<div class="d-flex flex-column">
									<div class="align-items-center justify-content-between mt-1">
										<form action='<c:url value="/develop/updateHr"/>' method="post">
											<div class="row">
												<div class="col-5">
													<div class="form-group row">
														<div class="col-sm-4 col-form-label row">
															<h6 class="text-danger">*&nbsp;</h6><h6 class="m-0 font-weight-bold text-primary">개발담당자</h6>
														</div>
														<div class="col-sm-8">
															<c:if test="${dlist.sttsNo != 5}">
																<select onchange="selectDev(this);" id="srDLeader" class="form-control" required>
																	<option></option>
																	<c:forEach var="users" items="${devlist}">
																		<option value="${users.userNo}">${users.userNm}</option>
																	</c:forEach>
																</select>
															</c:if>
															<c:if test="${dlist.sttsNo == 5}">
																<c:forEach items="${hrlist}" var="devlist" >
																	<c:if test="${devlist.hrLeader eq 'Y'}"> ${devlist.userNm}</c:if>
																</c:forEach>
															</c:if>
														</div>
													</div>
													<div class="form-group row">
														<div class="col-sm-4 col-form-label row">
															<h6 class="text-danger">&nbsp;&nbsp;&nbsp;</h6><h6 class="m-0 font-weight-bold text-primary">개발부서</h6>
														</div>
														<div class="col-sm-8">
															<input id="srDevDp" name="srDevDp" class="form-control" type="text" value="${dlist.srDevDp}" readonly />
														
															<input type="hidden" value="${dlist.srNo}" name="srNo"/>
														</div>
													</div>
													<div class="form-group row">
														<div class="col-sm-4 col-form-label row">
															<h6 class="text-danger">*&nbsp;</h6><h6 class="m-0 font-weight-bold text-primary">진행상태</h6>
														</div>
														<div class="col-sm-8">
															<select id="sttsNo" name="sttsNo"  class="form-control">
																<option>${dlist.sttsNm}</option>
																<option value="5">개발중</option>
															</select>
														</div>
													</div>
													<div class="form-group row mb-2">
														<div class="col-sm-4 col-form-control pr-0 row">
															<h6 class="text-danger">*&nbsp;</h6><h6 class="m-0 font-weight-bold text-primary">개발 내용</h6>
														</div>
														<div class="col-sm-8 p-2">
													 		<textarea name="srDevCn" id="srDevCn" style="width: 100%">${dlist.srDevCn}</textarea>
														</div>
													</div>
													
													<div class="form-group row">
														<div class="col-sm-4 col-form-label row">
															<h6 class="text-danger">*&nbsp;</h6><h6 class="m-0 font-weight-bold text-primary">완료(예정)일</h6>
														</div>
														<div class="col-sm-8">
															<input type="date" id="srDdlnDate" name="srDdlnDate" value="${dlist.srDdlnDate}" class="form-control" />
														</div>
													</div>
													<div class="form-group row">
														<div class="col-sm-4 col-form-label row">
															<h6 class="m-0 font-weight-bold text-primary">&nbsp;&nbsp;&nbsp;소요예산</h6>
														</div>
														<div class="col-sm-8">
															<input type="text" id="srBgt" name="srBgt" class="form-control" value="${dlist.srBgt}" />
														</div>
													</div>
													<div class="form-group row">
														<div class="col-sm-4 col-form-label row">
															<h6 class="text-danger">*&nbsp;</h6><h6 class="m-0 font-weight-bold text-primary">계획 시작일</h6>
														</div>
														<div class="col-sm-8">
															<input type="date" id="srStartDate" name="srStartDate" value="${dlist.srStartDate}" class="form-control" />
														</div>
													</div>
													<div class="form-group row">
														<div class="col-sm-4 col-form-label row">
															<h6 class="text-danger">*&nbsp;</h6><h6 class="m-0 font-weight-bold text-primary">계획 종료일</h6>
														</div>
														<div class="col-sm-8">
															<input type="date" id="srEndDate" name="srEndDate" value="${dlist.srEndDate}" class="form-control" required />
														</div>
													</div>
													<div class="text-right">
														<input type="hidden" id="srNo" value="${dlist.srNo}" />
														<c:if test="${dlist.sttsNo != 5}">
															<button type="button" id="button" class="btn btn-sm btn-primary mr-4" onclick="registerDevelop()"> 등록 ▶</button>
														</c:if>
													</div>
												</div>
											
												<div class="col-7">
													<div class="row" style="white-space: normal;">
														<div class="col-2">
															<div class="row">
																<div><h6 class="text-danger">*&nbsp;</h6></div>
																<div><h6 class="text-primary font-weight-bold">투입인력</h6></div>
															</div>	
														</div>
														<div class="col-10">
															<c:if test="${dlist.sttsNo != 5}">
																<button class="btn btn-secondary btn-sm addlist" type="button" data-toggle="modal" data-target="#exampleModalScrollable" id="#modalScroll">추가하기</button>
															</c:if>
														</div>
													</div>
													<div class="row mt-2 align-items-center">
														<div class="col-sm-2">
															<div class="row  align-items-center">
																<div class="col-sm-6">[담당자]</div>
																<div id="devNameInput" class="col-sm-6">
																	<c:if test="${dlist.sttsNo == 5}">
																		<c:forEach items="${hrlist}" var="devlist" >
																			<c:if test="${devlist.hrLeader eq 'Y'}"> ${devlist.userNm}</c:if>
																		</c:forEach>
																	</c:if>	
																	<c:if test="${dlist.sttsNo != 5}">
																		<input name="userNo" id="leaderNo" type="hidden" value="" />
																		<div id="pickDevNm"></div>
																		<input name="hrLeader" type="hidden" value="Y" />
																	</c:if>
																	
																</div>
															</div>
														</div>
														<div class="col-sm-2">
															<div class="row">
																<c:if test="${dlist.sttsNo != 5}">
																	<select name="taskNo" class="form-control" required>
																		<option value="" disabled selected>작업구분</option>
																		<option value="2">설계</option>
																		<option value="1">개발</option>
																		<option value="3">테스트</option>
																	</select>
																</c:if>
																<c:if test="${dlist.sttsNo == 5}">
																	<c:forEach items="${hrlist}" var="devlist" >
																		<c:if test="${devlist.hrLeader eq 'Y'}"><span class="badge badge-primary">${devlist.taskNm}</span></c:if>
																	</c:forEach>
																</c:if>
															</div>
														</div>
														<div class="col-8">
															<div class="row">
																<div class="col-sm-2 col-form-label">
																	<h6 class="font-weight-bold text-primary">시작일</h6>
																</div>
																<div class="col-sm-4">
																	<c:if test="${dlist.sttsNo == 5}">
																		<c:forEach items="${hrlist}" var="devlist" >
																			<c:if test="${devlist.hrLeader eq 'Y'}"><fmt:formatDate value="${devlist.hrStartDate}" pattern="yyyy-MM-dd"/></c:if>
																		</c:forEach>
																	</c:if>
																	<c:if test="${dlist.sttsNo != 5}">
																		<input name="hrStartDate" id="leaderSdate" type="date" class="form-control" readonly />
																	</c:if>
																</div>
																<div class="col-sm-2 col-form-label">
																	<h6 class="font-weight-bold text-primary">종료일</h6>
																</div>
																<div class="col-sm-4">
																	<c:if test="${dlist.sttsNo == 5}">
																		<c:forEach items="${hrlist}" var="devlist" >
																			<c:if test="${devlist.hrLeader eq 'Y'}"><fmt:formatDate value="${devlist.hrEndDate}" pattern="yyyy-MM-dd"/></c:if>
																		</c:forEach>
																	</c:if>
																	<c:if test="${dlist.sttsNo != 5}">
																		<input  name="hrEndDate" id="leaderEdate" type="date" class="form-control" readonly />
																	</c:if>
																</div>
															</div>
														</div>
													</div>
													<div class="mt-3" style="border: 1px solid gray; min-height: 400px;">
		
														<div id="HrList">
														<div class="row d-flex m-0 p-o" style="border-bottom:1px solid black; background-color:#eaecf4;">
															<div class="col-3 text-primary">개발 인력 성명</div>
															<div class="col-3 text-primary">작업 할당</div>
															<div class="col-3 text-primary">인력 투입일</div>
															<div class="col-3 text-primary">인력 투입종료일</div>
														</div>
															<div class="row mb-1" id="dvleaderHr">
																<c:if test="${dlist.sttsNo == 5}">
																	<c:forEach items="${hrlist}" var="devlist" >
																		<div class="col-3"><c:if test="${devlist.hrLeader eq 'N'}">${devlist.userNm}</c:if></div>
																		<div class="col-3"><c:if test="${devlist.hrLeader eq 'N'}"><span class="badge badge-primary">${devlist.taskNm}</span></c:if></div>
																		<div class="col-3"><c:if test="${devlist.hrLeader eq 'N'}"><fmt:formatDate value="${devlist.hrStartDate}" pattern="yyyy-MM-dd"/></c:if></div>
																		<div class="col-3"><c:if test="${devlist.hrLeader eq 'N'}"><fmt:formatDate value="${devlist.hrEndDate}" pattern="yyyy-MM-dd"/></c:if></div>
																	</c:forEach>
																</c:if>
															</div>
														</div>
													</div>
													<div class="text-right my-3">
														<c:if test="${dlist.sttsNo != 5}">
															<button type="submit" class="btn btn-primary">저장</button>
														</c:if>
														<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/develop/list'">목록</button>
													</div>
												</div>
											</div>
										</form>
									</div>
									<hr />
									<!-- 모달 시작-->
									<div>
										<div class="modal fade" id="exampleModalScrollable"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalScrollableTitle"
											aria-hidden="true">
											<div
												class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable"
												role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalScrollableTitle">개발자 등록하기</h5>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body" style="white-space: normal;">
														<div id="modalBody"></div>
														<div id="modalContent"></div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-outline-primary"
															data-dismiss="modal">닫기</button>
														<button type="button" onclick="submitDev()"	class="btn btn-primary" data-dismiss="modal">등록</button>
													</div>
												</div>
											</div>
										</div>
										<!-- 모달 끝-->
									</div>
								</div>
								<!-- 개발단계 관련 내용 -->
							</div>
						</div>
					</div>
					<!-- 로그아웃 모달 -->
					<%@include file="/WEB-INF/views/common/logout.jsp"%>
				</div>
				<!---Container Fluid-->
			</div>
		</div>
		<!-- Footer -->
	</div>
	<%@include file="/WEB-INF/views/common/bottom.jsp"%>
	<script>
 	$(document).ready(function(){
		let sttsNo = $("#sttsNo").val();
		console.log(sttsNo);
		if(sttsNo == '개발중' ){
			$("input").attr("disabled", true);
			$("select").attr("disabled", true);
			$("textarea").attr("disabled", true);
			
			
			console.log(sttsNo);
		}
	}); 
	
	</script>
	
</body>
</html>