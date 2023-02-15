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
        <div class="d-sm-flex align-items-end justify-content-between">
          <div class="bg-primary px-3 py-2" style="border-top-left-radius:10px; border-top-right-radius:10px;">
            <h6 class="mb-0 text-white">SR 검토관리</h6>
          </div>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/request/list">SR 관리</a></li>
              <li class="breadcrumb-item active" aria-current="page">SR 검토관리</li>
            </ol>
          </div>
        	
	
          <!-- Row -->
          <div class="row">
          <div class="col-lg-12">
              <div class="card mb-4">
                
                <!-- 검색 -->
                <div class="mb-1 mt-5 px-5">
                <form class="navbar-search">
                	<div class="row">
                		<div class="col-4">
                			<div class="form-group row" id="simple-date4" >
			                	<div class="input-daterange input-group input-group-sm">
			                		<label for="start" class="col-sm-3 col-form-label-sm">조회기간</label>
			                    	<input type="text" class="input-sm form-control form-control-sm col-sm-9" name="start" />
			                    	<div class="input-group-prepend">
			                    		<span class="input-group-text" style="height:31px;">~</span>
			                    	</div>
			                    	<input type="text" class="input-sm form-control form-control-sm" name="end" />
			                    </div>
			            	</div>
                		</div>
                		
                		<div class="col-3">
                			<div class="form-group row">
                				<label class="col-sm-3 col-form-label-sm">진행상태</label>
		                    	<select class="form-control form-control-sm col-sm-9" id="exampleFormControlSelect1">
		                        	<option selected>전체</option>
		                        	<option>요청</option>
		                        	<option>검토중</option>
		                        	<option>접수</option>
		                        	<option>개발중</option>
		                        	<option>개발완료</option>
		                        	<option>재검토</option>
		                    	</select>
		                	</div>
                		</div>
                		<div class="col-4">
                			<div class="form-group row">
                				<label for="exampleFormControlSelect1" class="col-sm-3 col-form-label-sm">관련시스템</label>
		                    	<select class="form-control form-control-sm col-sm-9" id="exampleFormControlSelect1" >
		                        	<option selected>전체</option>
		                        	<option>KHR시스템</option>
		                        	<option>KTH시스템</option>
		                        	<option>JHJ시스템 </option>
		                        	<option>HGH시스템 </option>
		                    	</select>
		                	</div>
                		</div>
                		<div class="col-1">
                			
                		</div>
                		
                	</div>
                	<div class="row">
                		<div class="col-4">
                			<div class="form-group row">
                				<label for="exampleFormControlSelect1" class="col-sm-3 col-form-label-sm">등록자 소속</label>
		                    	<select class="form-control form-control-sm col-sm-9" id="exampleFormControlSelect1">
		                        	<option selected>전체</option>
		                        	<option>KHR시스템</option>
		                        	<option>KTH시스템</option>
		                        	<option>JHJ시스템</option>
		                        	<option>HGH시스템</option>
		                    	</select>
		                	</div>
                		</div>
                		<div class="col-3">
                			<div class="form-group row">
                			<label for="exampleFormControlSelect1" class="col-sm-3 col-form-label-sm">개발부서</label>
		                    	<select class="form-control form-control-sm col-sm-9" id="exampleFormControlSelect1">
		                        	<option selected>전체</option>
		                        	<option>한국소프트웨어 개발1팀</option>
		                        	<option>한국소프트웨어 개발2팀</option>
		                        	<option>서강소프트웨어 개발1팀</option>
		                        	<option>미래소프트웨어 개발1팀</option>
		                    	</select>
		                	</div>
                		</div>
                		<div class="col-4">
		                	<div class="form-group row">
		                		<label for="exampleFormControlSelect1" class="col-sm-3 col-form-label-sm">키워드</label>
		                    	<input type="text" class="form-control form-control-sm col-sm-9 bg-light" 
		                   		aria-label="Search" placeholder="검색어를 입력하세요" style="border-color: #3f51b5;">
		                  	</div>
                		</div>
                		<div class="col-1">
                			<div class="input-group-append float-right">
								<button class="btn btn-primary btn-sm" type="button" onclick="progressList()" >
									조회 <i class="fas fa-search fa-sm"></i>
								</button>
							</div>
                		</div>
                	</div>
                </form>
                </div>
                <hr/>
                <!-- SR 검토 목록 -->
               <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">SR 검토 목록</h6>
                  <div class="d-sm-flex justify-content-end">
                	<button class="btn btn-sm btn-secondary mr-1">일괄 처리 (검토중)</button>
                	<button class="btn btn-sm btn-secondary mr-1">일괄 처리 (접수)</button>
                	<button class="btn btn-sm btn-secondary ">엑셀 다운로드</button>
                  </div>
                </div>
                <div class="table-responsive p-3">
                  <table class="table align-items-center table-flush table-hover">
                    <thead class="thead-light" style="text-align: center;">
	                    <tr>
		                    <th>No</th>	
		                    <th>
		                    	<div class="custom-control custom-checkbox m-0">
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
                   	<tbody>
                   		<c:forEach var="examine" items="${examineList}">
	                    	<tr>
		                      <td>1</td>
		                      <td>
		                      	<div class="custom-control custom-checkbox m-0">
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
                   		</c:forEach>
	                    
                  	</tbody>
                  </table>
                </div>
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
