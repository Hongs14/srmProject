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
					$('#HrList').empty();
					$('#srDevDp').val(data[0].userDpNm);
					$('#pickDevNm').empty();
					$('#leaderNo').val(data[0].userNo);
					$('#pickDevNm').append(data[0].userNm);
			
					$('.addlist').prop("disabled", true);
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
		  
		  	if(checkbox.checked === false)  {
		    	selectall.checked = false;
		  	}
		};

		function registerDevelop(){
			console.log("개발계획 등록");
			let srDevDp = $('#srDevDp').val();
			let srDdlnDate = $('#srDdlnDate').val();
			let srStartDate = $('#srStartDate').val();
			let srEndDate = $('#srEndDate').val();
			
			$('#selectDev').empty();
			$('#selectDev').append('<h3>[' + srDevDp + '] 등록하기 </h3>');
			$('#leaderSdate').val(srStartDate);
			$('#leaderEdate').val(srEndDate);
			$('.addlist').prop("disabled", false);

			selectList();
	
		}
	
		function selectList() {
			//모달리스트 띄우기
			let userDpNm = $('#srDevDp').val();
			let startDate = $('#srStartDate').val();
			let endDate = $('#srEndDate').val(); 
			let userNo = $('#srDLeader').val();
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
					$("#modalContent").html(data);
				},
				error : function(request, status, error) {
					
				}
			});
		};
	
		function submitDev() {
			//HR리스트에 일반개발자 등록
			var checkBoxArr = [];
			var srNo = '${dlist.srNo}';
			console.log("aAAAAAAAA"+srNo);
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
											<form action='<c:url value="/develop/updateHr"/>' method="post">
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
																	<option value="5" selected>개발중</option>
																	<option value="9">개발계획</option>
																</select>
															</div>
														</div>
														<div class="form-group row mb-2">
															<div class="col-sm-4 col-form-control pr-0 row">
																<h6 class="text-danger">*&nbsp;</h6><h6 class="m-0 font-weight-bold ">개발 내용</h6>
															</div>
															<div class="col-sm-8 p-2">
														 		<textarea class="toggle" name="srDevCn" id="srDevCn" style="width: 100%; height:135px" required>${dlist.srDevCn}</textarea>
															</div>
														</div>
														
														<div class="form-group row">
															<div class="col-sm-4 col-form-label row">
																<h6 class="text-danger">*&nbsp;</h6><h6 class="m-0 font-weight-bold ">완료(예정)일</h6>
															</div>
															<div class="col-sm-8">
																<input type="date" id="srDdlnDate" name="srDdlnDate" value="${dlist.srDdlnDate}" class="form-control" required/>
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
															</div>
														</div>
														<div class="form-group row">
															<div class="col-sm-4 col-form-label row">
																<h6 class="text-danger">*&nbsp;</h6><h6 class="m-0 font-weight-bold">계획 종료일</h6>
															</div>
															<div class="col-sm-8">
																<input type="date" id="srEndDate" name="srEndDate" value="${dlist.srEndDate}" class="form-control" required />
															</div>
														</div>
														<div class="text-right">
															<input type="hidden" id="srNo" value="${dlist.srNo}" />
															<button type="button" id="button" class="btn btn-sm btn-primary mr-4 toggle" onclick="registerDevelop()"> 등록 ▶</button>
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
																<div class="col-sm-1 ">담당</div>
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
																						<input type="hidden" id="userNo" value="${devlist.userNo}"/>
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
																		<select name="taskNo" class="form-control mx-0" required>	
																			<c:if test="${dlist.sttsNo == 9}">
																				<c:forEach items="${hrlist}" var="devlist">
																					<c:if test="${devlist.hrLeader eq 'Y'}">
																						<option value="${devlist.taskNo}" disabled selected>${devlist.taskNm}</option>
																					</c:if>
																				</c:forEach>
																			</c:if>	
																			<c:if test="${dlist.sttsNo != 9 }">
																				<option disabled selected>작업구분</option>
																			</c:if>		
																			<option value="2">설계</option>
																			<option value="1">개발</option>
																			<option value="3">테스트</option>
																		</select>
																	</div>
																	<div class="col-sm-3 text-center">
																		<c:if test="${dlist.sttsNo == 9}">
																			<c:forEach items="${hrlist}" var="devlist" >
																				<c:if test="${devlist.hrLeader eq 'Y'}">
																					<input name="hrStartDate" id="leaderSdate" value="<fmt:formatDate value="${devlist.hrStartDate}" pattern="yyyy-MM-dd"/>" type="date" class="form-control" readonly />
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
																					<input name="hrStartDate" id="leaderSdate" value="<fmt:formatDate value="${devlist.hrEndDate}" pattern="yyyy-MM-dd"/>" type="date" class="form-control" readonly />
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
																					</div>
																				</div>
																				<div class="col-sm-3 text-center">
																					<select name="taskNo" class="form-control">
																						<option value="${devlist.taskNo}" disabled selected>${devlist.taskNm}</option>
																						<option value="2">설계</option>
																						<option value="1">개발</option>
																						<option value="3">테스트</option>
																					</select>
																				</div>
																				<div class="col-sm-3 text-center">
																					<input name="hrStartDate" type="date" value="<fmt:formatDate value="${devlist.hrStartDate}" pattern="yyyy/MM/dd"/>" class="form-control"/>
																				</div>
																					
																				<div class="col-sm-3 text-center">
																					<input name="hrEndDate" type="date" value="<fmt:formatDate value="${devlist.hrEndDate}" pattern="yyyy/MM/dd"/>" class="form-control"/>
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
																<button type="button" data-toggle="modal" data-target="#exampleModalCenter" id="#modalCenter" class="btn btn-primary toggle">저장</button>
															</c:if>
															<c:if test="${dlist.sttsNo == 9}">
																<button type="button" data-toggle="modal" data-target="#exampleModalCenter" id="#modalCenter" class="btn btn-primary toggle">수정</button>
															</c:if>
														</div>
														<!-- 확인 모달 -->
														<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
												        	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
												        	<div class="modal-dialog modal-dialog-centered" role="document">
												            	<div class="modal-content">
												                	<div class="modal-header bg-primary">
												                  	<h5 class="modal-title" id="exampleModalCenterTitle"></h5>
												                  		<img src="${pageContext.request.contextPath}/resources/images/logoOnly.png" style="width:20px;">
												                  		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												                    		<span aria-hidden="true">&times;</span>
												                  		</button>
												                	</div>
												                	<div class="modal-body"  style="white-space: normal;">
												                  		등록을 완료하겠습니까?
												                	</div>
												                	<div class="modal-footer">
												                  		<button type="button" class="btn btn-outline-primary" data-dismiss="modal">닫기</button>
												                  		<button type="submit" class="btn btn-primary">제출</button>
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
			
			if("${dlist.sttsNo}" != 9){
				let srCn = "<개발내용> \n \n ";
				$("#srDevCn").val(srCn);
			}
			
			
			
		});
 	
	</script>
	
</body>
</html>