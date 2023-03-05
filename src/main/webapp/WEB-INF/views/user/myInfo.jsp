<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<style>
	.text-primary {
	font-size: 2rem;
	}
	
	#myInfoWrapper{
  			justify-content: center;
  			align-items:center;
  			min-height: 100vh;
  		}
	</style>
  	<%@include file="/WEB-INF/views/common/head.jsp" %>
</head>

<body id="page-top">
  <div id="wrapper">
    <!-- Sidebar -->
   	<%@include file="/WEB-INF/views/common/sidebar.jsp" %>

    
    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        
        <!-- TopBar -->
         <%@include file="/WEB-INF/views/common/topbar.jsp" %>


        <!-- 메인 컨테이너 Container Fluid-->
        <div class="container-fluid " id="container-wrapper">
			

		<!-- Row -->
          <div class="row" id="myInfoWrapper">
	     	<div class="col-lg-7 container">
	     	<div class="d-sm-flex align-items-end justify-content-between">
				<div class="bg-primary px-3 py-2"
					style="border-top-left-radius: 10px; border-top-right-radius: 10px;">
					<h6 class="mb-0 text-white">마이페이지</h6>
				</div>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><b>나의 정보 확인</b></li>
					<li class="breadcrumb-item active" aria-current="page">나의 정보 상세</li>
				</ol>
			</div>
              <div class="card mb-5">
                <div class="card-body d-flex p-5">
                	<div class="userOgdp" style="border-right: 2px solid #757575; padding-right: 30px;">
                		<div class="p-3 pt-5">
							<a class="badge badge-primary mb-3"  style="font-size:100%">${user.userType}</a>
							<h3 style="border-bottom:1px solid #757575;">${user.userOgdp}</h3>
						</div>
                	</div>
                	<form class="myInfoWrapper p-5 container" action="${pageContext.request.contextPath}/user/update" method="post"> 
                		<div class="row mb-5  justify-content-center d-flex align-items-center alert alert-primary" >
							   나의 정보 상세
            			</div>
						<div class="row mb-5">
							<label class="col-3 " style="border-top:0; margin:0px;font-size:1.2rem;" for="userNm">성명 </label>
							<input class="col-9" id="userNm"class="mx-2" style="border:0; font-size:1.2rem;" value="${user.userNm}" disabled>
						</div>
						<div class="row mb-5">
							<label class="col-3" style="border-top:0; margin:0px;font-size:1.2rem;" for="userId">ID </label>
							<input class="col-9" id="userId" class="mx-2" style="border:0; font-size:1.2rem;" value="${user.userId}" disabled>
						</div>
						<div class="row mb-5">
							<label class="col-3" style="border-top:0; margin:0px;font-size:1.2rem;" for="userPswd">비밀번호 </label>
							<input class="col-7" type="password" placeholder="password" id="userPswd"class="mx-2" style="border:0; font-size:1.2rem;" disabled>
							<a class="btn btn-outline-warning btn-sm col-2" data-toggle="modal" data-target="#updatePswd">수정하기</a>
						</div>
						<div class="row mb-5">
							<label class="col-3" style="border-top:0; margin:0px;font-size:1.2rem;" for="userEml">EMAIL </label>
							<input class="col-9 updatable" id="userEml" name="userEml" class="mx-2" style="border:0; font-size:1.2rem;" value="${user.userEml}" disabled>
						</div>
						<div class="row mb-5">
							<label class="col-3" style="border-top:0; margin:0px;font-size:1.2rem;" for="userTelno">연락처 </label>
							<input class="col-9 updatable" id="userTelno" name="userTelno" class="mx-2" style="border:0; font-size:1.2rem;" value="${user.userTelno}" disabled>
						</div>
						<div class="row mb-5">
							<label class="col-3" style="border-top:0; margin:0px;font-size:1.2rem;" for="userDpNm">부서 </label>
							<select class="col-9 updatable" id="userDpNm" style="border:0; font-size:1.2rem;"  name="userDpNm" disabled>
	                      		<option value="${user.userDpNm}"selected>${user.userDpNm}</option>
	                      		<c:if test="${user.userType eq '고객사'}">
		                      		<option>전산팀</option>
			                      	<option>마케팅팀</option>
			                      	<option>기획팀</option>
			                      	<option>인사팀</option>
			                      	<option>회계팀</option>
			                      	<option>총무팀</option>
			                      	<option>영업팀</option>
			                      	<option>판매팀</option>
	                      		</c:if>
	                      		<c:if test="${user.userType eq '개발자'}">
		                      		<option>개발1팀</option>
			                      	<option>개발2팀</option>
			                      	<option>개발3팀</option>
	                      		</c:if>
	                      		<c:if test="${user.userType eq '관리자'}">
		                      		<option>관리1팀</option>
			                      	<option>관리2팀</option>
			                      	<option>관리3팀</option>
	                      		</c:if>
	                      	</select>
						</div>
						<div class="row mb-5 ">
							<label class="col-3" style="border-top:0; margin:0px;font-size:1.2rem;" for="userJbps">직급 </label>
							<select class="col-9 updatable" id="userJbps" name="userJbps" style="border:0; font-size:1.2rem;" disabled>
		                      	<option value="${user.userJbps}" selected>${user.userJbps}</option>
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
						<input type="hidden" value="${user.userNo}" name="userNo"/>
						<input type="hidden" value="${user.userId}" name="userId"/>
					<div class="card-footer">
						<div class="text-center">
							<a type="button" class="btn btn-primary btn-sm" onclick= "updateInfo()" id="updateInfo_fun">수정하기</a>
			       			<button type="submit" class="btn btn-primary btn-sm" id="updateInfo_submit" style="display: none;">저장</button>
							<a class="btn btn-info btn-sm" data-toggle="modal" data-target="#unregister">회원탈퇴</a>
						</div>
					</div>
					</form>
              	</div>
              	
				
			
	          </div>
	        </div>
          <!-- Row -->
          
			<!-- Modal -->
			<div class="modal fade" id="updatePswd" tabindex="-1" aria-labelledby="updatePswdFunLabel" aria-hidden="true">
			  <div class="modal-dialog" style="width:400px">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="updatePswdFunLabel">비밀번호 변경</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      <form>
			      	<div class="row">
			      		<div class="col-sm-4">
			      			<span>현재 비밀번호</span>
			      		</div>
			      		<div class="col-sm-8">
			      			<input type="password" required/>
			      			<div class="invalid-feedback">
			      				현재 비밀번호를 입력해주세요.
			      			</div>
			      		</div>
			      	</div>
			      	<br>
			      	<div class="row">
			      		<div class="col-sm-4">
			      			<span>새로운 비밀번호</span>
			      		</div>
			      		<div class="col-sm-8">
			      			<input type="password" class="mb-1"required/>
			      			<div class="invalid-feedback">
			      				비밀번호를 입력해주세요.
			      			</div>
			      			<br>
			      			<input type="password" class="mb-1" required/>
			      			<div class="invalid-feedback">
			      				비밀번호를 입력해주세요.
			      			</div>
			      		</div>
			      	</div>
			      </form>
			      	
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			        <button class="btn btn-primary">비밀번호 수정</button>
			      </div>
			    </div>
			  </div>
			</div>
			
          <!-- 회원탈퇴 Modal -->
          <div class="modal fade" id="unregister" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelLogout" aria-hidden="true">
			   <div class="modal-dialog" role="document" style="max-width:400px;">
			     <div class="modal-content">
			       <div class="modal-header bg-primary">
			         	<h5 class="modal-title" id="exampleModalLabelLogout"> 
				          	<img src="${pageContext.request.contextPath}/resources/images/logoOnly.png" style="width:20px;">
				        	<small class="text-white"><b>회원탈퇴</b></small>
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
						     <h5>정말 탈퇴하시겠습니까?</h5>
					       </div>
				       </div>
			       </div>
			       <div class="modal-footer justify-content-center text-center">
			         <button type="button" class="btn btn-outline-primary mx-2" data-dismiss="modal">취소</button>
			         <a href="${pageContext.request.contextPath}/user/unregister/${user.userNo}" class="btn btn-outline-warning">탈퇴</a>
			       </div>
			     </div>
			   </div>
			 </div>

          <!-- 로그아웃 모달 -->
           <%@include file="/WEB-INF/views/common/logout.jsp" %>
        </div>
        <!---Container Fluid-->
      </div>
      </div>
      <!-- Footer -->
     <%@include file="/WEB-INF/views/common/footer.jsp" %>
    </div>
    </div>
 <%@include file="/WEB-INF/views/common/bottom.jsp" %>
 
 <script>
 function updateInfo(){
	 console.log("updateInfo 실행!!");
	 console.log($("#userId").val());
	$(".updatable").attr("disabled",false);
	$(".updatable").addClass("border");
	$("#updateInfo_fun").hide();
	$("#updateInfo_submit").show();	
 }
 </script>
</body>

</html>
