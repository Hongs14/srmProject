<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
	<style>
	.text-primary {
	font-size: 2rem;
	}
	
	#myInfoWrapper{
  			justify-content: center;
  			align-items:center;
  			min-height: 100vh;
  			min-width: 300px;
  			max-widht: 350px;
  		}
  	#bellIcon{
  		 display: inline-block;
		 width: 200px;
		 height: 200px;
		 border-radius: 50%;
		 text-align: center;
		 font-size: 15px;
		 padding-top: 40px;
		 background-color:#f1fafd;
		 color:#ffcc00;
  	}
  	#bellIcon>i{
		font-size:100px;
	}
	.myInfoWrapper{
		 background-color:#fff7d2;
	}
	</style>
  	<%@include file="/WEB-INF/views/common/head.jsp" %>
</head>

<body id="page-top">
	<div id="wrapper">
    	<!-- Sidebar -->
   		<%@include file="/WEB-INF/views/common/sidebar.jsp" %>
   			<div id="content-wrapper" class="d-flex flex-column">
   				<div id="content">
   					<!-- TopBar -->
   					<%@include file="/WEB-INF/views/common/topbar.jsp" %>
   					<!-- 메인 컨테이너 Container Fluid-->
   					<div class="container-fluid " id="container-wrapper">
   					
   						<!-- Row -->
   						<div class="row" id="myInfoWrapper">
   							<div class="col-lg-7 container">
   								<div class="d-sm-flex align-items-end justify-content-between">
   									<div class="bg-primary px-3 py-2" style="border-top-left-radius: 10px; border-top-right-radius: 10px;">
										<h6 class="mb-0 text-white">알림 센터</h6>
									</div>
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><b>알림 센터</b></li>
										<li class="breadcrumb-item active" aria-current="page">나의 알림</li>
									</ol>
								</div>
								<div class="card">
									<div class="card-body d-flex justify-content-between p-5">
										<div class="alertIcon text-center">
											<div id="bellIcon" class="mb-2">
												<i class="fa-solid fa-bell"></i>
											</div>
											<div>
												<hr>
												<span class="text-primary h6"><b>알림 카테고리</b></span>
											</div>
											<div>
												<button class="btn btn-outline-warning m-1">SR상태변경</button>
												<button class="btn btn-outline-info m-1">업무배정</button>
											</div>
											<div>
												<button class="btn btn-outline-primary m-1">문의결과</button>
												<button class="btn btn-outline-danger m-1">요청결과</button>
											</div>
										</div>
										<div class="myInfoWrapper shadow-sm">
											<div style="background-color:#fff3ab; padding: 20px;">나의 알림 목록</div>
											<!-- <div class="row mb-5"><button onclick="onMessage()">알림 전송</button></div> -->
											<div class="row mb-5 p-5">
												<table>
													<tbody>												
														<c:choose>
															<c:when test="${fn:length(alarmList) == 0 }">
																<span>알림 내역이 없습니다.</span>
															</c:when>
															<c:otherwise>
																<c:forEach var="alarmList" items="${alarmList}">
																	<tr style="cursor:pointer;">
																		<td onclick="updateCheck('${alarmList.srNo}')">
																			<c:if test="${alarmList.messageCheck eq 89}">
																				<i class="fa-regular fa-square-check fa-lg"></i>
													                    	</c:if>
													                    	<c:if test="${alarmList.messageCheck eq 78 }">
														                      <i class="fas fa-exclamation-triangle"></i>
													                    	</c:if>
																			<span class="col-3 " style="border-top:0; margin:0px;font-size:1.2rem;"><b>${alarmList.alarmTtl}</b></span>
																			<span>${alarmList.messageDate}</span>
																			<br/>			
																			<div class="col-3" style="font-size:0.7rem">${alarmList.srNo}</div>
																			<span class="d-none" id="alarmNo">${alarmList.alarmNo}</span>
																			<span class="d-none" id="sttsNm">${alarmList.sttsNm}</span>
																			<span class="col-3 ">${alarmList.message}</span>
																			<hr/>
																		</td>
																		<td>
																			<i class="fas fa-trash" data-toggle="modal" data-target="#alarmBtn" id="#modalScroll"></i>
																		</td>
																	</tr>																
																</c:forEach>
															</c:otherwise>
														</c:choose>										
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
							<script>
								function updateCheck(i) {
									var srNo = i;
									console.log(srNo);
									var alarmNo = document.getElementById("alarmNo").innerText;
									console.log(alarmNo);
									var sttsNm = document.getElementById("sttsNm").innerText;
									console.log(sttsNm);
									
									let data = {alarmNo : alarmNo};
									let url = "";

									if(sttsNm == "완료요청"){
										url = "${pageContext.request.contextPath}/progress/detail/"+srNo;
									}else{
										url = "${pageContext.request.contextPath}/request/list/"+srNo;
									}
									
									console.log(data);
									
									$.ajax({
										url : "updateAlarmCheck",
										method : "post",
										data : JSON.stringify(data),
										contentType: "application/json; charset=UTF-8"
									}).done((data) => {
										window.location.href = url;
									});
								}	
							</script>
							<div class="modal fade" id="alarmBtn" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
								<div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable" role="document">
									<div class="modal-content">
										<div class="modal-header bg-primary">
											<h5 class="modal-title" id="exampleModalScrollableTitle">
									          	<img src="${pageContext.request.contextPath}/resources/images/logoOnly.png" style="width:20px;">
									        	<small class="text-white">
									        		<b>알람</b>
									        	</small>
											</h5>
											<button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body p-5" style="white-space: normal;">
											<div class="alert alert-secondary m-3 p-2" role="alert">
												<h6><i class="fas fa-exclamation-triangle"></i><b> 안내 </b></h6>
												<div>
													<span>정말 삭제 하시겠습니까?</span>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-outline-primary" data-dismiss="modal" onclick="selectCheck()">네</button>
											<button type="button" class="btn btn-outline-danger" data-dismiss="modal">닫기</button>
										</div>
									</div>
								</div>
							</div>
							<script>
								function selectCheck() {
									
									var alarmNo = document.getElementById("alarmNo").value;
									let data = {alarmNo : alarmNo}
									console.log(data);
									
									$.ajax({
										url : "delete",
										method : "post",
										data : JSON.stringify(data),
										contentType : "application/json; charset=UTF-8"
									}).done((data) => {
										window.location.href ='/webapp/alarm/list';
									})
									
								}
							</script>
							<div id="msgStack"></div>
	          			<!-- 로그아웃 모달 -->
						<%@include file="/WEB-INF/views/common/logout.jsp" %>
					</div>
	        	<!---Container Fluid-->
				</div>
			</div>
			<%@include file="/WEB-INF/views/common/footer.jsp" %>
	    <!-- Footer -->
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/bottom.jsp" %>
 

</body>

</html>
