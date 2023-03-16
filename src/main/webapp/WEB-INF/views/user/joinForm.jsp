<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  	<%@include file="/WEB-INF/views/common/head.jsp" %>
  	 <style>
        select option[value=""][disabled] {
	        display: none;
        }
        .userType_check input[type="radio"] {display: none; }
        .userType_check input[type="radio"] + label {cursor:pointer;}
        .userType_check input[type="radio"]:checked + label { background: #66bb6a; color: white;}
        .form-group { margin-bottom: 30px;}
        .form-group > input { max-width: 780px;}
        .form-group > select { max-width: 780px;}
        .form-group > small {padding-left:150px;}
    </style>
</head>

<body id="page-top">
  <div id="wrapper">
  <!-- 회원가입 실패모달 -->
  	<div class="modal fade" id="wrongJoin" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelWelcome" aria-hidden="true">
	   <div class="modal-dialog" role="document" style="max-width:450px;">
	     <div class="modal-content">
	       <div class="modal-header bg-primary">
	         	<h5 class="modal-title" id="exampleModalLabelWelcome"> 
		          	<img src="${pageContext.request.contextPath}/resources/images/logoOnly.png" style="width:20px;">
		        	<small class="text-white"><b>가입 실패</b></small>
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
				     <h5>회원가입에 실패하였습니다 재시도해주시길 바랍니다.</h5>
			       </div>
		       </div>
	       </div>
	       <div class="modal-footer justify-content-center text-center">
	         <button type="button" class="btn btn-outline-primary mx-2" data-dismiss="modal">확인</button>
	       </div>
	     </div>
	   </div>
	 </div>
<!-- 회원가입 실패모달 -->

    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        


        <!-- 메인 컨테이너 Container Fluid-->
        <div class="container-fluid" id="container-wrapper">
		
          <!-- Row -->
          <div class="container-login">
		    <div class="row justify-content-center">
		      <div class="col-xl-8 col-lg-10 col-md-7">
		        <div class="card shadow-sm my-5">
		          <div class="card-body p-5">
	                <div class="join-form">
	                  <div class="text-center p-2">
	                    <h3 class="text-gray-900 mb-4"><b>회원 가입</b></h3>
	                  </div>
	                  <hr>
	                  
	                  <form action="${pageContext.request.contextPath}/user/join" class="needs-validation" method="post" id="joinForm" novalidate>
	                  
	                  <h6 class="m-3 px-5 mt-5 font-weight-bold text-primary">가입 타입 선택 </h6>
	                  	<div class="container mb-5 border p-5">
	                  	<div class="userType_check row row-cols-3 justify-content-md-center" role="group" onchange="optionChange1();" aria-label="radio group">
						  <div class="col text-center">
							  <input type="radio" class="btn-check" name="userType" id="userType1" autocomplete="off"  value="고객사" checked>
							  <label class="btn btn-outline-success" for="userType1"><i class="fas fa-users fa-lg" style="width:160px; height:120px; font-size:3rem; line-height:7rem;"></i><br><h3>고객사</h3></label>
						  </div>
						  <div class="col text-center">
							  <input type="radio" class="btn-check" name="userType" id="userType2" autocomplete="off"  value="개발자">
							  <label class="btn btn-outline-success" for="userType2"><i class="fas fa-cogs fa-sm fa-fw" style="width:160px; height:120px; font-size:3rem; line-height:7rem;"></i><br><h3>개발자</h3></i></label>
						  </div>
						  <div class="col text-center">
							  <input type="radio" class="btn-check" name="userType" id="userType3" autocomplete="off"  value="관리자">
							  <label class="btn btn-outline-success" for="userType3"><i class="fab fa-fw fa-wpforms" style="width:160px; height:120px; font-size:3rem; line-height:7rem;"></i><br><h3>관리자</h3></i></label>
						  </div>
						</div>
						</div>
						
	                    <div class="form-group row px-5 align-items-center">
	                      <label class="font-weight-bold text-primary col-sm-2 text-right">이름 </label>
	                      <input type="text" class="form-control col-sm-10" id="userNm" name="userNm" placeholder="Name" required>
	                      <small id="userNmHelp"></small>
	                    </div>
	                    
	                    <div class="form-group row row-cols-2 px-5 align-items-center">
	                      <label class="font-weight-bold text-primary col-sm-2 text-right">이메일 </label>
	                      <input type="email" class="form-control col-sm-10" id="userEml" name="userEml" aria-describedby="emailHelp"
	                        placeholder="Email Address" oninput="emailRegCheck()"required>
	                       <small id="emailHelp" class="form-text text-muted">예) user@naver.com, user@daum.net</small>
	                       <small id="emailCheckHelp" class="form-text text-danger"></small>
	                    </div>
	                    <div class="form-group row row-cols-2 px-5 align-items-center">
	                      <label class="font-weight-bold text-primary col-sm-2 text-right">전화번호 </label>
	                      <input type="tel" class="form-control col-sm-10" id="userTelno" name="userTelno" placeholder="PhoneNumber" oninput="userTelnoRegCheck()" required>
	                      <small id="telNoHelp" class="form-text text-muted">예) 010-123-1234, 011-1234-1234</small>
	                    </div>
	                    <div class="form-group row row-cols-2 px-5 align-items-center">
	                      <label class="font-weight-bold text-primary col-sm-2 text-right">아이디 </label>
	                      <input type="text" class="form-control col-sm-10" id="userId" name="userId" placeholder="Id" oninput="checkId()" required>
	                      <small id="userIdHelp" class="form-text text-muted">알파벳 대소문자, 숫자를 혼용해서 4자 이상 10자 이하</small><span id="userCheckHelp" class="text-danger small"></span>
	                    </div>
	                    <div class="form-group row row-cols-2 px-5 align-items-center">
	                      <label class="font-weight-bold text-primary col-sm-2 text-right">비밀번호 </label>
	                      <input type="password" class="form-control col-sm-10" id="userPswd" name="userPswd" placeholder="Password" oninput="checkPswdAgain()" required>
	                      <small id="passwordHelp" class="form-text text-muted">특수문자 포함,알파벳 대소문자,숫자를 혼용해서 8자 이상 25자 이하</small>
	                    </div>
	                    <div class="form-group row row-cols-2 px-5 align-items-center">
	                      <label class="font-weight-bold text-primary col-sm-2 text-right">비밀번호 재입력 </label>
	                      <input type="password" class="form-control col-sm-10" id="checkPswd" name="checkPswd" placeholder="Repeat Password"  oninput="checkPswdAgain()" required> 
	                      <small id="checkPswdHelp" class="form-text text-muted">패스워드와 똑같은 값을 입력해 주세요</small>
	                    </div>
	                    
	                    
	                    <div class="form-group row row-cols-2 px-5 align-items-center">
	                      <label class="font-weight-bold text-primary col-sm-2 text-right" for="userOgdp">소속 </label>
	                      <select type="text" class="form-control col-sm-10" id="userOgdp" name="userOgdp" required>
	                      	<option value="" disabled selected>소속 회사 선택</option>
	                      </select>
	                      <small id="userOgdpHelp"></small>
	                    </div>
	                    
	                    <div class="form-group row row-cols-2 px-5 align-items-center">
	                      <label class="font-weight-bold text-primary col-sm-2 text-right" for="userJbps">직급 </label>
	                      <select type="text" class="form-control col-sm-10" id="userJbps" name="userJbps" required>
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
	                      <small id="userJbpsHelp"></small>
	                    </div>
	                    
	                    <div class="form-group row row-cols-2 px-5 align-items-center">
	                      <label class="font-weight-bold text-primary col-sm-2 text-right" for="userDpNm">부서 </label>
	                      <select type="text" class="form-control col-sm-10" id="userDpNm" name="userDpNm" required>
	                      	<option value="" disabled selected>소속 부서 선택</option>
	                      </select>
	                      <small id="userDpNmHelp"></small>
	                    </div>
	                 	 <br>
	                 	<hr>
	                 	<br>
	                    <div class="px-5 mx-5 my-2 d-flex justify-content-center">
	                      <button type="button" class="btn btn-success btn-lg signupbtn"  style="width:500px;"onclick="submitJoinInfo()">가입</button>
	                      <a type="button" class="btn btn-warning btn-lg mx-2"  style="width:500px;" href="${pageContext.request.contextPath}/user/login">취소</a>
	                    </div>
	                  </form>
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
            var a = ['북북출판사','사슈즈','오티아이','한국대학교'];
            var b = ['한국소프트'];
            
            var a2 = ['전산팀','마케팅팀','기획팀','인사팀','회계팀','총무팀','영업팀','판매팀'];
            var b2 = ['개발1팀','개발2팀','개발3팀'];
            var c2 = ['관리팀'];
            
            var userType = document.querySelector('input[name="userType"]:checked').value;
            var userOgdpOptions;
            var userDpNmOptions;
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
     	
    	$(document).ready(function () {
    		 var a = ['북북출판사','사슈즈','오티아이','한국대학교'];
    		 var a2 = ['전산팀','마케팅팀','기획팀','인사팀','회계팀','총무팀','영업팀','판매팀'];
         	 var userType = '고객사';
    		 var userOgdpOptions = a;
         	 var userDpNmOptions = a2;
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
    		
    	});
    	/* 회원가입 유효성 검증을 위한 변수들 */
    	var idCheck = 0;
   	    var pswdCheck = 0;
   	    var emlCheck = 0;
   	    var emptyCheck = 0;
   	    var telnoCheck = 0;
   	    
   	    /* 아이디 중복여부 및 정규식 유효성 검증*/
   	    function checkId() {
   	        var userId = $('#userId').val();
   	        $.ajax({
   	            data : {
   	                userId : userId
   	            },
   	            url : "${pageContext.request.contextPath}/user/checkid",
   	            success : function(data) {
   	            	
   	            	var idRegCheck = /^[a-zA-Z0-9]{4,10}$/;
   	            	
   	                if(userId=="" && data=='success') {
   	                    $("#userId").css("background-color", "#FFCECE");
   	                 	$("#userCheckHelp").html("");
   	                    idCheck = 0;
   	                } else if (data == 'success') {
   	                    $("#userId").css("background-color", "#d4e6d4");
   	                    $("#userCheckHelp").removeClass("text-danger");
   	                    $("#userCheckHelp").addClass("text-muted");
   	                    $("#userCheckHelp").html(" ** 사용가능한 아이디입니다.");
   	                	$("#userIdHelp").removeClass("text-danger");
	                    $("#userIdHelp").addClass("text-muted");
   	                    if(idRegCheck.test(userId)){
	   	                    idCheck = 1;
   	                    } else if(!idRegCheck.test(userId)){
   	                    	$("#userId").css("background-color", "#FFCECE");
   	   	                 	$("#userIdHelp").removeClass("text-muted");
   		                    $("#userIdHelp").addClass("text-danger");
   		                	$("#userCheckHelp").html("");
   	   	                    idCheck = 0;
   	                    }
   	                    
   	                } else if (data == 'duplicated') {
   	                    $("#userId").css("background-color", "#FFCECE");
   	                 	$("#userCheckHelp").removeClass("text-muted");
	                    $("#userCheckHelp").addClass("text-danger");
   	                	 $("#userCheckHelp").html(" ** 중복된 아이디입니다.");
   	                    idCheck = 0;
   	                } 
   	            }
   	        });
   	    }
    	  /* 재입력 비밀번호 검증 및 비밀번호 정규식 검증 */
    	  function checkPswdAgain() {
   		  	var pswdRegCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
   			var inputed = $('#userPswd').val();
	        var reinputed = $('#checkPswd').val();
    	        if(reinputed=="" && (inputed != reinputed || inputed == reinputed)){
    	            $(".signupbtn").css("background-color", "#aaaaaa");
    	            $("#checkPswd").css("background-color", "#FFCECE");
    	            $("#checkPswdHelp").html("패스워드와 똑같은 값을 입력해 주세요");
    	            $("#checkPswdHelp").removeClass("text-muted");
       		  		$("#checkPswdHelp").addClass("text-danger");
       		  		pswdCheck = 0;
    	        }
    	        else if (inputed == reinputed) {
    	            $("#checkPswd").css("background-color", "#d4e6d4");
    	            $("#checkPswdHelp").html("비밀번호를 동일하게 입력하였습니다.");
    	        	$("#checkPswdHelp").removeClass("text-danger");
	       		 	$("#checkPswdHelp").addClass("text-muted");
    	            pswdCheck = 1;
    	        } else if (inputed != reinputed) {
    	            pswdCheck = 0;
    	            $("#checkPswd").css("background-color", "#FFCECE");
    	            $("#checkPswdHelp").html("패스워드와 똑같은 값을 입력해 주세요");
    	            $("#checkPswdHelp").removeClass("text-muted");
       		  		$("#checkPswdHelp").addClass("text-danger");
    	        }
    	        
    	       
    	        /* 비밀번호 정규식 검증 */
    	        if(!pswdRegCheck.test(inputed)){
       		  		$("#passwordHelp").removeClass("text-muted");
       		  		$("#passwordHelp").addClass("text-danger");
       		  		pswdCheck = 0;
       		  	}else if(pswdRegCheck.test(inputed)){
	       		  	$("#passwordHelp").removeClass("text-danger");
	       		 	$("#passwordHelp").addClass("text-muted");
	       		 	pswdCheck = 1;
       		  	}
    	    }
    	  
    	  /* 이메일 정규식 유효성 검증 */
    	  function emailRegCheck() {
    		  var emailReg = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    		  
    		  var userEmail = $("#userEml").val();
    		  
    		  if(userEmail!= ""){
    			  
    			  if(!emailReg.test(userEmail)){
        			  $("#emailHelp").html("이메일 형식으로 입력하세요.");
        			  $("#emailHelp").removeClass("text-muted");
        			  $("#emailHelp").addClass("text-danger");
        			  emlCheck = 0;
        		  }else{
        			  $("#emailHelp").html("올바른 이메일 형식입니다.")
        			  $("#emailHelp").removeClass("text-danger");
        			  $("#emailHelp").addClass("text-muted");

            		  $.ajax({
             	            data : {
             	            	checkEml : userEmail
             	            },
             	            url : "${pageContext.request.contextPath}/user/checkEml",
             	            success : function(data) {
             	                if(data=='success') {
             	                    $("#emailCheckHelp").removeClass("text-danger");
             	                    $("#emailCheckHelp").addClass("text-muted");
             	                    $("#emailCheckHelp").html(" ** 사용가능한 이메일입니다.");
             	                   emlCheck = 1;
             	                } else if (data == 'duplicated') {
             	                 	$("#emailCheckHelp").removeClass("text-muted");
          	                    	$("#emailCheckHelp").addClass("text-danger");
             	                	$("#emailCheckHelp").html(" ** 중복된 이메일입니다.");
             	                	emlCheck = 0;
             	                } 
             	            }
             	        });
        		  }
    			  
    		  } else if(userEmail == ""){
    			  $("#emailHelp").html("예) user@naver.com, user@daum.net");
    			  $("#emailHelp").removeClass("text-danger");
    			  $("#emailHelp").addClass("text-muted");
    			  $("#emailCheckHelp").html("");
    			  emlCheck = 0;
    		  }
    		  
    		  
    	  }
    	  /* 핸드폰번호 정규식 유효성 검증 */
    	  function userTelnoRegCheck() {
    		  var userTelnoReg = /^(010|011)-\d{3,4}-\d{4}$/;
    		  
    		  var telno = $("#userTelno").val();
    		  
    		  if(telno != ""){
    			  
    			  if(!userTelnoReg.test(telno)){
        			  $("#telNoHelp").removeClass("text-muted");
        			  $("#telNoHelp").addClass("text-danger");
        			  telnoCheck = 0;
        		  }else{
        			  $("#telNoHelp").removeClass("text-danger");
        			  $("#telNoHelp").addClass("text-muted");
        			  telnoCheck = 1;
        		  }
    			  
    		  } else if(telno == ""){
    			  $("#telNoHelp").removeClass("text-danger");
    			  $("#telNoHelp").addClass("text-muted");
    			  telnoCheck = 0;
    		  }
    		  
    	  }
    	  
    	  /* 회원가입 폼 전체 유효성 검증 및 form submit */
    	  function submitJoinInfo(){
    		 var joinForm = $("#joinForm");
    		 var userNm = $("#userNm").val();
    		 var userEml = $("#userEml").val();
    		 var userTelno = $("#userTelno").val();
    		 var userId = $("#userId").val();
    		 var userPswd = $("#userPswd").val();
    		 var checkPswd = $("#checkPswd").val();
    		 var userJbps =  $("#userJbps").val();
    		 var userOgdp = $("#userOgdp").val();
    		 var userDpNm = $("#userDpNm").val();
    		 
    		 if(userNm == ""){
    			 $("#userNmHelp").html("성함을 입력해주세요");
    			 $("#userNmHelp").addClass("text-danger");
    			 emptyCheck = 0;
    		 }
    		 if(userEml == ""){
    			 $("#emailHelp").html("이메일을 입력해주세요(예) user@naver.com)");
    			 $("#emailHelp").removeClass("text-muted");
    			 $("#emailHelp").addClass("text-danger");
    			 emptyCheck = 0;
    		 }
    		 if(userTelno == ""){
    			 $("#telNoHelp").html("연락처를 입력해주세요(예) 010-123-1234, 011-1234-1234)");
    			 $("#telNoHelp").removeClass("text-muted");
    			 $("#telNoHelp").addClass("text-danger");
    			 emptyCheck = 0;
    		 }
    		 if(userId == ""){
    			 $("#userIdHelp").html("아이디를 입력해주세요(알파벳 대소문자, 숫자를 혼용해서 4자 이상 10자 이하)");
    			 $("#userIdHelp").removeClass("text-muted");
    			 $("#userIdHelp").addClass("text-danger");
    			 emptyCheck = 0;
    		 }
    		 if(userPswd == ""){
    			 $("#passwordHelp").html("비밀번호를 입력해주세요(특수문자 포함,알파벳 대소문자,숫자를 혼용해서 8자 이상 25자 이하)");
    			 $("#passwordHelp").removeClass("text-muted");
    			 $("#passwordHelp").addClass("text-danger");
    			 emptyCheck = 0;
    		 }
    		 if(userJbps == null){
    			 $("#userJbpsHelp").html("직급을 선택해주세요");
    			 $("#userJbpsHelp").addClass("text-danger");
    			 emptyCheck = 0;
    		 }
    		 if(userOgdp == null){
    			 $("#userOgdpHelp").html("소속을 선택해주세요");
    			 $("#userOgdpHelp").addClass("text-danger");
    			 emptyCheck = 0;
    		 }
    		 if(userDpNm == null){
    			 $("#userDpNmHelp").html("부서를 선택해주세요");
    			 $("#userDpNmHelp").addClass("text-danger");
    			 emptyCheck = 0;
    		 }
    		 emptyCheck = 1;
    		
    		 if(idCheck != 1 || pswdCheck != 1 || emlCheck != 1 || emptyCheck != 1 || telnoCheck != 1) {
	   			console.log("회원가입 실패");
	   			var body = document.getElementsByTagName("body")[0];
	   			window.scroll({
	   	            behavior: 'smooth',
	   	            left: 0,
	   	            top:body.offsetTop
	   	        });
    		 }
    		 if(idCheck == 1 && pswdCheck == 1 && emlCheck == 1 && emptyCheck == 1 && telnoCheck == 1){
    			 joinForm.submit();
    		 }
    	  }
    	  
    	  	
     	 </script>
     	 
     <!-- Footer -->
    </div>
  </div>
 <%@include file="/WEB-INF/views/common/bottom.jsp" %>
</body>

</html>
