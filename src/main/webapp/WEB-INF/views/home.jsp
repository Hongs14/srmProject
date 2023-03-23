<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
	<html>

	<head>
	<c:if test="${sessionScope.loginUser.userType eq '관리자'}">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/managerMiniView.css">
	</c:if>
	<c:if test="${sessionScope.loginUser.userType eq '개발자'}">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/devMiniView.css">
	</c:if>
	<style>
	.nav-link {
		cursor: pointer;
	}
	</style>
		<%@include file="/WEB-INF/views/common/head.jsp" %>
	  	<style>
	  		.srTtl {
	  			width : 190px;
	  			overflow : hidden;
	  			text-overflow : ellipsis;
	  			display : block;
	  		}
	  		.graph_container{
			  display:block;
			  width:800px;
			  margin-left: 30px;
			  height: 250px;
			}
			.gantt-grid-cols .row{
				white-space: normal;
			}
			.row {
				white-space: normal;
			}
	
			.on {
				background-color: rgba(0, 0, 0, 0.075);
			}
			.subtab{
					display: block;
				}
			@media (max-width:1600px) {
				.subtab{
					display: none;
				}
			}
			
	    </style>
	  	
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
	          
	          			<!-- Row -->
			          	<div class="row">
				     		<div class="col-xl-8 col-lg-7 mb-4" style="min-width:700px;">
			              		<div class="card">
			               			<div class="card-header align-items-center">
										<i class="fas fa-tasks fa-fw"></i> 
										<span class="m-0 font-weight-bold text-primary">My SR </span>
									</div>
			             			<div id="tabs" class="mx-3">
										<ul class="nav nav-tabs" role="tablist">
											<li class="nav-item" role="presentation">
												<a class="nav-link active" data-toggle="pill" onclick="homeMiniViewChange(0, 1)">전체</a>
											</li>
											<li class="nav-item" role="presentation">
												<a class="nav-link" data-toggle="pill" onclick="homeMiniViewChange(1, 1)">요청</a>
											</li>
											<li class="nav-item" role="presentation">
												<a class="nav-link" data-toggle="pill" onclick="homeMiniViewChange(2, 1)">검토중</a>
											</li>
											<li class="nav-item" role="presentation">
												<a class="nav-link" data-toggle="pill" onclick="homeMiniViewChange(4, 1)">접수</a>
											</li>
											<li class="nav-item" role="presentation">
												<a class="nav-link" data-toggle="pill" onclick="homeMiniViewChange(5, 1)">개발중</a>
											</li>
											<li class="nav-item" role="presentation">
												<a class="nav-link" data-toggle="pill" onclick="homeMiniViewChange(8, 1)">완료요청</a>
											</li>
											<li class="nav-item" role="presentation">
												<a class="nav-link" data-toggle="pill" onclick="homeMiniViewChange(6, 1)">개발완료</a>
											</li>
											<li class="nav-item subtab" role="presentation">
												<a class="nav-link" data-toggle="pill" onclick="homeMiniViewChange(3, 1)">반려</a>
											</li>
											<li class="nav-item subtab" role="presentation">
												<a class="nav-link" data-toggle="pill" onclick="homeMiniViewChange(7, 1)">재검토</a>
											</li>
											<li class="nav-item subtab" role="presentation">
												<a class="nav-link" data-toggle="pill" onclick="homeMiniViewChange(9, 1)">개발 계획</a>
											</li>
											<li class="nav-item subtab" role="presentation">
												<a class="nav-link" data-toggle="pill" onclick="homeMiniViewChange(10, 1)">계획 조정</a>
											</li>
										</ul>
									
										<script>
											$(document).ready(function (){
												var sttsNo = 0;
												var pageNo = 1;
												
												let data = {stssNo : sttsNo, pageNo : pageNo};
												
												$.ajax({
													url : "homeMiniView",
													method : "post",
													data : JSON.stringify(data),
													contentType: "application/json; charset=UTF-8"
												}).done((data) => {
													$("#homeMiniView").html(data);
												});
												
												$.ajax({
													url : "${pageContext.request.contextPath}/systemMiniView",
													type : "GET",
													datatype : "html",
													success : function(data){
														$('#systemMiniView').html(data);
													}
												});
												
												var srNo = '${firstSrNo}';
												data = {srNo : srNo}
												
												$.ajax({
													url : "managerMiniView",
													method : "post",
													data : JSON.stringify(data),
													contentType: "application/json; charset=UTF-8"
												}).done((data) => {
													$('#managerMiniView').html(data);
													$("#managerMiniViewDetail").show();
													var bg = "bg-" + srNo;
													$('#' + bg).addClass("on");
												})
												
												$.ajax({
													url : "devMiniView",
													method : "post",
													data : JSON.stringify(data),
													contentType: "application/json; charset=UTF-8"
												}).done((data) => {
													$('#devMiniView').html(data);
													$("#devPlanDetail").show();
													var bg = "bg-" + srNo;
													$('#' + bg).addClass("on");
												})
												
											});
											
											function homeMiniViewChange(sttsNo, pageNo) {
												let data = {sttsNo : sttsNo, pageNo : pageNo};
												
												$.ajax({
													url : "homeMiniView",
													method : "post",
													data : JSON.stringify(data),
													contentType: "application/json; charset=UTF-8"
												}).done((data) => {
													$("#homeMiniView").html(data)
												});
											};
											
										</script>
									
										<div id="homeMiniView"></div>
									</div>
			              		</div>
			            	</div>
			            <div class="col-xl-4 col-lg-5 " id="systemMiniView"></div>
					</div>
	        		<div class="row mb-5">
						<c:if test="${sessionScope.loginUser.userType eq '고객사'}">
							<div class="col-xl-6 col-lg-6 ">
				            	<div class="card p-3">
				                	<div class="card-header align-items-center">
				                  		<h6 class="font-weight-bold text-primary"><i class="fas fa-fw fa-columns"></i> Notice </h6>
				                	</div>
				                	<div class="table-responsive">
				                  		<table class="table border mb-3">
				                    		<thead class="thead-light">
						                     	<tr>
						                        	<th>글번호 </th>
						                        	<th>제목 </th>
						                        	<th>작성자 </th>
						                        	<th>작성일 </th>
						                        	<th>상세보기 </th>
						                      	</tr>
				                    		</thead>
				                    		<tbody>
				                    			<c:choose>
				                    				<c:when test="${fn:length(noticeList) == 0 }">
				                    					<tr>
				                    						<td colspan="5" class="text-center">해당 공지사항이 없습니다.</td>
				                    					</tr>
					                    			</c:when>
					                    			<c:otherwise>	                    		
							                    		<c:forEach var="list" items="${noticeList}" end="4">
								                      		<tr>
										                        <td>${list.seq}</td>
										                        <td>${list.ntcTtl} </td>
										                        <td>${list.userId}</td>
										                        <td>${list.ntcWrtDate}</td>
										                        <td><a href="${pageContext.request.contextPath}/notice/list/${list.ntcNo}?sysNo=${list.sysNo}" class="btn btn-sm btn-primary">상세</a></td>
								                      		</tr>
							                      		</c:forEach>
					                    			</c:otherwise>
				                    			</c:choose>
				                      		</tbody>
				                    	</table>
					              	</div>
					           	</div>
				          	</div>
				          	
				          	<div class="col-xl-6 col-lg-6 ">
				          		<div class="card p-3">
				                	<div class="card-header align-items-center">
				                  		<h6 class="font-weight-bold text-primary"><i class="fas fa-fw fa-sticky-note"></i>QnA </h6>
				                	</div>
				                	<div class="table-responsive">
				                  		<table class="table border mb-3">
				                    		<thead class="thead-light">
						                     	<tr>
						                        	<th>글번호 </th>
						                        	<th>제목 </th>
						                        	<th>작성자 </th>
						                        	<th>작성일 </th>
						                        	<th>상세보기 </th>
						                      	</tr>
				                    		</thead>
				                    		<tbody>
				                    			<c:choose>
				                    				<c:when test="${fn:length(qstnList) == 0 }">
				                    					<tr>
				                    						<td colspan="5" class="text-center">해당 Q&A가 없습니다.</td>
				                    					</tr>
					                    			</c:when>
					                    			<c:otherwise>
							                    		<c:forEach var="qlist" items="${qstnList}" end="4">
							                      			<tr>
										                        <td>${qlist.rnum}</td>
										                        <td><c:if test="${qlist.qstnSecret eq 'Y'}"><i style="color:orange" class="mr-2 fa-solid fa-lock"></i></c:if>${qlist.qstnTtl}</td>
										                        <td>${qlist.userNm}</td>
										                       	<td>${qlist.qstnWrtDate}</td>
										                      								                      			
								                      			<c:choose>
								                      				<c:when test="${qlist.qstnSecret eq 'Y'}">
								                      					<c:if test="${qlist.userNm eq sessionScope.loginUser.userNm}">
								                      						<td><a href="${pageContext.request.contextPath}/qna/${sessionScope.loginUser.sysNo}/list/${qlist.qstnNo}" class="btn btn-sm btn-primary">상세</a></td>
								                      					</c:if>
								                      				</c:when>
								                      				<c:otherwise>
								                      					<td><a href="${pageContext.request.contextPath}/qna/${sessionScope.loginUser.sysNo}/list/${qlist.qstnNo}" class="btn btn-sm btn-primary">상세</a></td>
								                      				</c:otherwise>
								                      			</c:choose>
								                      			
								                      		</tr>
							                      		 </c:forEach>
					                    			</c:otherwise>
				                    			</c:choose>
				                      		</tbody>
				                    	</table>
					              	</div>
					            </div>
				          	</div>
			          	</c:if>
	          	
			          	<c:if test="${sessionScope.loginUser.userType eq '개발자'}">
			          		<div class="col-12">
			          			<div id="devMiniView"></div>
			                </div>
			          	</c:if>
			          	<c:if test="${sessionScope.loginUser.userType eq '관리자'}">
			          		<div class="col-12">
			          			<div id="managerMiniView"></div>
			                </div>
			          	</c:if>
					</div>
	        		<!-- Row -->
				
	        		<!-- 로그아웃 모달 -->
	       			 <%@include file="/WEB-INF/views/common/logout.jsp" %>
					</div>
	    		<!---Container Fluid-->
	   			</div>
	    		<%@include file="/WEB-INF/views/common/footer.jsp" %>
			</div>
	    	<!-- Footer -->
		</div>
	<%@include file="/WEB-INF/views/common/bottom.jsp" %>
	</body>
</html>