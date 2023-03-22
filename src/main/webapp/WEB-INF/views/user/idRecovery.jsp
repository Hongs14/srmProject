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
		                	<div class="d-flex justify-content-start align-items-center">
			                    <img src="${pageContext.request.contextPath}/resources/images/logoOnlyBlue.png"" style="width:40px;">
			                    <div class="p-2">
			                    	<small class="text-gray-900" style="font-size:4px;">KOREA SOFT SRM</small>
			                    	<h6>한국소프트SRM</h6>
			                    </div> 
			                  </div>
		                	<div id="recoveryWrapper">
	                			<h2 class="text-center my-2 mb-5">아이디 찾기</h2>
			                    <div style="width: 400px; height: 250px;">
				                  <form id="findId" action="${pageContext.request.contextPath}/user/id_recovery">
				                  	 <div class="form-group row align-items-center mb-4">
				                      <label class="font-weight-bold text-primary col-sm-2 text-right">이름 </label>
				                      <input type="text" class="form-control col-sm-10" id="userNm" name="userNm" placeholder="Name" required>
				                      <small id="userNmHelp" class="text-danger ml-3 pl-5"></small>
				                    </div>
				                    
				                    <div class="form-group row row-cols-2 align-items-center mb-4">
				                      <label class="font-weight-bold text-primary col-sm-2 text-right">이메일 </label>
				                      <input type="email" class="form-control col-sm-10" id="userEml" name="userEml" aria-describedby="emailHelp"
				                        placeholder="Email Address" required>
				                       <small id="emailHelp" class="form-text text-muted ml-3 pl-5">회원가입시 입력했던 이메일을 기입해주세요.</small>
				                    </div>
				                    <div class="d-flex justify-content-center">
					                   	<button type="button" class="btn btn-primary" onclick="findId()">아이디 찾기</button>
				                    </div>
				                  </form>
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
					}
				}); 
		  }
		  
	  }
  </script>
</body>

</html>

