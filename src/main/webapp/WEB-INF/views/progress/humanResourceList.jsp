<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
	<div class="table-responsive p-3">
	<div class="input-group-append float-right mb-3">
		<button class="btn btn-primary btn-sm mr-3" type="button" data-toggle="modal" data-target="#HumanResourceAdd" id="#modalScroll">
			추가
		</button>
		<button class="btn btn-primary btn-sm mr-3" type="button" data-toggle="modal" data-target="#HumanResourceUpdate" id="#modalScroll" onclick="developerUpdate()">
			선택 변경
		</button>
		<button class="btn btn-primary btn-sm" type="button" onclick="developerDelete()">
			선택 삭제
		</button>
	</div>
		<table class="table align-items-center table-flush table-hover">
			<thead class="thead-light">
				<tr>
					<th></th>
					<th>성명</th>
					<th>부서 명</th>
					<th>직책</th>
					<th>전화번호</th>
					<th>담당업무</th>
					<th>시작 날짜</th>
					<th>끝 날짜</th>
					<th>리더 여부</th>
				</tr>
			</thead>
			<c:forEach var="list" items="${hrList}">
				<tr>
					<th>
						<div class="custom-control custom-checkbox">
							<input name="hrcheck" value="${list.userNo}" type="checkbox" class="custom-control-input" id="SR+${list.userNo}">
							<label class="custom-control-label" for="SR+${list.userNo}"></label>
						</div>
					</th>
					<th>${list.userNm}</th>
					<th>${list.userDpNm}</th>
					<th>${list.userJbps}</th>
					<th>${list.userTelNo}</th>
					<th>${list.taskNm}</th>
					<th>${list.hrStartDate}</th>
					<th>${list.hrEndDate}</th>
					<th>${list.hrLeader}</th>
				</tr>
			</c:forEach>
		</table>
		
	<div class="modal fade" id="HumanResourceUpdate" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
		<div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalScrollableTitle">수정</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="white-space: normal;">
					<div></div>
				</div>
			</div>
		</div>
	</div>
		
	<div class="modal fade" id="HumanResourceAdd" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
		<div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalScrollableTitle">개발자 추가</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="white-space: normal;">
					<div style="text-align:left">
						<h5>${hrList.get(0).userDpNm}</h5>
					</div>
					<c:if test="${empty developerList}">
						비어 있다.
					</c:if>
					<c:if test="${!empty developerList}">
						<table class="table align-items-center table-flush table-hover">
							<thead class="thead-light">
								<tr>
									<th>선택</th>
									<th>직책</th>
									<th>성명</th>
									<th>전화번호</th>
									<th>업무사항</th>
									<th>투입 날짜</th>
									<th>투입 형태</th>
								</tr>
							</thead>
							<c:forEach var="list" items="${developerList}">
								<tr>
									<th>
										<input type="checkbox" name="developerCheckBox">
									</th>
									<th style="display:none">${srNo}</th>
									<th style="display:none">${list.userNo}</th>
									<th>${list.userJbps}</th>
									<th>${list.userNm}</th>
									<th>${list.userTelNo}</th>
									<th>
										<c:forEach var="srlist" items="${list.srList}">
											${srlist.srTtl} / ${srlist.hrStartDate} ~ ${srlist.hrEndDate}
											<br/>
										</c:forEach>
									</th>
									<th>
										<div class="form-group row" id="simple-date4">
											<div class="input-daterange input-group input-group-sm">
												<input type="text" value="" class="input-sm form-control form-control-sm col-sm-9" name="start" id="start-${list.userNo}"/>
												<div class="input-group-prepend">
													<span class="input-group-text" style="height: 31px;">~</span>
												</div>
												<input type="text" class="input-sm form-control form-control-sm" name="end" id="end-${list.userNo}"/>
											</div>
										</div>
									</th>
									<th>
										<div style="width:200px">
											<select class="form-control form-control-sm col-sm-9" id="dv-${list.userNo}" style="width:100%">
												<c:forEach var="list" items="${taskList}">
													<option value="${list.taskNo}">${list.taskNm}</option>
												</c:forEach>
					                    	</select>
				                    	</div>
									</th>
								</tr>
							</c:forEach>
						</table>
					</c:if>
					<hr/>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-primary"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="selectDeveloper">등록</button>
					<script>
						$("#selectDeveloper").click(function(){
							
							var thArr = new Array();
							var checkbox = $("input[name=developerCheckBox]:checked");
							
							// 체트된 체크박스의 값을 가져옴
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
							});
							
							data = {thArr : thArr};
							
							$.ajax({
								url : "developerinsert/" + "${srNo}",
								method : "post",
								data : JSON.stringify(data),
								contentType: "application/json; charset=UTF-8"
							}).done((data) => {
								window.location.href ='${srNo}';
							});
						});
						
						function developerUpdate() {
							console.log('개발자 수정');
							
							
						
						
						}
					</script>
				</div>
			</div>
		</div>
	</div>
</div>