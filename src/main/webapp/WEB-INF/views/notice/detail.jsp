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
                <!-- 게시글 상세 -->
                <div class="card-header">
	               	<!-- 글 제목 -->
	               	<div class="row">
	               		<div class="col-1">글제목 : </div>
	               		<div class="col-11">
	               			<textarea class="form-control" rows="1"></textarea>
	               		</div>
	               	</div>
                </div>
                <div class="card-body">
                	<!-- 글 내용 -->
                	<div class="row mt-2">
                		<div class="col-1">글 내용 : </div>
                		<div class="col-11">
                			<textarea class="form-control" rows="10"></textarea>
                		</div>
                	</div>
                	<!-- 첨부파일 -->
                	<div class="row mt-2">
                		<div class="col-1">첨부파일 : </div>
                		<div class="col-11">
                			<textarea class="form-control" rows="1"></textarea>
                		</div>
                	</div>
                	<!-- 작성완료/닫기 -->
                	<div class="row mt-2">
	                	<div class="col-12">
	                		<div class="d-sm-flex justify-content-end">
	                			<button class="btn btn-sm btn-primary mr-1">작성완료</button>
	                			<button class="btn btn-sm btn-danger mr-1">닫기</button>
							</div>	                	
	                	</div>
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
