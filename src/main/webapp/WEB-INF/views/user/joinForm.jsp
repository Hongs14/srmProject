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
        .userType_check input[type="radio"] {display: none; }
        .userType_check input[type="radio"] + label {cursor:pointer;}
        .userType_check input[type="radio"]:checked + label { background: #66bb6a; color: white;}
        .form-group { margin-bottom: 30px;}
        .form-group > input { max-width: 780px;}
         .form-group > select { max-width: 780px;}
         .form-group > small {padding-left:180px;}
    </style>
</head>

<body id="page-top">
  <div id="wrapper">
  

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
	                  <div class="text-center">
	                    <h1 class="h4 text-gray-900 mb-4">회원 가입</h1>
	                  </div>
	                  <hr>
	                  
	                  <form action="${pageContext.request.contextPath}/user/join"method="post">
	                  
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
	                    </div>
	                    
	                    <div class="form-group row row-cols-2 px-5 align-items-center">
	                      <label class="font-weight-bold text-primary col-sm-2 text-right">이메일 </label>
	                      <input type="email" class="form-control col-sm-10" id="userEml" name="userEml" aria-describedby="emailHelp"
	                        placeholder="Email Address" required>
	                       <small id="emailHelp" class="form-text text-muted">예) user@naver.com, user@daum.net</small>
	                    </div>
	                    <div class="form-group row row-cols-2 px-5 align-items-center">
	                      <label class="font-weight-bold text-primary col-sm-2 text-right">전화번호 </label>
	                      <input type="tel" class="form-control col-sm-10" id="userTelno" name="userTelno" placeholder="PhoneNumber"required>
	                      <small id="telNoHelp" class="form-text text-muted">예) 010-123-1234, 010-1234-1234</small>
	                    </div>
	                    <div class="form-group row row-cols-2 px-5 align-items-center">
	                      <label class="font-weight-bold text-primary col-sm-2 text-right">아이디 </label>
	                      <input type="text" class="form-control col-sm-10" id="userId" name="userId" placeholder="Id" required>
	                      <small id="userPswdHelp" class="form-text text-muted">알파벳 대소문자, 숫자를 혼용해서 4자 이상 10자 이하</small>
	                    </div>
	                    <div class="form-group row row-cols-2 px-5 align-items-center">
	                      <label class="font-weight-bold text-primary col-sm-2 text-right">비밀번호 </label>
	                      <input type="password" class="form-control col-sm-10" id="userPswd" name="userPswd" placeholder="Password" required>
	                      <small id="passwordHelp" class="form-text text-muted">알파벳 대소문자, 숫자를 혼용해서 8자 이상 15자 이하</small>
	                    </div>
	                    <div class="form-group row row-cols-2 px-5 align-items-center">
	                      <label class="font-weight-bold text-primary col-sm-2 text-right">비밀번호 재입력 </label>
	                      <input type="password" class="form-control col-sm-10" id="userPswdRepeat" name="userPswdRepeat"
	                        placeholder="Repeat Password" required> 
	                      <small id="passwordHelp" class="form-text text-muted">패스워드와 똑같은 값을 입력해 주세요</small>
	                    </div>
	                    
	                    
	                    <div class="form-group row row-cols-2 px-5 align-items-center">
	                      <label class="font-weight-bold text-primary col-sm-2 text-right" for="userOgdp">소속 </label>
	                      <select type="text" class="form-control col-sm-10" id="userOgdp" name="userOgdp" required>
	                      	<option value="" disabled selected>소속 회사 선택</option>
	                      </select>
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
	                    </div>
	                    
	                    <div class="form-group row row-cols-2 px-5 align-items-center">
	                      <label class="font-weight-bold text-primary col-sm-2 text-right" for="userDpNm">부서 </label>
	                      <select type="text" class="form-control col-sm-10" id="userDpNm" name="userDpNm" required>
	                      	<option value="" disabled selected>소속 부서 선택</option>
	                      </select>
	                    </div>
	                    
	                    
	                 	 <br>
	                    <div class="form-group px-5 mx-5 my-2">
	                      <button type="submit" class="btn btn-primary btn-lg btn-block">가입</button>
	                    </div>
	                  </form>
	                 <hr>
	                  <div class="text-center">
	                    <a class="font-weight-bold small" href="${pageContext.request.contextPath}/user/login">이미 계정을 가지고 계신가요?</a>
	                  </div>
	                  <div class="text-center">
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
            
            let userType = document.querySelector('input[name="userType"]:checked').value;
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
