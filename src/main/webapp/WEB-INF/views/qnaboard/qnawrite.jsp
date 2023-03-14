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
			<form onsubmit="return false;" method="post" id="qstnUpdateForm" enctype="multipart/form-data">
			   	<!-- 글 제목 -->
			   	<div class="row">
			   		<div class="col-2 col-form-label"><h6 class="m-0 font-weight-bold text-primary">글제목</h6></div>
			   		<div class="col-10">
			   			<input class="form-control" name="qstnTtl" id="qstnTtl" <c:if test="${command eq 'update'}">value="${qstn.qstnTtl}"</c:if>/>
			   		</div>
			   	</div>
			   	<!-- 글 내용 -->
			   	<div class="row mt-3">
			   		<div class="col-2 col-form-label"><h6 class="m-0 font-weight-bold text-primary">글 내용</h6> </div>
			   		<div class="col-10">
			   			<textarea class="form-control" rows="10" name="qstnCn" id="qstnCn">${qstn.qstnCn}</textarea>
			   		</div>
			   	</div>
			   	<!-- 첨부파일 -->
			   	<div class="row mt-3">
			   		<div class="col-2 col-form-label"><h6 class="m-0 font-weight-bold text-primary">첨부파일</h6></div>
			   		<div class="col-10">
		   				<input type="file" class="form-control custom-file-input" id="qstnMFile" name="qstnMFile" onchange="addQstnFile(this)" multiple>
						<label class="custom-file-label text-truncate" for="customFile">파일 선택</label>
			   		
			   		</div>
			   	</div>
			   <div class="row mt-2">
					<span class="col-sm-2 m-0 font-weight-bold text-primary">파일목록</span>
					<div class="col-sm-9" id="inputFile" style="border: 1px solid black">
						<c:if test="${command eq 'update'}"> 
							<c:forEach var="qstnFile" items="${qstnFile}">
								<div id="file${qstnFile.qstnFileNo}" class="filebox row">
					              	<a class="delete col-1" onclick="deleteExistingFile('${qstnFile.qstnFilePhysNm}','${qstnFile.qstnFileNo}')"><i class="far fa-minus-square"></i></a>
					                <a href="file?qstnFileNo=${qstnFile.qstnFileNo}">${qstnFile.qstnFileActlNm}</a>
					             
						        </div>
		               		</c:forEach>
	               		</c:if>
					</div>
				</div> 
			   	
			   	<input type="hidden" id="qstnNo" name="qstnNo" value="${qstn.qstnNo}"/>
			   	<input type="hidden" id="userNo" name="userNo" value="${sessionScope.loginUser.userNo}">
			   	<input type="hidden" id="userNm" name="userNm" value="${sessionScope.loginUser.userNm}">
			   	<input type="hidden" id="sysNo" name="sysNo" value="${session}">
			   	<!-- 작성완료/닫기 -->
			   	<div class="row mt-3">
			    	<div class="col-12">
			    		<div class="text-right">
			    		    <c:if test="${command ne 'update'}"><a type="button" class="btn btn-outline-primary" href="${pageContext.request.contextPath}/qna/${sessionScope.loginUser.sysNo}/list">취소</a></c:if>
					    	<c:if test="${command eq 'update'}"><button type="button" class="btn btn-outline-primary" onclick="getDetail('${qstn.qstnNo}')">취소</button></c:if>
					      	<c:if test="${command ne 'update'}"><button type="submit" class="btn btn-primary" onclick="qstnWrite()">저장</button></c:if>
					       	<c:if test="${command eq 'update'}"><button type="submit" class="btn btn-primary" onclick="qstnUpdate()">수정</button></c:if>
						</div>	                	
					</div>
			    </div>
			</form>
		</div>
	</div>
	
	<script>
		//파일 js
		let fileNo = 0;
		let filesArr = new Array();
		
		function addQstnFile(obj){
			//첨부파일 추가 
			let maxFileCnt = 5; // 첨부파일 최대 개수
			let curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수
			console.log(curFileCnt);
			for (const file of obj.files) {
				let reader = new FileReader();
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
		
		
		function deleteFile(num) {
			// 첨부파일 삭제 
			document.querySelector("#file" + num).remove();
			filesArr[num].is_delete = true;
		}
		
		function qstnWrite() {
			//QSTN 작성
			console.log("Qna 파일 작성");
			// 폼 데이터 담기
			let form = document.querySelector("form");
		    let formData = new FormData(form);
		    for (let i = 0; i < filesArr.length; i++) {
		        // 삭제되지 않은 파일만 폼데이터에 담기
		        if (!filesArr[i].is_delete) {
		        	console.log("삭제되지 않은 파일 담기");
		        	console.log(filesArr[i]);
		            formData.append("qstnMFile", filesArr[i]);
		        }
		    }
		    let sysNo = $('#sysNo').val();
		    formData.append("sysNo", sysNo);
		    
		    let qstnTtl = $('#qstnTtl').val();
		    formData.append("qstnTtl", qstnTtl);
		    
		    let qstnCn = $('#qstnCn').val();
		    formData.append("qstnCn", qstnCn);
		    
		    let userNo = $('#userNo').val();
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
		    	$("#qstnModal").modal();
		    	$("#modalHeader").html("<b>Qna작성</b>");
		    	$("#modalBody").html("<h4>작성이 완료되었습니다.</h4>"); 
		    	$('#qstnSubmit').attr("data-dismiss", "modal");
		    });
		}
		
		let fileNmArray = [];
		
		/* 기존의 첨부파일 삭제 */
		function deleteExistingFile(qstnFilePhysNm, qstnFileNo) {
			fileNmArray.push(qstnFilePhysNm);
			console.log(fileNmArray);
			
			document.querySelector("#file" + qstnFileNo).remove();
		}
		
		
		function qstnUpdate() {
			//update기능
			// 폼 데이터 담기
			let form = document.querySelector("form");
		    let formData = new FormData(form);
		    for (let i = 0; i < filesArr.length; i++) {
		        // 삭제되지 않은 파일만 폼데이터에 담기
		        if (!filesArr[i].is_delete) {
		        	console.log(filesArr[i]);
		            formData.append("qstnMFile", filesArr[i]);
		        }
		    }
		    for (let j = 0; j< fileNmArray.length; j++){
		    	console.log(fileNmArray[j]);
		    	formData.append("deleteFile",fileNmArray[j]);
		    }
		    let sysNo = $('#sysNo').val();
		    formData.append("sysNo", sysNo);
		    
		    let qstnCn = $('#qstnCn').val();
		    formData.append("qstnCn",qstnCn);
		    
		    let qstnTtl = $('#qstnTtl').val();
		    formData.append("qstnTtl",qstnTtl);
		    
		    let qstnNo = $('#qstnNo').val();
		    formData.append("qstnNo",qstnNo);
		    
		    let qstnFileNo = $("#qstnFileNo").val();
		    formData.append("qstnFileNo",qstnFileNo);
		    
		    console.log(sysNo+" "+qstnCn+" "+qstnTtl+" "+qstnNo);
		    
		    $.ajax({
				type: "POST",
				enctype: 'multipart/form-data',	// 필수
				url: '${pageContext.request.contextPath}/qna/'+sysNo+'/update',
				data: formData,		// 필수
				processData: false,	// 필수
				contentType: false	// 필수
		    }).done((data) => {
		     	$("#qstnModal").modal();
		    	$("#modalHeader").html("<b>Qna수정</b>");
		    	$("#modalBody").html("<h4>수정이 완료되었습니다.</h4>"); 
		    	$('#qstnSubmit').attr("data-dismiss", "modal");
		    	$('#miniView').html(data);
		    	
		    	
		    });
		    
		}
		
		function getDetail(qstnNo){
			$("#mainQstnMenu").removeClass("d-sm-flex");
			$("#mainQstnMenu").hide();
			$("#qstnMenu").show();
			$("#mainQstn").attr("class","col-lg-7");
			$("#miniView").attr("class","col-lg-5");
			let sysNo = $('#sysNo').val();
			
			$.ajax({
				type:"GET",
				url: '${pageContext.request.contextPath}/qna/'+sysNo+'/view/'+qstnNo,
				dataType : "html"
			}).done((data) =>{
				$('#miniView').html(data);
			})
		};
	</script>
	
</html>
