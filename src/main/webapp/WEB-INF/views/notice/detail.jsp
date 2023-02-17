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
	              				<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/notice/list">공지사항</a></li>
	            			</ol>
	          			</div>
						<!-- Row -->
						<div class="qnacontent mx-3 my-0">
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
												<span><a href="fileDownload?ntcNo=${notice.ntcNo}">${notice.ntcFileActlNm}</a></span>
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
		                        <div class="card mb-4 p-3">
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
	      	<!-- Footer -->
   		</div>
		<%@include file="/WEB-INF/views/common/bottom.jsp" %>
	</body>

</html>
