<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
	  	<%@include file="/WEB-INF/views/common/head.jsp" %>
		
		<style>
			.srdTtl{
				width: 230px;
				overflow: hidden;
				text-overflow: ellipsis;
				display:block;
			}
			
			select option[disabled] {
          		display: none;
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
       					<div class="d-sm-flex align-items-end justify-content-between">
          					<div class="bg-primary px-3 py-2" style="border-top-left-radius:10px; border-top-right-radius:10px;">
            					<h6 class="mb-0 text-white">SR 개발관리</h6>
         					</div>
            				<ol class="breadcrumb">
              					<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/develop/list/1">SR 관리</a></li>
              					<li class="breadcrumb-item active" aria-current="page">SR 개발관리</li>
            				</ol>
          				</div>
		
         				<!-- Row -->
          				<div class="row text-right">
							<div class="col-lg-12">
	                    		<div class="card mb-4">
	                           		
	                           		<!-- 검색 -->
	                                <div class="mb-1 mt-5 px-3">
								    	<form class="navbar-search">
									    	<div class="row">
									        	<div class="col-sm-4">
									            	<div class="form-group row" id="simple-date4" >
												    	<div class="input-daterange input-group input-group-sm">
												        	<label for="start" class="col-sm-3 col-form-label-sm">조회기간</label>
										            		<input type="text" class="input-sm form-control form-control-sm col-sm-9" name="startDate" id="startDate" />
								                    		<div class="input-group-prepend">
								                    			<span class="input-group-text" style="height:31px;">~</span>
								                    		</div>
									                    	<input type="text" class="input-sm form-control form-control-sm" name="endDate" id="endDate"/>
											     		</div>
									            	</div>
									         	</div> 
						                		<div class="col-sm-3">
						                			<div class="form-group row">
						                				<label class="col-sm-3 col-form-label-sm">진행상태</label>
								                    	<select class="form-control form-control-sm col-sm-9 clear" id="sttsNo">
								                        	<option value="0" selected>전체</option>
								                        	<option value="4">접수</option>
								                        	<option value="9">개발 계획</option>
								                    	</select>
								                	</div>
						                		</div>
						                		<div class="col-sm-4">
						                			<div class="form-group row">
						                				<label for="exampleFormControlSelect1 sysNo" class="col-sm-3 col-form-label-sm">관련시스템</label>
								                    	<select class="form-control form-control-sm col-sm-9 clear" id="sysNo" >
								                        	<option value="all" selected>전체</option>
				                        					<c:forEach var="system" items="${developFilter.sysNmList}">		                        	
					                        					<option value="${system.sysNo}">${system.sysNm}</option>
				                        					</c:forEach>
								                    	</select>
								                	</div>
						                		</div>
					                			<div class="col-sm-1 text-left">
													<button class="btn btn-outline-warning btn-sm" type="button" onclick="searchClear()">
														초기화 
													</button>
						                		</div>
								           	</div>
						                	<div class="row text-right">
						                		<div class="col-sm-4">
						                			<div class="form-group row">
						                				<label for="exampleFormControlSelect1" class="col-sm-3 col-form-label-sm">등록자 소속</label>
								                    	<select class="form-control form-control-sm col-sm-9 clear" id="userOgdp">
								                        	<option value="all" selected>전체</option>
								                        	<c:forEach var="users" items="${developFilter.userOgdpList}">		                        	
							                        			<option value="${users.userOgdp}">${users.userOgdp}</option>
						                        			</c:forEach>
								                    	</select>
								                	</div>
						                		</div>
						                		<div class="col-sm-3">
						                			<div class="form-group row">
						                				<label for="exampleFormControlSelect1" class="col-sm-3 col-form-label-sm">개발부서</label>
								                    	<select class="form-control form-control-sm col-sm-9 clear" id="srDevDp">
								                        	<option value="all" selected>전체</option>
								                        	<c:forEach var="sr" items="${developFilter.srDevDpList}">		                        	
					                        					<option value="${sr.srDevDp}">${sr.srDevDp}</option>
				                        					</c:forEach>
								                    	</select>
								                	</div>
						                		</div>
						                		<div class="col-sm-4">
								                	<div class="form-group row">
								                		<label for="exampleFormControlSelect1" class="col-sm-3 col-form-label-sm">키워드</label>
								                    	<input type="text" class="form-control form-control-sm col-sm-9 bg-light" 
								                   		aria-label="Search" placeholder="검색어를 입력하세요" style="border-color: #3f51b5;" id="keyword">
								                  	</div>
						                		</div>
						                		<div class="col-sm-1 text-left">
													<button class="btn btn-primary btn-sm" type="button" onclick="developList(1)">
														조회 <i class="fas fa-search fa-sm"></i>
													</button>
						                		</div>
						                	</div>
				                		</form>
					               	</div>
					               	<hr/>
                                	<!-- 검색 -->
                                	
                            		<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
			                			<h5 class="m-0 font-weight-bold text-primary mb-1">SR 개발 목록</h5>
			                			<div class="d-sm-flex justify-content-end">
			                				<button class="btn btn-sm btn-primary" onclick="ExcelDownload()">엑셀 다운로드</button>
			                  			</div>
			                		</div>
			                		<div>
										<input type="hidden" id="userNo" value="${sessionScope.loginUser.userNo}">
										<input type="hidden" id="userType" name="userType" value="${sessionScope.loginUser.userType}">
										<div class="custom-control custom-switch px-5 ml-2" style="width:200px; border-radius:3px; background-color:#eaecf4;">
											<input type="checkbox" class="custom-control-input" id="searchMySR" onclick="developList(1)"/>
											<label class="custom-control-label" for="searchMySR">
												<span class="text-primary">담당 SR 조회 <i class="fas fa-search fa-sm mx-2"></i></span>
											</label>
										</div>
									</div>
									
			                		<div id="ajaxList" style="width:100%"></div>
                         		</div>
                         	</div>
           				</div>
           				<!-- row -->
					</div>	
					
					<!-- 엑셀 선택 모달 -->
					<div class="modal fade" id="ListExcelModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
						<div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable" role="document">
							<div class="modal-content">
								<div class="modal-header bg-primary">
									<h5 class="modal-title" id="exampleModalScrollableTitle">
							          	<img src="${pageContext.request.contextPath}/resources/images/logoOnly.png" style="width:20px;">
							        	<small class="text-white">
							        		<b>엑셀 다운로드</b>
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
					<!-- 액셀 선택 모달 -->
					
		         	<!-- 로그아웃 모달 -->
		           	<%@include file="/WEB-INF/views/common/logout.jsp" %>
		        </div>
       		<!---Container Fluid-->
       		<%@include file="/WEB-INF/views/common/footer.jsp" %>	
      		</div>
      	</div>
      	
		<script src="${pageContext.request.contextPath}/resources/js/developList.js"></script>
 		<%@include file="/WEB-INF/views/common/bottom.jsp" %>
	</body>
</html>
