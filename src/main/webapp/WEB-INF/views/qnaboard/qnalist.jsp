<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

	<head>
	  	<%@include file="/WEB-INF/views/common/head.jsp" %>
	  	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	  	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	  	<script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
	
		<!-- Bootstrap Datepicker -->
	  	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
	  	<!-- RuangAdmin Javascript -->
	  	<script src="${pageContext.request.contextPath}/resources/js/ruang-admin.min.js"></script>
  		<style>
  			.qstnTtl{
				width: 680px;
				overflow: hidden;
				text-overflow: ellipsis;
				display:block;
			} 
			
			.detail span {
        		white-space:normal !important;
    		}
    		.textDetail{
    			white-space:normal !important;
    		} 
    		
    		#sizeTtl{
    			width: 360px;
    			overflow: hidden;
				text-overflow: ellipsis;
				display:block;
    		}
    		.col-lg-7 .qstnTtl{
    			width: 380px;
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
		   	<!-- 모달창 -->
		   	<div class="modal fade" id="qstnModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
			    	<div class="modal-content">
						<div class="modal-header bg-primary">
			         		<h5 class="modal-title" id="exampleModalCenterTitle"> 
				          		<img src="${pageContext.request.contextPath}/resources/images/logoOnly.png" style="width:20px;">
				        		<small class="text-white" id="modalHeader"><b>확인</b></small>
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
					       		<div id="modalBody" class="text-left">
						   
					       		</div>
				       		</div>
			       		</div>
			       		<div class="modal-footer justify-content-center text-center">
			         		<button type="button" class="btn btn-outline-primary mx-2" data-dismiss="modal">닫기</button>
			         		<button id="qstnSubmit" class="btn btn-primary">확인</button>
			       		</div>
			     	</div>
			   	</div>
			</div>
		   	<!-- 모달창 -->

			<div id="content-wrapper" class="d-flex flex-column">
				<div id="content">
		        
			        <!-- TopBar -->
			         <%@include file="/WEB-INF/views/common/topbar.jsp" %>
			
			        <!-- 메인 컨테이너 Container Fluid-->
					<div class="container-fluid" id="container-wrapper">
			        	<div class="d-sm-flex align-items-end justify-content-between" id="mainQstnMenu">
          					<div class="bg-primary px-3 py-2" style="border-top-left-radius:10px; border-top-right-radius:10px;">
            					<h6 class="mb-0 text-white">Q&A게시판</h6>
         					</div>
            				<ol class="breadcrumb">
              					<li class="breadcrumb-item">Q&A</li>
              					<li class="breadcrumb-item active" aria-current="page">목록보기</li>
            				</ol>
          				</div>
			         	<!-- Row -->
			         	<div class="row">
							<div id="mainQstn" class="col-lg-12">
								<div class="bg-primary px-3 py-2" style="border-top-left-radius:10px; border-top-right-radius:10px; width:114px; display:none;"  id="qstnMenu">
									<h6 class="mb-0 text-white">Q&A게시판</h6>
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
			         										<input type="text" class="input-sm form-control form-control-sm col-sm-8" value="" name="startDate" id="dateStart"/>
			               									<div class="input-group-prepend">
			               										<span class="input-group-text" style="height:31px;">~</span>
			           										</div>
			           										<input type="hidden" value=""/>
			            									<input type="text" class="input-sm form-control form-control-sm" name="endDate" id="dateEnd" value=""/>
														</div>
			   										</div>
												</div> 
			    								<div class="col-3 text-left">
														<input type="button" class="btn btn-sm btn-primary" value="당일" onclick="RangeClick('하루')"/>
														<input type="button" class="btn btn-sm btn-primary" value="1주일 전" onclick="RangeClick('일주일')"/>
														<input type="button" class="btn btn-sm btn-primary" value="1개월 전" onclick="RangeClick('한달')"/>
			    								</div>
			    								<div class="col-4">
			      									<div class="form-group row">
											      		<label for="exampleFormControlSelect1" class="col-sm-3 col-form-label-sm text-right">키워드</label>
											          	<input type="text" class="form-control form-control-sm col-sm-9 bg-light" 
				         									aria-label="Search" placeholder="검색어를 입력하세요" style="border-color: #3f51b5;" id="keyword">
			            							</div>
			        							</div>
			        							<div class="col-1">
			        								<div class="input-group-append float-right">
															<button class="btn btn-primary btn-sm" type="button" onclick="searchQnaList(1)">조회 <i class="fas fa-search fa-sm"></i>
														</button>
													</div>
			         							</div>
			         						</div>
										</form>
			       					</div>
					               	<hr/>
	                        		<!-- 검색 -->
						         	
						         	<!-- Qna 목록 -->
						            <div class="card-header px-5 d-flex flex-row align-items-center justify-content-between">
			                			<h6 class="m-0 font-weight-bold text-primary">질문 목록</h6>
			                			<div class="d-sm-flex justify-content-end">
			                				<c:if test="${sessionScope.loginUser.userType eq '고객사'}">
			                					<a onclick="writeQstn()" class="btn btn-primary btn-sm" style="cursor:pointer;">Q&A 등록하기</a>
			                				</c:if>
			                  			</div>
			                		</div> 
			                		<div id="qstnlist" >
			                		
			                		</div>
			                	</div>
					        </div>
					   		<div id="miniView"></div>
			        	</div> 
						<!-- Row -->
						<c:if test="${!empty command and command eq 'detail'}">
				          	<input type="hidden" value="${qstnNo}" id="detailqstnNo">
				        
							<script>
								$(document).ready(function(){
					          		let qstnNo = $("#detailqstnNo").val();
					          		qnaDetail(qstnNo); 
						        });
							</script>
						</c:if>
			         	<!-- 로그아웃 모달 -->
			           	<%@include file="/WEB-INF/views/common/logout.jsp" %>
					</div>
			        <!---Container Fluid-->
				</div>
				<%@include file="/WEB-INF/views/common/footer.jsp" %>
			</div>
		</div>
		<script>
			//오늘 날짜 디폴트로 입력
			$(document).ready(function() {
				var todayResult = getTimeStamp();
				$('#dateEnd').val(todayResult);
				
				var dateStart =getLastYearTimeStamp();
				$('#dateStart').val(dateStart);
			});
				
			
			function getTimeStamp() {
			//오늘 날짜 양식
			  var d = new Date();
	
			  var s =
			    leadingZeros(d.getFullYear(), 4) + '/' +
			    leadingZeros(d.getMonth() + 1, 2) + '/' +
			    leadingZeros(d.getDate(), 2);
	
			  return s;
			};
			
			
			function getLastYearTimeStamp() {
			//3개월전 날짜 양식
				  var d = new Date();
	
				  var s =
				    leadingZeros(d.getFullYear(), 4) + '/' +
				    leadingZeros((d.getMonth() +1)-2, 2) + '/' +
				    leadingZeros(d.getDate(), 2);
	
				  return s;
			};
	
			
			function leadingZeros(n, digits) {
			//오늘 날짜 양식 (+두자리)
			  var zero = '';
			  n = n.toString();
	
			  if (n.length < digits) {
			    for (i = 0; i < digits - n.length; i++)
			      zero += '0';
			  }
			  return zero + n;
			};
		
			$(document).ready(function(){
				readList();
			});
			
			function readList(){
				var startDate = $('#dateStart').val();
				var endDate = $('#dateEnd').val();
				var sysNo = "${session}";
				var qstnTtl = $('#keyword').val();
			    
				if(qstnTtl !== "") {
					qstnTtl = "%" + qstnTtl + "%";
				}
				
				let data = {startDate : startDate, endDate : endDate, qstnTtl : qstnTtl, sysNo : sysNo};
				
				$.ajax({
					url : '${pageContext.request.contextPath}/qna/'+sysNo+'/filter/1',
					method : "post",
					data : JSON.stringify(data),
					contentType: "application/json; charset=UTF-8"
				}).done((data) => {
					$("#qstnlist").html(data)
				});
			};
			
			function searchQnaList(pageNo){
				var startDate = $("#dateStart").val();
				var endDate = $("#dateEnd").val();
				var sysNo = "${session}";
				var qstnTtl = $("#keyword").val();
			
				if(qstnTtl !== "") {
					qstnTtl = "%" + qstnTtl + "%";
				}

				let data = {startDate : startDate, endDate : endDate, qstnTtl : qstnTtl, sysNo : sysNo, qstnSecret:qstnSecret};
				
				$.ajax({
					url : '${pageContext.request.contextPath}/qna/'+sysNo+'/filter/'+pageNo ,
					method : "post",
					data : JSON.stringify(data),
					contentType: "application/json; charset=UTF-8",
					
					}).done((data) => {
						$("#qstnlist").html(data);
				});
			
			};
			
			
			function qnaDetail(i) {
				//상세보기
				let qstnNo = i;
				$("#mainQstnMenu").removeClass("d-sm-flex");
				$("#mainQstnMenu").hide();
				$("#qstnMenu").show();
				$("#mainQstn").attr("class","col-lg-7");
				$("#miniView").attr("class","col-lg-5");
				/* resize(); */
				let sysNo = "${session}";
				
					$.ajax({
						url : '${pageContext.request.contextPath}/qna/'+sysNo+'/view/'+qstnNo,
						method : "get",
						dataType : "html",
						success : function(data) {
							$("#miniView").html(data);
						}
					});
			};
			
			function qnaSecret(i){
				let qstnNo = i;
				$("#modalBody").html("<h5>비밀글입니다. 작성자를 확인해주세요.</h5>");
				$("#qstnModal").modal('show');
				$("#qstnSubmit").attr("data-dismiss","modal");
			};
			
			function RangeClick(range){
				let today = new Date();   
				let year = today.getFullYear(); // 년도
			  	let month = today.getMonth() + 1;  // 월
			  	let date = today.getDate();  // 날짜
			  	var defaultStartDate;
				
			  	if(range === "하루"){
			  		defaultStartDate = (year + '/' + month + '/' + date);
				 
				} else if(range==="일주일"){
				  	let day = new Date(new Date().setDate(date - 7));
				  	let lastMonth = day.getMonth()+1;
				  	let lastDay = day.getDate();
				  	defaultStartDate = (year + '/' + lastMonth + '/' + lastDay);
				} else if(range === "한달"){
					defaultStartDate = (year + '/' + (month-1) + '/' + date);
				}
			  	
				var defaultEndDate = (year + '/' + month + '/' + date);
			  	$("#dateStart").val(defaultStartDate);
			  	$("#dateEnd").val(defaultEndDate);
			  	
			  	var startDate = $("#dateStart").val();
			  	var endDate = $("#dateEnd").val();
				var sysNo = "${session}";
				var qstnTtl = $("#keyword").val();
			
				if(qstnTtl !== "") {
					qstnTtl = "%" + qstnTtl + "%";
				}

				let data = {startDate : startDate, endDate : endDate, qstnTtl : qstnTtl,
							range: range, sysNo : sysNo};
				
				$.ajax({
					url : '${pageContext.request.contextPath}/qna/'+sysNo+'/filter/1' ,
					method : "post",
					data : JSON.stringify(data),
					contentType: "application/json; charset=UTF-8",
					
					}).done((data) => {
						$("#qstnlist").html(data);
						resize();					
						
					});
			};
			
			function resize(){
				$(".qstnTtl").css({
			 		"width" : "360px",
					"overflow": "hidden",
					"text-overflow": "ellipsis",
					"display":"block"
			 	});
			};
			
			function writeQstn(){
				//qna작성하기
				$("#mainQstnMenu").removeClass("d-sm-flex");
				$("#mainQstnMenu").hide();
				$("#qstnMenu").show();
				$("#mainQstn").attr("class","col-lg-7");
				$("#miniView").attr("class","col-lg-5");
				resize();
				let sysNo = "${session}";
				
				$.ajax({
					url :"${pageContext.request.contextPath}/qna/"+sysNo+"/write",
					type : "GET",
					dataType : "html",
					success : function(data) {
						$('#miniView').html(data);
					}
				});
			};
			
		</script>
 		<%@include file="/WEB-INF/views/common/bottom.jsp" %>
	</body>
</html>
