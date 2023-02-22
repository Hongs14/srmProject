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
	  		
	  		
			function writeComment(){
				console.log("댓글달기 실행");
				let content = $('#ntcCmntCn').val();
				let ntcWriterNo = '${sessionScope.loginUser.userNo}';
				let ntcwriter = '${sessionScope.loginUser.userId}';
				let ntcNo = '${notice.ntcNo}';
				
				let data = {userNo: ntcWriterNo, ntcNo: ntcNo, ntcCmntCn: content};
				console.log(data);
				$.ajax({
					url: "write/comment",
					method: "post",
					data: JSON.stringify(data),
					contentType: "application/json; charset=UTF-8"
				}).done((item) => {
					console.log(item);
					
					let comment = '<hr/>';
	        		comment += '<div class="d-flex px-2 flex-row align-items-center justify-content-between">';
	        		comment += 	'<div>'
					comment += 		'<h6 style="color: #406882"><b>'+ntcwriter+'</b></h6>';
					comment += 		'<h6>'+item.ntcCmntDate+'</h6>';
					comment +=	'</div>'
					comment += 	'<div>'
					comment += 		'<input type="hidden" id="ntcCmntNo" value="'+item.ntcCmntNo+'"/>'
					comment += 		'<a id="updateToggle'+data.ntcCmntNo+'" onclick="updateCButton('+item.ntcCmntNo+')">수정</a> | <a onclick="deleteComment('+item.ntcCmntNo+')">삭제</a> |';
					comment += 	'</div>';
					comment +='</div>';
					comment += '<textarea id="commentContent'+item.ntcCmntNo+'" disabled="disabled" style="border: none; resize:none; width:90%">'+item.ntcCmntCn+'</textarea>';
					
	        		$('#ntcComment').append(comment); 
	        		$('#cmntCount').empty();
	        		$('#cmntCount').append('댓글('+(${notice.countCmnt}+1)+')');
	        		$('#ntcCmntCn').val('');
					
				});
			}
			
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
						<div class="noticeContent mx-3 my-0">
							<div class="col-lg-12">
								<div class="card mb-4  p-3">
	                        		<div class="card-header">
	                            		<div class="d-flex flex-row align-items-center justify-content-between">
		                            		<div>
		                            			<h6 class="m-0 font-weight-bold text-primary mb-3">공지사항 No.${notice.ntcNo}</h6>
		                            		</div>
		                                	<div>
		                                		<span>조회수 : ${notice.ntcInqCnt} </span>
		                                	</div>
		                                 </div>
		                                 <div>
		                                 	<h2 class="m-0 font-weight-bold text-primary">제목 :${notice.ntcTtl} </h2>
		                                 </div>
		                                 <hr/>
	                           		</div>   
		                            <div class="mx-3 p-3 d-flex flex-column">
	                            		
                            			<div class="row mb-2">
	                            			<div class="form-group col-sm-3 ">
	                            				<label class="col-form-label">작성자</label>
		                            		</div>
		                            		<div class="col-sm-9">
		                            			<span>${notice.userId}</span>
		                            		</div>
	                            		</div>	
	                            		<div class="row mb-2">
	                            			<div class="form-group col-sm-3 ">
	                            				<label class="col-form-label">작성일</label>
		                            		</div>
		                            		<div class="col-sm-9">
			                            		<span>${notice.ntcWrtDate}</span>
			                            	</div>
		                            	</div>
		                            	<div class="row mb-2">
			                            	<div class="form-group col-sm-3 ">
			                            		<label class="col-form-label">내용</label>
			                            	</div>
			                            	<div class="col-sm-9">
			                            		<span>${notice.ntcCn}</span>
			                            	</div>
		                            	</div>
		                            	<div class="row mb-2">
			                            	<div class="form-group col-sm-3 ">
			                            		<label class="col-form-label">첨부파일</label>
			                            	</div>
			                            	<div class="col-sm-9">	
			                            		<c:forEach var="noticeFile" items="${noticeFile}">
													<span><a href="fileDownload?ntcFileNo=${noticeFile.ntcFileNo}">${noticeFile.ntcFileActlNm}</a></span>
			                            		</c:forEach>	                            		
			                            	</div>
		                            	</div>			                            		
		                            	<div class="d-sm-flex justify-content-end">
		                            		<a href="${pageContext.request.contextPath}/notice/list" class="btn btn-primary mr-1">목록</a>
		                            		<a href="${pageContext.request.contextPath}/notice/update?ntcNo=${notice.ntcNo}" class="btn btn-primary mr-1">수정</a>
		                            		<form method="post" action="delete" enctype="multipart/form-data">
		                            			<input type="hidden" id="ntcNo" name="ntcNo" value="${notice.ntcNo}"/>
			                            		<button class="btn btn-primary">삭제</button>
		                            		</form>
		                            	</div>
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
