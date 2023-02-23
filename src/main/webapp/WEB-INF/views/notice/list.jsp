<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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


			<div class="container-fluid" id="container-wrapper">
   				<div class="d-sm-flex align-items-end justify-content-between">
  					<div class="bg-primary px-3 py-2" style="border-top-left-radius:10px; border-top-right-radius:10px;">
						<h6 class="mb-0 text-white">공지사항</h6>
					</div>
					<ol class="breadcrumb">
						<li class="breadcrumb-item">공지사항</li>
						<li class="breadcrumb-item active" aria-current="page">목록보기</li>
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
	         										<input type="text" class="input-sm form-control form-control-sm col-sm-9" name="start" id="dateStart" />
	               									<div class="input-group-prepend">
	               										<span class="input-group-text" style="height:31px;">~</span>
	           										</div>
	            									<input type="text" class="input-sm form-control form-control-sm" name="end" id="dateEnd" />
												</div>
	   										</div>
										</div> 
	    								<div class="col-3"></div>
	    								<div class="col-4">
	      									<div class="form-group row">
									      		<label for="exampleFormControlSelect1" class="col-sm-3 col-form-label-sm">키워드</label>
									          	<input type="text" class="form-control form-control-sm col-sm-9 bg-light" 
		         									aria-label="Search" placeholder="검색어를 입력하세요" style="border-color: #3f51b5;" id="keyword">
	            							</div>
	        							</div>
	        							<div class="col-1">
	        								<div class="input-group-append float-right">
													<button class="btn btn-primary btn-sm" type="button" onclick="searchNoticeList(1)">조회 <i class="fas fa-search fa-sm"></i>
												</button>
											</div>
	         							</div>
	         							<script>
											$(document).ready(function () {
												console.log("시작");
												var startDate = document.getElementById("dateStart").value;
												var endDate = document.getElementById("dateEnd").value;
												
												var ntcTtl = document.getElementById("keyword").value;
												
												if(ntcTtl !== "") {
													ntcTtl = "%" + ntcTtl + "%";
												}
												
												console.log(ntcTtl);
												console.log(startDate);
												console.log(endDate);
												
												let data = {startDate : startDate, endDate : endDate, ntcTtl : ntcTtl};
												
												console.log(data);
												
												$.ajax({
													url : "filter/1",
													method : "post",
													data : JSON.stringify(data),
													contentType: "application/json; charset=UTF-8"
												}).done((data) => {
													$("#noticeList").html(data)
												});
											});
											
											function searchNoticeList(pageNo) {
												console.log(pageNo);
												var startDate = document.getElementById("dateStart").value;
												var endDate = document.getElementById("dateEnd").value;
												
												var ntcTtl = document.getElementById("keyword").value;
												
												if(ntcTtl !== "") {
													ntcTtl = "%" + ntcTtl + "%";
												}
												
												console.log(ntcTtl);
												console.log(startDate);
												console.log(endDate);
												
												let data = {startDate : startDate, endDate : endDate, ntcTtl : ntcTtl};
												
												console.log(data);
												
												$.ajax({
													url : "filter/"+pageNo,
													method : "post",
													data : JSON.stringify(data),
													contentType: "application/json; charset=UTF-8"
												}).done((data) => {
													$("#noticeList").html(data)
												});
											}
										</script>
	         						</div>
								</form>
        					</div>
        					<hr/>
    
						    <!-- 공지사항 목록 -->
							<div class="d-sm-flex justify-content-end">
								<a href="${pageContext.request.contextPath}/notice/write" class="btn btn-sm btn-secondary mr-3">글작성</a>
							</div>
							<div id="noticeList" style="width: 100%;"></div>
        				</div>
					</div>
				</div>
				
				<!-- 로그아웃 모달 -->
	          	<%@include file="/WEB-INF/views/common/logout.jsp" %>
	        	</div>
	        <!---Container Fluid-->
	      	</div>
      
		<!-- Footer -->

    	</div>
	</div>
	<%@include file="/WEB-INF/views/common/bottom.jsp" %>
</body>

</html>
