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
		        <div class="card shadow-sm m-5">
		          <div class="card-body p-0 d-flex">
		                <div class="login-form">
		                	<div id="recoveryWrapper">
				                  <div class="text-center">
				                    <h3 class="text-gray-900 mb-4">아이디 찾기</h3>
				                  </div>
				                  <div id="recoveryWrapper" style="width: 400px; height: 300px;">
					                  <form id="findId" action="${pageContext.request.contextPath}/user/id_recovery">
					                  	 <div class="form-group row px-5 align-items-center">
					                      <label class="font-weight-bold text-primary col-sm-2 text-right">이름 </label>
					                      <input type="text" class="form-control col-sm-10" id="userNm" name="userNm" placeholder="Name" required>
					                      <small id="userNmHelp" class="text-danger"></small>
					                    </div>
					                    
					                    <div class="form-group row row-cols-2 px-5 align-items-center">
					                      <label class="font-weight-bold text-primary col-sm-2 text-right">이메일 </label>
					                      <input type="email" class="form-control col-sm-10" id="userEml" name="userEml" aria-describedby="emailHelp"
					                        placeholder="Email Address" required>
					                       <small id="emailHelp" class="form-text text-muted">회원가입시 입력했던 이메일을 기입해주세요.</small>
					                    </div>
					                   	<button type="button" class="btn btn-primary" onclick="findId()">아이디 찾기</button>
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
 <!-- 아이디 찾기 모달 -->
  	<div class="modal fade" id="findIdModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelWelcome" aria-hidden="true">
	   <div class="modal-dialog" role="document" style="max-width:450px;">
	     <div class="modal-content">
	       <div class="modal-header bg-primary">
	         	<h5 class="modal-title" id="exampleModalLabelWelcome"> 
		          	<img src="${pageContext.request.contextPath}/resources/images/logoOnly.png" style="width:20px;">
		        	<small class="text-white"><b>아이디 찾기</b></small>
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
				     <h5>회원님의 아이디는 <span id="foundUserId"></span> 입니다.</h5>
			       </div>
		       </div>
	       </div>
	       <div class="modal-footer justify-content-center text-center">
	         <button type="button" class="btn btn-outline-primary mx-2" data-dismiss="modal">확인</button>
	       </div>
	     </div>
	   </div>
	 </div>
	 <!-- 아이디 찾기 모달 -->
  <script>
	  function findId(){
		  console.log("아이디 찾기 실행 ");
		  var userNm = $("#userNm").val();
		  var userEml = $("#userEml").val(); 
		  if(userNm == ""){
			  $("#userNmHelp").html("아이디를 입력해주세요");
		  }
		  if(userEml ==""){
			 $("#emailHelp").html("이메일을 입력해주세요");
			 $("#emailHelp").removeClass("text-muted");
			 $("#emailHelp").addClass("text-danger");
			 
		  }
		  if(userNm != "" && userEml != ""){
			 let data = {userNm:userNm, userEml:userEml};
			  console.log("유저 정보: "+userNm+", "+userEml);
			  $.ajax({
					url :"${pageContext.request.contextPath}/user/id_recovery",
					type : "post",
					data : JSON.stringify(data),
					contentType: "application/json; charset=UTF-8",
					success: function(data){
						var userId = data;
						if(userId == ""){
							$("#dialogWrapper").html("회원정보가 존재하지 않습니다.");
							$("#findIdModal").modal();
						}
						if(userId != ""){
							$("#foundUserId").html(userId);
							$("#findIdModal").modal();
						}
						
					},
					error: function(e){
						alert("실패 ");
						console.log(e);
					}
				}); 
		  }
		  
	  }
  </script>
</body>

</html>

