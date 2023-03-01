<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<style>
	.text-primary {
	font-size: 2rem;
	}
	
	#myInfoWrapper{
  			justify-content: center;
  			align-items:center;
  			min-height: 100vh;
  		}
	</style>
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
        <div class="container-fluid " id="container-wrapper">
			

		<!-- Row -->
          <div class="row" id="myInfoWrapper">
	     	<div class="col-lg-7 container">
              <div class="card" >
               <div class="card-header py-4 bg-gradient-primary d-flex flex-row align-items-center justify-content-between">
                  <h4 class="m-0 font-weight-bold text-light">나의 정보 </h4>
                </div>
                <div class="card-body d-flex p-0">
                	<div class="userOgdp bg-primary">
                		<div class="p-3 pt-5">
							<h6 class="text-white ">${sessionScope.loginUser.userType}</h6>
							<h3 class="text-white">${sessionScope.loginUser.userOgdp}</h3>
						</div>
                	</div>
                	<form class="myInfoWrapper p-5 container"> 
						<div class="row mb-4">
							<label class="col-3" style="border-top:0; margin:0px;font-size:1.2rem;" for="userNm">성명 </label>
							<input class="col-9" id="userNm"class="mx-2" style="border:0; font-size:1.2rem;" value="${sessionScope.loginUser.userNm}" disabled>
						</div>
						<div class="row mb-4">
							<label class="col-3" style="border-top:0; margin:0px;font-size:1.2rem;" for="userId">ID </label>
							<input class="col-9" id="userId"class="mx-2" style="border:0; font-size:1.2rem;" value="${sessionScope.loginUser.userId}" disabled>
						</div>
						<div class="row mb-4">
							<label class="col-3" style="border-top:0; margin:0px;font-size:1.2rem;" for="userPswd">비밀번호 </label>
							<input class="col-7" type="password" placeholder="password" id="userPswd"class="mx-2" style="border:0; font-size:1.2rem;" disabled>
							<a class="btn btn-outline-warning btn-sm col-2" data-toggle="modal" data-target="#updatePswd">수정하기</a>
						</div>
						<div class="row mb-4">
							<label class="col-3" style="border-top:0; margin:0px;font-size:1.2rem;" for="userEml">EMAIL </label>
							<input class="col-9" id="userEml"class="mx-2" style="border:0; font-size:1.2rem;" value="${sessionScope.loginUser.userEml}" disabled>
						</div>
						<div class="row mb-4">
							<label class="col-3" style="border-top:0; margin:0px;font-size:1.2rem;" for="userTelno">연락처 </label>
							<input class="col-9" id="userTelno"class="mx-2" style="border:0; font-size:1.2rem;" value="${sessionScope.loginUser.userTelno}" disabled>
						</div>
						<div class="row mb-4">
							<label class="col-3" style="border-top:0; margin:0px;font-size:1.2rem;" for="userDpNm">부서 </label>
							<input class="col-9" id="userDpNm"class="mx-2" style="border:0; font-size:1.2rem;" value="${sessionScope.loginUser.userDpNm}" disabled>
						</div>
						<div class="row mb-4 ">
							<label class="col-3" style="border-top:0; margin:0px;font-size:1.2rem;" for="userJbps">직급 </label>
							<input class="col-9" id="userJbps"class="mx-2" style="border:0; font-size:1.2rem;" value="${sessionScope.loginUser.userJbps}" disabled>
						</div>
					<div class="card-footer">
						<div class="text-center">
							<a href="update?userNo=${sessionScope.loginUser.userNo}" class="btn btn-info btn-sm">수정하기</a>
							<a href="unregister?userNo=${sessionScope.loginUser.userNo}" class="btn btn-warning btn-sm">탈퇴하기</a>
						</div>
					</div>
					</form>
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
      </div>
     <%@include file="/WEB-INF/views/common/footer.jsp" %>
      <!-- Footer -->
    </div>
    </div>
 <%@include file="/WEB-INF/views/common/bottom.jsp" %>
</body>

</html>
