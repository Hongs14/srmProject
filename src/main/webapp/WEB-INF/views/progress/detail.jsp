<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
	<%@include file="/WEB-INF/views/common/head.jsp"%>
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
							<h6 class="mb-0 text-white">SR 진척관리</h6>
						</div>
						<ol class="breadcrumb">
							<li class="breadcrumb-item">SR 관리</li>
							<li class="breadcrumb-item active" aria-current="page">SR
								진척관리</li>
						</ol>
					</div>

					<!-- Row -->
					<div class="row">
						<div class="col-lg-5">
							<div class="card mb-4">
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">SR 검토 상세</h6>
								</div>
								<hr />
								<div class="card-body">
									<!-- 진척 상세 -->
									<div class="container-fluid">
										<!-- 번호/구분 -->
										<div class="row">
											<div class="col-6">
												<span class="font-weight-bold text-primary">SR 번호 : ${progressDetail.srNo} </span>
											</div>
											<div class="col-6">
												<span class="font-weight-bold text-primary">요청 구분 : ${progressDetail.srTypeNm}</span>
											</div>
										</div>
										<br/>
										<!-- SR 제목 -->
										<div class="row">
											<div class="col-12">
												<span class="font-weight-bold text-primary">SR 제목 : ${progressDetail.srTtl}</span>
											</div>
										</div>
										<br/>
										<!-- 관련 근거(목적) -->
										<div class="row">
											<div class="col-12">
												<span class="font-weight-bold text-primary">관련근거(목적) : ${progressDetail.srStd}</span>
											</div>
										</div>
										<br/>
										<!-- 시스템 구분/업무 구분 -->
										<div class="row">
											<div class="col-6">
												<span class="font-weight-bold text-primary">시스템 구분 : ${progressDetail.sysNm}</span>
											</div>
											<div class="col-6">
												<span class="font-weight-bold text-primary">업무 구분 : ${progressDetail.sttsNm}</span>
											</div>
										</div>
										<br/>
										<!-- 요청팀/요청자 -->
										<div class="row">
											<div class="col-6">
												<span class="font-weight-bold text-primary">요청 팀 : ${progressDetail.userDpNm}</span>
											</div>
											<div class="col-6">
												<span class="font-weight-bold text-primary">요청자 : ${progressDetail.requesterNm}</span>
											</div>
										</div>
										<br/>
										<!-- 등록일/ 완료 예정 일 -->
										<div class="row">
											<div class="col-6">
												<span class="font-weight-bold text-primary">등록일 : ${progressDetail.srRegDate}</span>
											</div>
											<div class="col-6">
												<span class="font-weight-bold text-primary">완료 예정 일 : ${progressDetail.srDdlnDate}</span>
											</div>
										</div>
										<br/>
										<!-- SR 내용 -->
										<div class="row">
											<div class="col-12">
												<span class="font-weight-bold text-primary">SR 내용 : ${progressDetail.srCn}</span>
											</div>
										</div>
										<br/>
										<!-- 첨부파일 -->
										<c:if test="${progressDetail.srFile[0].srFileNo != null}">
											<div class="row">
												<div class="col-12">
													<span class="font-weight-bold text-primary">첨부 파일</span>
													<div>
													<c:forEach var="filelist" items="${progressDetail.srFile}">
														<a href="filedownload?srFileNo=${filelist.srFileNo}">
															<span class="font-weight-bold text-primary">${filelist.srFileActlNm}.${filelist.srFileExtnNm}</span>
															<br/>
														</a>
													</c:forEach>
													</div>
												</div>
											</div>
										</c:if>
										<hr />
										<!-- 처리팀/담당자 -->
										<div class="row">
											<div class="col-6">
												<span class="font-weight-bold text-primary">처리 팀 : ${progressDetail.dpNm}</span>
											</div>
											<div class="col-6">
												<span class="font-weight-bold text-primary">담당자 : ${progressDetail.developerNm}</span>
											</div>
										</div>
										<br/>
										<!-- 계획시작일/계획 종료일 -->
										<div class="row">
											<div class="col-6">
												<span class="font-weight-bold text-primary">계획 시작일 : ${progressDetail.srStartDate}</span>
											</div>
											<div class="col-6">
												<span class="font-weight-bold text-primary">계획 종료일 : ${progressDetail.srEndDate}</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-7">
							<div class="card mb-4" style="text-align:center">
								<ul class="nav nav-pills" role="tablist">
									<li class="nav-item col-4">
										<a class="nav-link active" data-toggle="pill" onclick="progressDetail(1)">SR 인적 자원 관리</a>
									</li>
									<li class="nav-item col-4">
										<a class="nav-link" data-toggle="pill" onclick="progressDetail(2)">SR 진척율</a>
									</li>
									<li class="nav-item col-4">
										<a class="nav-link" data-toggle="pill" onclick="progressDetail(3)">SR 산출물</a>
									</li>
								</ul>
								<hr/>
								<script>
									$(document).ready(function () {
										var srNo = '${progressDetail.srNo}';
										console.log(srNo);
										
										let data = {srNo : srNo};
										
										console.log(data);

										$.ajax({
											url : "progressajax/1",
											method : "post",
											data : JSON.stringify(data),
											contentType: "application/json; charset=UTF-8"
										}).done((data) => {
											$("#progressDetailView").html(data)
										});
									});
								
									function progressDetail(choice) {
										console.log(choice);
										var srNo = '${progressDetail.srNo}';
										console.log(srNo);
										
										let data = {srNo : srNo};
										
										console.log(data);
										
										$.ajax({
											url : "progressajax/" + choice,
											method : "post",
											data : JSON.stringify(data),
											contentType: "application/json; charset=UTF-8"
										}).done((data) => {
											$("#progressDetailView").html(data)
										});
									}
								</script>
								<div class="card-body">
									<!-- ajax 변경 부분-->
									<div class="container-fluid">
										<div id="progressDetailView" style="width:100%"></div>
									</div>
								</div>
							</div>
						</div>
					</div>



					<!-- 로그아웃 모달 -->
					<%@include file="/WEB-INF/views/common/logout.jsp"%>
				</div>
				<!---Container Fluid-->
			</div>

		</div>
	</div>
	<%@include file="/WEB-INF/views/common/bottom.jsp"%>
</body>

</html>
