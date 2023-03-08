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
					<div class="d-sm-flex align-items-end justify-content-between">
						<div class="bg-primary px-3 py-2" style="border-top-left-radius: 10px; border-top-right-radius: 10px;">
							<h6 class="mb-0 text-white">SR 진척관리</h6>
						</div>
						<ol class="breadcrumb">
							<li class="breadcrumb-item">
								SR 관리
							</li>
							<li class="breadcrumb-item active" aria-current="page">
								SR 진척관리
							</li>
						</ol>
					</div>
					<div class="row">
						<!-- 진척관리 테이블 -->
						<div class="col-lg-12">
							<div class="card mb-4">
				         		<!-- 검색 -->
				                <div class="mb-1 mt-5 px-5">
									<form class="navbar-search">
					                	<div class="row">
					                		<div class="col-4">
					                			<div class="form-group row">
					                				<label class="col-sm-3 col-form-label-sm" for="sysNo">시스템 구분</label>
							                    	<select class="form-control form-control-sm col-sm-9" id="sysNo">
														<option value="0">전체</option>
														<c:forEach var="item" items="${progressFilter.sysNmList}">
															<option value="${item.sysNo}">${item.sysNm}</option>
														</c:forEach>
							                    	</select>
							                	</div>
					                		</div>
					                		<div class="col-4">
					                			<div class="form-group row">
					                				<label class="col-sm-3 col-form-label-sm" for="sysNo">업무 구분</label>
							                    	<select class="form-control form-control-sm col-sm-9" id="srTypeNo">
														<option value="0">전체</option>
														<c:forEach var="item" items="${progressFilter.srTypeList}">
															<option value="${item.srTypeNo}">${item.srTypeNm}</option>
														</c:forEach>
							                    	</select>
							                	</div>
					                		</div>
					                		<div class="col-3">
					                			<div class="form-group row">
					                				<label class="col-sm-3 col-form-label-sm" for="sysNo">진행 상태</label>
							                    	<select class="form-control form-control-sm col-sm-9" id="srSttsNo">
														<option value="0">전체</option>
														<c:forEach var="item" items="${progressFilter.srSttsList}">
															<option value="${item.sttsNo}">${item.sttsNm}</option>
														</c:forEach>
							                    	</select>
							                	</div>
					                		</div>
					                		<div class="col-1">
					                			<div class="input-group-append float-right">
					                				<button class="btn btn-outline-warning btn-sm" type="button" onclick="progressFilterReset()" >
					                					초기화
					                				</button>
					                			</div>
					                		</div>
					                	</div>
										<div class="row">
											<div class="col-4">
							                	<div class="form-group row">
							                		<label class="col-sm-3 col-form-label-sm">SR 제목</label>
							                    	<input id="srName" type="text" class="form-control form-control-sm col-sm-9 bg-light" 
							                   		aria-label="Search" placeholder="검색어를 입력하세요" style="border-color: #3f51b5;">
							                  	</div>
					                		</div>
					                		<div class="col-4">
							                	<div class="form-group row">
							                		<label class="col-sm-3 col-form-label-sm">SR 번호</label>
							                    	<input id="srNo" type="text" class="form-control form-control-sm col-sm-9 bg-light" 
							                   		aria-label="Search" placeholder="검색어를 입력하세요" style="border-color: #3f51b5;">
							                  	</div>
					                		</div>
					                		<div class="col-3">
					                		
					                		</div>
											<div class="col-1">
												<div class="input-group-append float-right">
													<button class="btn btn-primary btn-sm" type="button" onclick="progressList(1)">
														조회 <i class="fas fa-search fa-sm"></i>
													</button>
												</div>
											</div>
											<script>
												
												// 화면이 처음 켜질 때 1번 페이지를 긁어오는 부분
												$(document).ready(function () {
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
													
													$.ajax({
														url : "progressajax/" + ${pageNo},
														method : "post",
														data : JSON.stringify(data),
														contentType: "application/json; charset=UTF-8"
													}).done((data) => {
														$("#progressListView").html(data)
													});
												});
											
												// 검색 버튼을 누르면 값을 긁어오는 부분
												function progressList(pageNo) {
													if ( $('#searchMySR').prop('checked') ) {
														choice = 2;
													} else {
														choice = 1;
													}
													
													console.log(choice)
													
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
													
													let data = {sysNo : sysNo, srTypeNo : srTypeNo, srSttsNo : srSttsNo, srName : srName, srNo : srNo, choice : choice};
													
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
												
												function progressFilterReset(){
													$("#sysNo").val("0").prop("selected", true);
													$("#srTypeNo").val("0").prop("selected", true);
													$("#srSttsNo").val("0").prop("selected", true);
													$("#srName").val(" ");
													$("#srNo").val(" ");
												}
											</script>
											
										</div>
									</form>
				                </div>
								<hr/>
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h5 class="m-0 font-weight-bold text-primary">SR 진척 목록</h5>
									<div class="d-sm-flex justify-content-end">
										<button class="btn btn-sm btn-primary" onclick="excelDownload()">엑셀 다운로드</button>
									</div>
								</div>
									
									<div class="custom-control custom-switch px-5 ml-2" style="width:180px; border-radius:3px; background-color:#eaecf4;">
										<input type="checkbox" class="custom-control-input" id="searchMySR" onclick="progressList(1)"/>
										<label class="custom-control-label" for="searchMySR">
											<span class="text-primary">담당 SR 조회<i class="fas fa-search fa-sm mx-2"></i> </span>
										</label>
									</div>
									
									<script>
										function excelDownload() {
											var progressArr = new Array();
											var checkbox = $("input[name=progressCheck]:checked");
											
											// 체크된 체크박스의 값을 가져옴
											checkbox.each(function(i) {
												var tr = checkbox.parent().parent().parent().eq(i);
												var td = tr.children();
												
												if(td.eq(1).text() != 'SR 번호') {
													
													var srNo = td.eq(1).text();
													
													progressArr.push(srNo);
												}
											});
											
											console.log(progressArr)
											
											var form = document.createElement('form');
											form.setAttribute('method','post');
											form.setAttribute('action', 'excelDownload');
											document.charset = "utf-8";
											
											var hiddenField = document.createElement("input");
											hiddenField.setAttribute('type', 'hidden');
											hiddenField.setAttribute('name', 'progressArr');
											hiddenField.setAttribute('value', progressArr);
											form.appendChild(hiddenField);
											
											document.body.appendChild(form);
											form.submit();
										}
										
									</script>
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