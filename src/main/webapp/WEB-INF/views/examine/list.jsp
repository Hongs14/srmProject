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
					                    			<input type="text" class="input-sm form-control form-control-sm col-sm-9" name="start" id="dateStart"/>
					                    			<div class="input-group-prepend">
					                    				<span class="input-group-text" style="height:31px;">~</span>
					                    			</div>
					                    			<input type="text" class="input-sm form-control form-control-sm" name="end" id="dateEnd"/>
					                    		</div>
					            			</div>
		                				</div>
		                				<div class="col-3">
		                					<div class="form-group row">
		                						<label class="col-sm-3 col-form-label-sm" for="sttsNo">진행상태</label>
				                    			<select class="form-control form-control-sm col-sm-9" id="sttsNo">
				                        			<option value="0" selected="selected">전체</option>
				                        			<option value="1">요청</option>
				                        			<option value="2">검토중</option>
				                        			<option value="3">반려</option>
				                        			<option value="7">재검토</option>
				                    			</select>
				                			</div>
		                				</div>
		                				<div class="col-4">
		                					<div class="form-group row">
		                						<label for="exampleFormControlSelect1 sysNo" class="col-sm-3 col-form-label-sm">관련시스템</label>
				                    			<select class="form-control form-control-sm col-sm-9" id="sysNo">
				                        			<option value="0">전체</option>
				                        			<c:forEach var="system" items="${examineFilter.sysNmList}">		                        	
					                        			<option value="${system.sysNo}">${system.sysNm}</option>
				                        			</c:forEach>
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
				                    			<select class="form-control form-control-sm col-sm-9" id="userOgdp">
				                        			<option value="0">전체</option>
				                        			<c:forEach var="users" items="${examineFilter.userOgdpList}">		                        	
					                        			<option>${users.userOgdp}</option>
				                        			</c:forEach>
				                    			</select>
				                			</div>
		                				</div>
		                				<div class="col-3">
		                					<div class="form-group row">
		                						<label for="exampleFormControlSelect1" class="col-sm-3 col-form-label-sm">부서</label>
				                    			<select class="form-control form-control-sm col-sm-9" id="userDpNm">
				                        			<option value="0">전체</option>
				                        			<c:forEach var="users" items="${examineFilter.userDpList}">		                        	
					                        			<option>${users.userDpNm}</option>
				                        			</c:forEach>
				                    			</select>
				                			</div>
		                				</div>
		                				<div class="col-4">
				                			<div class="form-group row">
				                				<label for="exampleFormControlSelect1" class="col-sm-3 col-form-label-sm">키워드</label>
				                    			<input type="text" class="form-control form-control-sm col-sm-9 bg-light" 
				                   				aria-label="Search" placeholder="검색어를 입력하세요" style="border-color: #3f51b5;" id="keyword">
				                  			</div>
		                				</div>
		                				<div class="col-1">
		                					<div class="input-group-append float-right">
												<button class="btn btn-primary btn-sm" type="button" onclick="examineList(1)" >조회 <i class="fas fa-search fa-sm"></i></button>
											</div>
		                				</div>
		                				<script>
			                				$(document).ready(function () {
												console.log("시작");
												var sysNoSelect = document.getElementById("sysNo");
												var sttsNoSelect = document.getElementById("sttsNo");
												var userOgdpSelect = document.getElementById("userOgdp");
												var userDpSelect = document.getElementById("userDpNm");
												
												var sysNo = sysNoSelect.options[document.getElementById("sysNo").selectedIndex].value;
												var sttsNo = sttsNoSelect.options[document.getElementById("sttsNo").selectedIndex].value;
												var userOgdp = userOgdpSelect.options[document.getElementById("userOgdp").selectedIndex].text;
												var userDpNm = userDpSelect.options[document.getElementById("userDpNm").selectedIndex].text;
												
												console.log(sysNo);
												console.log(sttsNo);
												console.log(userOgdp);
												console.log(userDpNm);
												
												let data = {sysNo : sysNo, sttsNo : sttsNo, userOgdp : userOgdp, userDpNm : userDpNm};
												
												console.log(data);
												
												$.ajax({
													url : "filter/1",
													method : "post",
													data : JSON.stringify(data),
													contentType: "application/json; charset=UTF-8"
												}).done((data) => {
													$("#ajaxList").html(data)
												});
											});
										
											function examineList(pageNo) {
												console.log(pageNo);
												var sysNoSelect = document.getElementById("sysNo");
												var sttsNoSelect = document.getElementById("sttsNo");
												var userOgdpSelect = document.getElementById("userOgdp");
												var userDpSelect = document.getElementById("userDpNm");
												
												var sysNo = sysNoSelect.options[document.getElementById("sysNo").selectedIndex].value;
												var sttsNo = sttsNoSelect.options[document.getElementById("sttsNo").selectedIndex].value;
												var userOgdp = userOgdpSelect.options[document.getElementById("userOgdp").selectedIndex].text;
												var userDpNm = userDpSelect.options[document.getElementById("userDpNm").selectedIndex].text;
												
												
												let data = {sysNo : sysNo, sttsNo : sttsNo, userOgdp : userOgdp, userDpNm : userDpNm};
												
												console.log(data);
												
												$.ajax({
													url : "filter/"+pageNo,
													method : "post",
													data : JSON.stringify(data),
													contentType: "application/json; charset=UTF-8"
												}).done((data) => {
													$("#ajaxList").html(data)
												});
											}
										</script>
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
				           		<div id="ajaxList" style="width:100%"></div>
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