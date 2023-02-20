<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
	<div class="table-responsive">
	<div class="input-group-append float-right mb-3">
		<button class="btn btn-primary btn-sm mr-2" type="button" data-toggle="modal" data-target="#HumanResourceAdd" id="#modalScroll">
			추가
		</button>
		<button class="btn btn-primary btn-sm" type="button" data-toggle="modal" data-target="#HumanResourceDelete" id="#modalScroll" onclick="developerDelete()">
			삭제
		</button>
	</div>
		<table class="table align-items-center table-flush table-hover">
			<thead class="thead-light">
				<tr>
					<th></th>
					<th>작업 구분</th>
					<th>시작일</th>
					<th>종료일</th>
					<th>진척율(누적)</th>
					<th>산출물</th>
				</tr>
			</thead>
			<c:forEach var="list" items="${progressRateList}">
				<tr>
					<th>
						<div class="custom-control custom-radio">
							<input type="radio" id="ProgNo+${list.progNo}" name="customRadio" class="custom-control-input">
							<label class="custom-control-label" for="ProgNo+${list.progNo}"></label>
						</div>
					</th>
					<th>${list.progTypeNm}</th>
					<th>${list.progStartDate}</th>
					<th>${list.progEndDate}</th>
					<th>${list.progRate}</th>
					<th></th>
				</tr>
			</c:forEach>
		</table>
	
	<!-- 삭제 모달 창 -->
	<div class="modal fade" id="HumanResourceDelete" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
		<div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalScrollableTitle">삭제</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="white-space: normal;">
					<h5 id="message"></h5>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 추가 모달 창 -->
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
					<button type="button" class="btn btn-outline-primary" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="selectDeveloper">등록</button>
				</div>
			</div>
		</div>
	</div>
</div>