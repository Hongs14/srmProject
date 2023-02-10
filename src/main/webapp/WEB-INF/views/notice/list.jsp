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
              <li class="breadcrumb-item active" aria-current="page">나의 할일 </li>
            </ol>
          </div>
	
          <!-- Row -->
          <div class="col-lg-12">
              <div class="card mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">게시글 목록</h6>
                </div>
                
                <!-- 검색 -->
                <div class="m-3">
                	<div class="row">
                		<div class="col-3">
                			<div class="form-group" id="simple-date4">
			                	<div class="input-daterange input-group">
				                	<span>조회기간</span>
			                    	<input type="text" class="input-sm form-control" name="start" />
			                    	<div class="input-group-prepend">
			                    		<span class="input-group-text">~</span>
			                    	</div>
			                    	<input type="text" class="input-sm form-control" name="end" />
			                    </div>
			            	</div>
                		</div>
                		<div class="col-6"></div>
                		<div class="col-3">
            				<form class="navbar-search">
			                	<div class="input-group">
	            					<span>키워드</span>
			                    	<input type="text" class="form-control bg-light border-1 small" placeholder="What do you want to look for?"
			                   		aria-label="Search" aria-describedby="basic-addon2" style="border-color: #3f51b5;">
			                    	<div class="input-group-append">
			                      		<button class="btn btn-primary" type="button">
			                        		<i class="fas fa-search fa-sm"></i>
			                      		</button>
			                    	</div>
			                  	</div>
			            	</form>
                		</div>
                	</div>
                </div>
                <hr/>
                
                <!-- 공지사항 목록 -->
                <div class="table-responsive p-3">
                  <table class="table align-items-center table-flush table-hover" id="dataTableHover">
                    <thead class="thead-light">
                    <tr>
                      <th>카테고리</th>
                      <th>글번호</th>
                      <th>글제목</th>
                      <th>작성자</th>
                      <th>작성일</th>
                      <th>조회수</th>
                    </tr>
                    </thead>
                   	<tbody>
	                    <tr>
	                      <td>공지사항</td>
	                      <td>1</td>
	                      <td>SRM 요청등록 하는 방법</td>
	                      <td>관리자</td>
	                      <td>2023-02-09</td>
	                      <td>111</td>
	                    </tr>
	                    <tr>
	                      <td>공지사항</td>
	                      <td>2</td>
	                      <td>SRM 요청등록 수정 하는 방법</td>
	                      <td>관리자</td>
	                      <td>2023-02-09</td>
	                      <td>111</td>
	                    </tr>
	                    <tr>
	                      <td>공지사항</td>
	                      <td>3</td>
	                      <td>SRM 요청등록 삭제 하는 방법</td>
	                      <td>관리자</td>
	                      <td>2023-02-09</td>
	                      <td>111</td>
	                    </tr>
	                    <tr>
	                      <td>공지사항</td>
	                      <td>4</td>
	                      <td>SRM 사용방법</td>
	                      <td>관리자</td>
	                      <td>2023-02-09</td>
	                      <td>111</td>
	                    </tr>
	                    <tr>
	                      <td>공지사항</td>
	                      <td>5</td>
	                      <td>SRM 검토</td>
	                      <td>관리자</td>
	                      <td>2023-02-09</td>
	                      <td>111</td>
	                    </tr>
                  	</tbody>
                  </table>
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
