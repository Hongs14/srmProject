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
  		#spinner {
		    position: fixed;
		    top: 0;
		    bottom: 0;
		    left: 0;
		    right: 0;
		    z-index: 9999;
		}
		
		.spinner-overlay {
		    position: fixed;
		    top: 0;
		    bottom: 0;
		    left: 0;
		    right: 0;
		    background-color: rgba(0,0,0,0.5);
		}
		
		.spinner-container {
		    position: absolute;
		    top: 50%;
		    left: 50%;
		    transform: translate(-50%, -50%);
		    text-align: center;
		}
		
		.spinner {
		    margin: 0 auto;
		}
		
		.message {
		    margin-top: 10px;
		    color: #fff;
		    font-size: 18px;
		    font-weight: bold;
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
		                	<div class="d-flex justify-content-start align-items-center">
			                    <img src="${pageContext.request.contextPath}/resources/images/logoOnlyBlue.png"" style="width:40px;">
			                    <div class="p-2">
			                    	<small class="text-gray-900" style="font-size:4px;">KOREA SOFT SRM</small>
			                    	<h6>한국소프트SRM</h6>
			                    </div> 
			                  </div>
		                	<div id="recoveryWrapper">
		                		<h2  class="text-center my-2">비밀번호 찾기</h2>
					            <small  class="my-2">회원가입시 작성하셨던 이메일로 <br> 임시 비밀번호를 전송해드리겠습니다.</small>
				                <div style="width: 400px; height: 250px; margin-top:30px;">
					               <div class="recoveryBtns d-flex flex-column" id="recoveryBtns">
					                  <form id="findPswdForm">
					                  	<div class="form-group row align-items-center mb-4">
					                      <label class="font-weight-bold text-primary col-sm-2 text-right">이름 </label>
					                      <input type="text" class="form-control col-sm-10" id="userNm" name="userNm" placeholder="Name" required>
					                      <small id="userNmHelp" class="text-danger ml-3 pl-5"></small>
					                    </div>
					                  	 <div class="form-group row row-cols-2 align-items-center mb-4">
					                      <label class="font-weight-bold text-primary col-sm-2 text-right">이메일 </label>
					                      <input type="email" class="form-control col-sm-10" id="userEml" name="userEml" aria-describedby="emailHelp"
					                        placeholder="Email Address" required>
					                       <small id="emailHelp" class="form-text text-muted ml-3 pl-5">회원가입시 작성했던 이메일을 기입해주세요.</small>
					                    </div>
					                    <div class="d-flex justify-content-center">
						                   	<button type="button" class="btn btn-primary" onclick="findPswd()">비밀번호 찾기</button>
					                    </div>
					                  </form>
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
      <!-- 패스워드 찾기 모달 -->
  	<div class="modal fade" id="findPswdModal" tabindex="-1" role="dialog" aria-labelledby="findPswdModalLabel" aria-hidden="true">
	   <div class="modal-dialog" role="document" style="max-width:450px;">
	     <div class="modal-content">
	       <div class="modal-header bg-primary">
	         	<h5 class="modal-title" id="findPswdModalLabel"> 
		          	<img src="${pageContext.request.contextPath}/resources/images/logoOnly.png" style="width:20px;">
		        	<small class="text-white"><b>비밀번호 찾기</b></small>
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
				     <h5>임시 비밀번호를 회원님의 메일로 전송했습니다.</h5>
			       </div>
		       </div>
	       </div>
	       <div class="modal-footer justify-content-center text-center">
	         <a class="btn btn-primary"  href="${pageContext.request.contextPath}/user/login" id="loginBtn">로그인하기</a>
	         <button type="button" class="btn btn-outline-primary mx-2" data-dismiss="modal" id="dismissBtn">닫기</button>
	       </div>
	     </div>
	   </div>
	 </div>
	 <!-- 패스워드 찾기 모달 -->
	 
	 <!-- spinner -->
	 <div id="spinner" style="display:none;">
	    <div class="spinner-overlay"></div>
	    <div class="spinner-container">
	        <div class="spinner">
	       		<div class="spinner-border text-primary" role="status">
				  <span class="sr-only">Loading...</span>
				</div>
	        </div>
	        <div class="message"></div>
	    </div>
	</div>
	 <!-- spinner -->
     <script>
     	function showSpinner(message) {
    	    $("#spinner .message").text(message);
    	    $("#spinner").show();
    	}

     	function hideSpinner() {
     	    $("#spinner").hide();
     	}
         function findPswd(){
         	var userEml = $("#userEml").val();
         	console.log("메일 테스트: "+userEml);
         	var userNm = $("#userNm").val();
	   		if(userNm == ""){
	   			 $("#userNmHelp").html("아이디를 입력해주세요");
	   		}
         	if(userEml ==""){
    			 $("#emailHelp").html("이메일을 입력해주세요");
    			 $("#emailHelp").removeClass("text-muted");
    			 $("#emailHelp").addClass("text-danger");
    		  	}
         	if(userEml !=""){
         		let data = {userNm:userNm, userEml:userEml};
   			  	console.log(userEml);
   			 	showSpinner("회원정보를 확인 중입니다. 잠시만 기다려주세요...");
   			  $.ajax({
   					url :"${pageContext.request.contextPath}/user/pswd_recovery",
   					type : "post",
   					data : JSON.stringify(data),
   					contentType: "application/json; charset=UTF-8",
   					success: function(data){
   	   					console.log(data);
   						if(data == 'success'){
   							$("#spinner").hide();
   							$("#dialogWrapper").html("임시 비밀번호를 회원님의 메일로 전송했습니다.");
   							$("#loginBtn").show();
   							$("#dismissBtn").hide();
   							$("#findPswdModal").modal();
   						}else{
   							$("#spinner").hide();
   							$("#dialogWrapper").html("회원정보가 존재하지 않습니다.");
   							$("#findPswdModal").modal();
   							$("#dismissBtn").show();
   							$("#loginBtn").hide();
   						}
   					},
   					error: function(e){
   						$("#spinner").hide();
   						alert("실패 ");
   						console.log(e);
   					}
   				});
         	}
         }
         </script>
 <%@include file="/WEB-INF/views/common/bottom.jsp" %>
</body>

</html>

