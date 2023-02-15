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
			<div class="d-sm-flex align-items-center justify-content-between">
				<div></div>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath}">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">나의 업무
					</li>
				</ol>
			</div>

		<!-- Row -->
          <div class="row">
	     	<div class="col-lg-12">
              <div class="card">
               <div class="card-header py-4 bg-gradient-primary d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-light">나의 정보 </h6>
                </div>
                <div class="card-body">
					<table class="table center" style="width: 400px;">
						<tr>
							<th class="text-primary">성명 </th>
							<td>${sessionScope.loginUser.userNm}</td>
						</tr>
						<tr>
							<th class="text-primary">ID</th>
							<td>${sessionScope.loginUser.userId}</td>
						</tr>
						<tr>
							<th class="text-primary">비밀번호 </th>
							<td><input type="password" disabled placeholder="password"><a class="btn btn-info btn-sm">수정하기</a></td>
						</tr>
						<tr>
							<th class="text-primary">소속</th>
							<td>${sessionScope.loginUser.userOgdp}</td>
						</tr>
						<tr>
							<th class="text-primary">EMAIL</th>
							<td>${sessionScope.loginUser.userEml}</td>
						</tr>
						<tr>
							<th class="text-primary">연락처</th>
							<td>${sessionScope.loginUser.userTelno}</td>
						</tr>
						<tr>
							<th class="text-primary">부서</th>
							<td>${sessionScope.loginUser.userDpNm}</td>
						</tr>
						<tr>
							<th class="text-primary">직급</th>
							<td>${sessionScope.loginUser.userJbps}</td>
						</tr>
					</table>
					<div class="mx-5 px-5">
						<a href="update?userNo=${sessionScope.loginUser.userNo}" class="btn btn-info btn-sm">수정하기</a>
	
					</div>
					<div class="card-footer"></div>
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
