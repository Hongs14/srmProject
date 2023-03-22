<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
  	<%@include file="/WEB-INF/views/common/head.jsp" %>
  	<style type="text/css">
  		.ajaxDetail span {
        	white-space:normal !important;
    	}
    	.bgChange{
			background-color: rgba(0, 0, 0, 0.075);
		}
  	</style>

    
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
  					<div class="bg-primary px-3 py-2" style="border-top-left-radius:10px; border-top-right-radius:10px; width:100px;">
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
						<div class="bg-primary px-3 py-2" style="border-top-left-radius:10px; border-top-right-radius:10px; width:100px; display:none;"  id="noticeMenu">
							<h6 class="mb-0 text-white">공지사항</h6>
						</div>
               			<div class="card mb-4">
                  			<!-- 검색 -->
            				<div class="mb-1 mt-5 px-3">
								<form class="navbar-search">
									<div class="row text-right">
	   									<div class="col-4">
	       									<div class="form-group row" id="simple-date4" >
	  											<div class="input-daterange input-group input-group-sm text-right">
	      											<label for="start" class="col-sm-3 col-form-label-sm">조회기간</label>
	         										<input type="text" class="input-sm form-control form-control-sm col-sm-8" name="start" id="dateStart" value=""/>
	               									<div class="input-group-prepend">
	               										<span class="input-group-text" style="height:31px;">~</span>
	           										</div>
	            									<input type="text" class="input-sm form-control form-control-sm" name="end" id="dateEnd" value="${notice.endDate}" />
												</div>
	   										</div>
										</div> 
	    								<div class="col-3 text-left">
												<input type="button" class="btn btn-sm btn-primary" value="당일" onclick="nTodayClick(1)">
												<input type="button" class="btn btn-sm btn-primary" value="1주일 전" onclick="nWeekClick(1)">
												<input type="button" class="btn btn-sm btn-primary" value="1개월 전" onclick="nMonthClick(1)">
	    								</div>
	    								<div class="col-3">
	      									<div class="form-group row">
									      		<label for="exampleFormControlSelect1" class="col-sm-3 col-form-label-sm text-center">키워드</label>
									          	<input type="text" class="form-control form-control-sm col-sm-8 bg-light ml-1" 
		         									aria-label="Search" placeholder="검색어를 입력하세요" style="border-color: #3f51b5; font-size:0.9rem;" id="keyword">
	            							</div>
	        							</div>
	        							<div class="col-1">
	        								<div class="input-group-append float-right">
													<button class="btn btn-primary btn-sm" type="button" onclick="searchNoticeList(1)">조회 <i class="fas fa-search fa-sm"></i>
												</button>
											</div>
	         							</div>
	         						</div>
								</form>
        					</div>
        					<hr/>
    
						    <!-- 공지사항 목록 -->
						    
						    <div class="card-header px-5 d-flex flex-row align-items-center justify-content-between">
								<h6 class="m-0 font-weight-bold text-primary">공지사항 목록</h6>
								<div class="d-sm-flex justify-content-end">
									<c:if test="${sessionScope.loginUser.userType eq '관리자'}">
										<c:if test="${sysNo eq param.sysNo or param.sysNo eq 'SRM'}">										
											<a class="btn btn-sm btn-primary mr-3" onclick="getNoticeWrite()">글작성</a>
										</c:if>									
									</c:if>

								</div>
							</div> 
							<div id="noticeList" style="width: 100%;"></div>
        				</div>
					</div>
					<div id="subNoticeDetailView" style="width: 100%;"></div>
					<div id="msgStack"></div>
				</div>
				<c:if test="${!empty command and command eq 'detail'}">
					<input type="hidden" value="${ntcNo}" id="detailNtcNo">
				</c:if>
				<c:if test="${!empty command and command eq 'detail'}">
					<script>
			          	$(document).ready(function(){
			          		var ntcNo = $("#detailNtcNo").val();
			          		
			          		getNoticeDetail(ntcNo);
				          }
			          	
			          	);
			          </script>
				</c:if>

				<script>
					$(document).ready(function () {
						let today = new Date();   
						
					  	let year = today.getFullYear(); // 년도
					  	let month = today.getMonth() + 1;  // 월
					  	let date = today.getDate();  // 날짜
					  	
					  	var defaltStartDate = (year + '/' + ((month<9? "0"+(month-2) : (month-2))) + '/' + date);
					  	var defaltEndDate = (year + '/' + (month<9? "0"+month : month) + '/' + date);
					  	
					  	document.getElementById("dateStart").value = defaltStartDate;
					  	document.getElementById("dateEnd").value = defaltEndDate;
					  	
					  	var startDate = document.getElementById("dateStart").value;
					  	var endDate = document.getElementById("dateEnd").value;
						
					  	var str = location.href;
						var index = str.indexOf("?")+1;
					    var lastIndex = str.indexOf("#") > -1 ? str.indexOf("#") + 1 : str.length;
					 
					    // index 값이 0이라는 것은 QueryString이 없다는 것을 의미하기에 종료
					    if (index == 0) {
					        return "";
					    }
					 
					    // str의 값은 a=1&b=first&c=true
					    str = str.substring(index, lastIndex); 

					    var arr = str.split("=");
					    var sysNo = arr[1];
					    
						var ntcTtl = document.getElementById("keyword").value;
						
						if(ntcTtl !== "") {
							ntcTtl = "%" + ntcTtl + "%";
						}

						let data = {startDate : startDate, endDate : endDate, ntcTtl : ntcTtl, sysNo : sysNo};
						
						$.ajax({
							url : "${pageContext.request.contextPath}/notice/filter/1",
							method : "post",
							data : JSON.stringify(data),
							contentType: "application/json; charset=UTF-8"
						}).done((data) => {
							$("#noticeList").html(data)
							var ntcNo = "${ntcNo}";
							var bg = "bgChange-"+ntcNo;
							$('#' + bg).addClass("bgChange");
						});
					});
					
					
					function searchNoticeList(pageNo) {
						var startDate = document.getElementById("dateStart").value;
						var endDate = document.getElementById("dateEnd").value;
						
						var str = location.href;
						var index = str.indexOf("?")+1;
					    var lastIndex = str.indexOf("#") > -1 ? str.indexOf("#") + 1 : str.length;
					 
					    // index 값이 0이라는 것은 QueryString이 없다는 것을 의미하기에 종료
					    if (index == 0) {
					        return "";
					    }
					 
					    // str의 값은 a=1&b=first&c=true
					    str = str.substring(index, lastIndex); 
					    var arr = str.split("=");
					    var sysNo = arr[1];
						var ntcTtl = document.getElementById("keyword").value;
						
						if(ntcTtl !== "") {
							ntcTtl = "%" + ntcTtl + "%";
						}
						let data = {startDate : startDate, endDate : endDate, ntcTtl : ntcTtl, sysNo : sysNo};
						
						$.ajax({
							url : "${pageContext.request.contextPath}/notice/filter/"+pageNo,
							method : "post",
							data : JSON.stringify(data),
							contentType: "application/json; charset=UTF-8"
						}).done((data) => {
							$("#noticeList").html(data)
						});
					}
					
					function nTodayClick(pageNo){
						
						let today = new Date();   
						
					  	let year = today.getFullYear(); // 년도
					  	let month = today.getMonth() + 1;  // 월
					  	let date = today.getDate();  // 날짜
					  	
					  	var defaltStartDate = (year + '/' + (month<9? "0"+month : month) + '/' + date);
					  	var defaltEndDate = (year + '/' + (month<9? "0"+month : month) + '/' + date);
					  	
					  	document.getElementById("dateStart").value = defaltStartDate;
					  	document.getElementById("dateEnd").value = defaltEndDate;
					  	
					  	var startDate = document.getElementById("dateStart").value;
					  	var endDate = document.getElementById("dateEnd").value;
						
						var ntcToday = "당일";
						var ntcWeek = null;
						var ntcMonth = null;
						
						var str = location.href;
						var index = str.indexOf("?")+1;
					    var lastIndex = str.indexOf("#") > -1 ? str.indexOf("#") + 1 : str.length;
					 
					    // index 값이 0이라는 것은 QueryString이 없다는 것을 의미하기에 종료
					    if (index == 0) {
					        return "";
					    }
					 
					    // str의 값은 a=1&b=first&c=true
					    str = str.substring(index, lastIndex); 
					    var arr = str.split("=");
					    var sysNo = arr[1];
						var ntcTtl = document.getElementById("keyword").value;
						
						if(ntcTtl !== "") {
							ntcTtl = "%" + ntcTtl + "%";
						}
						
						let data = {startDate : startDate, endDate : endDate, ntcTtl : ntcTtl,
								ntcToday : ntcToday, ntcWeek : ntcWeek, ntcMonth : ntcMonth, sysNo : sysNo};
						
						$.ajax({
							url : "${pageContext.request.contextPath}/notice/filter/"+pageNo,
							method : "post",
							data : JSON.stringify(data),
							contentType: "application/json; charset=UTF-8"
						}).done((data) => {
							$("#noticeList").html(data)
						});
					}
					
					function nWeekClick(pageNo){
						let today = new Date();   
						
					  	let year = today.getFullYear(); // 년도
					  	let month = today.getMonth() + 1;  // 월
					  	let date = today.getDate();  // 날짜
					  	
					  	let day = new Date(new Date().setDate(date - 7));
					  	let lastMonth = day.getMonth()+1;
					  	let lastDay = day.getDate();
					  	
					  	var defaltStartDate = (year + '/' + (lastMonth<9? "0"+lastMonth : lastMonth) + '/' + lastDay);
					  	var defaltEndDate = (year + '/' + (month<9? "0"+month : month) + '/' + date);
					  	
					  	document.getElementById("dateStart").value = defaltStartDate;
					  	document.getElementById("dateEnd").value = defaltEndDate;
					  	
					  	var startDate = document.getElementById("dateStart").value;
					  	var endDate = document.getElementById("dateEnd").value;
					  	
						var ntcToday = null;
						var ntcWeek = "1주일전";
						var ntcMonth = null;
						
						var str = location.href;
						var index = str.indexOf("?")+1;
					    var lastIndex = str.indexOf("#") > -1 ? str.indexOf("#") + 1 : str.length;
					 
					    // index 값이 0이라는 것은 QueryString이 없다는 것을 의미하기에 종료
					    if (index == 0) {
					        return "";
					    }
					 
					    // str의 값은 a=1&b=first&c=true
					    str = str.substring(index, lastIndex); 
					    var arr = str.split("=");
					    var sysNo = arr[1];
						var ntcTtl = document.getElementById("keyword").value;
						
						if(ntcTtl !== "") {
							ntcTtl = "%" + ntcTtl + "%";
						}

						let data = {startDate : startDate, endDate : endDate, ntcTtl : ntcTtl,
								ntcToday : ntcToday, ntcWeek : ntcWeek, ntcMonth : ntcMonth, sysNo : sysNo};
						
						$.ajax({
							url : "${pageContext.request.contextPath}/notice/filter/"+pageNo,
							method : "post",
							data : JSON.stringify(data),
							contentType: "application/json; charset=UTF-8"
						}).done((data) => {
							$("#noticeList").html(data)
						});
					}
					
					function nMonthClick(pageNo){
						let today = new Date();   
						
					  	let year = today.getFullYear(); // 년도
					  	let month = today.getMonth() + 1;  // 월
					  	let date = today.getDate();  // 날짜
					  	
					  	var defaltStartDate = (year + '/' + ((month<9? "0"+month : month)-1) + '/' + date);
					  	var defaltEndDate = (year + '/' + (month<9? "0"+month : month) + '/' + date);
					  	
					  	document.getElementById("dateStart").value = defaltStartDate;
					  	document.getElementById("dateEnd").value = defaltEndDate;
					  	
					  	var startDate = document.getElementById("dateStart").value;
					  	var endDate = document.getElementById("dateEnd").value;
						
						var ntcToday = null;
						var ntcWeek = null;
						var ntcMonth = "1개월전";
						
						var str = location.href;
						var index = str.indexOf("?")+1;
					    var lastIndex = str.indexOf("#") > -1 ? str.indexOf("#") + 1 : str.length;
					 
					    // index 값이 0이라는 것은 QueryString이 없다는 것을 의미하기에 종료
					    if (index == 0) {
					        return "";
					    }
					 
					    // str의 값은 a=1&b=first&c=true
					    str = str.substring(index, lastIndex);
					    var arr = str.split("=");
					    var sysNo = arr[1];
						var ntcTtl = document.getElementById("keyword").value;
						
						if(ntcTtl !== "") {
							ntcTtl = "%" + ntcTtl + "%";
						}
						
						let data = {startDate : startDate, endDate : endDate, ntcTtl : ntcTtl,
								ntcToday : ntcToday, ntcWeek : ntcWeek, ntcMonth : ntcMonth, sysNo : sysNo};
						
						$.ajax({
							url : "${pageContext.request.contextPath}/notice/filter/"+pageNo,
							method : "post",
							data : JSON.stringify(data),
							contentType: "application/json; charset=UTF-8"
						}).done((data) => {
							$("#noticeList").html(data)
						});
					}
					
					function getNoticeDetail(i) {
						let ntcNo = i;
						var str = location.href;
						var index = str.indexOf("?")+1;
					    var lastIndex = str.indexOf("#") > -1 ? str.indexOf("#") + 1 : str.length;
					 
					    // index 값이 0이라는 것은 QueryString이 없다는 것을 의미하기에 종료
					    if (index == 0) {
					        return "";
					    }
					 
					    // str의 값은 a=1&b=first&c=true
					    str = str.substring(index, lastIndex); 
					    var arr = str.split("=");
					    var sysNo = arr[1];
					    var className = $(".bg");
	                  	className.removeClass("bgChange")
					    
						$("#mainNoticeMenu").removeClass("d-sm-flex");
						$("#mainNoticeMenu").hide();
						$("#noticeMenu").show();
						$("#mainNoitce").attr("class","col-lg-7");
						$("#subNoticeDetailView").attr("class","col-lg-5");
						
						$.ajax({
							url : "${pageContext.request.contextPath}/notice/detail/"+ntcNo,
							method : "get",
							dataType : "html",
							success : function(data) {
								$("#subNoticeDetailView").html(data);
								var bg = "bgChange-"+ntcNo;
								$('#' + bg).addClass("bgChange");
							}
						});
					}
				</script>
				
				<script>
					function getNoticeDetail(i) {
						let ntcNo = i;
						
					 	var className = $(".bg");
	                  	className.removeClass("bgChange")
						
						$("#mainNoticeMenu").removeClass("d-sm-flex");
						$("#mainNoticeMenu").hide();
						$("#noticeMenu").show();
						$("#mainNoitce").attr("class","col-lg-7");
						$("#subNoticeDetailView").attr("class","col-lg-5");
						
						$.ajax({
							url : "${pageContext.request.contextPath}/notice/detail/"+ntcNo,
							method : "get",
							dataType : "html",
							success : function(data) {
								$("#subNoticeDetailView").html(data);
								var bg = "bgChange-"+ntcNo;
								$('#' + bg).addClass("bgChange");
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
							url : "${pageContext.request.contextPath}/notice/write",
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
							url : "${pageContext.request.contextPath}/notice/update/"+ntcNo,
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
		<%@include file="/WEB-INF/views/common/footer.jsp" %>
    	</div>
	</div>
	<%@include file="/WEB-INF/views/common/bottom.jsp" %>
</body>

</html>
