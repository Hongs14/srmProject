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
					<table class="table center m-3" style="width: 600px;">
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
							<td><input type="password" disabled placeholder="password">
								<a class="btn btn-outline-warning btn-sm mx-1" data-toggle="modal" data-target="#updatePswd">수정하기</a>
							</td>
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
							<td>${sessionScope.loginUser.userTelNo}</td>
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
          
			<!-- Modal -->
			<div class="modal fade" id="updatePswd" tabindex="-1" aria-labelledby="updatePswdFunLabel" aria-hidden="true">
			  <div class="modal-dialog" style="width:400px">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="updatePswdFunLabel">비밀번호 변경</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      <form>
			      	<div class="row">
			      		<div class="col-sm-4">
			      			<span>현재 비밀번호</span>
			      		</div>
			      		<div class="col-sm-8">
			      			<input type="password" required/>
			      			<div class="invalid-feedback">
			      				현재 비밀번호를 입력해주세요.
			      			</div>
			      		</div>
			      	</div>
			      	<br>
			      	<div class="row">
			      		<div class="col-sm-4">
			      			<span>새로운 비밀번호</span>
			      		</div>
			      		<div class="col-sm-8">
			      			<input type="password" class="mb-1"required/>
			      			<div class="invalid-feedback">
			      				비밀번호를 입력해주세요.
			      			</div>
			      			<br>
			      			<input type="password" class="mb-1" required/>
			      			<div class="invalid-feedback">
			      				비밀번호를 입력해주세요.
			      			</div>
			      		</div>
			      	</div>
			      </form>
			      	
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			        <a type="button" class="btn btn-primary" href= '<c:url value="/user/updatepswd/userno"/>'>수정</a>
			      </div>
			    </div>
			  </div>
			</div>
          

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
