<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
	<div class="modal-header bg-primary">
		<h5 class="modal-title" id="exampleModalScrollableTitle">
			<img src="${pageContext.request.contextPath}/resources/images/logoOnly.png" style="width:20px;">
        	<small class="text-white">
        		<b>기간 추가 확정</b>
        	</small>
		</h5>
	</div>
	<div class="modal-body" style="white-space: normal;">
		<div class="p-5" style="text-align:left">
			<!-- 등록자, 계획 변경 날짜 -->
			<div class="row">
				<div class="col-6">
					<span class="font-weight-bold">요청자: </span>
					<span>${changeRequest.userNm}</span>
				</div>
				<div class="col-6">
					<span class="font-weight-bold">요청 날짜: </span>
					<span>${changeRequest.crRegDate}</span>
				</div>
			</div>
			<br/>
			<!-- 제목 -->
			<div class="row">
				<div class="col-12">
					<span class="font-weight-bold">제목: </span>
					<span style="white-space:normal !important;">${changeRequest.crTtl}</span>
				</div>
			</div>
			<br/>
			<!-- 내용 -->
			<div class="row mb-1">
				<div class="col-2">
					<span class="font-weight-bold">내용 </span>
				</div>
				<div class="col-10 border" style="min-height:100px;">
					<span style="white-space:normal !important;">${changeRequest.crCn}</span>
				</div>
			</div>
			<br/>
			<!-- 계획 날짜, 상태 -->
			<div class="row">
				<div class="col-6">
					<span class="font-weight-bold">계획 연장 날짜: </span>
					<span>${changeRequest.crDdlnDate}</span>
				</div>
				<div class="col-6">
					<span class="font-weight-bold">신청 결과: </span>
					<span>${changeRequest.crResult}</span>
				</div>
			</div>
			<br/>
			<!-- 첨부파일 -->
			<div class="row">
				<div class="col-12">
					<span class="font-weight-bold ">첨부 파일</span>
					<div>
						<a href="ChangeRequestFileDownload/${changeRequest.crNo}">
							<span class="font-weight-bold ">${changeRequest.crFileActlNm}</span>
							<br/>
						</a>
					</div>
				</div>
			</div>
			<!-- 완료 예정일 입력창 -->
			<div id="finish">
			
			</div>
			<div id="buttonDiv" class="modal-footer justify-content-right mr-0">
				<button id="button1" type="submit" class="btn btn-primary" onclick="srUpdate()">
					계획 조정
				</button>
				<button id="button2" type="submit" class="btn btn-primary" onclick="srReturnUpdate()">
					반려
				</button>
				<button type="button" class="btn btn-outline-primary" data-dismiss="modal">
					닫기
				</button>
				<script>
					function srReturnUpdate() {
						$("#finish").empty();
						let htmlData = '';
						htmlData += '<br/>';
						htmlData += '<div class="row">';
						htmlData += '	<label class=" font-weight-bold col-sm-2">반려 내용</label>';
						htmlData += '	<textarea name="crCn" id="crCn" rows="5" class="form-control form-control-sm col-sm-10" wrap="hard"></textarea>';
						htmlData += '</div>';
						$("#finish").append(htmlData);
						
						$("#buttonDiv").empty();
						
						htmlData = '';
						htmlData += '<button id="button1" type="submit" class="btn btn-primary" onclick="updateReturnSubmit()">';
						htmlData += ' 확정 ';
						htmlData += '</button>';
						htmlData += '<button type="button" class="btn btn-outline-primary" data-dismiss="modal">';
						htmlData += ' 닫기 ';
						htmlData += '</button>';
						$("#buttonDiv").append(htmlData);
					}
				
					function srUpdate() {
						$("#finish").empty();
						let htmlData = '';
						htmlData += '<br/>';
						htmlData += '<div class="row">';
						htmlData += '	<label class="font-weight-bold col-sm-4" for="dateInput">완료 예정일 변경</label>';
						htmlData += '	<div class="form-group col-sm-4 px-0" id="simple-date1">';
						htmlData += '		<div class="input-group date">';
						htmlData += '			<div class="input-group-prepend">';
						htmlData += '				<span class="input-group-text" id="crRegDate"><i class="fas fa-calendar" ></i></span>';
						htmlData += '			</div>';
						htmlData += '			<input type="text" class="form-control" id="dateInput" style="height:30px;">';
						htmlData += '		</div>';
						htmlData += '	</div>';
						htmlData += '</div>';
						$("#finish").append(htmlData);
						
						$("#buttonDiv").empty();
						
						htmlData = '';
						htmlData += '<button id="button1" type="submit" class="btn btn-primary" onclick="updateSubmit()">';
						htmlData += ' 확정 ';
						htmlData += '</button>';
						htmlData += '<button type="button" class="btn btn-outline-primary" data-dismiss="modal">';
						htmlData += ' 닫기 ';
						htmlData += '</button>';
						$("#buttonDiv").append(htmlData);
						
						const today = new Date();
						
						// Bootstrap Date Picker
						$('#dateInput').datepicker({
						  format: 'yyyy/mm/dd',
						  todayBtn: 'linked',
						  todayHighlight: true,
						  autoclose: true,        
						});
					}
					
					function updateSubmit() {
						var srNo = '${changeRequest.srNo}';
						var date = document.getElementById("dateInput").value;
						var crDdlnDate = '${changeRequest.crDdlnDate}';
						var crNo = '${changeRequest.crNo}';
						
						var data = {srNo : srNo, date : date, crDdlnDate : crDdlnDate, crNo : crNo}
						
						$.ajax({
							url : "srChangeRequest",
							method : "post",
							data : JSON.stringify(data),
							contentType : "application/json; charset=UTF-8"
						}).done((data) => {
							window.location.href = "${changeRequest.srNo}";
						})
					}
					
					function updateReturnSubmit() {
					
					}
				</script>
			</div>
		</div>
	</div>
	
	<script>
		
	</script>
	