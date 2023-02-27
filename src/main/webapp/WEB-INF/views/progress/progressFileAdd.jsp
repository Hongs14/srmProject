<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
	<div class="modal-header">
		<h5 class="modal-title" id="exampleModalScrollableTitle">파일 추가</h5>
		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<div class="modal-body" style="white-space: normal;">
		<div class="row">
			<div class="col-4 p-3">
				<div class="form-group row">
             		<label class="col-sm-3 col-form-label-sm font-weight-bold" for="progressType">산출물 구분</label>
                   	<select class="form-control form-control-sm col-sm-9" id="progressType">
						<c:forEach var="list" items="${progressTypeList}" end="3">
							<option value="${list.progTypeNo}">${list.progTypeNm}</option>
						</c:forEach>
                   	</select>
               	</div>
			</div>
			<div class="col-8">
				<div class="p-3">
					<form method="POST" onsubmit="return false;" enctype="multipart/form-data">
						<div class="row mb-2">
							<span class=" font-weight-bold col-sm-2">첨부파일: </span> 
							<div class="custom-file col-sm-9">
								<input type="file" name="progressattach" class="custom-file-input form-control" onchange="addProgressRateFile(this);" multiple/> 
								<label class="custom-file-label text-truncate" for="customFile">파일 선택</label>
							</div>
						</div>
						<div class="row mb-2">
							<span class=" font-weight-bold col-sm-2">파일목록: </span> 
							<div class="col-sm-9" id="userfile"></div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-primary" onclick="ProgressFileAdd()">등록</button>
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
		function ProgressFileAdd() {
			// 폼 데이터 담기
			var form = document.querySelector("form");
		    var formData = new FormData(form);
		    for (var i = 0; i < filesArr.length; i++) {
		        // 삭제되지 않은 파일만 폼데이터에 담기
		        if (!filesArr[i].is_delete) {
		        	console.log("돌아감");
		        	console.log(filesArr[i]);
		            formData.append("progressattach", filesArr[i]);
		        }
		    }
		    
		    formData.append("srNo", "${srNo}");
		    
		    var progressTypeNoSelect = document.getElementById("progressType");
		    var progressTypeNo = progressTypeNoSelect.options[document.getElementById("progressType").selectedIndex].value;
		    
		    formData.append("progTypeNo", progressTypeNo);
		    
		    $.ajax({
				type: "POST",
				enctype: 'multipart/form-data',	// 필수
				url: 'progressFile/add',
				data: formData,		// 필수
				processData: false,	// 필수
				contentType: false	// 필수
		    }).done((data) => {
		    	window.location.href = "${progress.srNo}";
		    });
		    
		}
	</script>
	