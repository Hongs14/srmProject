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
    <!-- Sidebar -->
    
    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        
        <!-- TopBar -->
         <%@include file="/WEB-INF/views/common/topbar.jsp" %>
        <!-- Topbar -->

        <!-- 메인 컨테이너 Container Fluid-->
        <div class="container-fluid" id="container-wrapper">
        
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">회원가입</h1>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">회원가입  </li>
            </ol>
          </div>
		
          <!-- Row -->
          <div class="container-login">
		    <div class="row justify-content-center">
		      <div class="col-xl-10 col-lg-12 col-md-9">
		        <div class="card shadow-sm my-5">
		          <div class="card-body p-0">
		            <div class="row">
		              <div class="col-lg-12">
		                <div class="login-form">
		                  <div class="text-center">
		                    <h1 class="h4 text-gray-900 mb-4">Register</h1>
		                  </div>
		                  <form>
		                    <div class="form-group">
		                      <label>First Name</label>
		                      <input type="text" class="form-control" id="exampleInputFirstName" placeholder="Enter First Name">
		                    </div>
		                    <div class="form-group">
		                      <label>Last Name</label>
		                      <input type="text" class="form-control" id="exampleInputLastName" placeholder="Enter Last Name">
		                    </div>
		                    <div class="form-group">
		                      <label>Email</label>
		                      <input type="email" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp"
		                        placeholder="Enter Email Address">
		                    </div>
		                    <div class="form-group">
		                      <label>Password</label>
		                      <input type="password" class="form-control" id="exampleInputPassword" placeholder="Password">
		                    </div>
		                    <div class="form-group">
		                      <label>Repeat Password</label>
		                      <input type="password" class="form-control" id="exampleInputPasswordRepeat"
		                        placeholder="Repeat Password">
		                    </div>
		                    <div class="form-group">
		                      <button type="submit" class="btn btn-primary btn-block">Register</button>
		                    </div>
		                    <hr>
		                    <a href="index.html" class="btn btn-google btn-block">
		                      <i class="fab fa-google fa-fw"></i> Register with Google
		                    </a>
		                    <a href="index.html" class="btn btn-facebook btn-block">
		                      <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
		                    </a>
		                  </form>
		                  <hr>
		                  <div class="text-center">
		                    <a class="font-weight-bold small" href="login.html">Already have an account?</a>
		                  </div>
		                  <div class="text-center">
		                  </div>
		                </div>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
          </div>
          <!-- Row -->

          

          <!-- 로그아웃 모달 -->
          <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelLogout"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabelLogout">Ohh No!</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <p>Are you sure you want to logout?</p>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Cancel</button>
                  <a href="login.html" class="btn btn-primary">Logout</a>
                </div>
              </div>
            </div>
          </div>

        </div>
        <!---Container Fluid-->
      </div>
      <!-- Footer -->
     	 <%@include file="/WEB-INF/views/common/footer.jsp" %>
     <!-- Footer -->
    </div>
  </div>
 <%@include file="/WEB-INF/views/common/bottom.jsp" %>
</body>

</html>