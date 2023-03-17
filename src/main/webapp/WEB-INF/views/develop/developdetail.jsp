<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/common/head.jsp"%>
<link href="${pageContext.request.contextPath}/resources/vendor/select2/dist/css/select2.min.css" rel="stylesheet" type="text/css">
	<style>
		select option[disabled] {
           display: none;
        }
	</style>
	

</head>

<body id="page-top">
	<!-- 모달시작 -->
	<div class="modal fade" id="exampleModalScrollable"
		tabindex="-1" role="dialog"
		aria-labelledby="exampleModalScrollableTitle"
		aria-hidden="true">
		<div
			class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable"
			role="document">
			<div class="modal-content">
				 <div class="modal-header bg-primary">
		         	<h5 class="modal-title" id="exampleModalLabelLogout"> 
			          	<img src="${pageContext.request.contextPath}/resources/images/logoOnly.png" style="width:20px;">
			        	<small id="selectDev" class="text-white"><b></b></small>
			        </h5>
		         	<button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
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

	<div id="wrapper">
		<!-- Sidebar -->
		<%@include file="/WEB-INF/views/common/sidebar.jsp"%>

		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<!-- TopBar -->
				<%@include file="/WEB-INF/views/common/topbar.jsp"%>

				<!-- 메인 컨테이너 Container Fluid-->
				<div class="container-fluid" id="container-wrapper">
					<div class="d-sm-flex justify-content-between">
						<div class="bg-primary px-3 py-2"
							style="border-top-left-radius: 10px; border-top-right-radius: 10px;">
							<h6 class="mb-0 text-white">SR 개발관리</h6>
						</div>
						<ol class="breadcrumb">
							<li class="breadcrumb-item">SR 관리</li>
							<li class="breadcrumb-item active" aria-current="page">SR 개발관리</li>
						</ol>
					</div>

					<!-- Row -->
					<div class="row">
						<div class="col-lg-12">
							<div class="card mb-4 px-5 py-4">
								<div id="srDetail" class="mb-1 py-4 px-5" style="border: 1px solid #d1d3e2; border-radius:5px; background-color:rgb(117,117,117,0.1);">
									<a class="d-flex justify-content-between" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample" style="text-decoration: none;">
										<span class="text-primary" ><b>요청 상세 정보 확인</b></span><i class="fa-solid fa-circle-chevron-down"></i>
									</a>
									<div class="collapse show" id="collapseExample">
									<span class="text-primary" >SR No. ${dlist.srNo}</span>
									<hr>
										<div class="row">
											<div class="col-sm-1">
												<span class="font-weight-bold">등록자 : </span>
											</div>
											<div class="col-sm-2">${dlist.userNm}</div>
											<div class="col-sm-1">
												<span class="font-weight-bold ">등록일 : </span>
											</div>
											<div class="col-sm-2">${dlist.srRegDate}</div>
											<div class="col-sm-1">
												<span class="font-weight-bold ">소속 : </span>
											</div>
											<div class="col-sm-2">${dlist.userOgdp}</div>
											<div class="col-sm-1">
												<span class=" font-weight-bold ">관련시스템 : </span>
											</div>
											<div class="col-sm-2">${dlist.sysNm}</div>
										</div>

									<hr />
									<div id="srContent">
										<div class="row mb-1">
											<div class="col-sm-1">
												<h6 class="m-0 font-weight-bold ">SR제목 : </h6>
											</div>
											<div class="col-sm-11 text-left">${dlist.srTtl}</div>
										</div>
										<hr/>
										<div class="row mb-1">
											<div class="col-sm-1">
												<h6 class="m-0 font-weight-bold ">관련근거 : </h6>
											</div>
											<div class="col-sm-11">${dlist.srStd}</div>
										</div>
										<hr/>
										<div class="row mb-1 pr-3">
											<div class="col-sm-1">
												<h6 class="m-0 font-weight-bold" style="min-height:100px;">SR내용</h6>
											</div>
											<div class="col-sm-11" style="border: 1px solid gray">${dlist.srCn}</div>
										</div>
										<hr/>
										<div class="row mb-1">
											<div class="col-sm-1">
												<h6 class="m-0 font-weight-bold " style="min-height:50px;">첨부파일</h6>
											</div>
											<div class="col-sm-11">
												<c:forEach items="${dlist.srDevelopFile}" var="file">
													<div><a href="${pageContext.request.contextPath}/develop/file/${file.srFileNo}">${file.srFileActlNm}</a></div>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
								</div>
								<hr />
								<!-- SR내용 -->

								<!-- 개발단계 관련 내용 -->
								<div class="developPlan" style="border-radius: 5px; border:1px solid #d1d3e2;">
									<div class="mr-3 mt-3"><h6 class="text-danger text-right">*는 필수입력항목</h6></div>
									<div class="d-flex flex-column">
										<div class="align-items-center justify-content-between mt-1 px-5">
											<form action="${pageContext.request.contextPath}/develop/updateHr" method="post" id="updateHrForm">
												<div class="row">
													<div class="col-5">
														<div class="form-group row">
															<div class="col-sm-4 col-form-label row">
																<h6 class="text-danger">*&nbsp;</h6><h6 class="m-0 font-weight-bold">개발담당자</h6>
															</div>
															<div class="col-sm-8">
																<select onchange="selectDev(this);" id="srDLeader" class="form-control noneUpdate" required>
																	<c:if test="${leader.userNo ne null}">
																		<option value="${leader.userNo}" disabled selected>${leader.userNm} [${leader.userDpNm}&nbsp;${leader.userJbps}]</option>
																	</c:if>
																	<c:if test="${leader.userNo eq null}">
																		<option value="" disabled selected/>
																	</c:if>
																	<c:forEach var="users" items="${devlist}">
																		<option value="${users.userNo}">${users.userNm} [${users.userDpNm}&nbsp;${users.userJbps}]</option>
																	</c:forEach>
																</select>
																<div id="messageDev" class="validate" style="color: red;"></div>
															</div>
														</div>
														<div class="form-group row">
															<div class="col-sm-4 col-form-label row">
																<h6 class="text-danger">&nbsp;&nbsp;&nbsp;</h6><h6 class="m-0 font-weight-bold">개발부서</h6>
															</div>
															<div class="col-sm-8">
																<input id="srDevDp" name="srDevDp" class="form-control" type="text" value="${dlist.srDevDp}" readonly />
																<input type="hidden" value="${dlist.srNo}" name="srNo"/>
															</div>
														</div>
														<div class="form-group row">
															<div class="col-sm-4 col-form-label row">
																<h6 class="text-danger">*&nbsp;</h6><h6 class="m-0 font-weight-bold ">진행상태</h6>
															</div>
															<div class="col-sm-8">
																<select id="sttsNo" name="sttsNo"  class="form-control noneUpdate">
																	<option value="9" selected>개발계획</option>
																	<option value="5">개발중</option>
																</select>
															</div>
														</div>
														<div class="form-group row mb-2">
															<div class="col-sm-4 col-form-control pr-0 row">
																<h6 class="text-danger">*&nbsp;</h6><h6 class="m-0 font-weight-bold ">개발 내용</h6>
															</div>
															<div class="col-sm-8 p-2">
														 		<textarea class="toggle" name="srDevCn" id="srDevCn" style="width: 100%; height:135px" required>${dlist.srDevCn}</textarea>
																<div id="messageDevCn" class="validate" style="color: red"></div>
															</div>
														</div>
														
														<div class="form-group row">
															<div class="col-sm-4 col-form-label row">
																<h6 class="text-danger">*&nbsp;</h6><h6 class="m-0 font-weight-bold ">완료(예정)일</h6>
															</div>
															<div class="col-sm-8">
																<input type="date" id="srDdlnDate" name="srDdlnDate" value="${dlist.srDdlnDate}" class="form-control" required/>
																<div id="messageDdln" class="validate" style="color: red"></div>
															</div>
														</div>
														<div class="form-group row">
															<div class="col-sm-4 col-form-label row">
																<h6 class="m-0 font-weight-bold ">&nbsp;&nbsp;&nbsp;소요예산</h6>
															</div>
															<div class="col-sm-7 pr-1">
																<input type="text" id="srBgt" dir="rtl" name="srBgt" class="form-control" value="${dlist.srBgt}" />
															</div>
															<div class="col-sm-1 px-0 d-flex align-items-center">
																만원
															</div>
														</div>
														<div class="form-group row">
															<div class="col-sm-4 col-form-label row">
																<h6 class="text-danger">*&nbsp;</h6><h6 class="m-0 font-weight-bold">계획 시작일</h6>
															</div>
															<div class="col-sm-8">
																<input type="date" id="srStartDate" name="srStartDate" value="${dlist.srStartDate}" class="form-control" required/>
																<div id="messageStartDate" class="validate" style="color: red"></div>
															</div>
															
														</div>
														<div class="form-group row">
															<div class="col-sm-4 col-form-label row">
																<h6 class="text-danger">*&nbsp;</h6><h6 class="m-0 font-weight-bold">계획 종료일</h6>
															</div>
															<div class="col-sm-8">
																<input type="date" id="srEndDate" name="srEndDate" value="${dlist.srEndDate}" class="form-control" required />
																<div id="messageEndDate" class="validate" style="color: red"></div>
															</div>
														</div>
														<div class="text-right">
															<input type="hidden" id="srNo" value="${dlist.srNo}" />
															<button type="button" id="button" class="btn btn-sm btn-primary mr-4 toggle" data-toggle="modal" data-target="#checkEffectiveness" onclick="registerDevelop()"> 등록 ▶</button>
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
																	<button class="btn btn-secondary btn-sm addlist" type="button" data-toggle="modal" disabled="disabled" data-target="#exampleModalScrollable" id="#modalScroll">추가하기</button>
																</c:if>
															</div>
														</div>
														<div class="mt-3" style="border: 1px solid gray; min-height: 513px;">
															<div class="row d-flex text-center m-0 p-o" style="border-bottom:1px solid black; background-color:#eaecf4;">
																<div class="col-sm-1 ">역할</div>
																<div class="col-sm-1 ">성명</div>
																<div class="col-sm-3 ">작업 할당</div>
																<div class="col-sm-3 ">인력 투입일</div>
																<div class="col-sm-3 ">인력 투입종료일</div>
																<div class="col-sm-1 "></div>
																
															</div>
															<!-- 리더 영역 -->
															<div id="leader" class="py-2">
																<div class="row  d-flex text-center m-0">
																	<div class="col-sm-1 text-center pt-2">
																		<span class="badge badge-warning">Leader</span>
																	</div>
																	<div class="col-sm-1 text-center">
																		<div class="d-flex justify-content-center pt-2">
																			<c:if test="${dlist.sttsNo != 4}">
																				<c:forEach items="${hrlist}" var="devlist" >
																					<c:if test="${devlist.hrLeader eq 'Y'}">
																						<div id="pickDevNm">${devlist.userNm}</div>
																						<input type="hidden" name="userNo" id="userNo" value="${devlist.userNo}"/>
																						<input name="hrLeader" type="hidden" value="Y"/>
																					</c:if>
																				</c:forEach>
																			</c:if>
																			<c:if test="${dlist.sttsNo == 4}">
																				<input name="userNo" id="leaderNo" type="hidden" value="" />
																					<div id="pickDevNm"></div>
																				<input name="hrLeader" type="hidden" value="Y"/>
																			</c:if>
																		</div>
																	</div>
																	<div class="col-sm-3 text-center">
																		<select name="taskNo" class="selectTaskNo form-control mx-0" required>	
																			<c:if test="${dlist.sttsNo == 9}">
																				<c:forEach items="${hrlist}" var="devlist">
																					<c:if test="${devlist.hrLeader eq 'Y'}">
																						<option value="${devlist.taskNo}" class="taskNo" disabled selected>${devlist.taskNm}</option>
																					</c:if>
																				</c:forEach>
																				<option value="2">설계</option>
																				<option value="1">개발</option>
																				<option value="3">테스트</option>
																			</c:if>	
																			<c:if test="${dlist.sttsNo != 9 }">
																				<option disabled selected>작업구분</option>
																				<option value="2">설계</option>
																				<option value="1">개발</option>
																				<option value="3">테스트</option>
																			</c:if>		
																		</select>
																	</div>
																	<div class="col-sm-3 text-center">
																		<c:if test="${dlist.sttsNo == 9}">
																			<c:forEach items="${hrlist}" var="devlist" >
																				<c:if test="${devlist.hrLeader eq 'Y'}">
																					<input name="hrStartDate" onchange="setDate()" id="leaderSdate" value="<fmt:formatDate value="${devlist.hrStartDate}" pattern="yyyy-MM-dd"/>" type="date" class="form-control" readonly />
																				</c:if>
																			</c:forEach>
																		</c:if>
																		<c:if test="${dlist.sttsNo == 4}">
																			<input name="hrStartDate" id="leaderSdate" type="date" class="form-control" readonly />
																		</c:if>
																	</div>
																	<div class="col-sm-3 text-center">
																		<c:if test="${dlist.sttsNo == 9}">
																			<c:forEach items="${hrlist}" var="devlist" >
																				<c:if test="${devlist.hrLeader eq 'Y'}">
																					<input name="hrEndDate" id="leaderSdate" value="<fmt:formatDate value="${devlist.hrEndDate}" pattern="yyyy-MM-dd"/>" type="date" class="form-control" readonly />
																				</c:if>
																			</c:forEach>
																		</c:if>
																		<c:if test="${dlist.sttsNo == 4}">
																			<input name="hrEndDate" id="leaderEdate" type="date" class="form-control" readonly />
																		</c:if>
																	</div>
																	<div class="col-sm-1">
																		&nbsp;
																	</div>
																</div>
															</div>
															<!-- 리더 영역 -->
															
															<!-- 리더 외 개발자 영역 -->
															<hr class="my-0"/>
															<div class="mt-2" id="HrList">
																<c:if test="${dlist.sttsNo == 9}">
																	<c:forEach items="${hrlist}" var="devlist" >
																		<div class="row  d-flex text-center m-0">
																			<c:if test="${devlist.hrLeader eq 'N'}">
																				<div class="col-sm-1">
																					<span class="badge badge-secondary">Dev</span>
																				</div>
																			</c:if>
																			<c:if test="${devlist.hrLeader eq 'N'}">
																				<div class="col-sm-1 text-center">
																					<div class="d-flex justify-content-center pt-2">
																						${devlist.userNm}
																						<input type="hidden" name="userNo" value="${devlist.userNo}"/>
																						<input type="hidden" name="hrLeader" value="N"/>
																					</div>
																				</div>
																				<div class="col-sm-3 text-center">
																					<select name="taskNo" class="form-control">
																						<option value="${devlist.taskNo}" class="taskNo" disabled selected>${devlist.taskNm}</option>
																						<option value="2">설계</option>
																						<option value="1">개발</option>
																						<option value="3">테스트</option>
																					</select>
																				</div>
																				<div class="col-sm-3 text-center">
																					<input name="hrStartDate" type="date" value="<fmt:formatDate value="${devlist.hrStartDate}" pattern="yyyy-MM-dd"/>" class="form-control"/>
																				</div>
																					
																				<div class="col-sm-3 text-center">
																					<input name="hrEndDate" type="date" value="<fmt:formatDate value="${devlist.hrEndDate}" pattern="yyyy-MM-dd"/>" class="form-control"/>
																				</div>
																				<div class="col-sm-1 mt-2">
																					<i class="fa-solid fa-delete-left deleteHr text-danger p-0" id='${users.userNo}' style="cursor:pointer;"></i>
																				</div>
																				<hr class="my-0"/>
																			</c:if>
																		</div>
																	</c:forEach>
																</c:if>
															</div>
															<!-- 리더 외 개발자 영역 -->
														</div>
														<div class="text-right my-3">
															<c:if test="${dlist.sttsNo == 4}">
																<button type="button" data-toggle="modal" onclick="checkSubmit()" data-target="#checkEffectiveness" id="#modalCenter" class="btn btn-primary toggle modalCenter" disabled="disabled">저장</button>
															</c:if>
															<c:if test="${dlist.sttsNo == 9}">
																<button type="button" data-toggle="modal" data-target="#exampleModalCenter" id="#modalCenter" class="btn btn-primary toggle">수정</button>
															</c:if>
														</div>
														<!-- 확인 모달 -->
														<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
												        	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
												        	<div class="modal-dialog modal-dialog-centered " role="document" style="max-width:450px;">
												            	<div class="modal-content">
												                	<div class="modal-header bg-primary" style="color: white">
												                  	<h5 class="modal-title" id="exampleModalCenterTitle"></h5>
												                  		<img src="${pageContext.request.contextPath}/resources/images/logoOnly.png" style="width:20px;">
												                  		확인
												                  		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												                    		<span aria-hidden="true">&times;</span>
												                  		</button>
												                	</div>
												                	<div class="modal-body justify-content-center text-center p-5"  style="white-space: normal;">
												                  		<div class="d-flex align-items-center">
																	    	<div id="iconWrapper" class="mr-4">
																				<i class="fas fa-exclamation-triangle" style="font-size:3rem; color:#FFA426;"></i>
																	    	</div>
																	       <div><h5>제출 하시겠습니까?</h5></div>
																       </div>
												                	</div>
												                	<div class="modal-footer">
												                  		<button type="button" class="btn btn-outline-primary" data-dismiss="modal">닫기</button>
												                  		<button type="button" class="btn btn-primary" onclick="falseDisabled()">제출</button>
												                	</div>
												              	</div>
												            </div>
												        </div>
														<!-- 확인 모달 -->
													</div>
												</div>
											</form>
										</div>
										<hr />
										<div>
											<!-- 선택 모달 -->
											<div class="modal fade" id="checkEffectiveness" tabindex="-1" role="dialog"
									            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
									 			<div class="modal-dialog modal-dialog-centered" role="document">
									            	<div class="modal-content">
								                		<div class="modal-header bg-primary">
											         		<h5 class="modal-title" id="exampleModalLabelLogout"> 
												          		<img src="${pageContext.request.contextPath}/resources/images/logoOnly.png" style="width:20px;">
												        		<small id="selectDev" class="text-white"><b>확인</b></small>
												        	</h5>
											         		<button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
											           			<span aria-hidden="true">&times;</span>
											         		</button>
												       	</div>
												       	<div class="modal-body justify-content-center text-center p-5">
													    	<div class="d-flex align-items-center">
														    	<div id="iconWrapper" class="mr-4">
																	<i class="fas fa-exclamation-triangle" style="font-size:3rem; color:#FFA426;"></i>
														       </div>
														       <div id="checkBody" class="text-left">
														       </div>
													       </div>
												       </div>
									                	<div class="modal-footer">
									                  		<button type="button" class="btn btn-outline-primary" data-dismiss="modal">닫기</button>
									                  		<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
									                	</div>
									              	</div>
									            </div>
									 		</div>
											<!-- 모달 끝 -->
										</div>
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
			<%@include file="/WEB-INF/views/common/footer.jsp" %>
		</div>
		<!-- Footer -->
	</div>
	<%@include file="/WEB-INF/views/common/bottom.jsp"%>
	<script>
	 	$(document).ready(function(){
			let sttsNo = $("#sttsNo").val();
			console.log(sttsNo);

			$('.addlist').prop("disabled", true);
			
			if("${loginUser.sysNo}" != "${dlist.sysNo}"){
				$('input').attr("readonly", true);
				$('select').attr("disabled","disabled");
				$(".toggle").hide();
			}
			
			//현재날짜부터 선택 가능
 			let today = new Date();   
 			let sysdate =
 			    leadingZeros(today.getFullYear(), 4) + '-' +
 			    leadingZeros(today.getMonth() + 1, 2) + '-' +
 			    leadingZeros(today.getDate(), 2);
 			
			console.log(sysdate); 			
 			$('#srDdlnDate').attr("min", sysdate);
 			$('#srStartDate').attr("min", sysdate);
 			$('#srStartDate').val(sysdate);
 			$('#srEndDate').attr("min", sysdate);
 			
		});
	 	
 		function falseDisabled(){
 			$(".taskNo").prop("disabled", false);
 			$("#updateHrForm").submit();
 			let msg = '알림이 도착하였습니다.'
    		socket.send(msg);
 		};
 		
 		function getToday(){
 			let today = new Date();   
 			let sysdate =
 			    leadingZeros(today.getFullYear(), 4) + '-' +
 			    leadingZeros(today.getMonth() + 1, 2) + '-' +
 			    leadingZeros(today.getDate(), 2);
 			return sysdate;
 		}
 		
 		function leadingZeros(n, digits) {
			//오늘 날짜 양식 (+두자리)
			  var zero = '';
			  n = n.toString();
	
			  if (n.length < digits) {
			    for (i = 0; i < digits - n.length; i++)
			      zero += '0';
			  }
			  return zero + n;
		};
 		
 		$('#srDdlnDate').on('change', function() {
 			let end = $('#srDdlnDate').val();
 			//현재날짜 구하기
 			let today = new Date();   
 			let sysdate =
 			    leadingZeros(today.getFullYear(), 4) + '-' +
 			    leadingZeros(today.getMonth() + 1, 2) + '-' +
 			    leadingZeros(today.getDate(), 2);
 			
			console.log(sysdate); 			
 			console.log($('#srDdlnDate').val());
 			//날짜 범위 구하기
 			$('#srStartDate').attr("max", end);
 			
 			$('#srEndDate').attr("min", sysdate);
 			$('#srEndDate').attr("max", end);
 			$('#srEndDate').val(end);
 			
 			$('#messageDdln').remove();
 			$('#messageEndDate').remove();
 			
 		});
 		
 		$('#srStartDate').on('change', function(){
 			//시작날짜 범위 지정
 			let min = $('#srStartDate').val();
 			$('#srEndDate').attr("min", min);
 			$('#messageStartDate').remove();
 		});
 	
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
					$('#HrList').empty();
					$('#srDevDp').val(data[0].userDpNm);
					$('#pickDevNm').empty();
					$('#leaderNo').val(data[0].userNo);
					$('#pickDevNm').append(data[0].userNm);
			
					$('.addlist').prop("disabled", true);
					if($('#messageDev').val() != "" || $('#messageDev').val() != null || $('#messageDev').val() != undefined){
						$('#messageDev').remove();
					}
				},
				error : function(request, status, error) {
					console.log("실패");
					alert("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
				}
			});
		};
		
		function selectAll(selectAll) {
			//전체 체크하기
			const checkboxes = document.querySelectorAll('input[class="selectall"]');
		  	checkboxes.forEach((checkbox) => {
		    	checkbox.checked = selectAll.checked
		  	});
		  	
		};
		
		function checkSelectAll(checkbox)  {
			//체크 해제
			const selectall  = document.querySelector('input[class="selectall"]');
		  
		  	if(checkbox.checked === false) {
		    	selectall.checked = false;
		  	}
		};

		function registerDevelop(){
			//SR개발계획 등록
			console.log("개발계획 등록");
			let srDevDp = $('#srDevDp').val();
			let srDdlnDate = $('#srDdlnDate').val();
			let srStartDate = $('#srStartDate').val();
			let srEndDate = $('#srEndDate').val();
			
			let srCn = $('#srDevCn').val();
		
			
			let check = true;
			if(srDevDp == null || srDevDp === undefined || srDevDp === ""){
				check = false;
				console.log("srDevdp: "+check);
				$('#messageDev').html("<small>*개발자를 선택해주세요</small>");
			} 
			if (srDdlnDate == null || srDdlnDate === undefined || srDdlnDate ==="") {
				check = false;
				console.log("srDdlnDate: "+check);
				console.log(srDdlnDate);
				$('#messageDdln').html("<small>*완료예정날짜를 선택해주세요.</small>")
			}

			if (srStartDate == null || srStartDate === undefined || srStartDate==="") {
			  	check = false;
			  	console.log("srStartDate: "+check);
			  	$('#messageStartDate').html("<small>*계획시작날짜를 선택해주세요.</small>");
			}

			if (srEndDate == null || srEndDate === undefined || srEndDate==="") {
			  	check = false;
			  	console.log("srEndDate: "+check);
			  	$('#messageEndDate').html("<small>*계획종료날짜를 선택해주세요.</small>");
			}
			if (srCn == null || srCn === undefined || srCn==="") {
			  	check = false;
			  	console.log("srCn: "+check);
			  	console.log("srCn: "+srCn);
			  	$('#messageDevCn').html("<small>*내용을 작성해주세요.</small>");
			}
			
			$('#selectDev').empty();
			$('#selectDev').append('<h3>[' + srDevDp + '] 등록하기 </h3>');
			$('#leaderSdate').val(srStartDate);
			$('#leaderEdate').val(srEndDate);
			console.log(srStartDate);
			
			if(check == false){
				$('#checkBody').html("<h5>다시 입력해주세요.</h5>");
				$('#checkEffectiveness').modal('show');
				
			} else {
				selectList(check);
			}
			
	
		}
		
		$('#srDevCn').on('input', function() {
	 		    if($(this).val() != '') {
	 		    	$('#messageDevCn').remove();
	 		    }
	 	});
	
		function selectList(check) {
			//모달리스트 띄우기
			console.log("조건의 유무: "+check);
			let userNo = $('#srDLeader option:first').val();
			if(userNo == "" || userNo == undefined || userNo == null){
				userNo = $('#srDLeader').val();
			}
			let userDpNm = $('#srDevDp').val();
			let startDate = $('#srStartDate').val();
			let endDate = $('#srEndDate').val(); 
			console.log($('#srDLeader option:first').val());
			console.log(userNo);
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
					let message = "<h5>등록 되었습니다.</h5>";
					$('.validate').remove();
					$("#checkBody").html(message);
					$("#modalContent").html(data);
					$('.addlist').prop("disabled", false);
					$('.modalCenter').prop("disabled",false);
				},
				error : function(request, status, error) {
					if(!check){
						let message = "<h5>다시 입력해주세요.</h5>";
						$("#checkBody").html(message);
					}
				}
				 	
			});
		};
	
		function submitDev() {
			//HR리스트에 일반개발자 등록
			var checkBoxArr = [];
			var srNo = '${dlist.srNo}';
			console.log(srNo);
			$("input:checkbox[name='devName']:checked").each(function(i) {
				//체크박스값 배열에 넣기
				var userNo = $(this).val();
				var data = {
					userNo : userNo,
					srNo : srNo
				};
				console.log("data"+data);
				checkBoxArr.push(data);
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
		
		$(document).on('click', '.deleteHr', function(){
			//리스트 지우기
			let userNo = $(this).parent().parent().find('input').val();
			console.log($(this).parent().parent().find('input').val());
			console.log('hr삭제하기');
			$(this).parent().parent().remove();
			$("#" + userNo).prop("checked", false);
			$("#allcheck").prop("checked", false);
		})

		function checkSubmit() {
			
			let check = 0;
			let sysdate = getToday();
			let rightaway = false;
			
			if($('#srStartDate').val() === sysdate){
					rightaway = true;
			};
			
			console.log(sysdate === $('#srStartDate').val());
			console.log("$('#sttsNo').val(): "+$('#sttsNo').val());
			console.log("sysdate: "+ sysdate);
			console.log("$('#srStartDate').val(): "+$('#srStartDate').val());
			console.log("rightaway: "+rightaway);
			
			for(let i = 0;i<$("select[name=taskNo]").length;i++){
				if(($("select[name='taskNo']").eq(i).val() === undefined || $("select[name='taskNo']").eq(i).val() == null || $("select[name='taskNo']").eq(i).val() === "")){
					check++;
					console.log("taskNo" + i +" = " + check);
				} 
				
				if(($("input[name='hrStartDate']").eq(i).val() === undefined || $("input[name='hrStartDate']").eq(i).val() == null || $("input[name='hrStartDate']").eq(i).val() === "")){
					check++;
					console.log("hrStartDate" + i +" = " + check);
				} 
					
				if(($("input[name='hrEndDate']").eq(i).val() === undefined || $("input[name='hrEndDate']").eq(i).val() == null || $("input[name='hrEndDate']").eq(i).val() === "")){
					check++;
					console.log("hrEndDate" + i +" = " + check);
				}
			};
			console.log("check: "+ check);
			
			if($('#sttsNo').val() === '5'){
				if(check == 0 && rightaway == true) {
					//개발중으로 등록
					$('.modalCenter').attr("data-dismiss","modal");
					$('.modalCenter').attr("data-target","#exampleModalCenter");
					$('.modalCenter').attr("data-toggle", "modal");
				} else {
					if(check > 0 && rightaway == true) {
						$('#checkBody').html('<h5>필수사항을 모두 작성해주세요.</h5>');
					} else if(check == 0 && rightaway == false) {
						$('#checkBody').html('<h5>날짜를 확인해주세요.</h5>');
					}
				};
			 } else if($('#sttsNo').val() === '9'){
				
				if(check == 0 && rightaway === false){
					//개발계획으로 등록
					$('.modalCenter').attr("data-dismiss","modal");
					$('.modalCenter').attr("data-target","#exampleModalCenter");
					$('.modalCenter').attr("data-toggle", "modal");
				} else if(check > 0){
					$('#checkBody').html('<h5>필수사항을 모두 작성해주세요.</h5>');
				} else {
					$('#checkBody').html('<h5>날짜를 확인해주세요.</h5>');
				};
			}; 
		};
		
	</script>
	
</body>
</html>