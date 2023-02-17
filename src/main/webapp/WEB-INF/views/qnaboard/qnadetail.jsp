<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
	  	<%@include file="/WEB-INF/views/common/head.jsp" %>
	  	
		<script>
	  		$(document).ready(function(){
	  			console.log("시작할때");
	  			readComment();
	  			
	  		});
	  		
	  		function readComment(){
	  			console.log("aa");
	  			$.ajax({
			    	url:"read/comment"
			        ,type:"get"
			        ,data: JSON.stringify(data)
	  				,contentType: "application/json; charset=UTF-8"
			        ,success:function(data){
			        	console.log(data.size());
			        	console.log(data);
			         }
			    })
			    
				/* $.ajax({
  				url: "read/comment",
  				method: "get",
  				data: JSON.stringify(data),
  				contentType: "application/json; charset=UTF-8"
  				}).done((data) => {
  					console.log(data);
  					console.log("ajax성공");
  				}); */
	  		};
	  		
	  		
			function writeComment(){
				console.log("댓글달기 실행");
				let content = $('#qnaCmntCn').val();
				let qcwriterNo = '${sessionScope.loginUser.userNo}';
				let qcwriter = '${sessionScope.loginUser.userNm}';
				let qstnNo = '${qstn.qstnNo}';
				
				let data = {userNo: qcwriterNo, qstnNo: qstnNo, qstnCmntCn: content};
				
				$.ajax({
					url: "write/comment",
					method: "post",
					data: JSON.stringify(data),
					contentType: "application/json; charset=UTF-8"
				}).done((data) => {
					console.log(data);
					
				});
			}
			
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
		        	<div class="d-sm-flex align-items-end justify-content-between">
          				<div class="bg-primary px-3 py-2" style="border-top-left-radius:10px; border-top-right-radius:10px;">
            				<h6 class="mb-0 text-white">Q&A 게시판</h6>
         				</div>
           				<ol class="breadcrumb">
             					<li class="breadcrumb-item">Q&A</li>
             					<li class="breadcrumb-item active" aria-current="page">목록보기</li>
           				</ol>
          			</div>
          			<!-- Row -->
					<div class="row">
		       			<div class="col-lg-12">
	                    	<div class="card mb-4">
	                    	
	                        	<div class="card-header">
	                            	<div class="d-flex flex-row align-items-center justify-content-between">
	                                 	<div><h6 class="m-0 font-weight-bold text-primary mb-3">문의사항 No.${qstn.qstnNo}</h6></div>
	                                 	<div>조회수 2</div>
	                                </div>
	                                 	<div>
	                                 		<h2 class="m-0 font-weight-bold text-primary">${qstn.qstnTtl}</h2>
	                                 	</div>
	                                 	<hr/>
	                          	</div>   
		                        <div class="mx-3 p-3 d-flex flex-column">
		                       		<form>
	                            		<div class="row mb-2">
		                            		<div class="form-group col-sm-3 ">
		                            			<label class="col-form-label">작성자</label>
		                            		</div>
		                            		<div class="col-sm-9">
		                            			<!-- <input type="text" class="form-control" id="qqnaWriter" value="정홍주"/> -->
		                            			${qstn.userNm}
		                            		</div>
	                            		</div>	
	                            		<div class="row mb-2">
		                            		<div class="form-group col-sm-3 ">
		                            			<label class="col-form-label">작성일</label>
		                            		</div>
		                            		<div class="col-sm-9">
		                            			<!-- <input type="text" class="form-control" id="qqnaWriter" value="정홍주"/> -->
		                            			${qstn.qstnWrtDate}
		                            		</div>
	                            		</div>
	                            		<div class="row mb-2">
		                            		<div class="form-group col-sm-3 ">
		                            			<label class="col-form-label">내용</label>
		                            		</div>
		                            		<div class="col-sm-9" style="border: 1px solid black">
		                            			${qstn.qstnCn}
		                            			<!-- <textarea rows="5" cols="80" readonly>지금 한달째 검토중입니다. 빨리 접수해주세요</textarea> -->
		                            		</div>
	                            		</div>
	                            		<div class="row mb-2">
		                            		<div class="form-group col-sm-3 ">
		                            			<label class="col-form-label">첨부파일</label>
		                            		</div>
		                            		<div class="col-sm-9">화면캡처.png</div>
	                            		</div>
	                            		<div class="text-right"> 
	                            			<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/qna/list'">목록</button>
	                            			<input type="button" class="btn btn-primary" value="수정" onclick="location.href='${pageContext.request.contextPath}/qna/update'"/>
	                            			<button class="btn btn-primary">삭제</button>
	                            		</div>
		                            </form>
		                        </div>
	                        	<hr/>
	                        	<!-- 댓글 -->
	                        		<div class="mx-3 mb-2">댓글(2)</div>
		                        	<div class="mx-3 p-1" style="border: 1px solid black">
		                        		<div class="row">
		                        			<div class="col-sm-1 form-group" id="qnaComentWriter">
		                        				${sessionScope.loginUser.userNm}
		                        			</div>
		                        			<div class="col-sm-10 form-group">
		                        				<textarea style="width: 100%" id="qnaCmntCn"></textarea>
		                        			</div>
		                        			<div class="col-sm-1">
		                        				<button type="button" onclick="writeComment();">등록하기</button>
		                        			</div>
				                        </div>
		                        	</div>
		                        	<div class="px-4" id="qComment">
		                        		<hr/>
		                        		<div class="d-flex px-2 flex-row align-items-center justify-content-between">
		                        			<div class="row">
		                        				<h6 style="color: #406882"><b>김희률</b></h6>
		                        				<h6 class="ml-3">2023.02.13</h6>
		                        			</div>
		                        			<div>| <a href="#">수정</a> | <a href="#">삭제</a> |</div>
		                        		</div>
		                        		
		                        		<div id="commentContent">
		                        			한 번 확인해보겠습니다.
		                        		</div>
		                        	</div>
                        		</div>
                       		</div>
                    	</div>
          			<!-- 로그아웃 모달 -->
           			<%@include file="/WEB-INF/views/common/logout.jsp" %>
       			</div>
       		<!---Container Fluid-->
      		</div>
     		
      	</div>
     	<!-- Footer -->
   	 	</div>
 		<%@include file="/WEB-INF/views/common/bottom.jsp" %>
	</body>
</html>