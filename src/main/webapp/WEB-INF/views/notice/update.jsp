<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<script>
	var ntcCountCmnt = parseInt("${countNtcComment}",10);
	
	$(document).ready(function(){
	   readComment();
	});
	
	function readComment(){
	   //댓글 불러오기
	   let ntcNo ='${notice.ntcNo}';
	   $.ajax({
		url:"${pageContext.request.contextPath}/notice/read/comment?ntcNo="+ntcNo,
	 	type:"get",
	 	dataType: "html",
	 	success:function(data){
	    	$('#ntcComment').html(data);
	        
	 		}
		});
	};
	
	
	function writeComment(){
		//댓글 작성
		let content = $('#ntcCmntCn').val();
		let userNo = '${sessionScope.loginUser.userNo}';
		let ntcNo = '${notice.ntcNo}';
		
		let data = {userNo: userNo, ntcNo: ntcNo, ntcCmntCn: content};
		$.ajax({
		   url: "${pageContext.request.contextPath}/notice/write/comment",
		   method: "post",
		   data: JSON.stringify(data),
		   contentType: "application/json; charset=UTF-8"
		}).done((data) => {
		   $('#ntcCmntCn').val('');
		   readComment();
		   $('#cmntCount').html('댓글('+(ntcCountCmnt+1)+')');
		   ntcCountCmnt += 1;
		});
	}
	
	function updateCButton(i){
		$('#commentContent'+i).removeAttr("disabled");
		$('#updateToggle'+i).html("변경");
		$('#updateToggle'+i).attr('onclick', 'udpateComplete('+i+')');
	};
	
	function udpateComplete(i){
		//댓글 수정
		let content = $('#commentContent'+i).val();
		 let ntcCmntNo = i;
		let data = {ntcCmntNo: ntcCmntNo, ntcCmntCn: content};  
		$.ajax({
		   url: "${pageContext.request.contextPath}/notice/update/comment",
		   method: "post",
		   data: JSON.stringify(data),
		   contentType: "application/json; charset=UTF-8"
		}).done((data) => {
		   $('#commentContent'+i).attr('disabled','disabled');
		   $('#updateToggle'+i).html("수정");
		   $('#updateToggle'+i).attr('onclick', 'updateCButton('+i+')');
		}); 
	};
	
	function deleteComment(i){
		//댓글 삭제
		let ntcCmntNo = i;
		$.ajax({
		   url: "${pageContext.request.contextPath}/notice/delete/comment",
		   method: "get",
		   data: 'ntcCmntNo='+ntcCmntNo
		}).done((data) => {
		   $('#cmntCount').html('댓글('+(ntcCountCmnt-1)+')');
		   ntcCountCmnt -= 1;
		   $('#ntcComment').empty(); 
		   readComment();
		   
		});
	};
</script>

<!-- 메인 컨테이너 Container Fluid-->

<div class="d-sm-flex align-items-center justify-content-between">
	<div class="bg-primary px-3 py-2" style="border-top-left-radius: 10px; border-top-right-radius: 10px;">
		<h6 class="mb-0 text-white">공지사항 수정</h6>
	</div>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Home</a></li>
		<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/notice/list">공지사항</a></li>
	</ol>
</div>
<div class="card mb-4 p-4">
	<div class="card-header">
		<div class="d-flex flex-row align-items-center justify-content-between">
			<!-- 카테고리 -->
			<div>
				<h6 class="m-0 font-weight-bold text-primary mb-3">공지사항 No.${notice.ntcNo}</h6>
			</div>
			<div>
				<span>조회수 : ${notice.ntcInqCnt}</span>
			</div>
		</div>
		<!-- 글 제목 -->
		<div>
			<h4 class="m-0 font-weight-bold text-primary">제목 : ${notice.ntcTtl}</h4>
		</div>
		<hr/>
	</div>   
	<div class="mx-3 p-3 d-flex flex-column">
		<form method="post" onsubmit="return false;" enctype="multipart/form-data">	
			<div><input type="hidden" id="ntcNo" name="ntcNo" value="${notice.ntcNo}"></div>
			<div class="row mb-2">
				<div class="form-group col-2 ">
					<label class="col-form-label">작성자</label>
				</div>
				<div class="col-sm-9">
					<span>${notice.userId}</span>
				</div>
			</div>	
			<div class="row mb-2">
				<div class="form-group col-2 ">
					<label class="col-form-label">작성일</label>
				</div>
				<div class="col-sm-9">
					<span>${notice.ntcWrtDate}</span>
				</div>
			</div>
			<div class="row mb-2">
				<div class="form-group col-2 ">
					<label class="col-form-label">내용</label>
				</div>
				<div class="col-sm-9">
					<textarea class="form-control" rows="10" id="ntcCn" name="ntcCn">${notice.ntcCn }</textarea>
				</div>
			</div>
			<!-- 첨부파일 -->
			<div class="row mt-2">
				<div class="col-2">첨부파일</div>
				<div class="col-9 ml-4">
					<input type="file" class="custom-file-input form-control" id="ntcMFile" name="ntcMFile" onchange="addNoticeFile(this)" multiple> 
					<label class="custom-file-label text-truncate" for="customFile">파일 선택</label>
				</div>
			</div>
			<div class="row mt-2">
				<span class="font-weight-bold col-2">파일목록 : </span>
				<div class="col-2 ml-3" id="userfile">												
					<div id="updateAjax" style="width:100%;"></div>
				</div>
			</div>
			<div class="text-right">
				<a href="${pageContext.request.contextPath}/notice/list" class="btn btn-primary">목록</a>
				<button class="btn btn-primary" onclick="noticeUpdate()">수정 완료</button>
			</div>	
		</form>
	</div>
</div>
<!-- 댓글 -->
<div class="card p-4 mb-4">
	<div  class="mx-3 mb-2"><span id="cmntCount">댓글(${countNtcComment})</span></div>
	<div class="cmnts" style="overflow-y: scroll; height:200px;">
		<div class="mx-3 p-1" >
			<div class="row  justify-content-between">
				<div class="col-sm-2 form-group">
					${sessionScope.loginUser.userNm}
				</div>
				<div class="col-sm-8 ">
					<textarea  class="form-control" id="ntcCmntCn"></textarea>
				</div>
				<div class="col-sm-2 text-right">
					<button type="button" class="btn btn-primary btn-sm" onclick="writeComment();">등록하기</button>
				</div>
			</div>
		</div>
		<div id="ntcComment"></div>
	</div>
</div>	

<script>
	$(document).ready(function () {
		var ntcNo = document.getElementById('ntcNo').value;
		var str = location.href;
		var index = str.indexOf("?")+1;
	    var lastIndex = str.indexOf("#") > -1 ? str.indexOf("#") + 1 : str.length;
	 
	    // index 값이 0이라는 것은 QueryString이 없다는 것을 의미하기에 종료
	    if (index == 0) {
	        return "";
	    }
	 
	    // str의 값은 a=1&b=first&c=true
	    str = str.substring(index, lastIndex); 
	    var arr = str.split("=");
	    var sysNo = arr[1];
	    
		let data = {ntcNo : ntcNo};
     			
		$.ajax({
			type: "post",
			url: '${pageContext.request.contextPath}/notice/updateAjax/'+ntcNo,
			data : JSON.stringify(data),
			contentType: "application/json; charset=UTF-8"
	    }).done((data) => {
	    	$("#updateAjax").html(data)
	    });
	});
	
	var fileNo = 0;
	var filesArr = new Array();

	/* 첨부파일 추가 */
	function addNoticeFile(obj){
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
		var ntcFileNo = num;
		var ntcNo = document.getElementById('ntcNo').value;
		
		let data = {ntcFileNo : ntcFileNo, ntcNo : ntcNo};

		$.ajax({
			type: "post",
			url: '${pageContext.request.contextPath}/notice/deleteFile/'+ntcFileNo+'/'+ntcNo,
			data : JSON.stringify(data),
			contentType: "application/json; charset=UTF-8"
	    }).done((data) => {
	    	$("#updateAjax").html(data)
	    });
	}
	
	/* ajax 처리 */
	function noticeUpdate() {
		// 폼 데이터 담기
		var form = document.querySelector("form");
	    var formData = new FormData(form);
	    for (var i = 0; i < filesArr.length; i++) {
	        // 삭제되지 않은 파일만 폼데이터에 담기
	        if (!filesArr[i].is_delete) {
	            formData.append("ntcMFile", filesArr[i]);
	        }
	    }
	    
	    var str = location.href;
		var index = str.indexOf("?")+1;
	    var lastIndex = str.indexOf("#") > -1 ? str.indexOf("#") + 1 : str.length;
	 
	    // index 값이 0이라는 것은 QueryString이 없다는 것을 의미하기에 종료
	    if (index == 0) {
	        return "";
	    }
	 
	    // str의 값은 a=1&b=first&c=true
	    str = str.substring(index, lastIndex); 
	    var arr = str.split("=");
	    var sysNo = arr[1];
	    
	    var ntcCn = document.getElementById('ntcCn').value;
	    formData.append("ntcCn",ntcCn);
	    
	    var ntcNo = document.getElementById('ntcNo').value;
	    formData.append("ntcNo",ntcNo);
	    
	    $.ajax({
			type: "POST",
			enctype: 'multipart/form-data',	// 필수
			url: '${pageContext.request.contextPath}/notice/update',
			data: formData,		// 필수
			processData: false,	// 필수
			contentType: false	// 필수
	    }).done((data) => {
	    	window.location.href = "/webapp/notice/list?sysNo="+sysNo;
	    });
	    
	}
</script>
