<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

	<head>
	  	<%@include file="/WEB-INF/views/common/head.jsp" %>
	  	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	  	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	  	<script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
	
		<!-- Bootstrap Datepicker -->
	  	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
	  	<!-- RuangAdmin Javascript -->
	  	<script src="${pageContext.request.contextPath}/resources/js/ruang-admin.min.js"></script>
  	
	  	<script>
		  	$(document).ready(function () {
			    $('#simple-date4 .input-daterange').datepicker({        
			        format: 'yyyy/mm/dd',        
			        autoclose: true,     
			        todayHighlight: true,   
			        todayBtn: 'linked',
			      });  
		  	});
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
	                        		<!-- 검색 -->
	                        		<div class="mb-1 mt-5 px-5">
								    	<div class="row">
								        	<div class="col-4">
								            	<div class="form-group row" id="simple-date4" >
											    	<div class="input-daterange input-group input-group-sm">
											        	<label for="start" class="col-sm-3 col-form-label-sm">조회기간</label>
										            	<input type="text" class="input-sm form-control form-control-sm col-sm-9" name="start" />
								                    	<div class="input-group-prepend">
								                    		<span class="input-group-text" style="height:31px;">~</span>
								                    	</div>
									                    <input type="text" class="input-sm form-control form-control-sm" name="end" />
											     	</div>
								            	</div>
								         	</div> 
					                		<div class="col-3"></div>
					                		<div class="col-4">
							                	<div class="form-group row">
							                		<label for="exampleFormControlSelect1" class="col-sm-3 col-form-label-sm">키워드</label>
							                    	<input type="text" class="form-control form-control-sm col-sm-9 bg-light" 
							                   		aria-label="Search" placeholder="검색어를 입력하세요" style="border-color: #3f51b5;">
							                  	</div>
					                		</div>
					                		<div class="col-1">
					                			<div class="input-group-append float-right">
													<button class="btn btn-primary btn-sm" type="button" onclick="progressList()">
														조회 <i class="fas fa-search fa-sm"></i>
													</button>
												</div>
					                		</div>
					                	</div>
					               	</div>
					               	<hr/>
	                        		<!-- 검색 -->
						         	
						            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
			                			<h6 class="m-0 font-weight-bold text-primary">질문 목록</h6>
			                			<div class="d-sm-flex justify-content-end">
			                				<button class="btn btn-sm btn-secondary ">Q&A 등록하기</button>
			                  			</div>
			                		</div> 
			                		
			                		<!-- 테이블 -->
			                		<div class="table-responsive p-3">
					               		<table class="table align-items-center table-flush">
					                    	<thead class="thead-light">
							                	<tr>
							                    	<th>번호</th>
							                        <th>글제목</th>
							                        <th>작성자</th>
							                        <th>작성일</th>
							                        <th>조회수</th>
							                        <th>댓글수</th>
							                    </tr>
					                   		</thead>
					                   		<tbody>
					                   			<c:forEach var="QnaboardDto" items="${qnalist}">
						                   			<tr onclick="location.href='${pageContext.request.contextPath}/qna/detail'">
						                        		<td>1</td>
								                        <td>${QnaboardDto.qstnTtl}</td>
								                        <td>${QnaboardDto.userNm}</td>
								                        <td>${QnaboardDto.qstnWrtDate}</td>
								                        <td>${QnaboardDto.qstnInqCnt}</td>
								                        <td>2</td>
						                     		</tr>
					                     		</c:forEach>
					                 		</tbody>
					                  	</table>
						           	</div>
						            <!-- table -->
					         		<div class="text-center"><button class="btn btn-secondary">1</button></div>
					            </div>
					    	</div>  
			        	</div> 
						<!-- Row -->
						
			         	<!-- 로그아웃 모달 -->
			           	<%@include file="/WEB-INF/views/common/logout.jsp" %>
					</div>
			        <!---Container Fluid-->
				</div>
			</div>
		</div>
 		<%@include file="/WEB-INF/views/common/bottom.jsp" %>
	</body>
</html>
