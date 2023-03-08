<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<div class="d-sm-flex align-items-center justify-content-between">
		<div class="bg-primary px-3 py-2" style="border-top-left-radius: 10px; border-top-right-radius: 10px;">
			<h6 class="mb-0 text-white">
				<c:if test="${command eq 'write'}">Q&A작성</c:if>
				<c:if test="${command eq 'update'}">Q&A수정</c:if>
			</h6>
		</div>
		<ol class="breadcrumb">
			<li class="breadcrumb-item">Home</li>
			<li class="breadcrumb-item">공지사항</li>
		</ol>
	</div>
    
    <div class="card mb-4">   
		<div class="card-header d-flex flex-row align-items-center justify-content-between">
			<div>
				<h6 class="m-0 font-weight-bold text-primary">
					<c:if test="${command eq 'write'}">질문작성</c:if>
					<c:if test="${command eq 'update'}">질문수정</c:if>
				</h6>
			</div>
	    </div> 
	    
		<!-- 게시글 작성 -->
		<div class="card-body">
			<form onsubmit="return false;" method="post" enctype="multipart/form-data">
			   	<!-- 글 제목 -->
			   	<div class="row">
			   		<div class="col-1 col-form-label"><h6 class="m-0 font-weight-bold text-primary">글제목</h6></div>
			   		<div class="col-11">
			   			<input class="form-control" name="qstnTtl" id="qstnTtl" <c:if test="${command eq 'update'}">value="${qstn.qstnTtl}"</c:if>/>
			   		</div>
			   	</div>
			   	<!-- 글 내용 -->
			   	<div class="row mt-3">
			   		<div class="col-1"><h6 class="m-0 font-weight-bold text-primary">글 내용</h6> </div>
			   		<div class="col-11">
			   			<textarea class="form-control" rows="10" name="qstnCn" id="qstnCn">${qstn.qstnCn}</textarea>
			   		</div>
			   	</div>
			   	<!-- 첨부파일 -->
			   	<div class="row mt-3">
			   		<div class="col-1"><h6 class="m-0 font-weight-bold text-primary">첨부파일</h6></div>
			   		<div class="col-11">
			   			<input type="file" class="custom-file-input form-control" id="qstnMFile" name="qstnMFile" onchange="addQstnFile(this)" multiple/>
			   		</div>
			   	</div>
			   	<div class="row mt-2">
					<span class="font-weight-bold col-sm-2">파일목록</span>
					<div class="col-sm-9" id="inputFile" style="border: 1px solid black">
						<c:if test="${command eq 'update'}"> 
							<c:forEach var="qstnFile" items="${qstnFile}">
								<div id="file${requestFile.srFileNo}" class="filebox row">
					              	<a class="delete col-1" onclick="deleteExistingFile('${qstnFile.qstnFilePhysNm}','${qstnFile.qstnFileNo}')"><i class="far fa-minus-square"></i></a>
					                <a href="file?qstnFileNo=${qstnFile.qstnFileNo}">${qstnFile.qstnFileActlNm}</a>
						        </div>
		               		</c:forEach>
	               		</c:if>
					</div>
				</div>
			   	
			   	<input type="hidden" id="userNo" name="userNo" value="${sessionScope.loginUser.userNo}">
			   	<input type="hidden" id="userNm" name="userNm" value="${sessionScope.loginUser.userNm}">
			   	<input type="hidden" id="sysNo" name="sysNo" value="${sessionScope.loginUser.sysNo}">
			   	<!-- 작성완료/닫기 -->
			   	<div class="row mt-3">
			    	<div class="col-12">
			    		<div class="d-sm-flex justify-content-end">
			    		    <c:if test="${command ne 'update'}"><a type="button" class="btn btn-outline-primary" href="${pageContext.request.contextPath}/qna/${sessionScope.loginUser.sysNo}/list">취소</a></c:if>
					    	<c:if test="${command eq 'update'}"><button type="button" class="btn btn-outline-primary" onclick="getDetail('${qstn.qstnNo}')">취소</button></c:if>
					      	<c:if test="${command ne 'update'}"><button type="submit" class="btn btn-primary" onclick="QSTNWrite()">저장</button></c:if>
					       	<c:if test="${command eq 'update'}"><button type="submit" class="btn btn-primary" onclick="qstnUpdate()">저장</button></c:if>
						</div>	                	
					</div>
			    </div>
			</form>
		</div>
	</div>
	
	<script>
		//파일 js
		var fileNo = 0;
		var filesArr = new Array();
		
		/* 첨부파일 추가 */
		function addQstnFile(obj){
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
				$('#inputFile').append(htmlData);
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
		function QSTNWrite() {
			console.log("Qna 파일 작성");
			// 폼 데이터 담기
			var form = document.querySelector("form");
		    var formData = new FormData(form);
		    for (var i = 0; i < filesArr.length; i++) {
		        // 삭제되지 않은 파일만 폼데이터에 담기
		        if (!filesArr[i].is_delete) {
		        	console.log("삭제되지 않은 파일 담기");
		        	console.log(filesArr[i]);
		            formData.append("qstnMFile", filesArr[i]);
		        }
		    }
		    var sysNo = $('#sysNo').val();
		    formData.append("sysNo",sysNo);
		    
		    var qstnTtl = $('#qstnTtl').val();
		    formData.append("qstnTtl", qstnTtl);
		    
		    var qstnCn = $('#qstnCn').val();
		    formData.append("qstnCn", qstnCn);
		    
		    var userNo = $('#userNo').val();
		    formData.append("userNo", userNo);
		    console.log(sysNo+" "+qstnTtl+" "+qstnCn+" "+userNo);
		    
		    $.ajax({
				type: "POST",
				enctype: 'multipart/form-data',	// 필수
				url: "${pageContext.request.contextPath}/qna/"+sysNo+"/write",
				data: formData,	// 필수
				processData: false,	// 필수
				contentType: false	// 필수
		    }).done((data) => {
		    	$('#miniView').html(data);
		    	console.log("전송완료");
		    });
		}
		
		let fileNmArray = [];
		
		/* 기존의 첨부파일 삭제 */
		function deleteExistingFile(srFilePhysNm, srFileNo) {
			fileNmArray.push(srFilePhysNm);
			console.log(fileNmArray);
			
			document.querySelector("#file" + qstnFileNo).remove();
		}
		
		/* ajax 업데이트 처리 */
		function requestUpdate() {
			// 폼 데이터 담기
			var form = document.querySelector("form");
		    var formData = new FormData(form);
		    for (var i = 0; i < filesArr.length; i++) {
		        // 삭제되지 않은 파일만 폼데이터에 담기
		        if (!filesArr[i].is_delete) {
		        	console.log("돌아감");
		        	console.log(filesArr[i]);
		            formData.append("requestMFile", filesArr[i]);
		        }
		    }
		    
		    for (var j = 0; j< fileNmArray.length; j++){
		    	console.log(fileNmArray[j]);
		    	formData.append("deleteFile",fileNmArray[j]);
		    }
		    var srRegDate=document.getElementById('srRegDate').value;
		    var srNo = document.getElementById('srNo').value;
		    formData.append("srNo",srNo);
		    var sysNm=document.getElementById('sysNm').value;
		    formData.append("sysNm",sysNm);
		    
		    var srTtl = document.getElementById('srTtl').value;
		    formData.append("srTtl",srTtl);
		    
		    if($('#srStd').val() !== ""){
		    	var srStd = $('#srStd').val();
		    	formData.append("srStd",srStd);
		    }
		    var srCn = document.getElementById('srCn').value;
		    formData.append("srCn",srCn);
		    
		    var userNo = document.getElementById('userNo').value;
		    formData.append("userNo",userNo);
		    
		    $.ajax({
				type: "POST",
				enctype: 'multipart/form-data',	// 필수
				url: 'update',
				data: formData,		// 필수
				processData: false,	// 필수
				contentType: false	// 필수
		    }).done((data) => {
		//    	console.log("update:: "+"srNo"+srNo+"sysNm"+sysNm+"srTtl"+srTtl+"srStd"+srStd+"srCn"+srCn+userNo);
		    	$('#miniView').html(data);
		    });
		    
		}
	</script>
	
</html>
