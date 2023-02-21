<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  	<%@include file="/WEB-INF/views/common/head.jsp" %>
</head>

<body id="page-top">
  <div id="wrapper">
  
    
    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        

        <!-- 메인 컨테이너 Container Fluid-->
        <div class="container-fluid" id="container-wrapper">
        
          
		
          <!-- Row -->
          <div class="container-login mt-5">
		    <div class="row justify-content-center">
		      <div class="col-xl-6 col-lg-12 p-0">
		        <div class="card shadow-sm my-5">
		          <div class="card-body p-0">
		          	<div class="container p-0">
			          <div class="row p-0">
			              <div class="col-lg-9 p-0">
			                <div class="login-form">
			                  <div class="text-center">
			                    <h1 class="h4 text-gray-900 mb-4">Login</h1>
			                  </div>
			                  <form class="user" method="post" action="login">
			                    <div class="form-group">
			                      <input type="text" class="form-control" id="userId" name="userId" placeholder="ID">
			                    </div>
			                    <div class="form-group">
			                      <input type="password" class="form-control" id="userPswd" name="userPswd" placeholder="Password">
			                    </div>
			                    <div class="form-group">
			                    <div class="row">
			                      <button type="submit" class="btn btn-primary btn-block">로그인 </button>
			                    </div>
			                    </div>
			                     <div class="text-center">
			                    <a class="font-weight-bold small" href="${pageContext.request.contextPath}/user/join">회원가입</a>
			                    <a class="font-weight-bold small" href="${pageContext.request.contextPath}/user/join">비밀번호 찾기</a>
			                  </div>
			                  </form>
			                  </div> 
			                  
			                  </div>
			                  <div class="col-lg-3 m-0 p-0 bg-primary">
			                  	<div class="brand-icon" >
						          <img src="${pageContext.request.contextPath}/resources/images/logoOnly.png" style="width:50px; margin:50px 30px 20px 30px;">
						        </div>
						        <h3 class="text-white" style="margin:0px 30px;">SRM </h3>
						        <h3 class="text-white" style="margin:0px 30px;">SYSTEM</h3>
						        <h6 class="text-light" style="margin:5px 30px 50px 30px;">OTI Team01</h6>
			                  </div>
			                  <hr>
			                </div>
			              </div>
			             <div>
			             
			             </div>
			            </div>
		          	</div>
		          </div>
		        </div>
		      </div>
		    </div>
          </div>
          <!-- Row -->

        </div>
        <!---Container Fluid-->
      </div>
    
 <%@include file="/WEB-INF/views/common/bottom.jsp" %>
</body>

</html>

