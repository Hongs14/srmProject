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
   				<div class="d-sm-flex align-items-end justify-content-between">
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
					<div class="col-lg-12">
               			<div class="card mb-4">
                  			<!-- 검색 -->
            				<div class="mb-1 mt-5 px-5">
								<div class="row">
   									<div class="col-4">
       									<div class="form-group row" id="simple-date4" >
  											<div class="input-daterange input-group input-group-sm">
      											<label for="start" class="col-sm-3 col-form-label-sm">조회기간</label>
         										<input type="text" class="input-sm form-control form-control-sm col-sm-9" name="start" />
               									<div class="input-group-prepend">
               										<span class="input-group-text" style="height:31px;">~</span>
           										</div>
            									<input type="text" class="input-sm form-control form-control-sm" name="end" />
											</div>
   										</div>
									</div> 
    								<div class="col-3"></div>
    								<div class="col-4">
      									<div class="form-group row">
								      		<label for="exampleFormControlSelect1" class="col-sm-3 col-form-label-sm">키워드</label>
								          	<input type="text" class="form-control form-control-sm col-sm-9 bg-light" 
	         									aria-label="Search" placeholder="검색어를 입력하세요" style="border-color: #3f51b5;">
            							</div>
        							</div>
        							<div class="col-1">
        								<div class="input-group-append float-right">
												<button class="btn btn-primary btn-sm" type="button" onclick="#">조회 <i class="fas fa-search fa-sm"></i>
											</button>
										</div>
         							</div>
         						</div>
        					</div>
        					<hr/>
    
						    <!-- 공지사항 목록 -->
							<div class="d-sm-flex justify-content-end">
								<a href="${pageContext.request.contextPath}/notice/write" class="btn btn-sm btn-secondary mr-3">글작성</a>
							</div>
							<div class="table-responsive p-3">
								<table class="table align-items-center table-flush table-hover">
								    <thead class="thead-light">
									    <tr>
								      		<th>카테고리</th>
								      		<th>글번호</th>
								      		<th>글제목</th>
								      		<th>작성자</th>
								      		<th>작성일</th>
								      		<th>조회수</th>
									    </tr>
								    </thead>
									<tbody>
   										<c:forEach var="notice" items="${noticeList}">
											<tr onclick="location.href='${pageContext.request.contextPath}/notice/detail?ntcNo=${notice.ntcNo}'" style="cursor:pointer;">
											<td>공지사항</td>
											<td>${notice.ntcNo}</td>
											<td>${notice.ntcTtl}</td>
											<td>${notice.userId}</td>
											<td>${notice.ntcWrtDate}</td>
											<td>${notice.ntcInqCnt}</td>
											</tr>
										</c:forEach>
            							<tr>
											<td colspan="6" class="text-center">
												<div>
													<a class="btn btn-outline-primary btn-sm" href="list?pageNo=1">처음</a>
													<c:if test="${pager.groupNo>1}">
														<a class="btn btn-outline-info btn-sm" href="list?pageNo=${pager.startPageNo-1}">이전</a>
													</c:if>

													<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
														<c:if test="${pager.pageNo != i}">
															<a class="btn btn-outline-success btn-sm" href="list?pageNo=${i}">${i}</a>
														</c:if>
														<c:if test="${pager.pageNo == i}">
															<a class="btn btn-danger btn-sm" href="list?pageNo=${i}">${i}</a>
														</c:if>
													</c:forEach>

													<c:if test="${pager.groupNo<pager.totalGroupNo}">
														<a class="btn btn-outline-info btn-sm" href="list?pageNo=${pager.endPageNo+1}">다음</a>
													</c:if>
													<a class="btn btn-outline-primary btn-sm" href="list?pageNo=${pager.totalPageNo}">맨끝</a>
												</div>
											</td>
										</tr>
            						</tbody>
            					</table>
          					</div>
        				</div>
					</div>
				</div>
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
