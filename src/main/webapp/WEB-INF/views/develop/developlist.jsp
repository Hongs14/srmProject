<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
	  	<%@include file="/WEB-INF/views/common/head.jsp" %>
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
        
         				<div class="d-sm-flex align-items-center justify-content-between mb-4">
            				<h1 class="h3 mb-0 text-gray-800">SR개발관리</h1>
            				<ol class="breadcrumb">
              					<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Main </a></li>
              					<li class="breadcrumb-item active" aria-current="page">개발관리</li>
           					</ol>
          				</div>
		
         				<!-- Row -->
          				<div>
							<div class="qnacontent mx-3 my-0">
					         	<!-- table -->
						    	<div class="col-lg-12">
	                          		<div class="card mb-4  p-3">
	                                	<div class="mb-4"><h6 class="m-0 font-weight-bold text-primary">SR개발목록</h6></div>
	                                    <!-- 검색 -->
	                                    <div>
	                                    <form>
		                                    <div class="row">
						                		<div class="col-6">조회기간
						                			<div class="form-group" id="simple-date4">
									                	<div class="input-daterange input-group">
									                    	<input type="text" class="input-sm form-control" name="start" />
									                    	<div class="input-group-prepend">
									                    		<span class="input-group-text" style="background-color: #406882">~</span>
									                    	</div>
									                    	<input type="text" class="input-sm form-control" name="end" />
									                    </div>
									            	</div>
						                		</div>
						                		<div class="col-6">
						                			<div class="row">
							                			<div class="col-6">관련시스템
								                			<div class="form-group">
										                    	<select class="form-control" id="exampleFormControlSelect1">
										                        	<option></option>
										                        	<option>KHR</option>
										                        	<option>KTH</option>
										                        	<option>JHJ</option>
										                        	<option>HGH</option>
										                    	</select>
										                	</div>
							                			</div>
								                		<div class="col-6">진행상태
								                			<div class="form-group">
										                    	<select class="form-control" id="exampleFormControlSelect1">
										                        	<option></option>
										                        	<option>검토중</option>
										                        	<option>요청</option>
										                    	</select>
										                	</div>
								                		</div>
							                		</div>
						                		</div>
	                						</div>
	                						
	                						<div class="row">
	                							<div class="col-6">
	                								<div class="row">
		                								<div class="col-6">등록자 소속
								                			<div class="form-group">
										                    	<select class="form-control" id="exampleFormControlSelect1">
										                        	<option></option>
										                        	<option>KHR</option>
										                        	<option>KTH</option>
										                        	<option>JHJ</option>
										                        	<option>HGH</option>
										                    	</select>
										                	</div>
							                			</div>
								                		<div class="col-6">개발 부서
								                			<div class="form-group">
										                    	<select class="form-control" id="exampleFormControlSelect1">
										                        	<option></option>
										                        	<option>KHR</option>
										                        	<option>KTH</option>
										                        	<option>JHJ</option>
										                        	<option>HGH</option>
										                    	</select>
										                	</div>
								                		</div>
							                		</div>
	                							</div>
	                							<div class="col-6">
	                								<div class="d-sm-flex align-items-center justify-content-between">
		                								<div class="col-9">키워드
								                			<div class="row">
									                			<div class="col-4 m-0 p-0">
									                				<select class="form-control">
									                					<option></option>
									                					<option>제목</option>
									                					<option>소속</option>
									                				</select>
									                			</div>
									                			<div class="col-8 px-1">
									                				<div class="input-group">
												                    	<input type="text" class="form-control bg-light border-1 small" aria-label="Search" aria-describedby="basic-addon2" style="border-color: #3f51b5;">
												             	  	</div>
									                			</div>
									                		</div>
							                			</div>
							                			<div class="col-3">   
								                			<div class="mt-4 text-right">
									                			<button class="btn btn-primary" type="button">
											                       <i class="fas fa-search fa-sm"> &nbsp; 검색하기</i>
											                    </button>
											                </div> 
							                			</div>
						                			</div>
	                							</div> 
						                	</div>
						                </form>
					               		</div>
	                                    <!-- 검색 -->
	                                   
	                                   	<!-- 테이블 -->
	                                   	<div class="table-responsive p-3">
						                	<table class="table align-items-center table-flush">
						                    	<thead class="thead-light">
								                	<tr>
								                    	<th>요청번호</th>
								                        <th>제목</th>
								                        <th>관련시스템</th>
								                        <th>등록자</th>
								                        <th>소속</th>
								                        <th>개발부서</th>
								                        <th>상태</th>
								                        <th>등록일</th>
								                        <th>완료예정일</th>
								                        <th>중요도</th>
								                        <th>상세보기</th>
								                    </tr>
						                   		</thead>
						                   		<tbody>
						                   			<c:forEach items="${developlist}" var="SrDevelopDto">
						                   			<tr>
						                        		<td>${SrDevelopDto.srNo}</td>
								                        <td>${SrDevelopDto.srTtl}</td>
								                        <td>${SrDevelopDto.sysNo}</td>
								                        <td>${SrDevelopDto.userNm}</td>
								                        <td>${SrDevelopDto.userOgdp}</td>
								                        <td>${SrDevelopDto.userDpNm }</td>
								                        <td>${SrDevelopDto.sttsNo}</td>
								                        <td>${SrDevelopDto.srRegDate}</td>
								                        <td>${SrDevelopDto.srDdlnDate}</td>
								                        <td>${SrDevelopDto.srPry}</td>
								                        <td><button class="btn btn-sm btn-primary" onclick="location.href='${pageContext.request.contextPath}/develop/detail'">보기</button></td>
							                     	</tr>
							                     	</c:forEach>
						                 		</tbody>
						                  	</table>
						                </div>
	                                   	<!-- 테이블 -->
	                                   	<div class="text-center">
		                                   	<a class="btn btn-outline-primary btn-sm" href="list?pageNo=1">처음</a>
												<c:if test="${pager.groupNo>1}">
													<a class="btn btn-outline-info btn-sm" href="list?pageNo=${pager.startPageNo-1}">이전</a>
												</c:if>
	
												<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
													<c:if test="${pager.pageNo != i}">
														<a class="btn btn-outline-secondary btn-sm" href="list?pageNo=${i}">${i}</a>
													</c:if>
													<c:if test="${pager.pageNo == i}">
														<a class="btn btn-warning btn-sm" href="list?pageNo=${i}">${i}</a>
													</c:if>
												</c:forEach>
	
												<c:if test="${pager.groupNo<pager.totalGroupNo}">
													<a class="btn btn-outline-info btn-sm" href="list?pageNo=${pager.endPageNo+1}">다음</a>
												</c:if>
												<a class="btn btn-outline-primary btn-sm" href="list?pageNo=${pager.totalPageNo}">맨끝</a>
	                                	</div>
	                          		</div>
	                          	</div>
	                    	</div>
						</div>
						
				        <!-- Row -->
				         
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
