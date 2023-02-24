<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  	<%@include file="/WEB-INF/views/common/head.jsp" %>
</head>

<body id="page-top">
	<div id="wrapper">
	    <!-- Sidebar -->
	   	<%@include file="/WEB-INF/views/common/sidebar.jsp" %>
	    	<div id="content-wrapper" class="d-flex flex-column">
				<div id="content">
        			<!-- TopBar -->
					<%@include file="/WEB-INF/views/common/topbar.jsp" %>
					<!-- 메인 컨테이너 Container Fluid-->
					<div class="container-fluid" id="container-wrapper">
          				<div class="d-sm-flex align-items-center justify-content-between mb-4">
            				<h1 class="h3 mb-0 text-gray-800">공지사항</h1>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Home</a></li>
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/notice/list">목록으로</a></li>
							</ol>
						</div>
						<!-- Row -->
						<div class="col-lg-12">
							<div class="card mb-4">                
								<!-- 게시글 작성 -->
								<div class="card-body">
									<!-- 글 제목 -->
									<form method="post" onsubmit="return false;" enctype="multipart/form-data">
										<div class="row">
											<div class="col-1">글제목 : </div>
											<div class="col-9">
												<textarea class="form-control" rows="1" id="ntcTtl" name="ntcTtl"></textarea>
											</div>
											<div class="col-1 my-2">중요 여부</div>
											<div class="col-1">
												<div class="form-group">
													<select class="form-control" id="exampleFormControlSelect1" id="ntcPry" name="ntcPry">
														<option>Yes</option>
														<option>No</option>
													</select>
												</div>
											</div>
										</div>
										<!-- 글 내용 -->
										<div class="row mt-2">
											<div class="col-1">글 내용 : </div>
											<div class="col-11">
												<textarea class="form-control" rows="10" id="ntcCn" name="ntcCn"></textarea>
											</div>
										</div>
										<!-- 첨부파일 -->
										<div class="row mt-2">
											<div class="col-1">첨부파일 : </div>
											<div class="col-10 ml-1">
												<input type="file" class="custom-file-input form-control" id="ntcMFile" name="ntcMFile" onchange="addNoticeFile(this)" multiple> 
												<label class="custom-file-label text-truncate" for="customFile">파일 선택</label>
											</div>
										</div>
										<div class="row mt-2">
											<span class="font-weight-bold col-sm-2">파일목록 : </span>
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
						                			<button class="btn btn-sm btn-danger mr-1">닫기</button>
												</div>	                	
						                	</div>
						               	</div>
               						</form>
               					</div>
							</div>
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
						    
						   
						    var ntcPry = document.getElementById("ntcPry");
						    var ntcPry = ntcPry.options[document.getElementById("ntcPry").selectedIndex].value;
						    formData.append("ntcPry",ntcPry);
						    
						    var ntcCn = document.getElementById('ntcCn').value;
						    formData.append("ntcCn",ntcCn);
						    
						    var userNo = document.getElementById('userNo').value;
						    formData.append("userNo",userNo);
						    
						    $.ajax({
								type: "POST",
								enctype: 'multipart/form-data',	// 필수
								url: 'write',
								data: formData,		// 필수
								processData: false,	// 필수
								contentType: false	// 필수
						    }).done((data) => {
						    	window.location.href = "/webapp/notice/list";
						    });
						    
						}
						
						
						
					</script>

					<!-- 로그아웃 모달 -->
					<%@include file="/WEB-INF/views/common/logout.jsp" %>
				</div>
				<!---Container Fluid-->
			
		</div>
		<!-- Footer -->

	</div>
	<%@include file="/WEB-INF/views/common/bottom.jsp" %>
</body>

</html>
