<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
	<div class="modal-header bg-primary">
		<h5 class="modal-title" id="exampleModalScrollableTitle">
			<img src="${pageContext.request.contextPath}/resources/images/logoOnly.png" style="width:20px;">
        	<small class="text-white">
        		<b>파일 추가</b>
        	</small>
		</h5>
		<button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<div class="modal-body" style="white-space: normal;">
		<div class="p-3">
			<div class="form-group row">
				<label class="col-3 col-form-label font-weight-bold" for="progressType">산출물 구분</label>
				<select class="col-3 form-control" id="progressType">
					<c:forEach var="list" items="${progressTypeList}" end="3">
						<option value="${list.progTypeNo}">${list.progTypeNm}</option>
					</c:forEach>
				</select>
            </div>
			<form method="POST" onsubmit="return false;" enctype="multipart/form-data">
				<div class="row mb-2">
					<span class=" font-weight-bold col-3">첨부파일: </span> 
					<div class="custom-file col-9">
						<input type="file" name="progressattach" class="custom-file-input form-control" onchange="addProgressRateFile(this);" multiple/> 
						<label class="custom-file-label text-truncate" for="customFile" style="text-align:left">파일 선택</label>
					</div>
				</div>
				<div class="row mb-2">
					<span class=" font-weight-bold col-3">파일목록: </span> 
					<div class="col-9" id="userfile"></div>
				</div>
			</form>
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
		            formData.append("progressattach", filesArr[i]);
		        }
		    }
		    
		    if(formData.get("progressattach") == null) {
		    	$('#progressFileModal').modal('hide');
		    	$('#messageModal').modal('show');
		    	$("#Modalmessage").text("파일을 선택해 주세요");
		    } else {
		    	formData.append("srNo", "${srNo}");
		    
			    var progressTypeNoSelect = document.getElementById("progressType");
			    var progressTypeNo = progressTypeNoSelect.options[document.getElementById("progressType").selectedIndex].value;
			    var progressTypeNm = progressTypeNoSelect.options[document.getElementById("progressType").selectedIndex].text;
			    formData.append("progTypeNo", progressTypeNo);
			    
			    $.ajax({
					type: "POST",
					enctype: 'multipart/form-data',	// 필수
					url: 'progressFile/add',
					data: formData,		// 필수
					processData: false,	// 필수
					contentType: false	// 필수
			    }).done((data) => {
			    	$('#progressFileModal').modal('hide');
   			    	$('#messageModal').modal('show');
		    		$("#Modalmessage").text(progressTypeNm + "에 파일이 추가 되었습니다.");
		    		setTimeout(function() {
			    		window.location.href = "${progress.srNo}";
			    	}, 2000);
			    });
		    }
		}
	</script>
	