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
   				<div class="d-sm-flex align-items-end justify-content-between" id="mainNoticeMenu">
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
					<div id="mainNoitce" class="col-lg-12">
						<div class="bg-primary px-3 py-2" style="border-top-left-radius:10px; border-top-right-radius:10px; width:121px; display:none;"  id="noticeMenu">
							<h6 class="mb-0 text-white">공지사항</h6>
						</div>
               			<div class="card mb-4">
                  			<!-- 검색 -->
            				<div class="mb-1 mt-5 px-5">
								<form class="navbar-search">
									<div class="row text-right">
	   									<div class="col-4">
	       									<div class="form-group row" id="simple-date4" >
	  											<div class="input-daterange input-group input-group-sm text-right">
	      											<label for="start" class="col-sm-4 col-form-label-sm">조회기간</label>
	         										<input type="text" class="input-sm form-control form-control-sm col-sm-8" name="start" id="dateStart" value="${notice.startDate}"/>
	               									<div class="input-group-prepend">
	               										<span class="input-group-text" style="height:31px;">~</span>
	           										</div>
	            									<input type="text" class="input-sm form-control form-control-sm" name="end" id="dateEnd" value="${notice.endDate}" />
												</div>
	   										</div>
											<div class="row">
												<div class="col-sm-9">
													<input type="button" class="btn btn-sm btn-primary ml-5" value="당일" onclick="nTodayClick(1)">
													<input type="button" class="btn btn-sm btn-primary" value="1주일 전" onclick="nWeekClick(1)">
													<input type="button" class="btn btn-sm btn-primary" value="1개월 전" onclick="nMonthClick(1)">
												</div>
												
											</div>
										</div> 
	    								<div class="col-3"></div>
	    								<div class="col-4">
	      									<div class="form-group row">
									      		<label for="exampleFormControlSelect1" class="col-sm-3 col-form-label-sm text-right">키워드</label>
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
												
												var sysNo = "${sysNo}";
												
												var ntcTtl = document.getElementById("keyword").value;
												
												if(ntcTtl !== "") {
													ntcTtl = "%" + ntcTtl + "%";
												}
												
												console.log(ntcTtl);
												console.log(startDate);
												console.log(endDate);

												let data = {startDate : startDate, endDate : endDate, ntcTtl : ntcTtl, sysNo : sysNo};
												
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
												
												var sysNo = "${sysNo}"
												
												var ntcTtl = document.getElementById("keyword").value;
												
												if(ntcTtl !== "") {
													ntcTtl = "%" + ntcTtl + "%";
												}
												
												console.log(ntcTtl);
												console.log(startDate);
												console.log(endDate);

												let data = {startDate : startDate, endDate : endDate, ntcTtl : ntcTtl, sysNo : sysNo};
												
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
											
											function nTodayClick(pageNo){
												var startDate = '';
												var endDate = '';
												
												var ntcToday = "당일";
												var ntcWeek = null;
												var ntcMonth = null;
												
												var sysNo = "${sysNo}"
												
												var ntcTtl = document.getElementById("keyword").value;
												
												if(ntcTtl !== "") {
													ntcTtl = "%" + ntcTtl + "%";
												}

												console.log(ntcTtl);
												console.log(startDate);
												console.log(endDate);
												console.log(ntcToday);
												console.log(ntcWeek);
												console.log(ntcMonth);

												let data = {startDate : startDate, endDate : endDate, ntcTtl : ntcTtl,
														ntcToday : ntcToday, ntcWeek : ntcWeek, ntcMonth : ntcMonth, sysNo : sysNo};
												
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
											
											function nWeekClick(pageNo){
												var startDate = '';
												var endDate = '';
												
												var ntcToday = null;
												var ntcWeek = "1주일전";
												var ntcMonth = null;
												
												var sysNo = "${sysNo}"
												
												var ntcTtl = document.getElementById("keyword").value;
												
												if(ntcTtl !== "") {
													ntcTtl = "%" + ntcTtl + "%";
												}

												console.log(ntcTtl);
												console.log(startDate);
												console.log(endDate);
												console.log(ntcToday);
												console.log(ntcWeek);
												console.log(ntcMonth);

												let data = {startDate : startDate, endDate : endDate, ntcTtl : ntcTtl,
														ntcToday : ntcToday, ntcWeek : ntcWeek, ntcMonth : ntcMonth, sysNo : sysNo};
												
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
											
											function nMonthClick(pageNo){
												var startDate = '';
												var endDate = '';
												
												var ntcToday = null;
												var ntcWeek = null;
												var ntcMonth = "1개월전";
												
												var sysNo = "${sysNo}"
												
												var ntcTtl = document.getElementById("keyword").value;
												
												if(ntcTtl !== "") {
													ntcTtl = "%" + ntcTtl + "%";
												}

												console.log(ntcTtl);
												console.log(startDate);
												console.log(endDate);
												console.log(ntcToday);
												console.log(ntcWeek);
												console.log(ntcMonth);

												let data = {startDate : startDate, endDate : endDate, ntcTtl : ntcTtl,
														ntcToday : ntcToday, ntcWeek : ntcWeek, ntcMonth : ntcMonth, sysNo : sysNo};
												
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
								<c:if test="${sessionScope.loginUser.userNm eq '관리자'}">
									<a class="btn btn-sm btn-secondary mr-3" onclick="getNoticeWrite()">글작성</a>
								</c:if>
							</div>
							<div id="noticeList" style="width: 100%;"></div>
        				</div>
					</div>
					<div id="subNoticeDetailView" style="width: 100%;"></div>
				</div>
				<script>
					function getNoticeDetail(i) {
						let ntcNo = i;
						$("#mainNoticeMenu").removeClass("d-sm-flex");
						$("#mainNoticeMenu").hide();
						$("#noticeMenu").show();
						$("#mainNoitce").attr("class","col-lg-7");
						$("#subNoticeDetailView").attr("class","col-lg-5");
						
						$.ajax({
							url : "detail/"+ntcNo,
							method : "get",
							dataType : "html",
							success : function(data) {
								$("#subNoticeDetailView").html(data);
							}
						});
					}
					
					function getNoticeWrite() {
						$("#mainNoticeMenu").removeClass("d-sm-flex");
						$("#mainNoticeMenu").hide();
						$("#noticeMenu").show();
						$("#mainNoitce").attr("class","col-lg-7");
						$("#subNoticeDetailView").attr("class","col-lg-5");
						
						$.ajax({
							url : "write",
							method : "get",
							dataType : "html",
							success : function(data) {
								$("#subNoticeDetailView").html(data);
							}
						});
					}
					
					function getNoticeUpdate(i) {
						let ntcNo = i;
						$("#mainNoticeMenu").removeClass("d-sm-flex");
						$("#mainNoticeMenu").hide();
						$("#noticeMenu").show();
						$("#mainNoitce").attr("class","col-lg-7");
						$("#subNoticeDetailView").attr("class","col-lg-5");
						
						$.ajax({
							url : "update/"+ntcNo,
							method : "get",
							dataType : "html",
							success : function(data) {
								$("#subNoticeDetailView").html(data);
							}
						});
					}
					
				</script>
				
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
