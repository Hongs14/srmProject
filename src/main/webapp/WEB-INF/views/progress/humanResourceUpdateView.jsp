<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
	<script>
	  	$(document).ready(function () {
		    $('#simple-date4 .input-daterange .a').datepicker({        
		        format: 'yyyy-mm-dd',        
		        autoclose: true,     
		        todayHighlight: true,   
		        todayBtn: 'linked',
		      });  
	  	});
	</script>
	<div class="table-responsive p-3">
		<table class="table align-items-center table-hover border">
			<thead class="thead-light">
				<tr>
					<th>직책</th>
					<th>성명</th>
					<th>투입 날짜</th>
					<th>투입 형태</th>
				</tr>
			</thead>
			<tbody>
			<tr>
				<td>${developer.userJbps}</td>
				<td>${developer.userNm}</td>
				<td>
					<div class="form-group row" id="simple-date4">
						<div class="input-daterange input-group input-group-sm">
							<c:choose>
								<c:when test="${startresult}">
									<input type="text" value="${developer.hrStartDate}" class="a input-sm form-control form-control-sm col-sm-9" name="start" id="start"/>
								</c:when>
								<c:otherwise>
									<input type="text" value="${developer.hrStartDate}" class="input-sm form-control form-control-sm col-sm-9" name="start" id="start" readonly/>
								</c:otherwise>
							</c:choose>
							<div class="input-group-prepend">
								<span class="input-group-text" style="height: 31px;">~</span>
							</div>
							<c:choose>
								<c:when test="${endresult}">
									<input type="text" value="${developer.hrEndDate}" class="a input-sm form-control form-control-sm" name="end" id="end"/>
								</c:when>
								<c:otherwise>
									<input type="text" value="${developer.hrEndDate}" class="input-sm form-control form-control-sm" name="end" id="end" readonly/>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</td>
				<td>${developer.taskNm}</td>
			</tr>
			</tbody>
		</table>
		<br/>
		<div class="d-sm-flex justify-content-end">
			<button type="button" class="btn btn-outline-primary mr-2" data-dismiss="modal">닫기</button>
			<button type="button" class="btn btn-primary" id="updateDeveloper">수정</button>
		</div>
		
		<script>
			$("#updateDeveloper").click(function(){
				var srNo = "${developer.srNo}";
				var userNo = ${developer.userNo};
				
				var hrStartDate = document.getElementById("start").value;
				var hrEndDate = document.getElementById("end").value;
				
				console.log(srNo);
				console.log(userNo);
				console.log(hrStartDate);
				console.log(hrEndDate);
				
				let data = {srNo : srNo, userNo : userNo, hrStartDate : hrStartDate, hrEndDate : hrEndDate};
				
				$.ajax({
					url : "developerUpdate",
					method : "post",
					data : JSON.stringify(data),
					contentType : "application/json; charset=UTF-8"
				}).done((data) => {
					windows.location.href = "${developer.srNo}";
				});
			});
		</script>
</div>