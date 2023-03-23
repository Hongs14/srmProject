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
  	}
  	#bellIcon{
  		 display: inline-block;
		 width: 50px;
		 height: 50px;
		 border-radius: 50%;
		 text-align: center;
		 font-size: 15px;
		 padding-top: 5px;
		 background-color:#214763;
		 border:1px solid #214763;
		 color:#ffcc00;
  	}
  	#bellIcon>i{
		font-size:35px;
	}
	.myInfoWrapper{
		background-color:rgb(255, 247, 209, 0.5);
		 width: 650px;
		 padding: 20px;
	}
	table .icon {
		font-size: 30px;
	}
	.myInfoWrapper span{
		white-space: normal;
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
   					<div id="msgStack"></div>
   						<!-- Row -->
   						<div class="row" id="myInfoWrapper">
   							<div class="col-lg-7 container">
   								<div class="d-sm-flex align-items-center justify-content-between">
   									<div class="bg-primary px-3 py-2" style="border-top-left-radius: 10px; border-top-right-radius: 10px;">
										<h6 class="mb-0 text-white">알림 센터</h6>
									</div>
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><b>나의 알림 확인하기 </b></li>
									</ol>
								</div>
								<div class="card">
									<div class="d-flex justify-content-between p-5 border-bottom mb-4">
										<div class="alertIcon text-center align-items-center">
											<div id="bellIcon">
												<i class="fa-solid fa-bell"></i>
											</div>
											<span class="h2 m-2 font-weight-bold"> 알림 </span>
										</div>
										<div class="text-left">
											<div>
												<span class="text-primary h5 m-2">알림 카테고리</span>
											</div>
											<div>
												<button class="btn btn-outline-primary m-1" onclick="alarmAll()">전체</button>
												<button class="btn btn-outline-danger m-1" onclick="requestResult()">요청결과</button>
												<c:if test="${userType ne '개발자'}">												
													<button class="btn btn-outline-warning m-1" onclick="srSttsChange()">SR상태변경</button>
												</c:if>
												<button class="btn btn-outline-info m-1" onclick="assigned()">업무배정</button>
											</div>
										</div>
									</div>
									<div id="alarmView">
										<div class="d-flex px-5 justify-content-center">
											<div class="myInfoWrapper shadow-sm mb-5">
												<table class="table table-hover">
													<tbody>
														<c:choose>
															<c:when test="${fn:length(alarmList) == 0 }">
																<div class="alert alert-secondary m-3 p-2" role="alert">
																	<h6><i class="fas fa-exclamation-triangle"></i><b> 안내 </b></h6>
																	알림 내역이 없습니다.
																</div>
															</c:when>
															<c:otherwise>
																<c:forEach var="alarmList" items="${alarmList}">
																	<tr style="cursor:pointer;">
																		<td class="row border-bottom" onclick="updateCheck('${alarmList.srNo}','${alarmList.alarmNo}','${alarmList.sttsNm }')" style="border-top: 0; ">
																			<div class="col-2 text-center mt-3">
																				<c:if test="${alarmList.messageCheck eq 89}">
																					<i class="fa-regular fa-square-check icon"></i>
														                    	</c:if>
														                    	<c:if test="${alarmList.messageCheck eq 78 }">
															                     	<i class="fas fa-exclamation-triangle icon"></i>
														                    	</c:if>
													                    	</div>
													                    	<div class="col-9">
													                    		<span style="border-top:0; margin:0px;font-size:1.2rem;"><b>${alarmList.alarmTtl}</b></span>
																				<span>${alarmList.messageDate}</span>
																				<br/>			
																				<div style="font-size:0.7rem">${alarmList.srNo}</div>
																				<span class="d-none" id="alarmNo">${alarmList.alarmNo}</span>
																				<span class="d-none" id="sttsNm">${alarmList.sttsNm}</span>
																				<span >${alarmList.message}</span>
													                    	</div>
																		</td>
																		<td>
																			<i class="fas fa-trash col-1" data-toggle="modal" data-target="#alarmBtn" id="#modalScroll"></i>
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
									<div id="categoryView">
										<div id="categoryList"></div>
									</div>
								</div>
							</div>
							<script>
								function updateCheck(i,j,k) {
									var srNo = i;
									console.log(srNo);
									var alarmNo = j;
									console.log(alarmNo);
									var sttsNm = k;
									console.log(sttsNm);
									let data = {alarmNo : alarmNo};
									let url = "";
									
									var userType = "${userType}";
									
									if(userType == "관리자" || userType == "개발자" ){
										if(sttsNm == "완료요청" || sttsNm =="계획조정" || sttsNm=="개발중"){
											url = "${pageContext.request.contextPath}/progress/detail/"+srNo;
										}else if(sttsNm == "요청" && userType == "관리자"){
											url = "${pageContext.request.contextPath}/examine/list/"+srNo;
										}else if(sttsNm == "개발계획"){
											url = "${pageContext.request.contextPath}/develop/view/"+srNo;
										}
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
								
								function srSttsChange() {
									var sysNo = "${sysNo}";
									var userNo = "${sessionScope.loginUser.userNo}";
									var alarmCategory = "SR상태변경";
									var userType = "${userType}";
									
									let data = {sysNo : sysNo, userNo : userNo, alarmCategory : alarmCategory, userType : userType};
									console.log(data);
									
									$.ajax({
										url : "categoryAlarm",
										method : "post",
										data : JSON.stringify(data),
										contentType: "application/json; charset=UTF-8"
									}).done((data) => {
										$("#categoryList").html(data);
										$("#alarmView").addClass("d-none");
										$("#categoryView").removeClass("d-none");
									});
									
								}
								
								function assigned(){
									var sysNo = "${sysNo}";
									var userNo = "${sessionScope.loginUser.userNo}";
									var alarmCategory = "업무배정";
									var userType = "${userType}";
									
									let data = {sysNo : sysNo, userNo : userNo, alarmCategory : alarmCategory, userType : userType};
									console.log(data);
									
									$.ajax({
										url : "categoryAlarm",
										method : "post",
										data : JSON.stringify(data),
										contentType: "application/json; charset=UTF-8"
									}).done((data) => {
										$("#categoryList").html(data);
										$("#alarmView").addClass("d-none");
										$("#categoryView").removeClass("d-none");
									});
								}
								
								function requestResult() {
									var sysNo = "${sysNo}";
									var userNo = "${sessionScope.loginUser.userNo}";
									var alarmCategory = "요청결과";
									var userType = "${userType}";
									
									let data = {sysNo : sysNo, userNo : userNo, alarmCategory : alarmCategory, userType : userType};
									console.log(data);
									
									$.ajax({
										url : "categoryAlarm",
										method : "post",
										data : JSON.stringify(data),
										contentType: "application/json; charset=UTF-8"
									}).done((data) => {
										$("#categoryList").html(data);
										$("#alarmView").addClass("d-none");
										$("#categoryView").removeClass("d-none");
									});
								}
								
								function alarmAll() {
									var sysNo = "${sysNo}";
									var userNo = "${sessionScope.loginUser.userNo}";
									var alarmCategory = "전체";
									var userType = "${userType}";
									
									let data = {sysNo : sysNo, userNo : userNo, alarmCategory : alarmCategory, userType : userType};
									console.log(data);
									
									$.ajax({
										url : "categoryAlarm",
										method : "post",
										data : JSON.stringify(data),
										contentType: "application/json; charset=UTF-8"
									}).done((data) => {
										$("#categoryList").html(data);
										$("#alarmView").addClass("d-none");
										$("#categoryView").removeClass("d-none");
									});
								}
								
							</script>
							<div class="modal fade" id="alarmBtn" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
								<div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable" role="document"  style="max-width:450px;">
									<div class="modal-content">
										<div class="modal-header bg-primary">
											<h5 class="modal-title" id="exampleModalScrollableTitle">
									          	<img src="${pageContext.request.contextPath}/resources/images/logoOnly.png" style="width:20px;">
									        	<small class="text-white">
									        		<b>알림</b>
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
									
									var alarmNo = document.getElementById("alarmNo").innerText;
									console.log(alarmNo);
									let data = {alarmNo : alarmNo}
									console.log(data);
									
									$.ajax({
										url : "${pageContext.request.contextPath}/alarm/delete",
										method : "post",
										data : JSON.stringify(data),
										contentType : "application/json; charset=UTF-8"
									}).done((data) => {
										window.location.href ='${pageContext.request.contextPath}/alarm/list';
									})
								}
							</script>
	          			<!-- 로그아웃 모달 -->
						<%@include file="/WEB-INF/views/common/logout.jsp" %>
					</div>
	        	<!---Container Fluid-->
				</div>
			</div>
	    <!-- Footer -->
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/bottom.jsp" %>
 

</body>

</html>
