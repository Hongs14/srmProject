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
            <h1 class="h3 mb-0 text-gray-800">SR 요청 검토 </h1>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Home</a></li>
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/examine/list">목록으로</a></li>
            </ol>
          </div>
	
          <!-- Row -->
          <div class="col-lg-12">
              <div class="card mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">SR 검토 상세</h6>
                </div>
                <hr/>
                <div class="card-body">
	              	<!-- 검토내용 -->
                	<div class="container-fluid">
                		<!-- 등록자/소속 -->
                		<div class="row">
                			<div class="col-6">
                				<span>등록자 : 김태희</span>
                			</div>
                			<div class="col-6">
                				<span>소속 : 고용노동부</span>
                			</div>
                		</div>
                		<!-- 등록일/관련시스템 -->
                		<div class="row">
                			<div class="col-6">
                				<span>등록일 : 2023.02.13</span>
                			</div>
                			<div class="col-6">
                				<span>관련시스템 : A쇼핑몰</span>
                			</div>
                		</div>
                		<!-- 요청구분 -->
                		<div class="row">
                			<div class="col-12">
                				<span>요청구분 : 신규</span>
                			</div>
                		</div>
                		<!-- 검토상태/종요여부 -->
                		<div class="row">
                			<div class="col-1">
                				<span>검토 상태</span>
                			</div>
                			<div class="col-5">
                				<div class="form-group ml-2">
			                    	<select class="form-control" id="exampleFormControlSelect1">
			                        	<option></option>
			                        	<option>미검토</option>
			                        	<option>검토중</option>
			                        	<option>재검토</option>
			                        	<option>반려</option>
			                    	</select>
		                		</div>
		                	</div>
                			<div class="col-1">
                				<span>중요여부</span>                				
                			</div>
                			<div class="col-5">
                				<div class="form-group ml-2">
			                    	<select class="form-control" id="exampleFormControlSelect1">
			                        	<option></option>
			                        	<option>상</option>
			                        	<option>중</option>
			                        	<option>하</option>
			                    	</select>
		                		</div>
		                	</div>
                		</div>
                		<!-- 검토의견 -->
                		<div class="row">
                			
               				<div class="col-1">
                				<span>검토의견</span>
               				</div>
               				<div class="col-11">
                				<textarea class="form-control" rows="5"></textarea>
               				</div>
                			
                		</div>
                	</div>
                	<hr/>
	                <!-- 요청내용 -->
	                <div class="container-fluid">
	                	<!-- SR제목 -->
	                	<div class="row">
	                		<div class="col-12">
	                			<span>SR제목 : 고용노동부 댓글 기능 추가</span>
	                		</div>
	                	</div>
	                	<!-- 관련 근거(목적) -->
	                	<div class="row">
	                		<div class="col-12">
	                			<span>관련 근거(목적) : 법령 2조 2항 </span>
	                		</div>
	                	</div>
	                	<!-- SR 내용 -->
	                	<div class="row">
	                		<div class="col-12">
	                			<span> SR 내용 : </span>
	                		</div>
	                	</div>
	                	<!-- 첨부파일 -->
	                	<div class="row">
	                		<div class="col-12">
	                			<span>첨부파일 : </span>
	                		</div>
	                	</div>
	                	<!-- 저장/닫기-->
	                	<div class="row">
		                	<div class="col-12">
		                		<div class="d-sm-flex justify-content-end">
		                			<button class="btn btn-sm btn-primary mr-1">저장</button>
		                			<button class="btn btn-sm btn-danger mr-1">닫기</button>
								</div>	                	
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

    </div>

	<%@include file="/WEB-INF/views/common/bottom.jsp" %>
</body>

</html>
