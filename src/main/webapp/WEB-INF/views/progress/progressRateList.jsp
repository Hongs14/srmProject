<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.Enumeration" %>
<% session.removeAttribute("message"); %>

<!DOCTYPE html>
		<script>
	  	$(document).ready(function () {
		    $('.input-daterange .a').datepicker({        
		        format: 'yyyy-mm-dd',        
		        autoclose: true,     
		        todayHighlight: true,   
		        todayBtn: 'linked',
		      });  
	  	});
	</script>

	<div class="table-responsive p-1">
	<div class="input-group-append float-right mb-3">
		<c:if test="${!(sttsNm == '완료요청' || sttsNm == '개발 완료')}">
			<c:if test="${check}">
				<button class="btn btn-primary btn-sm mr-2" type="button" onclick="progressRateALLAdd()">
					저장
				</button>
				<button class="btn btn-primary btn-sm mr-2" type="button" data-toggle="modal" data-target="#progressFinishRequestModal" onclick="progressRequestModal(1)">
					완료 요청
				</button>
			</c:if>
		</c:if>
		<c:if test="${sttsNm == '완료요청'}">
			<c:if test="${userNo == managerNo}">
				<button class="btn btn-warning btn-sm mr-2" type="button" data-toggle="modal" data-target="#progressFinishRequestModal" onclick="progressRequestModal(2)">
					개발 완료 승인
				</button>
			</c:if>
		</c:if>
	</div>
		<table class="table align-items-center table-flush table-hover">
			<thead class="thead-light">
				<tr>
					<th>작업 구분</th>
					<th>시작일</th>
					<th>종료일</th>
					<th>진척율(누적)</th>
					<th>산출물</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${!(sttsNm == '완료요청' || sttsNm == '개발 완료') && check}">
					<c:forEach var="list" items="${progressRateList}">
						<tr>
							<c:if test="${list.progType != 5 && list.progType != 6}">
								<th>
									<a onclick="progressRateAdd('${list.progNo}')" data-toggle="modal" data-target="#progressRateModal">
										${list.progTypeNm}
									</a>
								</th>
								<th class="input-daterange p-3" style="width:170px;">
									<input type="text" value="${list.progStartDate}" class="a form-control form-control-sm" id="start-${list.progNo}"/>
								</th>
								<th class="input-daterange p-3" style="width:170px;">
									<input type="text" value="${list.progEndDate}" class="a form-control form-control-sm" id="end-${list.progNo}"/>
								</th>
								<th class="input-daterange p-3" style="width:100px;">
									<input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value="${list.progRate}" min="0" class="form-control form-control-sm" id="rate-${list.progNo}"/>
								</th>
								<th class="pl-5">
									<c:if test="${list.progressFile[0].progFileNo != null}">
										<div class="row d-flex flex-column text-left">
											<c:forEach var="fileList" items="${list.progressFile}">
										
												<a href="progressFiledownload/${list.srNo}/?progFileNo=${fileList.progFileNo}">
													<span>[${fileList.progFileActlNm}]</span>
												</a>
											</c:forEach>
										</div>
									</c:if>
								</th>
							</c:if>
							<c:if test="${list.progType == 5 || list.progType == 6}">
								<th>
									${list.progTypeNm}
								</th>
								<th>
									${list.progStartDate}
								</th>
								<th>
									${list.progEndDate}
								</th>
								<th>
									${list.progRate}
								</th>
								<th>
									<c:if test="${list.progressFile[0].progFileNo != null}">
										<div class="row">
											<c:forEach var="fileList" items="${list.progressFile}">
												<a href="progressFiledownload/${list.srNo}/?progFileNo=${fileList.progFileNo}">
													<span>[${fileList.progFileActlNm}]</span>
												</a>
											</c:forEach>
										</div>
									</c:if>
								</th>
							</c:if>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${sttsNm == '완료요청' || sttsNm == '개발 완료' || !check}">
					<c:forEach var="list" items="${progressRateList}">
						<tr>
							<th>
								${list.progTypeNm}
							</th>
							<th>
								${list.progStartDate}
							</th>
							<th>
								${list.progEndDate}
							</th>
							<th>
								${list.progRate}
							</th>
							<th>
								<c:if test="${list.progressFile[0].progFileNo != null}">
									<div class="row">
										<c:forEach var="fileList" items="${list.progressFile}">
											<a href="progressFiledownload/${list.srNo}/?progFileNo=${fileList.progFileNo}">
												<span>[${fileList.progFileActlNm}]</span>
											</a>
										</c:forEach>
									</div>
								</c:if>
							</th>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	<!-- 모달 창 -->
	<div class="modal fade" id="progressRateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
		<div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable" role="document">
			<div class="modal-content">
				<div id="progressRateModalView"></div>
			</div>
		</div>
	</div>
	<!-- 완료 요청 모달 -->
	<div class="modal fade" id="progressFinishRequestModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
		<div class="modal-dialog modal-md modal-dialog-centered modal-dialog-scrollable" role="document">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<h5 class="modal-title" id="exampleModalLabelLogout">
			          	<img src="${pageContext.request.contextPath}/resources/images/logoOnly.png" style="width:20px;">
			        	<small class="text-white">
			        		<b>요청 신청</b>
			        	</small>
					</h5>
					<button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body p-5" style="white-space: normal;">
					<div class="alert alert-secondary m-3 p-2" role="alert">
						<h6><i class="fas fa-exclamation-triangle"></i><b> 안내 </b></h6>
						<div id="message"></div>
					</div>
				</div>
				<div class="modal-footer" id="footer">
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	function progressRateAdd(progNo) {
		$.ajax({
			url : "progressRateAdd/" + progNo,
			method : "post"
		}).done((data) => {
			$("#progressRateModalView").html(data)
		});
	}
	
	function progressRequestModal(choice) {
		if(choice == 1) {
			var progRateArr = new Array();
		
			<c:forEach var="list" items="${progressRateList}" begin="0" end="3">
				progRateArr.push(${list.progRate})
			</c:forEach>
			
			var a = null;
			
			if(progRateArr[0] != 20) {
				a = "요구정의가 끝나지 않아서 요청하실 수 없습니다.";
			} else if(progRateArr[1] != 40) {
				a = "분석/설계가 끝나지 않아서 요청하실 수 없습니다.";
			} else if(progRateArr[2] != 60) {
				a = "구현이 끝나지 않아서 요청하실 수 없습니다.";
			} else if(progRateArr[3] != 80) {
				a = "테스트가 끝나지 않아서 요청하실 수  없습니다.";
			} 
			
			if(a == null) {
				$("#message").text("요청하시겠습니까?");
				$('#footer').empty();
				let htmlData = '';
				htmlData += '<button class="btn btn-primary mr-2" type="button" onclick="progressRateFinishRequest(1)">'
				htmlData += "네"
				htmlData += '</button>'
				htmlData += '<button type="button" class="btn btn-outline-primary mr-2" data-dismiss="modal">닫기</button>';
				$('#footer').append(htmlData)
			} else {
				$("#message").text(a);
			}
			
		} else {
			$("#message").text("승인하시겠습니까?");
			$('#footer').empty();
			let htmlData = '';
			htmlData += '<button class="btn btn-primary mr-2" type="button" onclick="progressRateFinishRequest(2)">'
			htmlData += "네"
			htmlData += '</button>'
			htmlData += '<button type="button" class="btn btn-outline-primary mr-2" data-dismiss="modal">닫기</button>';
			$('#footer').append(htmlData)
		}
	}
	
	function progressRateALLAdd() {
		var progressArr = new Array();
		
		<c:forEach var="list" items="${progressRateList}" end="3">
			progNo = "${list.progNo}"
			
			var progStartDate = document.getElementById("start-${list.progNo}").value;
			var progEndDate = document.getElementById("end-${list.progNo}").value;
			var progRate = document.getElementById("rate-${list.progNo}").value;
			
			var data = {progNo : progNo, progStartDate : progStartDate, progEndDate : progEndDate, progRate : progRate}
			progressArr.push(data);
		</c:forEach>
		var srNo = "${srNo}"
		
		data = {srNo : srNo, progressArr : progressArr}
		
		$.ajax({
			url : "progressRateAllAdd",
			method : "post",
			data : JSON.stringify(data),
			contentType : "application/json; charset=UTF-8"
		}).done((data) => {
			window.location.href = "${progress.srNo}";
		});
	}
	
	function progressRateFinishRequest(choice) {
		var srNo = "${srNo}"
		
		if(choice == 1) {
			<c:forEach var="list" items="${progressRateList}" begin="4" end="4">
				progNo = "${list.progNo}"
			</c:forEach>
		} else {
			<c:forEach var="list" items="${progressRateList}" begin="5" end="5">
				progNo = "${list.progNo}"
			</c:forEach>
		}
		
		data = {srNo : srNo, progNo : progNo, choice : choice}
		
		$.ajax({
			url : "progressRateFinishRequest",
			method : "post",
			data : JSON.stringify(data),
			contentType : "application/json; charset=UTF-8"
		}).done((data) => {
			window.location.href = "${progress.srNo}";
		});
	}
</script>