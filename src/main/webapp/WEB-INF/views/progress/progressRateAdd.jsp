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
		<div class="p-3">
			<div class="row mb-2">
				<span class=" font-weight-bold col-sm-2">첨부파일: </span> 
				<div class="custom-file col-sm-9">
					<input type="file" class="custom-file-input form-control" onchange="addProgressRateFile(this)" multiple/> 
					<label class="custom-file-label text-truncate" for="customFile">파일 선택</label>
				</div>
			</div>
			<div class="row mb-2">
				<span class=" font-weight-bold col-sm-2">파일목록: </span> 
				<div class="col-sm-9" id="userfile"></div>
			</div>
		</div>
		<script>
			var fileNo = 0;
			var fileArr = new Array();
			
			/* 첨부파일 추가 */
			function addProgressRateFile(obj) {
				var maxFileCnt = 3; // 첨부파일의 최대 개수
				var attFileCnt = document.querySelectorAll('.filebox').length; // 기존 추가된 첨부파일 개수
				var remainFileCnt = maxFileCnt - attFileCnt;    // 추가로 첨부가능한 개수
				var curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수
				
				// 첨부파일 개수 확인
				if(curFileCnt > remainFileCnt) {
					alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
				} else {
					 for (const file of obj.files) {
					 	// 첨부파일 검증
					 	if (validation(file)) {
					 		// 파일 배열에 담기
					 		var reader = new FileReader();
					 		reader.onload = function () {
					 			fileArr.push(file);
					 		};
					 		reader.readAsDataURL(file);
					 	}
					 }
				}
			}
		</script>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-outline-primary" data-dismiss="modal">닫기</button>
		<button type="button" class="btn btn-primary" id="selectDeveloper">등록</button>
	</div>