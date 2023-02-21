<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  	<%@include file="/WEB-INF/views/common/head.jsp" %>
  	 <style>
        select option[value=""][disabled] {
	        display: none;
        }
    </style>
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
		                  <form action="join" method="post">
		                    <div class="form-group">
		                      <label>이름 </label>
		                      <input type="text" class="form-control" id="userNm" name="userNm" placeholder="Enter Name" required>
		                    </div>
		                    
		                    <div class="form-group">
		                      <label>이메일 </label>
		                      <input type="email" class="form-control" id="userEml" name="userEml" aria-describedby="emailHelp"
		                        placeholder="Enter Email Address" required>
		                    </div>
		                    <div class="form-group">
		                      <label>전화번호 </label>
		                      <input type="tel" class="form-control" id="userTelno" name="userTelno" required>
		                    </div>
		                    <div class="form-group">
		                      <label>아이디 </label>
		                      <input type="text" class="form-control" id="userId" name="userId" placeholder="Enter Name" required>
		                    </div>
		                    <div class="form-group">
		                      <label>비밀번호 </label>
		                      <input type="password" class="form-control" id="userPswd" name="userPswd" placeholder="Password" required>
		                    </div>
		                    <div class="form-group">
		                      <label>비밀번호 재입력 </label>
		                      <input type="password" class="form-control" id="userPswdRepeat" name="userPswdRepeat"
		                        placeholder="Repeat Password" required> 
		                    </div>
		                    <div class="form-group">
		                      <label for="userType">타입 </label>
		                      <select class="form-control" id="userType" name="userType" onchange="optionChange1();" required>
		                      	<option value="" disabled selected>가입 타입 선택</option>
		                      	<option value="고객사">고객사</option>
		                      	<option value="개발자">개발자</option>
		                      	<option value="관리자">관리자</option>
		                      </select>
		                    </div>
		                    
		                    <div class="form-group">
		                      <label for="userOgdp">소속 </label>
		                      <select type="text" class="form-control" id="userOgdp" name="userOgdp" required>
		                      	<option value="" disabled selected>소속 회사 선택</option>
		                      </select>
		                    </div>
		                    
		                    <div class="form-group">
		                      <label for="userJbps">직급 </label>
		                      <select type="text" class="form-control" id="userJbps" name="userJbps" required>
		                      	<option value="" disabled selected>직급 선택</option>
		                      	<option>사원</option>
		                      	<option>주임</option>
		                      	<option>대리</option>
		                      	<option>과장</option>
		                      	<option>차장</option>
		                      	<option>부장</option>
		                      	<option>이사</option>
		                      	<option>상무</option>
		                      	<option>전무</option>
		                      	<option>사장</option>
		                      </select>
		                    </div>
		                    
		                    <div class="form-group">
		                      <label for="userDpNm">부서 </label>
		                      <select type="text" class="form-control" id="userDpNm" name="userDpNm" required>
		                      	<option value="" disabled selected>소속 부서 선택</option>
		                      </select>
		                    </div>
		                    
		                    
		                    <div class="form-group">
		                      <button type="submit" class="btn btn-primary btn-block">가입</button>
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
        </div>
        <!---Container Fluid-->
      </div>
      <!-- Footer -->
     	 <%@include file="/WEB-INF/views/common/footer.jsp" %>
     	 <script>
     	function optionChange1() {
            let a = ['티에이치컴퍼니','레드주컴퍼니','에이치알컴퍼니','지에이치컴퍼니'];
            let b = ['한국소프트SRM'];
            
            let a2 = ['전산팀','마케팅팀','기획팀','인사팀','회계팀','총무팀','영업팀','판매팀'];
            let b2 = ['개발1팀','개발2팀','개발3팀'];
            let c2 = ['관리1팀','관리2팀','관리3팀'];
            
            let userType = $( '#userType' ).val();
            let userOgdpOptions;
            let userDpNmOptions;
            if ( userType == '고객사' ) {
            	userOgdpOptions = a;
            	userDpNmOptions = a2;
            }  else if ( userType == '개발자' ) {
            	userOgdpOptions = b;
            	userDpNmOptions = b2;
            }	else {
            	userOgdpOptions = b;
            	userDpNmOptions = c2;
            	
            }
            $( '#userOgdp' ).empty();
            $( '#userOgdp' ).append( '<option value="" disabled selected>소속 회사 선택</option>' );
            for ( let i = 0; i < userOgdpOptions.length; i++ ) {
              $( '#userOgdp' ).append( '<option>' + userOgdpOptions[ i ] + '</option>' );
            }
            
            $( '#userDpNm' ).empty();
            $( '#userDpNm' ).append( '<option value="" disabled selected>소속 부서 선택</option>' );
            for ( var i = 0; i < userDpNmOptions.length; i++ ) {
              $( '#userDpNm' ).append( '<option>' + userDpNmOptions[ i ] + '</option>' );
            }
          }
     	
     	
     	 </script>
     <!-- Footer -->
    </div>
  </div>
 <%@include file="/WEB-INF/views/common/bottom.jsp" %>
</body>

</html>
