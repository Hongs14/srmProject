<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				width: 400px;
				overflow: hidden;
				text-overflow: ellipsis;
				display:block;
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
			
			        <!-- 메인 컨테이너 Container Fluid-->
					<div class="container-fluid" id="container-wrapper">
			        	<div class="d-sm-flex align-items-end justify-content-between">
          					<div class="bg-primary px-3 py-2" style="border-top-left-radius:10px; border-top-right-radius:10px;">
            					<h6 class="mb-0 text-white">Q&A 게시판</h6>
         					</div>
            				<ol class="breadcrumb">
              					<li class="breadcrumb-item">Q&A</li>
              					<li class="breadcrumb-item active" aria-current="page">목록보기</li>
            				</ol>
          				</div>
			         	<!-- Row -->
			         	<div class="row">
							<div id="mainQstn" class="col-lg-12">
								<div class="bg-primary px-3 py-2" style="border-top-left-radius:10px; border-top-right-radius:10px; width:121px; display:none;"  id="qstnMenu">
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
			         										<input type="text" class="input-sm form-control form-control-sm col-sm-8" name="start" id="dateStart"/>
			               									<div class="input-group-prepend">
			               										<span class="input-group-text" style="height:31px;">~</span>
			           										</div>
			            									<input type="text" class="input-sm form-control form-control-sm" name="end" id="dateEnd"/>
														</div>
			   										</div>
												</div> 
			    								<div class="col-3 text-left">
														<input type="button" class="btn btn-sm btn-primary" value="당일" onclick="nTodayClick(1)">
														<input type="button" class="btn btn-sm btn-primary" value="1주일 전" onclick="nWeekClick(1)">
														<input type="button" class="btn btn-sm btn-primary" value="1개월 전" onclick="nMonthClick(1)">
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
			                				<a href="${pageContext.request.contextPath}/qna/write" class="btn-outline-primary btn-sm">Q&A 등록하기</a>
			                  			</div>
			                		</div> 
			                		<div id="qstnlist" style="width: 100%;"></div>
			                	</div>
					        </div>
					   		<div id="qnaDetailView" style="width: 100%;"></div>
			        	</div> 
						<!-- Row -->
						
			         	<!-- 로그아웃 모달 -->
			           	<%@include file="/WEB-INF/views/common/logout.jsp" %>
					</div>
			        <!---Container Fluid-->
				</div>
			</div>
		</div>
		<script>
			$(document).ready(function () {
				console.log("시작");
				var startDate = $('#dateStart').val;
				var endDate = $('#dateEnd').val;
				
				var sysNo = "${sessionScope.loginUser.sysNo}";
				
				var qstnTtl = $('#keyword').val;
				
				if(qstnTtl !== "") {
					qstnTtl = "%" + qstnTtl + "%";
				}
				
				let data = {startDate : startDate, endDate : endDate, qstnTtl : qstnTtl, sysNo : sysNo};
				
				console.log(data);
				
				$.ajax({
					url : "filter/1",
					method : "post",
					data : JSON.stringify(data),
					contentType: "application/json; charset=UTF-8"
				}).done((data) => {
					$("#qstnlist").html(data)
				});
			});
			
			function getQnaDetail(i) {
				let qstnNo = i;
				$("#mainQstnMenu").removeClass("d-sm-flex");
				$("#mainQstnMenu").hide();
				$("#QstnMenu").show();
				$("#mainQstn").attr("class","col-lg-7");
				$("#qnaDetailView").attr("class","col-lg-5");
				
				$.ajax({
					url : "detail/"+qstnNo,
					method : "get",
					dataType : "html",
					success : function(data) {
						$("#qnaDetailView").html(data);
					}
				});
			}
		</script>
 		<%@include file="/WEB-INF/views/common/bottom.jsp" %>
	</body>
</html>
