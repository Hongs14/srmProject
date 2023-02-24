<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

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
        			<div class="row justify-content-center">
        				<div class=" col-lg-8 d-sm-flex align-items-center justify-content-between">
	            			<div class="bg-primary px-3 py-2" style="border-top-left-radius:10px; border-top-right-radius:10px;">
	            				<h6 class="mb-0 text-white">QnA 수정</h6>
	          				</div>
	            			<ol class="breadcrumb">
	              				<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/qnaboard/qnalist">Qna게시판</a></li>
	              				<li class="breadcrumb-item">QnA수정</li>
	            			</ol>
	          			</div>
	          			</div>
	
          				<!-- Row -->
          				<div class="row justify-content-center">
		       			<div class="col-lg-8">
	                    	<div class="card mb-4 p-4">
			             		<div class="card-header d-flex flex-row align-items-center justify-content-between">
                        			<div><h6 class="mx-4 font-weight-bold text-primary">QNA 수정</h6></div>
	                            </div> 
                				<!-- 게시글 작성 -->
                				<div class="card-body">
                					<form>
					                	<!-- 글 제목 -->
					                	<div class="row">
					                		<div class="col-2 col-form-label text-center"><h6 class="m-0 font-weight-bold text-primary">글제목</h6> </div>
					                		<div class="col-10">
					                			<textarea class="form-control" rows="1"></textarea>
					                		</div>
					                	
					                		
					                	</div>
					                	<!-- 글 내용 -->
					                	<div class="row mt-3">
					                		<div class="col-2 text-center"><h6 class="m-0 font-weight-bold text-primary">글 내용</h6> </div>
					                		<div class="col-10">
					                			<textarea class="form-control" rows="10"></textarea>
					                		</div>
					                	</div>
					                	<!-- 첨부파일 -->
					                	<div class="row mt-3">
					                		<div class="col-2 text-center"><h6 class="m-0 font-weight-bold text-primary">첨부파일</h6></div>
					                		<div class="col-10">
					                			<input type="file"/>
					                		</div>
					                	</div>
					                	<!-- 작성완료/닫기 -->
					                	<div class="row mt-3">
						                	<div class="col-12">
						                		<div class="d-sm-flex justify-content-end">
						                			<button class="btn btn-sm btn-primary mr-1">작성완료</button>
						                			<button type="button" class="btn btn-sm btn-warning mr-1" onclick="location.href='${pageContext.request.contextPath}/qna/list'">닫기</button>
												</div>	                	
						                	</div>
						               	</div>
	               					</form>
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
      	<!-- Footer -->
		</div>
 		<%@include file="/WEB-INF/views/common/bottom.jsp" %>
	</body>
</html>