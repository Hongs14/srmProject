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

 <!-- User Modal -->
<div class="modal fade" id="userModal" tabindex="-1" role="dialog" aria-labelledby="userModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document" style="max-width:400px;">
    <div class="modal-content">
      <div class="modal-header bg-primary">
        	<h5 class="modal-title" id="userModalLabel"> 
          	<img src="${pageContext.request.contextPath}/resources/images/logoOnly.png" style="width:20px;">
        	<small class="text-white"><b>알림</b></small>
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
	       <div class="text-left">
		     <h5 id="dialogWrapper">비밀번호를 변경하였습니다.</h5>
	       </div>
       </div>
      </div>
      <div class="modal-footer justify-content-center text-center">
        <button type="button" class="btn btn-outline-primary mx-2" data-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>
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
		                		<h2  class="text-center my-2">비밀번호 변경</h2>
					            <small  class="my-2"><b>임시 비밀번호</b>로 로그인하셨습니다.<br>비밀번호를 변경해주세요.</small>
				                <div style="width: 500px; margin-top:30px;">
					                  <form class="d-flex flex-column">
								      	<div class="row ">
								      		<div class="col-sm-3">
								      			<label class="text-right" for="newPswd">비밀번호 </label>
								      		</div>
								      		<div class="col-sm-9">
								      			<div class="form-group">
							                      <input type="password" class="form-control" id="newPswd" name="userPswd" placeholder="Password" required>
							                      <small id="passwordHelp" class="form-text text-muted">특수문자 포함,알파벳 대소문자,숫자를 혼용해서 8자 이상 25자 이하</small>
							                    </div>
								      		</div>
								      	</div>
								      	<div class="row border-bottom pb-4 mb-4">
								      		<div class="col-sm-3">
								      			<label class="text-right" for="checkPswd">비밀번호 재입력 </label>
								      		</div>
								      		<div class="col-sm-9">
									      		<div class="form-group">
								                      <input type="password" class="form-control" id="checkPswd"  name="checkPswd" placeholder="Repeat Password" required> 
								                      <small id="checkPswdHelp" class="form-text text-muted">패스워드와 똑같은 값을 입력해 주세요</small>
							                    </div>
						                    </div>
								      	</div>
				                 		<input type="hidden" value="${sessionScope.userNo}" id="userNo"/>
								      	<div class="row justify-content-center mb-3">
						                     <a class="btn btn-secondary mx-2" href="${pageContext.request.contextPath}/home">다음에 변경하기 </a>
						                    <a class="btn btn-primary  mx-2" onclick="updatePswd()">비밀번호 수정 </a>
								      	</div>
								      </form>
				                 </div>
		                 	 </div> 
			       		</div>
		        	</div>
		      	</div>
		    </div>
          </div>
        </div>
      </div>
   </div>
 <!-- Wrapper끝 -->
	 
	
     <script>
     /* 비밀번호 수정 */
 	function updatePswd(){
 		var userNo = $("#userNo").val();
 		var pswdCheckAgain = 0;
 		
 		console.log("updatePswd 실행");
 		
 		/* 비밀번호 재입력 확인 */
 	  	var inputed = $('#newPswd').val();
         var reinputed = $('#checkPswd').val();
         console.log(inputed);
         console.log(reinputed);
         
         if(reinputed=="" && (inputed != reinputed || inputed == reinputed)){
             $("#checkPswd").css("background-color", "#FFCECE");
             $("#checkPswdHelp").html("패스워드와 똑같은 값을 입력해 주세요");
             $("#checkPswdHelp").removeClass("text-muted");
 	  		$("#checkPswdHelp").addClass("text-danger");
 	  		pswdCheckAgain = 0;
         } else if (inputed == reinputed) {
             $("#checkPswd").css("background-color", "#d4e6d4");
             $("#checkPswdHelp").html("비밀번호를 동일하게 입력하였습니다.");
         	$("#checkPswdHelp").removeClass("text-danger");
       		 	$("#checkPswdHelp").addClass("text-muted");
       		pswdCheckAgain = 1;
 	            
         } else if (inputed != reinputed) {
             $("#checkPswd").css("background-color", "#FFCECE");
             $("#checkPswdHelp").html("패스워드와 똑같은 값을 입력해 주세요");
             $("#checkPswdHelp").removeClass("text-muted");
 		  	$("#checkPswdHelp").addClass("text-danger");
         	pswdCheckAgain = 0;
         }
 	        
 	       
         /* 비밀번호 정규식 검증 */
 	  	var pswdRegCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
         if(!pswdRegCheck.test(inputed)){
 	  		$("#passwordHelp").removeClass("text-muted");
 	  		$("#passwordHelp").addClass("text-danger");
 	  		pswdCheckAgain = 0;
 	  	 	
 	  	}else if(pswdRegCheck.test(inputed)){
  		  	$("#passwordHelp").removeClass("text-danger");
  		 	$("#passwordHelp").addClass("text-muted");
  		 	pswdCheckAgain = 1;
 	  	}
 		
 		console.log("pswdCheckAgain: "+pswdCheckAgain);
 		
 		let data = {userPswd: inputed, userNo:userNo};
 		/* 비밀번호 업데이트 */
         if(pswdCheckAgain == 1){
         	$.ajax({
     			url : "${pageContext.request.contextPath}/user/update_pswd",
     			method : "post",
     			async :false,
     			data : JSON.stringify(data),
     			contentType: "application/json; charset=UTF-8"
     		}).done((data) => {
     			console.log(data);
     			$("#dialogWrapper").text("비밀번호를 변경하였습니다.");
     			$("#userModal").modal();
     	    	console.log("변경완료");
     	    	setTimeout(function() {
     	    		window.location.href = "/webapp/home";
	    		}, 2000);
     		});
         }
 	}
 	
 	
     </script>
 <%@include file="/WEB-INF/views/common/bottom.jsp" %>
</body>

</html>

