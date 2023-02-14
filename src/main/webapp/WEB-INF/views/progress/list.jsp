<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

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
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">SR 진척관리</h1>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a
								href="${pageContext.request.contextPath}">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">진척관리
							</li>
						</ol>
					</div>
					<div class="row">
						<!-- 진척관리 테이블 -->
						<div class="col-lg-12">
							<div class="card mb-4">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">SR 진척목록</h6>
								</div>
								<div class="col-lg-12">
									<div class="border-bottom border-dark">
										<div class="card-body">
											<div class="form-group">
												<div class="row">
													<div class="col-lg-1">
														<label style="margin:10px 0px">시스템 구분</label>
													</div>
													<div class="col-lg-2">
														<div style="margin:10px 0px; width:100%">
															<select id="sysNo" class="select2-single from-control" style="width:100%">
																<option value="0">전체</option>
																<c:forEach var="item" items="${progressFilter.sysNmList}">
																	<option value="${item.sysNo}">${item.sysNm}</option>
																</c:forEach>
															</select>
														</div>
													</div>
													<div class="col-lg-1">
														<label for="" style="margin:10px 0px">업무 구분</label>
													</div>
													<div class="col-lg-2">
														<div style="margin:10px 0px; width:100%">
															<select id="srTypeNo" class="select2-single from-control" style="width:100%">
																<option value="0">전체</option>
																<c:forEach var="item" items="${progressFilter.srTypeList}">
																	<option value="${item.srTypeNo}">${item.srTypeNm}</option>
																</c:forEach>
															</select>
														</div>
													</div>
													<div class="col-lg-1">
														<label for="" style="margin:10px 0px">진행 상태</label>
													</div>
													<div class="col-lg-2">
														<div style="margin:10px 0px; width:100%">
															<select id="srSttsNo" class="select2-single from-control" style="width:100%">
																<option value="0">전체</option>
																<c:forEach var="item" items="${progressFilter.srSttsList}">
																	<option value="${item.sttsNo}">${item.sttsNm}</option>
																</c:forEach>
															</select>
														</div>
													</div>
													<div class="col-lg-3">
														<div class="input-group-append float-right">
															<button class="btn btn-primary" type="button" onclick="progressList(1)" style="margin:3px 0px">
																<i class="fas fa-search fa-sm"></i>
															</button>
														</div>										
													</div>
												</div>
												<div class="row">
													<div class="col-lg-1">
														<label for="" style="margin:10px 0px">SR 제목</label>
													</div>
													<div class="col-lg-3">
														<form class="navbar-search">
															<div class="input-group" style="margin:2px 0px">
																<input id="srName" type="text" class="form-control bg-light border-1 small" aria-label="Search">
															</div>
														</form>
													</div>
													<div class="col-lg-1">
														<label for="" style="margin:10px 0px">SR 번호</label>
													</div>
													<div class="col-lg-4">
														<form class="navbar-search">
															<div class="input-group" style="margin:2px 0px">
																<input id="srNo" type="text" class="form-control bg-light border-1 small" aria-label="Search">
															</div>
														</form>
													</div>
													<div class="col-lg-3">
														<div class="input-group-append float-right">
															<button class="btn btn-danger" type="button" style="margin:3px 5px">
																초기화
															</button>
															<button class="btn btn-dark" type="button" style="margin:3px 0px">
																엑셀 다운로드
															</button>
														</div>
													</div>
													
													<script>
														$(document).ready(function () {
															console.log("시작");
															var sysNoSelect = document.getElementById("sysNo");
															var srTypeNoSelect = document.getElementById("srTypeNo");
															var srSttsNoSelect = document.getElementById("srSttsNo");
															
															var sysNo = sysNoSelect.options[document.getElementById("sysNo").selectedIndex].value;
															var srTypeNo = srTypeNoSelect.options[document.getElementById("srTypeNo").selectedIndex].value;
															var srSttsNo = srSttsNoSelect.options[document.getElementById("srSttsNo").selectedIndex].value;
															
															var srName = document.getElementById('srName').value;
															var srNo = document.getElementById('srNo').value;	
															
															if(srName !== "") {
																srName = "%" + srName + "%";
															}
															
															if(srNo !== "") {
																srNo = "%" + srNo + "%";
															}
															
															let data = {sysNo : sysNo, srTypeNo : srTypeNo, srSttsNo : srSttsNo, srName : srName, srNo : srNo};
															
															console.log(data);
															
															$.ajax({
																url : "progressajax/" + ${pageNo},
																method : "post",
																data : JSON.stringify(data),
																contentType: "application/json; charset=UTF-8"
															}).done((data) => {
																$("#progressListView").html(data)
															});
														});
													
														function progressList(pageNo) {
															console.log(pageNo);
															var sysNoSelect = document.getElementById("sysNo");
															var srTypeNoSelect = document.getElementById("srTypeNo");
															var srSttsNoSelect = document.getElementById("srSttsNo");
															
															var sysNo = sysNoSelect.options[document.getElementById("sysNo").selectedIndex].value;
															var srTypeNo = srTypeNoSelect.options[document.getElementById("srTypeNo").selectedIndex].value;
															var srSttsNo = srSttsNoSelect.options[document.getElementById("srSttsNo").selectedIndex].value;
															
															var srName = document.getElementById('srName').value;
															var srNo = document.getElementById('srNo').value;	
															
															if(srName !== "") {
																srName = "%" + srName + "%";
															}
															
															if(srNo !== "") {
																srNo = "%" + srNo + "%";
															}
															
															let data = {sysNo : sysNo, srTypeNo : srTypeNo, srSttsNo : srSttsNo, srName : srName, srNo : srNo};
															
															console.log(data);
															
															$.ajax({
																url : "progressajax/" + pageNo,
																method : "post",
																data : JSON.stringify(data),
																contentType: "application/json; charset=UTF-8"
															}).done((data) => {
																$("#progressListView").html(data)
															});
														}
													</script>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div id="progressListView" style="width:100%"></div>
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
														