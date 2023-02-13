<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  	<%@include file="/WEB-INF/views/common/head.jsp" %>
  	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  	<script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Bootstrap Datepicker -->
  	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
  	<!-- RuangAdmin Javascript -->
  	<script src="${pageContext.request.contextPath}/resources/js/ruang-admin.min.js"></script>
  	
  	
  	<script>
  	$(document).ready(function () {
	    $('#simple-date4 .input-daterange').datepicker({        
	        format: 'yyyy/mm/dd',        
	        autoclose: true,     
	        todayHighlight: true,   
	        todayBtn: 'linked',
	      });  
  	});
  	</script>
  	
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
        <div class="container-fluid" id="container-wrapper">
        
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">SR 검토 관리</h1>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">나의 할일 </li>
            </ol>
          </div>
	
          <!-- Row -->
          <div class="col-lg-12">
              <div class="card mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">SR 검토 목록</h6>
                </div>
                
                <!-- 검색 -->
                <div class="m-3">
                	<div class="row">
                		<div class="col-4">조회기간
                			<div class="form-group" id="simple-date4">
			                	<div class="input-daterange input-group">
			                    	<input type="text" class="input-sm form-control" name="start" />
			                    	<div class="input-group-prepend">
			                    		<span class="input-group-text">~</span>
			                    	</div>
			                    	<input type="text" class="input-sm form-control" name="end" />
			                    </div>
			            	</div>
                		</div>
                		<div class="col-4">관련시스템
                			<div class="form-group">
		                    	<select class="form-control" id="exampleFormControlSelect1">
		                        	<option></option>
		                        	<option>KHR</option>
		                        	<option>KTH</option>
		                        	<option>JHJ</option>
		                        	<option>HGH</option>
		                    	</select>
		                	</div>
                		</div>
                		<div class="col-4">진행상태
                			<div class="form-group">
		                    	<select class="form-control" id="exampleFormControlSelect1">
		                        	<option></option>
		                        	<option>검토중</option>
		                        	<option>요청</option>
		                    	</select>
		                	</div>
                		</div>
                	</div>
                	<div class="row">
                		<div class="col-4">등록자 소속
                			<div class="form-group">
		                    	<select class="form-control" id="exampleFormControlSelect1">
		                        	<option></option>
		                        	<option>KHR</option>
		                        	<option>KTH</option>
		                        	<option>JHJ</option>
		                        	<option>HGH</option>
		                    	</select>
		                	</div>
                		</div>
                		<div class="col-4">개발 부서
                			<div class="form-group">
		                    	<select class="form-control" id="exampleFormControlSelect1">
		                        	<option></option>
		                        	<option>KHR</option>
		                        	<option>KTH</option>
		                        	<option>JHJ</option>
		                        	<option>HGH</option>
		                    	</select>
		                	</div>
                		</div>
                		<div class="col-4">키워드
            				<form class="navbar-search">
			                	<div class="input-group">
			                    	<input type="text" class="form-control bg-light border-1 small" 
			                   		aria-label="Search" aria-describedby="basic-addon2" style="border-color: #3f51b5;">
			                    	<div class="input-group-append">
			                      		<button class="btn btn-primary" type="button">
			                        		<i class="fas fa-search fa-sm"></i>
			                      		</button>
			                    	</div>
			                  	</div>
			            	</form>
                		</div>
                	</div>
                </div>
                <hr/>
                <!-- SR 검토 목록 -->
                <div class="d-sm-flex justify-content-end">
                	<button class="btn btn-sm btn-secondary mr-1">일괄 처리 (검토중)</button>
                	<button class="btn btn-sm btn-secondary mr-1">일괄 처리 (접수)</button>
                	<button class="btn btn-sm btn-secondary mr-3">엑셀 다운로드</button>
                </div>
                <div class="table-responsive p-3">
                  <table class="table align-items-center table-flush table-hover">
                    <thead class="thead-light" style="font-size:13px; text-align: center;">
	                    <tr>
		                    <th> </th>	
		                    <th>
		                    	<div class="custom-control custom-checkbox">
                          			<input type="checkbox" class="custom-control-input" id="customCheck1">
                          			<label class="custom-control-label" for="customCheck1"></label>
                        		</div>
		                    </th>
		                    <th>요청번호</th>
		                    <th>제목</th>
		                    <th>관련시스템</th>
		                    <th>등록자</th>
		                    <th>소속</th>
		                    <th>개발부서</th>
		                    <th>상태</th>
		                    <th>등록일</th>
		                    <th>완료(예정)일</th>
		                    <th>중요</th>
		                    <th>상세보기</th>
	                    </tr>
                    </thead>
                   	<tbody style="font-size:10px;">
                    	<tr>
	                      <td>1</td>
	                      <td>
	                      	<div class="custom-control custom-checkbox">
                          		<input type="checkbox" class="custom-control-input" id="customCheck2">
                          		<label class="custom-control-label" for="customCheck2"></label>
                        	</div>
	                      </td>
	                      <td>SR-001</td>
	                      <td>청년구직활동지원금 화면 개선</td>
	                      <td>워크넷(외부망)</td>
	                      <td>홍길동</td>
	                      <td>서울강남고용센터</td>
	                      <td>일자리포털개발팀</td>
	                      <td>요청</td>
	                      <td>2023-02-09</td>
	                      <td>     </td>
	                      <td>N</td>
	                      <td><a href="${pageContext.request.contextPath}/examine/detail" class="btn btn-sm btn-info">상세보기</a></td>
	                    </tr>
	                    <tr>
	                      <td>2</td>
	                      <td>
	                      	<div class="custom-control custom-checkbox">
                          		<input type="checkbox" class="custom-control-input" id="customCheck3">
                          		<label class="custom-control-label" for="customCheck3"></label>
                        	</div>
	                      </td>
	                      <td>SR-002</td>
	                      <td>청년구직활동지원금 화면 개선</td>
	                      <td>워크넷(외부망)</td>
	                      <td>홍길동</td>
	                      <td>서울강남고용센터</td>
	                      <td>일자리포털개발팀</td>
	                      <td>요청</td>
	                      <td>2023-02-09</td>
	                      <td>     </td>
	                      <td>Y</td>
	                      <td><button class="btn btn-sm btn-info">상세보기</button></td>
	                    </tr>
	                    <tr>
	                      <td>3</td>
	                      <td>
	                      	<div class="custom-control custom-checkbox">
                          		<input type="checkbox" class="custom-control-input" id="customCheck4">
                          		<label class="custom-control-label" for="customCheck4"></label>
                        	</div>
	                      </td>
	                      <td>SR-003</td>
	                      <td>청년구직활동지원금 화면 개선</td>
	                      <td>워크넷(외부망)</td>
	                      <td>홍길동</td>
	                      <td>서울강남고용센터</td>
	                      <td>일자리포털개발팀</td>
	                      <td>요청</td>
	                      <td>2023-02-09</td>
	                      <td>     </td>
	                      <td>N</td>
	                      <td><button class="btn btn-sm btn-info">상세보기</button></td>
	                    </tr>
	                    <tr>
	                      <td>4</td>
	                      <td>
	                      	<div class="custom-control custom-checkbox">
                          		<input type="checkbox" class="custom-control-input" id="customCheck5">
                          		<label class="custom-control-label" for="customCheck5"></label>
                        	</div>
	                      </td>
	                      <td>SR-004</td>
	                      <td>청년구직활동지원금 화면 개선</td>
	                      <td>워크넷(외부망)</td>
	                      <td>홍길동</td>
	                      <td>서울강남고용센터</td>
	                      <td>일자리포털개발팀</td>
	                      <td>요청</td>
	                      <td>2023-02-09</td>
	                      <td>     </td>
	                      <td>N</td>
	                      <td><button class="btn btn-sm btn-info">상세보기</button></td>
	                    </tr>
	                    <tr>
	                      <td>5</td>
	                      <td>
	                      	<div class="custom-control custom-checkbox">
                          		<input type="checkbox" class="custom-control-input" id="customCheck6">
                          		<label class="custom-control-label" for="customCheck6"></label>
                        	</div>
	                      </td>
	                      <td>SR-005</td>
	                      <td>청년구직활동지원금 화면 개선</td>
	                      <td>워크넷(외부망)</td>
	                      <td>홍길동</td>
	                      <td>서울강남고용센터</td>
	                      <td>일자리포털개발팀</td>
	                      <td>요청</td>
	                      <td>2023-02-09</td>
	                      <td>     </td>
	                      <td>N</td>
	                      <td><button class="btn btn-sm btn-info">상세보기</button></td>
	                    </tr>
                  	</tbody>
                  </table>
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

	<%@include file="/WEB-INF/views/common/bottom.jsp" %>
</body>

</html>
