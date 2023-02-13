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
		      <div class="col-xl-6 col-lg-12 col-md-9">
		        <div class="card shadow-sm my-5">
		          <div class="card-body p-0">
		          	<div class="container">
			          <div class="row">
			              <div class="col-lg-12">
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
			                      <div class="custom-control custom-checkbox small" style="line-height: 1.5rem;">
			                        <input type="checkbox" class="custom-control-input" id="customCheck">
			                        <label class="custom-control-label" for="customCheck">Remember
			                          Me</label>
			                      </div>
			                    </div>
			                    <div class="form-group">
			                      <button type="submit" class="btn btn-primary btn-block">로그인 </button>
			                      <p>로그인 유저: ${loginUser.userId} / ${sessionScope.userId}</p>
			                      <p>result: ${result}</p>
			                    </div>
			                    <hr>
			                  </form>
			                  <hr>
			                  <div class="text-center">
			                    <a class="font-weight-bold small" href="${pageContext.request.contextPath}/user/join">회원가입</a>
			                  </div>
			                  <div class="text-center">
			                  </div>
			                  
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
    
    </div>
  </div>
 <%@include file="/WEB-INF/views/common/bottom.jsp" %>
</body>

</html>

