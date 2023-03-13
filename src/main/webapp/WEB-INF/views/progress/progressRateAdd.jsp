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

	<div class="modal-header bg-primary">
		<h5 class="modal-title" id="exampleModalScrollableTitle">
          	<img src="${pageContext.request.contextPath}/resources/images/logoOnly.png" style="width:20px;">
        	<small class="text-white">
        		<b>진척율</b>
        	</small>
		</h5>
		<button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
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
						<th style="width:70px"> 진척율 </th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${progress.progTypeNm}</td>
						<td>
							<div class="input-daterange input-group input-group-sm justify-content-center">
								<input type="text" value="${progress.progStartDate}" class="a input-sm form-control form-control-sm col-sm-9" id="start"/>
							</div>
						</td>
						<td>
							<div class="input-daterange input-group input-group-sm justify-content-center">
								<input type="text" value="${progress.progEndDate}" class="a input-sm form-control form-control-sm col-sm-9" id="end"/>
							</div>
						</td>
						<td>
							<input type="text" value="${progress.progRate}" id="progRate" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" style="text-align: center;" class="form-control form-control-sm"/>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="p-3">
			<form method="POST" onsubmit="return false;" enctype="multipart/form-data">
				<div class="row mb-2">
					<span class=" font-weight-bold col-sm-2">첨부파일: </span> 
					<div class="custom-file col-sm-9">
						<input type="file" name="progressattach" class="custom-file-input form-control" onchange="addProgressRateFile(this);" multiple/> 
						<label class="custom-file-label text-truncate" for="customFile" style="text-align:left">파일 선택</label>
					</div>
				</div>
				<div class="row mb-2">
					<span class=" font-weight-bold col-sm-2">파일목록: </span> 
					<div class="col-sm-9" id="userfile"></div>
				</div>
			</form>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-primary" onclick="progressRateUpdate()">등록</button>
		<button type="button" class="btn btn-outline-primary" data-dismiss="modal">닫기</button>
	</div>
	
	<input type="hidden" name="progNo" value="${progress.progNo}"/>
	<input type="hidden" name="srNo" value="${progress.srNo}"/>
	
	<script>
		var fileNo = 0;
		var filesArr = new Array();
		
		/* 첨부파일 추가 */
		function addProgressRateFile(obj){
			var maxFileCnt = 5; // 첨부파일 최대 개수
			var curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수
			
			for (const file of obj.files) {
				var reader = new FileReader();
				reader.onload = function() {
					filesArr.push(file);
				};
				reader.readAsDataURL(file);
				
	               // 목록 추가
	               let htmlData = '';
	               htmlData += '<div id="file' + fileNo + '" class="filebox row">';
	               htmlData += '   <a class="delete col-1" onclick="deleteFile(' + fileNo + ');"><i class="far fa-minus-square"></i></a>';
	               htmlData += '   <p class="name col-11 text-left">' + file.name + '</p>';
	               htmlData += '</div>';
	               $('#userfile').append(htmlData);
	               fileNo++;
			}
			
			// 초기화
		    document.querySelector("input[type=file]").value = "";
		}
		
		/* 첨부파일 삭제 */
		function deleteFile(num) {
			document.querySelector("#file" + num).remove();
			filesArr[num].is_delete = true;
		}
		
		/* ajax 처리 */
		function progressRateUpdate() {
			// 폼 데이터 담기
			var form = document.querySelector("form");
		    var formData = new FormData(form);
		    for (var i = 0; i < filesArr.length; i++) {
		        // 삭제되지 않은 파일만 폼데이터에 담기
		        if (!filesArr[i].is_delete) {
		            formData.append("progressattach", filesArr[i]);
		        }
		    }
		    
		    formData.append("progNo", "${progress.progNo}");
		    
		    formData.append("srNo", "${progress.srNo}");
		    
		    var progStartDate = document.getElementById("start").value;
		    formData.append("progStartDate", progStartDate);
		    
		    var progEndDate = document.getElementById("end").value;
		    formData.append("progEndDate", progEndDate);
		    
		    var progRate = document.getElementById("progRate").value;
		    formData.append("progRate", progRate);
		    
		    var progTypeNoStart = ((${progress.progType} - 1) * 20);
		    var progTypeNoEnd = (${progress.progType} * 20);
		    
		    if((progTypeNoStart < progRate) && (progRate <= progTypeNoEnd)) {
			    $.ajax({
					type: "POST",
					enctype: 'multipart/form-data',	// 필수
					url: 'progressRate/update',
					data: formData,		// 필수
					processData: false,	// 필수
					contentType: false	// 필수
			    }).done((data) => {
			    	$('#progressRateModal').modal('hide');
			    	$('#messageModal').modal('show');
			    	$("#Modalmessage").text("${progress.progTypeNm}(이)가 변경 되었습니다.");
			    	setTimeout(function() {
			    		window.location.href = "${progress.srNo}";
			    	}, 2000);
			    });
		    } else {
 			    $('#progressRateModal').modal('hide');
	    		$('#rateMessageModal').modal('show');
	    		$('#rateModalMessage').text(progTypeNoStart + '보다 크거나 ' + progTypeNoEnd + '보다 작아야 합니다.');
		    	setTimeout(function() {
	 			    $('#progressRateModal').modal('show');
		    		$('#rateMessageModal').modal('hide');
		    	}, 1000);
		    }
		    
		}
	</script>
	