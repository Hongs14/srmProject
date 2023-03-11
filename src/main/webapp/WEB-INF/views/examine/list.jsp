<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  	<%@include file="/WEB-INF/views/common/head.jsp" %>
	<style>
	
	.col-lg-7 .srTtl{
		width: 90px;
		overflow: hidden;
		text-overflow: ellipsis;
		display:block;
	}	
    .col-lg-12 .srTtl{
    	width: 400px;
		overflow: hidden;
		text-overflow: ellipsis;
		display:block;
    }
    .col-lg-7 .userOgdp{
		width: 70px;
		overflow: hidden;
		text-overflow: ellipsis;
		display:block;
	}
	
    .col-lg-12 .userOgdp{
		width: 70px;
		display:block;
	}
	.srStts{
		width: 50px;
		display:block;
	}
	
	.detailView span {
	  	white-space:normal !important;
	  	font-size:14px;
	 }
	 #srExamineBox{
	 	border: 2px solid #EAECF4;
	 	border-radius: 5px;
	 	margin: 20 0 20 0px;
	 	padding: 10px;
	 	padding-left:15px;
	 	background-color:  #EAECF4;
	 }
	</style>
  	<script>
	  	$(document).ready(function () {
		    $('#simple-date4 .input-daterange').datepicker({        
		        format: 'yyyy-mm-dd',        
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
	        	<div class="d-sm-flex align-items-end justify-content-between" id="srMainMenu">
	          		<div class="bg-primary px-3 py-2" style="border-top-left-radius:10px; border-top-right-radius:10px;">
	            		<h6 class="mb-0 text-white">SR 검토관리</h6>
	          		</div>
	            	<ol class="breadcrumb">
	              		<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/examine/list">SR 관리</a></li>
	              		<li class="breadcrumb-item active" aria-current="page">SR 검토관리</li>
	            	</ol>
	          	</div>
	        	
	        	<!-- Row -->
	          	<div class="row">
	          		<div id="mainExamine" class="col-lg-12">
	            		<div class="bg-primary px-3 py-2" style="border-top-left-radius:10px; border-top-right-radius:10px; width:121px; display:none;" id="srSubMenu">
			 				<h6 class="mb-0 text-white">SR 검토관리</h6>
						</div>
	            		<div class="card mb-4">
	                		<!-- 검색 -->
	                		<div class="mb-1 mt-5 px-3">
		                		<form class="navbar-search">
		                			<div class="row text-right">
		                				<div class="col-4">
		                					<div class="form-group row" id="simple-date4" >
					                			<div class="input-daterange input-group input-group-sm">
					                				<label for="start" class="col-sm-3 col-form-label-sm">조회기간</label>
					                				<div class="col-sm-9 d-flex">
						                    			<input type="text" class="input-sm form-control form-control-sm" name="start" id="dateStart"/>
						                    			<div class="input-group-prepend">
						                    				<span class="input-group-text" style="height:31px;">~</span>
						                    			</div>
						                    			<input type="text" class="input-sm form-control form-control-sm" name="end" id="dateEnd"/>
					                				</div>
					                    		</div>
					            			</div>
		                				</div>
		                				<div class="col-3">
		                					<div class="form-group row">
		                						<label class="col-sm-4 col-form-label-sm" for="sttsNo">진행상태</label>
				                    			<select class="form-control form-control-sm col-sm-8" id="sttsNo">
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
		                						<label for="exampleFormControlSelect1 sysNo" class="col-sm-4 col-form-label-sm">관련시스템</label>
				                    			<select class="form-control form-control-sm col-sm-8" id="sysNm">
				                        			<option value="0">전체</option>
				                        			<c:forEach var="system" items="${examineFilter.sysNmList}">		                        	
					                        			<option value="${system.sysNo}">${system.sysNm}</option>
				                        			</c:forEach>
				                    			</select>
				                			</div>
		                				</div>
		                				<div class="col-1 text-left px-1">
											<button class="btn btn-outline-warning btn-sm" type="button" onclick="examineListReset()" >초기화 </button>
		                				</div>
		                			</div>
		                			<div class="row text-right">
		                				<div class="col-4">
		                					<div class="form-group row">
		                						<label for="exampleFormControlSelect1" class="col-sm-3 col-form-label-sm">등록자소속</label>
				                    			<div class="col-sm-9">
					                    			<select id="userOgdp" class="form-control form-control-sm">
					                        			<option value="0">전체</option>
					                        			<c:forEach var="users" items="${examineFilter.userOgdpList}">		                        	
						                        			<option>${users.userOgdp}</option>
					                        			</c:forEach>
					                    			</select>
				                    			</div>
				                			</div>
		                				</div>
		                				<div class="col-3">
		                					<div class="form-group row">
		                						<label for="exampleFormControlSelect1" class="col-sm-4 col-form-label-sm">부서</label>
				                    			<select class="form-control form-control-sm col-sm-8" id="userDpNm">
				                        			<option value="0">전체</option>
				                        			<c:forEach var="users" items="${examineFilter.userDpList}">		                        	
					                        			<option>${users.userDpNm}</option>
				                        			</c:forEach>
				                    			</select>
				                			</div>
		                				</div>
		                				<div class="col-4">
				                			<div class="form-group row">
				                				<label for="exampleFormControlSelect1" class="col-sm-4 col-form-label-sm">키워드</label>
				                    			<input type="text" class="form-control form-control-sm col-sm-8 bg-light" 
				                   				aria-label="Search" placeholder="검색어를 입력하세요" style="border-color: #3f51b5;" id="keyword">
				                  			</div>
		                				</div>
		                				<div class="col-1 text-left px-1">
											<button class="btn btn-primary btn-sm" type="button" onclick="examineList(1)" >조회 <i class="fas fa-search fa-sm"></i></button>
		                				</div>
		                				<script>
			                				$(document).ready(function () {
												console.log("시작");
												var sysNo = "${loginUser.sysNo}";
												
												if ( $('#mySrWork').prop('checked') ) {
													
													sysNo = "${loginUser.sysNo}";
													console.log("sysNo");
												}else{
													sysNo="";
												}
												var sysNmSelect = document.getElementById("sysNm");
												var sttsNoSelect = document.getElementById("sttsNo");
												var userOgdpSelect = document.getElementById("userOgdp");
												var userDpSelect = document.getElementById("userDpNm");
												
												var sysNm = sysNmSelect.options[document.getElementById("sysNm").selectedIndex].text;
												var sttsNo = sttsNoSelect.options[document.getElementById("sttsNo").selectedIndex].value;
												var userOgdp = userOgdpSelect.options[document.getElementById("userOgdp").selectedIndex].text;
												var userDpNm = userDpSelect.options[document.getElementById("userDpNm").selectedIndex].text;

												let today = new Date();   
												
											  	let year = today.getFullYear(); // 년도
											  	let month = today.getMonth() + 1;  // 월
											  	let date = today.getDate();  // 날짜
											  	
											  	var defaltStartDate = ((year-1) + '/' + month + '/' + date);
											  	var defaltEndDate = (year + '/' + month + '/' + date);
											  	
											  	console.log(defaltStartDate);
											  	console.log(defaltEndDate);
											  	
											  	document.getElementById("dateStart").value = defaltStartDate;
											  	document.getElementById("dateEnd").value = defaltEndDate;
											  	
											  	var srRegStartDate = document.getElementById("dateStart").value;
											  	var srRegEndDate = document.getElementById("dateEnd").value;
												
												var srTtl = document.getElementById("keyword").value;
												
												if(srTtl !== "") {
													srTtl = "%" + srTtl + "%";
												}
												
												console.log(sysNo);
												console.log(sttsNo);
												console.log(srTtl);
												console.log(userOgdp);
												console.log(userDpNm);
												console.log(srRegStartDate);
												console.log(srRegEndDate);
												
												let data = {sysNo : sysNo, sysNm : sysNm, sttsNo : sttsNo, userOgdp : userOgdp, userDpNm : userDpNm,
														srRegStartDate : srRegStartDate, srRegEndDate : srRegEndDate, srTtl : srTtl};
												
												console.log(data);
												
												$.ajax({
													url : "${pageContext.request.contextPath}/examine/filter/1",
													method : "post",
													data : JSON.stringify(data),
													contentType: "application/json; charset=UTF-8"
												}).done((data) => {
													$("#ajaxList").html(data)
												});
											});
										
											function examineList(pageNo) {
												console.log(pageNo);

												var sysNo = "${loginUser.sysNo}";
												
												if ( $('#mySrWork').prop('checked') ) {
													
													sysNo = "${loginUser.sysNo}";
													console.log("sysNo");
												}else{
													sysNo="";
												}
												
												var sysNmSelect = document.getElementById("sysNm");
												var sttsNoSelect = document.getElementById("sttsNo");
												var userOgdpSelect = document.getElementById("userOgdp");
												var userDpSelect = document.getElementById("userDpNm");
												
												var sysNm = sysNmSelect.options[document.getElementById("sysNm").selectedIndex].text;
												var sttsNo = sttsNoSelect.options[document.getElementById("sttsNo").selectedIndex].value;
												var userOgdp = userOgdpSelect.options[document.getElementById("userOgdp").selectedIndex].text;
												var userDpNm = userDpSelect.options[document.getElementById("userDpNm").selectedIndex].text;
											  	
											  	var srRegStartDate = document.getElementById("dateStart").value;
											  	var srRegEndDate = document.getElementById("dateEnd").value;
												
												var srTtl = document.getElementById("keyword").value;
												
												if(srTtl !== "") {
													srTtl = "%" + srTtl + "%";
												}
												
												console.log(sysNo);
												console.log(sttsNo);
												console.log(srTtl);
												console.log(userOgdp);
												console.log(userDpNm);
												console.log(srRegStartDate);
												console.log(srRegEndDate);
												
												let data = {sysNo : sysNo, sysNm : sysNm, sttsNo : sttsNo, userOgdp : userOgdp, userDpNm : userDpNm,
														srRegStartDate : srRegStartDate, srRegEndDate : srRegEndDate, srTtl : srTtl};
												
												console.log(data);
												
												$.ajax({
													url : "${pageContext.request.contextPath}/examine/filter/"+pageNo,
													method : "post",
													data : JSON.stringify(data),
													contentType: "application/json; charset=UTF-8"
												}).done((data) => {
													$("#ajaxList").html(data)
												});
											}
											
											function examineListReset() {
												
												let today = new Date();   
												
											  	let year = today.getFullYear(); // 년도
											  	let month = today.getMonth() + 1;  // 월
											  	let date = today.getDate();  // 날짜
											  	
											  	var defaltStartDate = ((year-1) + '/' + month + '/' + date);
											  	var defaltEndDate = (year + '/' + month + '/' + date);
											  	
											  	console.log(defaltStartDate);
											  	console.log(defaltEndDate);
											  	
											  	document.getElementById("dateStart").value = defaltStartDate;
											  	document.getElementById("dateEnd").value = defaltEndDate;
												
											  	$("#sysNm").val("0").prop("selected", true);
												$("#sttsNo").val("0").prop("selected", true);
												$("#userOgdp").val("0").prop("selected", true);
												$("#userDpNm").val("0").prop("selected", true);
												document.getElementById("keyword").value = "";
											}
										</script>
	                				</div>
	               				</form>
	               			</div>
	                		<hr/>
			                <!-- SR 검토 목록 -->
			               	<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
		                  		<h5 class="m-0 font-weight-bold text-primary">SR 검토 목록</h5>
			                  	<div class="d-sm-flex justify-content-end">
			                		<button class="btn btn-sm btn-primary mr-1" onclick='selectUnderReview()'>일괄 처리 (검토중)</button>
			                		<button class="btn btn-sm btn-primary mr-1" onclick='selectreception()'>일괄 처리 (접수)</button>
			                		<button class="btn btn-sm btn-primary" onclick="excelDownload()">엑셀 다운로드</button>
			                  	</div>
			                </div>     
		                  	<div class="custom-control custom-switch px-5 ml-3" style="width:180px; border-radius:3px; background-color:#eaecf4;">
			  					<input type="checkbox" class="custom-control-input" id="mySrWork" name="mySrWork" onclick="examineList(1)" >
			  					<label class="custom-control-label" for="mySrWork"><span class="text-primary">나의 SR 조회<i class="fas fa-search fa-sm mx-2"></i> </span></label>
							</div>
			                <form>
					           	<div id="ajaxList" style="width:100%"></div>
					           	<script>
						           	function checkSelectAll(checkbox)  {
						           	  const selectall 
						           	    = document.querySelector('input[name="selectall"]');
						           	  
						           	  if(checkbox.checked === false)  {
						           	    selectall.checked = false;
						           	  }
						           	}

					           		function selectAll(selectAll) {
					           			const checkboxes = document.getElementsByName('examineCheck');
					           	    
									  	checkboxes.forEach((checkbox) => {
									    	checkbox.checked = selectAll.checked
									  	})
										
									}
									
									function selectUnderReview() {
										
										var sysNo = "${loginUser.sysNo}";
										console.log("sysNo");
										if ( $('#mySrWork').prop('checked') ) {
											
											sysNo = "${loginUser.sysNo}";
											console.log("sysNo");
										}else{
											sysNo="";
										}
										var sysNmSelect = document.getElementById("sysNm");
										var sttsNoSelect = document.getElementById("sttsNo");
										var userOgdpSelect = document.getElementById("userOgdp");
										var userDpSelect = document.getElementById("userDpNm");
										
										var sysNm = sysNmSelect.options[document.getElementById("sysNm").selectedIndex].text;
										var sttsNo = sttsNoSelect.options[document.getElementById("sttsNo").selectedIndex].value;
										var userOgdp = userOgdpSelect.options[document.getElementById("userOgdp").selectedIndex].text;
										var userDpNm = userDpSelect.options[document.getElementById("userDpNm").selectedIndex].text;

										var srRegStartDate = document.getElementById("dateStart").value;
										var srRegEndDate = document.getElementById("dateEnd").value;
										var srTtl = document.getElementById("keyword").value;
										
										if(srTtl !== "") {
											srTtl = "%" + srTtl + "%";
										}
										
										const query = 'input[name="examineCheck"]:checked';
									  	const selectedEls = 
										      document.querySelectorAll(query);
										  
								  		let data = '';
								  		
									  	selectedEls.forEach((el) => {
									  		data = {srNo : el.value , sttsNm : '검토중', srPry : '상', srReqSe : '개발(신규)', srOpnn : '',
									  				sysNo : sysNo, sysNm : sysNm, sttsNo : sttsNo, userOgdp : userOgdp, userDpNm : userDpNm, 
									  				srRegStartDate : srRegStartDate, srRegEndDate : srRegEndDate, srTtl : srTtl			
									  		};
									  		
									  		console.log(data);
									  		
										  	$.ajax({
										  		url : "${pageContext.request.contextPath}/examine/processing",
												method : "post",
												data : JSON.stringify(data),
												contentType: "application/json; charset=UTF-8"
											}).done((data) => {
												$("#ajaxList").html(data);
											});
									  	});

									}
									
									function selectreception() {
										var sysNo = "${loginUser.sysNo}";
										
										if ( $('#mySrWork').prop('checked') ) {
											
											sysNo = "${loginUser.sysNo}";
											console.log("sysNo");
										}else{
											sysNo="";
										}
										var sysNmSelect = document.getElementById("sysNm");
										var sttsNoSelect = document.getElementById("sttsNo");
										var userOgdpSelect = document.getElementById("userOgdp");
										var userDpSelect = document.getElementById("userDpNm");
										
										var sysNm = sysNmSelect.options[document.getElementById("sysNm").selectedIndex].text;
										var sttsNo = sttsNoSelect.options[document.getElementById("sttsNo").selectedIndex].value;
										var userOgdp = userOgdpSelect.options[document.getElementById("userOgdp").selectedIndex].text;
										var userDpNm = userDpSelect.options[document.getElementById("userDpNm").selectedIndex].text;

										
										var srRegStartDate = document.getElementById("dateStart").value;
										var srRegEndDate = document.getElementById("dateEnd").value;
										var srTtl = document.getElementById("keyword").value;
										
										if(srTtl !== "") {
											srTtl = "%" + srTtl + "%";
										}
										const query = 'input[name="examineCheck"]:checked';
									  	const selectedEls = 
										      document.querySelectorAll(query);
										  
								  		let data = '';
								  		
									  	selectedEls.forEach((el) => {
									  		data = {srNo : el.value , sttsNm : '접수', srPry : '상', srReqSe : '개발(신규)', srOpnn : '',
									  				sysNo : sysNo, sysNm : sysNm, sttsNo : sttsNo, userOgdp : userOgdp, userDpNm : userDpNm, 
									  				srRegStartDate : srRegStartDate, srRegEndDate : srRegEndDate, srTtl : srTtl			
									  		};
									  		
									  		console.log(data);
									  		
										  	$.ajax({
										  		url : "${pageContext.request.contextPath}/examine/processing",
												method : "post",
												data : JSON.stringify(data),
												contentType: "application/json; charset=UTF-8"
											}).done((data) => {
												$("#ajaxList").html(data);
											});
									  	});

									}
								</script>
			                </form>           
						</div>
					</div>
					<div id="subExamineDetailView">
						
					</div>
					<c:if test="${!empty command and command eq 'detail'}">
		          		<input type="hidden" value="${srNo}" id="detailSrNo">
		          	</c:if>
		          	<c:if test="${!empty command and command eq 'detail'}">
		          		<script>
		          			$(document).ready(function(){
		          				var srNo = $("#detailSrNo").val();
			  					getSrDetail(srNo);
				          	}
				          	
			          		);
			          	</script>	
			          </c:if>
				</div>
			</div>
			<script>
				function getSrDetail(i) {
					
					let srNo = i;
					$(".ex_info").hide();
					console.log(srNo);
					$("#srMainMenu").removeClass("d-sm-flex");
					$("#srMainMenu").hide();
					$("#srSubMenu").show();
					$("#mainExamine").attr("class","col-lg-7");
					$("#subExamineDetailView").attr("class","col-lg-5");
					
					$.ajax({
						url : "${pageContext.request.contextPath}/examine/detail/"+srNo,
						method : "get",
						dataType : "html",
						success : function(data) {
							$("#subExamineDetailView").html(data);
						}
					}); 	
					
				}
				function excelDownload() {
					
					var examineArr = new Array();
					var checkbox = $("input[name=examineCheck]:checked");
					
					// 체크된 체크박스의 값을 가져옴
					checkbox.each(function(i) {
						var tr = checkbox.parent().parent().eq(i);
						var td = tr.children();
						
						if(td.eq(1).text() != 'SR 번호') {
							
							var srNo = td.eq(1).text();
							
							examineArr.push(srNo);
						}
					});
					
					console.log(examineArr);
					
					if(examineArr.length == 0) {
				    	$('#ListExcelModal').modal('show');
				    	$("#ListExcelModalMessage").text("SR을 선택해 주세요");
					} else {
						var form = document.createElement('form');
						form.setAttribute('method','post');
						form.setAttribute('action', 'excelDownload');
						document.charset = "utf-8";
						
						var hiddenField = document.createElement("input");
						hiddenField.setAttribute('type', 'hidden');
						hiddenField.setAttribute('name', 'examineArr');
						hiddenField.setAttribute('value', examineArr);
						form.appendChild(hiddenField);
						
						document.body.appendChild(form);
						form.submit();
					}

				}
			</script>
			<!-- 메시지 모달 창 -->
			<div class="modal fade" id="ListExcelModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
				<div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable" role="document">
					<div class="modal-content">
						<div class="modal-header bg-primary">
							<h5 class="modal-title" id="exampleModalScrollableTitle">
					          	<img src="${pageContext.request.contextPath}/resources/images/logoOnly.png" style="width:20px;">
					        	<small class="text-white">
					        		<b>삭제</b>
					        	</small>
							</h5>
							<button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body p-5" style="white-space: normal; text-align:center;">
							<div class="alert alert-secondary m-3 p-2" role="alert">
								<h6><i class="fas fa-exclamation-triangle"></i><b> 안내 </b></h6>
								<div id="ListExcelModalMessage"></div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-outline-primary" data-dismiss="modal">닫기</button>
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