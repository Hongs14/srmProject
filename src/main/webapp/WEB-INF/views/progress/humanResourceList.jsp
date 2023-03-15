<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import = "java.util.Enumeration" %>
<% session.removeAttribute("message"); %>
    
<!DOCTYPE html>
	<script>
	  	$(document).ready(function () {
		    $('#simple-date4 .input-daterange').datepicker({        
		        format: 'yyyy-mm-dd',        
		        autoclose: true,     
		        todayHighlight: true,   
		        todayBtn: 'linked',
		      });  
	  	});
	</script>
	<div class="humanResourceList">
		<div class="input-group-append float-right mb-3">
			<c:if test="${!(sttsNm == '완료요청' || sttsNm == '개발 완료')}">
				<c:if test="${userNo == managerNo}">
					<button class="btn btn-primary btn-sm mr-2" type="button" data-toggle="modal" data-target="#HumanResourceAdd" id="#modalScroll">
						추가
					</button>
					<button class="btn btn-primary btn-sm mr-2" type="button" data-toggle="modal" data-target="#HumanResourceUpdate" id="#modalScroll" onclick="developerUpdate()">
						변경
					</button>
					<button class="btn btn-primary btn-sm" type="button" data-toggle="modal" data-target="#messageModal" id="#modalScroll" onclick="developerDelete()">
						삭제
					</button>
				</c:if>
			</c:if>
		</div>
		<div id="systemView" class="mb-2 text-left">
			<div style="border: 2px solid #e3e6f0; border-radius:5px;" class="p-2">
				<div class="d-flex mb-1">
					<span class="text-primary font-weight-bold p-2"><i class="fa-solid fa-circle-info mx-1"></i>시스템 정보</span>
				</div>
				<div class="row px-5 mb-1">
					<span class="col-sm-3 font-weight-bold"><i class="fa-solid fa-user-tie mr-2"></i>시스템 관리자:</span> 
					<span class="col-sm-3">${userData.userNm}</span> 
					<span class="col-sm-3 font-weight-bold"><i class="fa-solid fa-wrench mr-2"></i>업데이트 일자:</span>
					<span class="col-sm-3">${userData.sysUpdtDate}</span>
				</div>
				<div class="row px-5 mb-1">
					<span class="col-sm-3 font-weight-bold"><i class="fa-solid fa-mobile-screen-button mr-2"></i>관리자 연락처:</span> 
					<span class="col-sm-3">${userData.userTelno}</span> 
					<span class="col-sm-3 font-weight-bold"><i class="fa-solid fa-envelope mr-2"></i>관리자 메일:</span>
					<span class="col-sm-3">${userData.userEml}</span>
				</div>
			</div>
		</div>
		<table class="table align-items-center table-flush table-hover p-2">
			<thead class="thead-light">
				<tr>
					<c:if test="${userNo == managerNo}">
						<c:if test="${!(sttsNm == '완료요청' || sttsNm == '개발 완료')}">
							<th></th>
						</c:if>
					</c:if>
					<th>리더 여부</th>
					<th>성명</th>
					<th>부서 명</th>
					<th>직책</th>
					<th>전화번호</th>
					<th>담당업무</th>
					<th>시작 날짜</th>
					<th>끝 날짜</th>
				</tr>
			</thead>
			<c:forEach var="list" items="${hrList}">
				<tr>
					<c:if test="${userNo == managerNo}">
						<c:if test="${!(sttsNm == '완료요청' || sttsNm == '개발 완료')}">
							<th>
								<div class="custom-control custom-radio">
									<input type="radio" id="SR+${list.userNo}" name="customRadio" class="custom-control-input" value="${list.userNo}">
									<label class="custom-control-label" for="SR+${list.userNo}"></label>
								</div>
							</th>
						</c:if>
					</c:if>
					<th id="leader+${list.userNo}">
						<c:if test="${list.hrLeader eq 'Y'}">
							<span class="badge badge-warning">Leader</span>
						</c:if>
						<c:if test="${list.hrLeader eq 'N'}">
							<span class="badge badge-secondary">Dev</span>
						</c:if>
					</th>
					<th>${list.userNm}</th>
					<th>${list.userDpNm}</th>
					<th>${list.userJbps}</th>
					<th>${list.userTelno}</th>
					<th>${list.taskNm}</th>
					<th id="startDate+${list.userNo}">
						<fmt:formatDate value="${list.hrStartDate}" pattern="yyyy-MM-dd" />
					</th>
					<th id="endDate+${list.userNo}">
						<fmt:formatDate value="${list.hrEndDate}" pattern="yyyy-MM-dd" />
					</th>
				</tr>
			</c:forEach>
		</table>
	
	<!-- 수정 모달 창 -->
	<div class="modal fade" id="HumanResourceUpdate" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable" role="document">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<h5 class="modal-title" id="exampleModalScrollableTitle">
			          	<img src="${pageContext.request.contextPath}/resources/images/logoOnly.png" style="width:20px;">
			        	<small class="text-white">
			        		<b>수정</b>
			        	</small>
					</h5>
					<button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div id="developerUpdateView" style="width:100%"></div>
			</div>
		</div>
	</div>
	<!-- 추가 모달 창 -->
	<div class="modal fade" id="HumanResourceAdd" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
		<div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable" role="document">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<h5 class="modal-title" id="exampleModalScrollableTitle">
						<img src="${pageContext.request.contextPath}/resources/images/logoOnly.png" style="width:20px;">
			        	<small class="text-white">
			        		<b>개발자 추가</b>
			        	</small>
					</h5>
					<button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body justify-content-center text-center p-5">
					<div style="text-align:left">
						<h5>${hrList.get(0).userDpNm}</h5>
					</div>
					<c:if test="${empty developerList}">
						<div class="alert alert-secondary m-3 p-2" role="alert">
			                  <h6><i class="fas fa-exclamation-triangle"></i><b> 안내 </b></h6>
			                  	${hrList.get(0).userDpNm}에 투입 가능한 인력이 더이상 존재하지 않습니다.
						</div>
					</c:if>
					<c:if test="${!empty developerList}">
						<table class="table align-items-center table-flush table-hover">
							<thead class="thead-light">
								<tr>
									<th>선택</th>
									<th>직책</th>
									<th>성명</th>
									<th>전화번호</th>
									<th colspan="4">업무사항</th>
									<th>투입 날짜</th>
									<th>투입 형태</th>
								</tr>
							</thead>
							<c:forEach var="list" items="${developerList}">
								<tr>
									<td valign="middle">
										<input type="checkbox" name="developerCheckBox">
									</td>
									<td valign="middle" style="display:none">${srNo}</td>
									<td style="display:none">${list.userNo}</td>
									<td>${list.userJbps}</td>
									<td>${list.userNm}</td>
									<td>${list.userTelno}</td>
									<td style="width:200px; overflow:hidden; text-overflow: ellipsis; display:block;">
										<c:forEach var="srlist" items="${list.srList}">
											${srlist.srTtl}
											<br/>
										</c:forEach>
									</td>
									<td>
										<c:forEach var="srlist" items="${list.srList}">
											${srlist.hrStartDate}
											<br/>
										</c:forEach>
									</td>
									<td>
										<c:forEach var="srlist" items="${list.srList}">
											~
											<br/>
										</c:forEach>
									</td>
									<td>
										<c:forEach var="srlist" items="${list.srList}">
											${srlist.hrEndDate}
											<br/>
										</c:forEach>
									</td>
									<td align="center">
										<div class="form-group row" id="simple-date4" style="width:250px">
											<div class="input-daterange input-group input-group-sm">
												<input type="text" value="" class="input-sm form-control form-control-sm col-sm-9" name="start" id="start-${list.userNo}"/>
												<div class="input-group-prepend">
													<span class="input-group-text" style="height: 31px;">~</span>
												</div>
												<input type="text" class="input-sm form-control form-control-sm" name="end" id="end-${list.userNo}"/>
											</div>
										</div>
									</td>
									<td align="center">
										<div style="width:100px">
											<select class="form-control form-control-sm col-sm-9" id="dv-${list.userNo}" style="width:100%; text-align:center">
												<c:forEach var="list" items="${taskList}">
													<option value="${list.taskNo}">${list.taskNm}</option>
												</c:forEach>
					                    	</select>
				                    	</div>
									</td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
				</div>
				<div class="modal-footer">
					<c:if test="${!empty developerList}">
						<button type="button" class="btn btn-primary" onclick="selectDeveloper()" data-toggle="modal" data-target="#messageModal" id="#modalScroll">등록</button>
					</c:if>
					<button type="button" class="btn btn-outline-primary" data-dismiss="modal">닫기</button>
					<script>
						function selectDeveloper() {
							var count = 0;
							var thArr = new Array();
							var checkbox = $("input[name=developerCheckBox]:checked");
							
							// 체크된 체크박스의 값을 가져옴
							checkbox.each(function(i) {
								var tr = checkbox.parent().parent().eq(i);
								var th = tr.children();
								
								var srNo = th.eq(1).text();
								var userNo = th.eq(2).text();
								var taskNoSelect = document.getElementById("dv-"+userNo);
								var taskNo = taskNoSelect.options[document.getElementById("dv-"+userNo).selectedIndex].value;
								var hrStartDate = document.getElementById("start-"+userNo).value;
								var hrEndDate = document.getElementById("end-"+userNo).value;
								
								let data = {srNo : srNo, userNo : userNo, taskNo : taskNo, hrStartDate : hrStartDate, hrEndDate : hrEndDate}
								
								thArr.push(data);
								count = 1;
							});
							
							if(count == 1) {
								data = {thArr : thArr};
								
								$.ajax({
									url : "developerinsert/" + "${srNo}",
									method : "post",
									data : JSON.stringify(data),
									contentType: "application/json; charset=UTF-8"
								}).done((data) => {
									$('#HumanResourceAdd').modal('hide');
									$("#Modalmessage").text("개발자가 추가 되었습니다.");
									setTimeout(function() {
										window.location.href ='${srNo}';
									}, 2000);
								});
							} else {
								$('#HumanResourceAdd').modal('hide');
								$("#Modalmessage").text("개발자를 선택해 주세요.");
								setTimeout(function() {
									$('#messageModal').modal('hide');
									$('#HumanResourceAdd').modal('show');
								}, 2000);
							}
						};
						
						function developerUpdate() {
							const customRadioNodeList = document.getElementsByName('customRadio');
							let userNo = null;
							customRadioNodeList.forEach((node) => {
								if(node.checked) {
									userNo = node.value;
								}
							});
							
							if(userNo == null) {
								$("#developerUpdateView").empty();
								let userNoNullData = '';
								userNoNullData += '<div class="modal-body" style="white-space: normal;">';
								userNoNullData += '	<div class="alert alert-secondary m-3 p-2" role="alert">';
								userNoNullData += '		<h6><i class="fas fa-exclamation-triangle"></i><b> 안내 </b></h6>';
								userNoNullData += '			수정할 인력을 선택해 주세요.';
								userNoNullData += '	</div>';
								userNoNullData += '</div>';
								userNoNullData += '<div class="modal-footer">';
								userNoNullData += '	<button type="button" class="btn btn-outline-primary mr-2" data-dismiss="modal">닫기</button>';
								userNoNullData += '</div>';
								$("#developerUpdateView").append(userNoNullData);
							} else {
								var srNo = '${srNo}';
								let data = {srNo : srNo, userNo : userNo};
								
								$.ajax({
									url : "developerUpdateView",
									method : "post",
									data : JSON.stringify(data),
									contentType : "application/json; charset=UTF-8"
								}).done((data) => {
									$("#developerUpdateView").html(data)
								});
							}
						}
							
						function developerDelete() {
							const customRadioNodeList = document.getElementsByName('customRadio');
							let userNo = null;
							
							customRadioNodeList.forEach((node) => {
								if(node.checked) {
									userNo = node.value;
								}
							});
							
							if(userNo == null) {
								$("#Modalmessage").text("삭제할 인력을 선택해 주세요.");
							} else {
								var start = document.getElementById("startDate+"+userNo).innerText;
								var end = document.getElementById("endDate+"+userNo).innerText;
								var leader = document.getElementById("leader+"+userNo).innerText;
								
								var startDate = new Date(start);
								var endDate = new Date(end);
								var today = new Date();
								
								if(leader == 'Leader') {
									$("#Modalmessage").text("리더라서 삭제할수 없습니다.");
								} else {
									if(startDate <= today) {
										$("#Modalmessage").text("이미 일을 시작했기 때문에 삭제할 수 없습니다.");
									} else {
										var srNo = '${srNo}';
										let data = {srNo : srNo, userNo : userNo};
										
										$.ajax({
											url : "developerDelete",
											method : "post",
											data : JSON.stringify(data),
											contentType : "application/json; charset=UTF-8"
										}).done((data) => {
											$("#Modalmessage").text("삭제 되었습니다.");
											setTimeout(function() {
												window.location.href ='${srNo}';
											}, 2000);
										})
									}
								}
							}
						}
					</script>
				</div>
			</div>
		</div>
	</div>
</div>