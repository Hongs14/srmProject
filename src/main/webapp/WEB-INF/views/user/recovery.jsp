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
  	
  	<c:if test="${result eq 'success'}">
	  	<script>
		  	$(document).ready(function(){
		  	 	$("#welcomeModal").modal();
		  	});
		  	
	  	</script>
  	</c:if>
</head>

<body id="page-top">
  <div id="wrapper">
  	<!-- S회원가입 환영 모달 -->
  	<div class="modal fade" id="welcomeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelWelcome" aria-hidden="true">
	   <div class="modal-dialog" role="document" style="max-width:450px;">
	     <div class="modal-content">
	       <div class="modal-header bg-primary">
	         	<h5 class="modal-title" id="exampleModalLabelWelcome"> 
		          	<img src="${pageContext.request.contextPath}/resources/images/logoOnly.png" style="width:20px;">
		        	<small class="text-white"><b>가입 완료</b></small>
		        </h5>
	         <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
	           <span aria-hidden="true">&times;</span>
	         </button>
	       </div>
	       <div class="modal-body justify-content-center text-center p-5">
		       <div class="d-flex align-items-center">
			       <div id="iconWrapper" class="mr-4">
				       	<i class="fas fa-exclamation-triangle" style="font-size:3rem; color:#FFA426;"></i>
			       </div>
			       <div id="dialogWrapper" class="text-left">
				     <h5>회원가입이 완료되었습니다.</h5>
			       </div>
		       </div>
	       </div>
	       <div class="modal-footer justify-content-center text-center">
	         <button type="button" class="btn btn-outline-primary mx-2" data-dismiss="modal">확인</button>
	       </div>
	     </div>
	   </div>
	 </div>
	 <!-- E회원가입 환영 모달 -->
    
    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        

        <!-- 메인 컨테이너 Container Fluid-->
        <div class="container-fluid" id="container-wrapper">
        
          
		
          <!-- Row -->
          <div class="container-login row justify-content-center">
		        <div class="card shadow-sm m-5">
		          <div class="card-body p-0 d-flex">
		                <div class="login-form">
		                	<div id="recoveryWrapper">
				                  <div class="text-center">
				                    <h3 class="text-gray-900 mb-4">아이디 / 비밀번호 찾기</h3>
				                  </div>
				                  <div id="recoveryWrapper" style="width: 400px; height: 300px;">
					                  <div class="recoveryBtns d-flex flex-column" id="recoveryBtns">
					                  	<a class="btn btn-primary my-5 mx-4" href="${pageContext.request.contextPath}/user/id_recovery">아이디 찾기</a>
					                  	<a class="btn btn-primary m-4" href="${pageContext.request.contextPath}/user/pswd_recovery">비밀번호찾기</a>
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
		                  <hr>
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

