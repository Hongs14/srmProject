<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
   	<div>
   		<span class="text-primary"><i class="fa-regular fa-calendar-plus mr-1"></i><b>기간 추가 신청</b></span>
   	</div>
	<div class="p-5">
		<form method="post" onsubmit="return false;"  enctype="multipart/form-data">
			<div class="row mb-2 mr-0" >
				<label class="font-weight-bold col-sm-2">등록자 </label> 
				<input class="col-sm-4" style="height:30px" disabled value="${sessionScope.loginUser.userNm}"/>
				<label class="font-weight-bold col-sm-2" for="dateInput">계획 종료일</label>
				<div class="form-group col-sm-4 px-0" id="simple-date1" >
					<div class="input-group date" >
						<div class="input-group-prepend">
							<span class="input-group-text" id="crRegDate"><i class="fas fa-calendar" ></i></span>
						</div>
						<input type="text" class="form-control" id="dateInput" style="height:30px;">
					</div>
				</div>
			</div>
			<div class="row mb-2 align-items-center">
				<label class=" font-weight-bold col-sm-3" for="srTtl">기간 추가 신청 제목</label> 
				<input name="crTtl" id="crTtl"class="col-sm-9" type="text" class="form-control form-control-sm"/>
			</div>
			<div class="row mb-2">
				<label class=" font-weight-bold col-sm-2">신청 내용</label> 
				<textarea name="crCn" id="crCn" rows="10" class="form-control form-control-sm col-sm-10" wrap="hard"></textarea>
			</div>
			<!-- 파일 첨부 -->
			<div class="row mb-2">
				<label class=" font-weight-bold col-sm-2" for="srFile">첨부파일 </label> 
				<div class="custom-file col-sm-10">
					<input type="file" class="custom-file-input form-control" name="changeRequestFile" onchange="addChangeFile(this)">
					<label class="custom-file-label text-truncate" for="customFile">파일 선택</label>
				</div>
			</div>
			<div class="row mb-2">
				<label class=" font-weight-bold col-sm-2">파일목록 </label> 
				<div class="col-sm-10" id="userfile">
					
				</div>
			</div>			
			<input type="hidden" id="userNo" value="${userNo}"/>
			<input type="hidden" id="srNo" value="${srNo}"/>
			<div class="modal-footer justify-content-right mr-0">
				<button type="submit" class="btn btn-primary" onclick="changeRequest()">
					저장
				</button>
			</div>
		</form>
	</div>
	
	<script>
		 //날짜 선택
		 $(document).ready(function () {
			const today = new Date();
			
		     // Bootstrap Date Picker
		     $('#dateInput').datepicker({
		       format: 'yyyy/mm/dd',
		       todayBtn: 'linked',
		       todayHighlight: true,
		       autoclose: true,        
		     });
		 });
		
		//파일 js
		var fileNo = 0;
		var filesArr = new Array();
		
		/* 첨부파일 추가 */
		function addChangeFile(obj){
			$('#userfile').empty();
			var maxFileCnt = 1; // 첨부파일 최대 개수
			var curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수
			console.log(curFileCnt);
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
		function changeRequest() {
			// 폼 데이터 담기
			var form = document.querySelector("form");
		    var formData = new FormData(form);
			for (var i = 0; i < filesArr.length; i++) {
		        // 삭제되지 않은 파일만 폼데이터에 담기
		        if (!filesArr[i].is_delete) {
		            formData.append("changeRequestFile", filesArr[i]);
		        }
		    }
		    
		    if(formData.get("changeRequestFile") == null) {
		    	$('#messageModal').modal('show');
		    	$("#Modalmessage").text("파일을 선택해주세요.");
		    } else {
				var srNo = document.getElementById('srNo').value;
			    formData.append("srNo", srNo);
			    
			    var crTtl = document.getElementById('crTtl').value;
			    formData.append("crTtl", crTtl);
			    
			    var crCn = document.getElementById('crCn').value;
			    formData.append("crCn", crCn);
			    
			    var crDdlnDate = document.getElementById('dateInput').value;
			    formData.append("crDdlnDate", crDdlnDate);
			    
			    $.ajax({
		   			type: "POST",
					enctype: 'multipart/form-data',	// 필수
					url: 'changeRequest',
					data: formData,	// 필수
					processData: false,	// 필수
					contentType: false	// 필수
			    }).done((data) => {
			    	$('#messageModal').modal('show');
			    	$("#Modalmessage").text("기간 추가가 신청 되었습니다.");
			    	setTimeout(function() {
			    		window.location.href = "${progress.srNo}";
			    	}, 2000);
			    });
		    }		    
		}
	</script>
	