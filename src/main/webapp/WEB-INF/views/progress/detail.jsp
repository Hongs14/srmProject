<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<style>
#prog_tabs .nav-link{
background-color:#EFEFEF;
color: black;
border-top-left-radius: 10px; 
border-top-right-radius: 10px;

}
	#prog_tabs .nav-link.active{
	background-color:#406882;
	color:white;
	}

	.ajaxDetail span {
        white-space:normal !important;
    }
</style>
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
					<!-- Row -->
					<div class="row">
						<div class="col-lg-5">
							<div class="d-sm-flex align-items-end justify-content-between">
								<div class="bg-primary px-3 py-2"
									style="border-top-left-radius: 10px; border-top-right-radius: 10px;">
									<h6 class="mb-0 text-white">SR 진척관리</h6>
								</div>

							</div>
							<div class="ajaxDetail card mb-4">
								<div class="card-header mt-2">
									<h6 class="m-0 font-weight-bold text-primary"> <i class="fab fa-fw fa-wpforms"></i> SR 검토 상세</h6>
								</div>
								<div class="card-body">
									<!-- 진척 상세 -->
									<div class="container-fluid">
										<!-- 번호/구분 -->
										<div class="row">
											<div class="col-6">
												<span class="font-weight-bold">SR 번호: </span><span> ${progressDetail.srNo}</span>
											</div>
											<div class="col-6">
												<span class="font-weight-bold">요청 구분: </span><span> ${progressDetail.srTypeNm}</span>
											</div>
										</div>
										<hr/>
										<!-- 시스템 구분/업무 구분 -->
										<div class="row">
											<div class="col-6">
												<span class="font-weight-bold">시스템 구분: </span><span> ${progressDetail.sysNm}</span>
											</div>
											<div class="col-6">
												<span class="font-weight-bold">진행 상태: </span><span> ${progressDetail.sttsNm}</span>
											</div>
										</div>
										<br/>
										<!-- 요청팀/요청자 -->
										<div class="row">
											<div class="col-6">
												<span class="font-weight-bold ">요청 팀: </span><span>${progressDetail.userDpNm}</span>
											</div>
											<div class="col-6">
												<span class="font-weight-bold ">요청자: </span><span>${progressDetail.requesterNm}</span>
											</div>
										</div>
										<br/>
										<!-- 등록일/ 완료 예정 일 -->
										<div class="row">
											<div class="col-6">
												<span class="font-weight-bold ">등록일: </span><span>${progressDetail.srRegDate}</span>
											</div>
											<div class="col-6">
												<span class="font-weight-bold ">완료 예정일: </span><span>${progressDetail.srDdlnDate}</span>
											</div>
										</div>
										<br/>
										<!-- SR 제목 -->
										<div class="row">
											<div class="col-12">
												<span class="font-weight-bold">SR 제목: </span><span> ${progressDetail.srTtl}</span>
											</div>
										</div>
										<br>
										<!-- 관련 근거(목적) -->
										<div class="row">
											<div class="col-12">
												<span class="font-weight-bold">관련근거(목적): </span><span>${progressDetail.srStd}</span>
											</div>
										</div>
										<br>
										<!-- SR 내용 -->
										<div class="row mb-1">
											<div class="col-2">
												<span class="font-weight-bold">SR 내용 </span>
											</div>
											<div class="col-10 border" style="min-height:100px;">
												<span>${progressDetail.srCn}</span>
											</div>
										</div>
										<br/>
										<!-- 첨부파일 -->
										<c:if test="${progressDetail.srFile[0].srFileNo != null}">
											<div class="row">
												<div class="col-12">
													<span class="font-weight-bold ">첨부 파일</span>
													<div>
													<c:forEach var="filelist" items="${progressDetail.srFile}">
														<a href="filedownload?srFileNo=${filelist.srFileNo}">
															<span class="font-weight-bold ">${filelist.srFileActlNm}</span>
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
												<span class="font-weight-bold ">처리 팀 : </span><span>${progressDetail.dpNm}</span>
											</div>
											<div class="col-6">
												<span class="font-weight-bold ">담당자 : </span><span>${progressDetail.developerNm}</span>
											</div>
										</div>
										<br/>
										<!-- 계획시작일/계획 종료일 -->
										<div class="row mb-3">
											<div class="col-6">
												<span class="font-weight-bold ">계획 시작일 : </span><span>${progressDetail.srStartDate}</span>
											</div>
											<div class="col-6">
												<span class="font-weight-bold ">계획 종료일 : </span><span>${progressDetail.srEndDate}</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-lg-7">
						<div class="d-flex justify-content-between flex-lg-nowrap" id="prog_tabs">
							<ul class="nav nav-tabs" role="tablist">
							<c:choose>
								<c:when test="${message == 2}">
									<li class="nav-item">
										<a class="nav-link" data-toggle="pill" onclick="progressDetail(1)">SR 인적자원관리</a>
									</li>
									<li class="nav-item">
										<a class="nav-link active" data-toggle="pill" onclick="progressDetail(2)">SR 진척율</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-toggle="pill" onclick="progressDetail(3)">SR 산출물</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-toggle="pill" onclick="progressDetail(4)">SR 계획조정</a>
									</li>
								</c:when>
								<c:when test="${message == 3}">
									<li class="nav-item">
										<a class="nav-link" data-toggle="pill" onclick="progressDetail(1)">SR 인적자원관리</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-toggle="pill" onclick="progressDetail(2)">SR 진척율</a>
									</li>
									<li class="nav-item">
										<a class="nav-link active" data-toggle="pill" onclick="progressDetail(3)">SR 산출물</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-toggle="pill" onclick="progressDetail(4)">SR 계획조정</a>
									</li>
								</c:when>
								<c:when test="${message == 4}">
									<li class="nav-item">
										<a class="nav-link" data-toggle="pill" onclick="progressDetail(1)">SR 인적자원관리</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-toggle="pill" onclick="progressDetail(2)">SR 진척율</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-toggle="pill" onclick="progressDetail(3)">SR 산출물</a>
									</li>
									<li class="nav-item">
										<a class="nav-link active" data-toggle="pill" onclick="progressDetail(4)">SR 계획조정</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="nav-item">
										<a class="nav-link active" data-toggle="pill" onclick="progressDetail(1)">SR 인적자원관리</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-toggle="pill" onclick="progressDetail(2)">SR 진척율</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-toggle="pill" onclick="progressDetail(3)">SR 산출물</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-toggle="pill" onclick="progressDetail(4)">SR 계획조정</a>
									</li>
								</c:otherwise>
							</c:choose>
							</ul>
							<ol class="breadcrumb">
								<li class="breadcrumb-item">SR 관리</li>
								<li class="breadcrumb-item active" aria-current="page">SR 진척관리</li>
							</ol>
						</div>
							<div class="card mb-4" style="text-align:center">
								<script>
									$(document).ready(function () {
										
										if ("${message}" == "") {
											message = 1
										} else {
											message = "${message}"
										}
										console.log(message);
									
										var srNo = '${progressDetail.srNo}';
										console.log(srNo);
										
										let data = {srNo : srNo};

										$.ajax({
											url : "progressajax/" + message,
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
									<div class="container-fluid mb-5">
										<div id="progressDetailView" style="width:100%; min-height:467px"></div>
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
