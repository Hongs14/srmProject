<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  	<%@include file="/WEB-INF/views/common/head.jsp" %>
  	<style>
  		#wrapper{
  			justify-content: center;
  			align-items:center;
  			min-height: 100vh;
  		}
  	</style>
</head>

<body id="page-top">
  <div id="wrapper">
  
    
    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        

        <!-- 메인 컨테이너 Container Fluid-->
        <div class="container-fluid" id="container-wrapper">
        
          
		
          <!-- Row -->
          <div class="container-login row justify-content-center">
		        <div class="card shadow-sm m-5">
		          <div class="card-body p-0 d-flex">
		                <div class="login-form">
			                  <div class="text-center">
			                    <h3 class="text-gray-900 mb-4">LOGIN</h3>
			                  </div>
			                  
			                  <form class="user d-flex flex-column m-5" method="post" action="user/login">
			                    <div class="form-group mb-4">
			                      <input type="text" class="form-control" id="userId" name="userId" placeholder="ID" >
			                    </div>
			                    <div class="form-group mb-4">
			                      <input type="password" class="form-control" id="userPswd" name="userPswd" placeholder="Password" >
			                    </div>
			                    <div class="form-group mb-1">
				                    <button type="submit" class="btn btn-primary btn-block" >로그인 </button>
			                    </div>
			                  </form>
			                  
			                  <div class="text-center">
			                    <a class="font-weight-bold small" href="${pageContext.request.contextPath}/user/join">회원가입</a>
			                    <span> | </span>
			                    <a class="font-weight-bold small" href="${pageContext.request.contextPath}/user/findPassword">아이디&비밀번호 찾기 </a>
			                  </div>
		                  </div> 
		                  
		                  <div class="m-0 p-0 bg-primary">
		                  	<div class="brand-icon" >
					          <img src="${pageContext.request.contextPath}/resources/images/logoOnly.png" style="width:50px; margin:50px 30px 20px 30px;">
					        </div>
					        <h3 class="text-white" style="margin:0px 30px;">SRM </h3>
					        <h3 class="text-white" style="margin:0px 30px;">SYSTEM</h3>
					        <h6 class="text-light" style="margin:5px 30px 50px 30px;">OTI Team01</h6>
		                  </div>
		                  <hr>
			             <div>
			             
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

