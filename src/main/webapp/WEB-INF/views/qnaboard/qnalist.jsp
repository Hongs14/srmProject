<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
							<div class="col-lg-12">
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
															<button class="btn btn-primary btn-sm" type="button" onclick="searchNoticeList(1)">조회 <i class="fas fa-search fa-sm"></i>
														</button>
													</div>
			         							</div>
			         						</div>
										</form>
		        					</div>
					               	<hr/>
	                        		<!-- 검색 -->
						         	
						            <div class="card-header px-5 d-flex flex-row align-items-center justify-content-between">
			                			<h6 class="m-0 font-weight-bold text-primary">질문 목록</h6>
			                			<div class="d-sm-flex justify-content-end">
			                				<a href="${pageContext.request.contextPath}/qna/write" class="btn btn-outline-primary">Q&A 등록하기</a>
			                  			</div>
			                		</div> 
			                		
			                		<!-- 테이블 -->
			                		<div class="table-responsive px-5">
					               		<table class="table align-items-center table-flush">
					                    	<thead class="thead-light">
							                	<tr>
							                    	<th class="col-1">번호</th>
							                        <th class="col-3">글제목</th>
							                        <th class="col-2">작성자</th>
							                        <th class="col-2">작성일</th>
							                        <th class="col-1">조회수</th>
							                        <th class="col-1">댓글수</th>
							                    </tr>
					                   		</thead>
					                   		<tbody>
					                   			<c:forEach var="QnaboardDto" items="${qnalist}">
						                   			<tr onclick="location.href='${pageContext.request.contextPath}/qna/view?qstnNo=${QnaboardDto.qstnNo}'">
						                        		<td class="1">${QnaboardDto.qstnNo}</td>
								                        <td class="3" class="qstnTtl">${QnaboardDto.qstnTtl}</td>
								                        <td class="2">${QnaboardDto.userNm}</td>
								                        <td class="2">${QnaboardDto.qstnWrtDate}</td>
								                        <td class="1 pl-4">${QnaboardDto.qstnInqCnt}</td>
								                        <td class="1 pl-4">${QnaboardDto.countCmnt}</td>
						                     		</tr>
					                     		</c:forEach>
					                 		</tbody>
					                  	</table>
					                  	<!-- table -->
						           	</div>
						            
						            <c:if test="${pager.totalRows != 0}">
										<div class="pager d-flex justify-content-center my-3">
											<div class="pagingButtonSet d-flex justify-content-center">
												<c:if test="${pager.pageNo > 1}">
													<a href='<c:url value="/qna/list?pageNo=1"/>' type="button" class="btn btn-outline-primary btn-sm m-1">처음</a>
												</c:if>
												<c:if test="${pager.groupNo > 1}">
													<a href='<c:url value="/qna/list?pageNo=${pager.startPageNo-1}"/>' type="button" class="btn btn-outline-info btn-sm m-1">이전</a>
												</c:if>
								
												<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
													<c:if test="${pager.pageNo != i}">
														<a href='<c:url value="/qna/list?pageNo=${i}"/>' type="button" class="btn btn-outline-success btn-sm m-1">${i}</a>
													</c:if>
													<c:if test="${pager.pageNo == i}">
														<a href='<c:url value="/qna/list?pageNo=${i}"/>' type="button" class="btn btn-primary btn-sm m-1">${i}</a>
													</c:if>
												</c:forEach>
								
												<c:if test="${pager.groupNo < pager.totalGroupNo }">
													<a href='<c:url value="/qna/list?pageNo=${pager.endPageNo+1}"/>' type="button" class="btn btn-outline-info btn-sm m-1">다음</a>
								
												</c:if>
												<c:if test="${pager.pageNo < pager.totalPageNo }">
													<a href='<c:url value="/qna/list?pageNo=${pager.totalPageNo}"/>' type="button" class="btn btn-outline-primary btn-sm m-1">맨끝</a>
												</c:if>
											</div>
										</div>
									</c:if>
						            
					            </div>
					    	</div>  
			        	</div> 
						<!-- Row -->
						
			         	<!-- 로그아웃 모달 -->
			           	<%@include file="/WEB-INF/views/common/logout.jsp" %>
					</div>
			        <!---Container Fluid-->
				</div>
			</div>
		</div>
 		<%@include file="/WEB-INF/views/common/bottom.jsp" %>
	</body>
</html>
