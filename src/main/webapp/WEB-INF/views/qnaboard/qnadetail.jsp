<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
		        	<div class="d-sm-flex align-items-center justify-content-between mb-4">
			            <h1 class="h3 mb-0 text-gray-800">Q&A 상세보기</h1>
			            <ol class="breadcrumb">
			            	<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Home</a></li>
			            	<li class="breadcrumb-item active" aria-current="page">Qna 자세히보기 </li>
			            </ol>
		          	</div>
          			
          			<!-- Row -->
          			<div>
						<div class="qnacontent mx-3 my-0">
		       				<div class="col-lg-12">
	                     		<div class="card mb-4  p-3">
	                             	<div class="card-header">
	                                 	<div class="d-flex flex-row align-items-center justify-content-between">
		                                 	<div><h6 class="m-0 font-weight-bold text-primary mb-3">문의사항 No.131</h6></div>
		                                 	<div>조회수 2</div>
	                                 	</div>
	                                 	<div>
	                                 		<h2 class="m-0 font-weight-bold text-primary">계속 검토중에 멈춰있습니다.</h2>
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
			                            			정홍주
			                            		</div>
		                            		</div>	
		                            		<div class="row mb-2">
			                            		<div class="form-group col-sm-3 ">
			                            			<label class="col-form-label">작성일</label>
			                            		</div>
			                            		<div class="col-sm-9">
			                            			<!-- <input type="text" class="form-control" id="qqnaWriter" value="정홍주"/> -->
			                            			2023.02.13
			                            		</div>
		                            		</div>
		                            		<div class="row mb-2">
			                            		<div class="form-group col-sm-3 ">
			                            			<label class="col-form-label">내용</label>
			                            		</div>
			                            		<div class="col-sm-9">
			                            			지금 한달째 검토중입니다. 빨리 접수해주세요
			                            			<!-- <textarea rows="5" cols="80" readonly>지금 한달째 검토중입니다. 빨리 접수해주세요</textarea> -->
			                            		</div>
		                            		</div>
		                            		<div class="row mb-2">
			                            		<div class="form-group col-sm-3 ">
			                            			<label class="col-form-label">첨부파일</label>
			                            		</div>
			                            		<div class="col-sm-9">
			                            			<!-- <input type="text" class="form-control" id="qqnaWriter" value="정홍주"/> -->
			                            			화면캡처.png
			                            		</div>
		                            		</div>
		                            		<div class="text-right">
		                            			<button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/qna/list'">목록</button>
		                            			<input type="button" class="btn btn-primary" value="수정"/>
		                            			<button class="btn btn-primary">삭제</button>
		                            		</div>
		                            		
		                            	</form>
		                            </div>
	                        	</div>
	                        	댓글(1)
	                        	
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
	                        	<!-- 댓글 -->
	                        	
                         	</div>
	                    </div> 
          			</div>
          			<!-- Row -->

          <!-- 로그아웃 모달 -->
           <%@include file="/WEB-INF/views/common/logout.jsp" %>
        </div>
        <!---Container Fluid-->
      </div>
     <%@include file="/WEB-INF/views/common/footer.jsp" %>
      </div>
      <!-- Footer -->
    </div>
 <%@include file="/WEB-INF/views/common/bottom.jsp" %>
</body>

</html>