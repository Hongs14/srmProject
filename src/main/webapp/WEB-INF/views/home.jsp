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
            <h1 class="h3 mb-0 text-gray-800">${sessionScope.loginUser.userNm} 님 환영합니다.</h1>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">나의 업무 </li>
            </ol>
          </div>
		
          <!-- Row -->
          <div class="row">
	     	<div class="col-xl-8 col-lg-7 mb-4">
              <div class="card">
               <div class="card-header py-4 bg-primary d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-light">나의 요청 </h6>
                </div>
                <div class="table-responsive">
                  <table class="table align-items-center table-flush">
                    <thead class="thead-light">
                      <tr>
                        <th>SR번호 </th>
                        <th>제목 </th>
                        <th>관련 시스템 </th>
                        <th>상태 </th>
                        <th>완료예정일 </th>
                        <th>중요 </th>
                        <th>진척도 </th>
                        <th>상세보기 </th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td><a href="#">JHJ-SR-0001</a></td>
                        <td>댓글기능추가</td>
                        <td>JHJ시스템</td>
                        <td><span class="badge badge-success">검토중</span></td>
                        <td>2023/04/14 </td>
                        <td>상</td>
                        <td>0%</td>
                        <td><a href="#" class="btn btn-sm btn-primary">상세</a></td>
                      </tr>
                      <tr>
                        <td><a href="#">JHJ-SR-0002</a></td>
                        <td>첨부기능 보완</td>
                        <td>JHJ시스템</td>
                        <td><span class="badge badge-warning">개발중 </span></td>
                        <td>2023/04/14 </td>
                        <td>상</td>
                        <td>10%</td>
                        <td><a href="#" class="btn btn-sm btn-primary">상세</a></td>
                      </tr>
                       <tr>
                        <td><a href="#">JHJ-SR-0003</a></td>
                        <td>조회 기능 보완</td>
                        <td>JHJ시스템</td>
                        <td><span class="badge badge-warning">반려</span></td>
                        <td>2023/04/14 </td>
                        <td>하 </td>
                        <td>0%</td>
                        <td><a href="#" class="btn btn-sm btn-primary">상세</a></td>
                      </tr>
                      
                    </tbody>
                  </table>
                </div>
                <div class="card-footer"></div>
              </div>
            </div>
            <div class="col-xl-4 col-lg-5 ">
              <div class="card">
                <div class="card-header py-4 bg-primary d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-light"> 나의 시스템 </h6>
                </div>
                <div>
                  <div class="customer-message align-items-center">
                    <a class="font-weight-bold" href="#">
                      <div class="text-truncate message-title">JHJ 시스템</div>
                      <div class="small text-gray-500 message-time font-weight-bold">Udin Cilok · 58m</div>
                    </a>
                  </div>
                  
                  <div class="card-footer text-center">
                    <a class="m-0 small text-primary card-link" href="#">View More <i
                        class="fas fa-chevron-right"></i></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
          <div class="col-xl-6 col-lg-6 ">
              <div class="card">
                <div class="card-header py-4 bg-primary d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-light">공지사항 </h6>
                </div>
                <div class="table-responsive">
                  <table class="table align-items-center table-flush">
                    <thead class="thead-light">
                      <tr>
                        <th>글번호 </th>
                        <th>제목 </th>
                        <th>작성자 </th>
                        <th>작성일 </th>
                        <th>상세보기 </th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td><a href="#">0001</a></td>
                        <td>공지사항1 </td>
                        <td>관리자</td>
                        <td>2023/04/14 </td>
                        <td><a href="#" class="btn btn-sm btn-primary">상세</a></td>
                      </tr>
                      </tbody>
                      </table>
	              </div>
	            </div>
            
          	</div>
          	<div class="col-xl-6 col-lg-6 ">
              <div class="card">
                <div class="card-header py-4 bg-primary d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-light">QnA </h6>
                </div>
                <div class="table-responsive">
                  <table class="table align-items-center table-flush">
                    <thead class="thead-light">
                      <tr>
                        <th>글번호 </th>
                        <th>제목 </th>
                        <th>작성자 </th>
                        <th>작성일 </th>
                        <th>상세보기 </th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td><a href="#">0001</a></td>
                        <td>QnA1 </td>
                        <td>관리자</td>
                        <td>2023/04/14 </td>
                        <td><a href="#" class="btn btn-sm btn-primary">상세</a></td>
                      </tr>
                      </tbody>
                      </table>
	              </div>
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
