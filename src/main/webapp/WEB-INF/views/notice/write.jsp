<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
<!-- 메인 컨테이너 Container Fluid-->

<div class="d-sm-flex align-items-center justify-content-between">
	<div class="bg-primary px-3 py-2" style="border-top-left-radius: 10px; border-top-right-radius: 10px;">
		<h6 class="mb-0 text-white">공지사항 작성</h6>
	</div>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Home</a></li>
		<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/notice/list">공지사항</a></li>
	</ol>
</div>

<div class="card mb-4">                
	<!-- 게시글 작성 -->
	<div class="card-body">
		<!-- 글 제목 -->
		<form method="post" onsubmit="return false;" enctype="multipart/form-data">
			<div class="row px-2">
				<div class="col-2 my-2">글제목  </div>
				<div class="col-10">
					<input class="form-control"id="ntcTtl" name="ntcTtl"/>
				</div>
			</div>
			<div class="row mt-2 px-2">
				<div class="col-2 my-2">카테고리</div>
				<div class="col-4">
					<div class="form-group">
						<select class="form-control" id="sysNo" name="sysNo">
							<option>한국소프트</option>
							<option>북북</option>
							<option>한국대학교</option>
							<option>사슈즈</option>
							<option>오티아이</option>
						</select>
					</div>
				</div>
				<div class="col-2 my-2">중요 여부</div>
				<div class="col-4">
					<div class="form-group">
						<select class="form-control" id="ntcPry" name="ntcPry">
							<option value="Yes">Yes</option>
							<option value="No">No</option>
						</select>
					</div>
				</div>
			</div>
			<div class="row mt-1 px-2">
				<div class="form-group row" id="simple-date4" >
          			<div class="input-daterange input-group input-group-sm">
          				<div class="col-4">조회기간</div>
              			<input type="text" class="input form-control form-control col-8" name="start" id="datePryStart"/>
              			<div class="input-group-prepend">
              				<span class="input-group-text" style="height:31px;">~</span>
              			</div>
              			<input type="text" class="input form-control form-control" name="end" id="datePryEnd"/>
              		</div>
      			</div>
			</div>
			<!-- 글 내용 -->
			<div class="row mt-1 px-2">
				<div class="col-2">글 내용 </div>
				<div class="col-10">
					<textarea class="form-control" rows="10" id="ntcCn" name="ntcCn"></textarea>
				</div>
			</div>
			<!-- 첨부파일 -->
			<div class="row mt-2 px-4">
				<div class="col-2 my-2">첨부파일</div>
				<div class="col-10">
					<input type="file" class="custom-file-input form-control" id="ntcMFile" name="ntcMFile" onchange="addNoticeFile(this)" multiple> 
					<label class="custom-file-label text-truncate" for="customFile">파일 선택</label>
				</div>
			</div>
			<div class="row mt-2 px-2">
				<span class="col-sm-2 my-2">파일목록</span>
				<div class="col-sm-9" id="userfile"></div>
			</div>
			<!-- userNo -->	                	
			<div>
				<input type="hidden" id="userNo" name="userNo" value="${sessionScope.loginUser.userNo}">
			</div>
			<!-- 작성완료/닫기 -->
			<div class="row mt-2">
				<div class="col-12">
					<div class="d-sm-flex justify-content-end">
						<button class="btn btn-sm btn-primary mr-1" onclick="noticeWrite()">작성완료</button>
						<a href="${pageContext.request.contextPath}/notice/list?sysNo=SRM" class="btn btn-sm btn-danger">닫기</a>
					</div>	                	
				</div>
			</div>
		</form>
	</div>
</div>
	
<script>
	var fileNo = 0;
	var filesArr = new Array();

	/* 첨부파일 추가 */
	function addNoticeFile(obj){
		var maxFileCnt = 5; // 첨부파일 최대 개수
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
	function noticeWrite() {
	// 폼 데이터 담기
	var form = document.querySelector("form");
	var formData = new FormData(form);
	for (var i = 0; i < filesArr.length; i++) {
		// 삭제되지 않은 파일만 폼데이터에 담기
		if (!filesArr[i].is_delete) {
			console.log("돌아감");
			console.log(filesArr[i]);
			formData.append("ntcMFile", filesArr[i]);
		}
	}
						    
	var ntcTtl = document.getElementById('ntcTtl').value;
	formData.append("ntcTtl",ntcTtl);
						    
    var str = location.href;
  	console.log(str);
	var index = str.indexOf("?")+1;
	console.log(index);
    var lastIndex = str.indexOf("#") > -1 ? str.indexOf("#") + 1 : str.length;
 
    // index 값이 0이라는 것은 QueryString이 없다는 것을 의미하기에 종료
    if (index == 0) {
        return "";
    }
 
    // str의 값은 a=1&b=first&c=true
    str = str.substring(index, lastIndex); 
    console.log(str);

    var arr = str.split("=");
    console.log(arr);
    
    var sysNo = arr[1];
    console.log(sysNo);
	formData.append("sysNo",sysNo);
						    
	var ntcPrySelect = document.getElementById("ntcPry");
	var ntcPry = ntcPrySelect.options[document.getElementById("ntcPry").selectedIndex].value;
	console.log(ntcPry);
	formData.append("ntcPry",ntcPry);
	
	var ntcPryStartDate = document.getElementById("datePryStart").value;
	console.log(ntcPryStartDate);
	if(document.getElementById("datePryStart").value != ""){		
		ntcPryStartDate = document.getElementById("datePryStart").value;
		formData.append("ntcPryStartDate",ntcPryStartDate);
	}else{
		ntcPryStartDate = "";
		formData.append("ntcPryStartDate",ntcPryStartDate);
	}
	
	var ntcPryEndDate = document.getElementById("datePryEnd").value;
	console.log(ntcPryEndDate);
	if(document.getElementById("datePryEnd").value != ""){		
		ntcPryEndDate = document.getElementById("datePryEnd").value;
		formData.append("ntcPryEndDate",ntcPryEndDate);
	}else{
		ntcPryEndDate = "";
		formData.append("ntcPryEndDate",ntcPryEndDate);
	}
	
	var ntcCn = document.getElementById('ntcCn').value;
	formData.append("ntcCn",ntcCn);
						    
	var userNo = document.getElementById('userNo').value;
	formData.append("userNo",userNo);
						    
	$.ajax({
		type: "POST",
		enctype: 'multipart/form-data',	// 필수
		url: '${pageContext.request.contextPath}/notice/write',
		data: formData,		// 필수
		processData: false,	// 필수
		contentType: false	// 필수
	}).done((data) => {
		window.location.href = "/webapp/notice/list?sysNo="+sysNo;
	});
						    
	}
</script>


