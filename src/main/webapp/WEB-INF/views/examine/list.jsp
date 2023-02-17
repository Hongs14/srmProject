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
		                						<label class="col-sm-3 col-form-label-sm">진행상태</label>
				                    			<select class="form-control form-control-sm col-sm-9" id="exampleFormControlSelect1" id="srSttsNo">
				                        			<option value="0">전체</option>
				                        			<c:forEach var="status" items="${examineFilter.srSttsList}">		                        	
					                        			<option value="${status.sttsNo}">${status.sttsNm}</option>
				                        			</c:forEach>
				                    			</select>
				                			</div>
		                				</div>
		                				<div class="col-4">
		                					<div class="form-group row">
		                						<label for="exampleFormControlSelect1 sysNo" class="col-sm-3 col-form-label-sm">관련시스템</label>
				                    			<select class="form-control form-control-sm col-sm-9" id="exampleFormControlSelect1" id="sysNo">
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
				                    			<select class="form-control form-control-sm col-sm-9" id="exampleFormControlSelect1" id="userOgdp">
				                        			<option value="0">전체</option>
				                        			<c:forEach var="users" items="${examineFilter.userOgdpList}">		                        	
					                        			<option value="${users.userNo}">${users.userOgdp}</option>
				                        			</c:forEach>
				                    			</select>
				                			</div>
		                				</div>
		                				<div class="col-3">
		                					<div class="form-group row">
		                						<label for="exampleFormControlSelect1" class="col-sm-3 col-form-label-sm">부서</label>
				                    			<select class="form-control form-control-sm col-sm-9" id="exampleFormControlSelect1" id="userDp">
				                        			<option value="0">전체</option>
				                        			<c:forEach var="users" items="${examineFilter.userDpList}">		                        	
					                        			<option  value="${users.userNo}">${users.userDpNm}</option>
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
												<button class="btn btn-primary btn-sm" type="button" onclick="examineList()" >조회 <i class="fas fa-search fa-sm"></i></button>
											</div>
		                				</div>
		                				<script>
											/* $(document).ready(function () {
												console.log("시작");
												
												$.ajax({
													url : "filter?pageNo=${pageNo}",
													method : "get",
													success : function(result){ 
														console.log(result);
														$("#examineAjaxList tbody").append(
																"<tr>" +
																"	<td>"+result.srNo+"</td>" +
																"	<td>"+result.srTtl+"</td>" +
																"	<td>"+result.sysNm+"</td>" +
																"</tr>"
														);
														
													}
												})
											}); */
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
				           		<div class="table-responsive p-3" id="examineAjaxList">
								<table class="table align-items-center table-flush table-hover border" id="dataTableHover">
			                    <thead class="thead-light">
			                      <tr>
			                        <th class="pr-0">
				                        <div class="custom-control custom-checkbox">
				                   			<input type="checkbox" class="custom-control-input" id="customCheck1">
				                   			<label class="custom-control-label" for="customCheck1"></label>
				                 		</div>
			                        </th>
			                        <th>요청번호 </th>
			                        <th>제목 </th>
			                        <th>관련시스템 </th>
			                        <th>등록자 </th>
			                        <th>소속 </th>
			                        <th>개발부서 </th>
			                        <th>상태 </th>
			                        <th>등록일 </th>
			                        <th>완료예정일 </th>
			                        <th>중요도 </th>
			                      </tr>
			                    </thead>
			                    
			                    <tbody>
			                    <tr>
			                    	<td class="pr-0">
				                        <div class="custom-control custom-checkbox">
				                   			<input type="checkbox" class="custom-control-input" id="customCheck5">
				                   			<label class="custom-control-label" for="customCheck5"></label>
				                 		</div>
			                        </td>
			                        <td>JHJ-SR-0001</td>
			                        <td class="requsetTtl"><a href="detail/1">댓글 기능 추가 부탁드립니다.~~~~~~~~~~~~~~~~~~`</a></td>
			                        <td>JHJ쇼핑몰</td>
			                        <td>정홍주 </td>
			                        <td>관리팀 </td>
			                        <td>미배정 </td>
			                        <td>미검토 </td>
			                        <td>2023/02/09 </td>
			                        <td>2023/04/08 </td>
			                        <td>상 </td>
			                      </tr>
			                      <tr>
			                      	<td class="pr-0">
				                        <div class="custom-control custom-checkbox">
				                   			<input type="checkbox" class="custom-control-input" id="customCheck2">
				                   			<label class="custom-control-label" for="customCheck2"></label>
				                 		</div>
			                        </td>
			                        <td>JHJ-SR-0002</td>
			                        <td>게시 기능 추가 부탁드립니다.</td>
			                        <td>JHJ쇼핑몰</td>
			                        <td>문지연</td>
			                        <td>관리팀 </td>
			                        <td>미배정 </td>
			                        <td>미검토 </td>
			                        <td>2023/02/09 </td>
			                        <td>2023/04/08 </td>
			                        <td>하 </td>
			                      </tr>
			                      <tr>
			                      	<td class="pr-0">
				                        <div class="custom-control custom-checkbox">
				                   			<input type="checkbox" class="custom-control-input" id="customCheck3">
				                   			<label class="custom-control-label" for="customCheck3"></label>
				                 		</div>
			                        </td>
			                        <td>JHJ-SR-0003</td>
			                        <td>알림 기능 추가 부탁드립니다.</td>
			                        <td>JHJ쇼핑몰</td>
			                        <td>김주하 </td>
			                        <td>관리팀 </td>
			                        <td>미배정 </td>
			                        <td>미검토 </td>
			                        <td>2023/02/01 </td>
			                        <td>2023/04/11 </td>
			                        <td>중 </td>
			                      </tr>
			                      <tr>
			                      	<td class="pr-0">
				                        <div class="custom-control custom-checkbox">
				                   			<input type="checkbox" class="custom-control-input" id="customCheck4">
				                   			<label class="custom-control-label" for="customCheck4"></label>
				                 		</div>
			                        </td>
			                        <td>JHJ-SR-0004</td>
			                        <td>댓글/검색 기능 보완 부탁드립니다.</td>
			                        <td>JHJ쇼핑몰</td>
			                        <td>정지혜 </td>
			                        <td>관리팀 </td>
			                        <td>미배정 </td>
			                        <td>미검토 </td>
			                        <td>2023/02/09 </td>
			                        <td>2023/04/08 </td>
			                        <td>상 </td>
			                      </tr>
			                    </tbody>
			                  </table>
			                  <div class="pager d-flex justify-content-center my-4">
									<div class="pagingButtonSet d-flex justify-content-center">
										<c:if test="${pager.pageNo > 1}">
											<a onclick="requestList(1)" type="button" class="btn btn-outline-primary btn-sm m-1">처음</a>
										</c:if>
										<c:if test="${pager.groupNo > 1}">
											<a onclick="requestList(${pager.startPageNo-1})" type="button" class="btn btn-outline-info btn-sm m-1">이전</a>
										</c:if>
						
										<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
											<c:if test="${pager.pageNo != i}">
												<a onclick="requestList(${i})" type="button" class="btn btn-outline-success btn-sm m-1">${i}</a>
											</c:if>
											<c:if test="${pager.pageNo == i}">
												<a onclick="requestList(${i})" type="button" class="btn btn-primary btn-sm m-1 text-white">${i}</a>
											</c:if>
										</c:forEach>
						
										<c:if test="${pager.groupNo < pager.totalGroupNo }">
											<a onclick="requestList(${pager.endPageNo+1})" type="button" class="btn btn-outline-info btn-sm m-1">다음</a>
						
										</c:if>
										<c:if test="${pager.pageNo < pager.totalPageNo }">
											<a onclick="requestList(${pager.totalPageNo})" type="button" class="btn btn-outline-primary btn-sm m-1">맨끝</a>
										</c:if>
									</div>
								</div>
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
