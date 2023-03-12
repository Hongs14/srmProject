<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		        <div class="card shadow-sm m-5 p-2">
		          <div class="card-body p-0 d-flex">
		                <div class="login-form">
			                <div class="d-flex justify-content-start align-items-center">
			                    <img src="${pageContext.request.contextPath}/resources/images/logoOnlyBlue.png"" style="width:40px;">
			                    <div class="p-2">
			                    	<small class="text-gray-900" style="font-size:4px;">KOREA SOFT SRM</small>
			                    	<h6>한국소프트SRM</h6>
			                    </div> 
			                  </div>
		                	<div id="recoveryWrapper">
				                  <h2 class="text-center my-2">아이디  / 비밀번호 찾기</h2>
				                  <div style="width: 400px; height: 300px; padding-top:20px;">
					                  <div class="recoveryBtns d-flex flex-column" id="recoveryBtns">
						                  <div class="d-flex border justify-content-center align-items-center mb-4" style="cursor: pointer; height:100px;" onclick="location.href='${pageContext.request.contextPath}/user/id_recovery';">
						                  	<i class="fa-solid fa-user-lock px-4" style="font-size:60px;"></i>
						                  	<span class="border-left h4 px-4">아이디 찾기</span>
						                  </div>
						                   <div class="d-flex border justify-content-center align-items-center mb-3" style="cursor: pointer; height:100px;" onclick="location.href='${pageContext.request.contextPath}/user/pswd_recovery';">
						                  	<i class="fa-solid fa-key px-4" style="font-size:60px;"></i>
						                  	<span  class="border-left h4 px-4">비밀번호찾기</span>
						                  </div>
					                  </div>
				                  </div>
				                   <hr>
				                  <div class="text-center">
				                    <a class="font-weight-bold small" href="${pageContext.request.contextPath}/user/join">회원가입</a>
				                    <span> | </span>
				                    <a class="font-weight-bold small"  href="${pageContext.request.contextPath}/user/login">로그인하기 </a>
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

