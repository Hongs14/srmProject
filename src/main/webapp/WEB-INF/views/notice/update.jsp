<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

	<head>
  		<%@include file="/WEB-INF/views/common/head.jsp" %>
  		<script>
	  		$(document).ready(function(){
	  			console.log("시작");
	  			readComment();
	  		});
	  		
	  		function readComment(){
	  			let noticeNo ='${notice.ntcNo}';
	  			console.log(noticeNo);
	  			$.ajax({
			    	url:"read/comment"
			        ,type:"get"
			        ,data: 'ntcNo='+noticeNo
			        ,success:function(data){
			        	console.log(data);
			        	$.each(data, function(index, item){
			        		let comment = '<hr/>';
			        		comment += '<div id="readCmnt">';
			        		comment += 	'<div class="d-flex px-2 flex-row align-items-center justify-content-between">';
			        		comment += 		'<div>';
							comment += 			'<h6 style="color: #406882"><b>'+item.userId+'</b></h6>';
							comment += 			'<h6>'+item.ntcCmntDate+'</h6>';
							comment +=		'</div>';
							comment += 		'<div>';
							comment += 			'<input type="hidden" id="ntcCmntNo" value="'+item.ntcCmntNo+'"/>';
							comment += 			'<a id="updateToggle'+item.ntcCmntNo+'" onclick="updateCButton('+item.ntcCmntNo+')">수정</a> | <a onclick="deleteComment('+item.ntcCmntNo+')">삭제</a> |';
							comment += 		'</div>';
							comment += 	'</div>';
							comment += 	'<textarea id="commentContent'+item.ntcCmntNo+'" disabled="disabled" style="border: none; resize:none; width:90%">'+item.ntcCmntCn+'</textarea>';
							comment +='</div>'; 
			        		$('#ntcComment').append(comment); 
			        	});
			        	
			         }
			    })
			
	  		};
	  		
			function updateCButton(i){
				console.log(i);
				$('#commentContent'+i).removeAttr("disabled");
				console.log("수정 버튼 실행");
				$('#updateToggle'+i).html("변경");
				$('#updateToggle'+i).attr('onclick', 'udpateComplete('+i+')');
				
			};

			function udpateComplete(i){
				console.log("댓글수정 ajax");
				console.log(i);
				let content = $('#commentContent'+i).val();
			 	let ntcCmntNo = i;
				let data = {ntcCmntNo: ntcCmntNo, ntcCmntCn: content};  
				$.ajax({
					url: "update/comment",
					method: "post",
					data: JSON.stringify(data),
					contentType: "application/json; charset=UTF-8"
				}).done((data) => {
					$('#commentContent'+i).attr('disabled','disabled');
					$('#updateToggle'+i).html("수정");
					$('#updateToggle'+i).attr('onclick', 'updateCButton('+i+')');
					console.log(data);
				}); 
			};
			
			function deleteComment(i){
				console.log("댓글삭제"+i);
				let ntcCmntNo = i;
				$.ajax({
					url: "delete/comment",
					method: "get",
					data: 'ntcCmntNo='+ntcCmntNo,
				}).done((data) => {
					console.log("성공");
					$('#cmntCount').empty();
	        		$('#cmntCount').append('댓글('+(${notice.countCmnt}-1)+')');
					$('#ntcComment').empty(); 
					readComment();
					
				});
			};
		</script>
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
	              				<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/notice/list">공지사항</a></li>
	            			</ol>
	          			</div>
						<!-- Row -->
						<div class="qnacontent mx-3 my-0">
							<div class="col-lg-12">
								<div class="card mb-4  p-3">
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
		                                 	
		                                 	<h2 class="m-0 font-weight-bold text-primary">제목 : ${notice.ntcTtl}</h2>
		                                 </div>
		                                 <hr/>
	                           		</div>   
		                            <div class="mx-3 p-3 d-flex flex-column">
	                            		<form method="post" onsubmit="" enctype="multipart/form-data">	
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
												<div class="col-2">첨부파일 : </div>
												<div class="col-2 ml-3">
													<input type="file" class="form-control" id="ntcMFile" name="ntcMFile" onchange="addNoticeFile(this)" multiple> 
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
                        		<div id="cmntCount" class="mx-3 mb-2">댓글(${notice.countCmnt})</div>
                        		<div class="mx-3 p-1" style="border: 1px solid black">
	                        		<div class="row">
	                        			<div class="col-sm-1 form-group">
	                        				${sessionScope.loginUser.userId}
	                        			</div>
	                        			<div class="col-sm-10 form-group">
	                        				<textarea style="width: 100%" id="ntcCmntCn"></textarea>
	                        			</div>
	                        			<div class="col-sm-1">
	                        				<button type="button" onclick="writeComment();">등록하기</button>
	                        			</div>
			                        </div>
                      			</div>
                      			<div class="px-4" id="ntcComment">
	                        		
		                        </div>  	
							</div>
	                    </div> 
	        		</div>
	        		<script>
		        		$(document).ready(function () {
		        			var ntcNo = document.getElementById('ntcNo').value;
		        			
		        			let data = {ntcNo : ntcNo};
		        			console.log(data);
		        			
		        			$.ajax({
								type: "post",
								url: 'updateAjax/'+ntcNo,
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
							var ntcFileNo = num;
							var ntcNo = document.getElementById('ntcNo').value;
							
							let data = {ntcFileNo : ntcFileNo, ntcNo : ntcNo};
	
							$.ajax({
								type: "post",
								url: 'deleteFile/'+ntcFileNo+'/'+ntcNo,
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
						        	console.log("돌아감");
						        	console.log(filesArr[i]);
						            formData.append("ntcMFile", filesArr[i]);
						        }
						    }
						    
						    var ntcCn = document.getElementById('ntcCn').value;
						    formData.append("ntcCn",ntcCn);
						    
						    var ntcNo = document.getElementById('ntcNo').value;
						    formData.append("ntcNo",ntcNo);
						    
						    $.ajax({
								type: "POST",
								enctype: 'multipart/form-data',	// 필수
								url: 'update',
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
