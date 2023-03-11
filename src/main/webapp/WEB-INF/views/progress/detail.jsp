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
   font-size:14px;
}
.collapsed:active{
 background-color: green;
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
							<!-- 진척 상세 -->
								<div class="mb-4 mt-4 px-5">
									<!-- 번호/구분 -->
									<div class="row mb-2 mr-0">
										<div class="col-6">
								  			<span class="text-primary font-weight-bold">SR No.</span> 
								  			<span> ${progressDetail.srNo}</span>
										</div>
										<div class="col-6 text-right">
											<span class="font-weight-bold">요청구분 - </span><span class="badge badge-warning"> ${progressDetail.srTypeNm}</span>
										</div>
									</div>
									<hr/>
									<!-- -->
									<div class="row mb-2 mr-0">
										<div class="col-sm-2">
											<span class="font-weight-bold">등록자 : </span> 
										</div>
										<div class="col-sm-3">
											<span>${progressDetail.requesterNm}</span>
										</div>
										<div class="col-sm-3">
											<span class=" font-weight-bold">진행상태 :  </span> 
										</div>
										<div class="col-sm-4">
											<span> ${progressDetail.sttsNm}</span>
										</div>
									</div>
									<!-- 등록자팀/등록자 -->
									<div class="row mb-2 mr-0" >
										<div class="col-sm-2">
											<span class="font-weight-bold">요청팀 : </span> 
										</div>
										<div class="col-sm-3">
											<span>${progressDetail.userDpNm}</span>
										</div>
										<div class="col-sm-3">
											<span class="font-weight-bold">관련시스템 : </span> 
										</div>
										<div class="col-sm-4">
											<span> ${progressDetail.sysNm}</span>
										</div>
									</div>
									
									<!-- 등록일/ 완료 예정 일 -->
									<div class="row mb-2 mr-0">
										<div class="col-sm-2">
											<span class=" font-weight-bold">등록일 : </span> 
										</div>
										<div class="col-sm-3">
											<span>${progressDetail.srRegDate}</span> 
										</div>
										<div class="col-sm-3">
											<span class=" font-weight-bold">완료예정일 : </span> 
										</div>
										<div class="col-sm-4">
											<span>${progressDetail.srDdlnDate}</span> 
										</div>
									</div>
									<hr/>
									<!-- SR 상세 / 개발 상세 아코디언 -->
									<div class="accordion" id="accordion">
									    <div id="headingOne">
									      <h6 class="collapsed p-2 d-flex justify-content-between"
									      data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne" 
									      style="cursor: pointer; border-radius:5px; background-color: #EAECF4; border: 1px solid #e3e6f0;">
									          <b>SR 상세</b> <i class="fa-solid fa-caret-down"></i>
									      </h6>
									    </div>
									    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
									        <!-- SR 제목 -->
											<div class="row mb-4">
												<div class="col-sm-2">
													<span class=" font-weight-bold">SR 제목: </span> 
												</div>
												<div class="col-sm-10 border-bottom border-light" style="white-space: normal !important;">
													<span> ${progressDetail.srTtl}</span>
												</div>
											</div>	
									      	<!-- 관련 근거(목적) -->
												<div class="row mb-4">
													<div class="col-sm-2">
														<span class="font-weight-bold">관련근거: </span> 
													</div>
													<div class="col-sm-10 border-bottom border-light">
														<span>${progressDetail.srStd}</span> 
													</div>
												</div>
												<!-- SR 내용 -->
												<div class="row mb-1">
													<div class="col-2">
														<span class="font-weight-bold">SR 내용 </span>
													</div>
													<div class="col-10 border p-2" style="min-height:100px; white-space: normal !important;">
														<span>${progressDetail.srCn}</span>
													</div>
												</div>
												<!-- 첨부파일 -->
												<c:if test="${progressDetail.srFile[0].srFileNo != null}">
													<div class="row mb-2">
														<div class="col-sm-2">
															<span class="font-weight-bold">첨부파일: </span> 
														</div>
														<div class="col-sm-10 custom-file">
															<c:forEach var="filelist" items="${progressDetail.srFile}">
																<a href="filedownload?srFileNo=${filelist.srFileNo}">
																	<span class="font-weight-bold ">${filelist.srFileActlNm}</span>
																	<br/>
																</a>
															</c:forEach>
														</div>
													</div>
												</c:if>
									    </div>
									  	
									  	<div id="headingTwo">
									      <h6 class="collapsed p-2 d-flex justify-content-between"
									      data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo" 
									      style="cursor: pointer; border-radius:5px; background-color: #EAECF4; border: 1px solid #e3e6f0;">
									          	<b>개발 상세</b> <i class="fa-solid fa-caret-down"></i>
									      </h6>
									    </div>
									
									    <div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordion">
									        	<!-- 처리팀/담당자 -->
												<div class="row mb-2" >
													<div class="col-sm-2">
														<span class="font-weight-bold">개발팀 : </span> 
													</div>
													<div class="col-sm-3">
														<span>${progressDetail.dpNm}</span>
													</div>
													<div class="col-sm-3">
														<span class="font-weight-bold">계획 시작일 : </span> 
													</div>
													<div class="col-sm-4">
														<span>${progressDetail.srStartDate}</span>
													</div>
												</div>	
												<!-- 계획시작일/계획 종료일 -->
												<div class="row mb-2" >
													<div class="col-sm-2">
														<span class="font-weight-bold">팀 리더 :</span> 
													</div>
													<div class="col-sm-3">
														<span> ${progressDetail.developerNm}</span>
													</div>
													<div class="col-sm-3">
														<span class="font-weight-bold">계획 종료일 : </span> 
													</div>
													<div class="col-sm-4">
														<span>${progressDetail.srEndDate}</span>
													</div>
												</div>	
												<!-- 개발 내용 -->
												<div class="row mb-1" style="white-space: normal !important;">
													<div class="col-2">
														<span class="font-weight-bold">개발 내용 </span>
													</div>
													<div class="col-10 border p-2" style="min-height:200px;">
														<span>${progressDetail.srDevCn}</span>
													</div>
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
										<div id="progressDetailView" style="width:100%; min-height:200px; max-height:400px"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 메시지 모달 창 -->
					<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
						<div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable" role="document">
							<div class="modal-content">
								<div class="modal-header bg-primary">
									<h5 class="modal-title" id="exampleModalScrollableTitle">
							          	<img src="${pageContext.request.contextPath}/resources/images/logoOnly.png" style="width:20px;">
							        	<small class="text-white">
							        		<b>삭제</b>
							        	</small>
									</h5>
									<button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body p-5" style="white-space: normal; text-align:center;">
									<div class="alert alert-secondary m-3 p-2" role="alert">
										<h6><i class="fas fa-exclamation-triangle"></i><b> 안내 </b></h6>
										<div id="Modalmessage"></div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-outline-primary" data-dismiss="modal">닫기</button>
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
