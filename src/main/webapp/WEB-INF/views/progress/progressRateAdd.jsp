<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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

	<div class="modal-header">
		<h5 class="modal-title" id="exampleModalScrollableTitle">진척율</h5>
		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<div class="modal-body" style="white-space: normal;">
		<div class="table-responsive p-3">
			<table class="table align-items-center table-hover border">
				<thead class="thead-light">
					<tr>
						<th> 작업 구분 </th>
						<th> 시작일 </th>
						<th> 종료일 </th>
						<th> 진척율 </th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${progress.progTypeNm}</td>
						<td>
							<div class="input-daterange input-group input-group-sm justify-content-center">
								<input type="text" value="${progress.progStartDate}" class="a input-sm form-control form-control-sm col-sm-9" name="start" id="start"/>
							</div>
						</td>
						<td>
							<div class="input-daterange input-group input-group-sm justify-content-center">
								<input type="text" value="${progress.progEndDate}" class="a input-sm form-control form-control-sm col-sm-9" name="start" id="start"/>
							</div>
						</td>
						<td>
							<input type="number" value="${progress.progRate}" min="0"/>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div>
			<h5>산출물</h5>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-outline-primary" data-dismiss="modal">닫기</button>
		<button type="button" class="btn btn-primary" id="selectDeveloper">등록</button>
	</div>