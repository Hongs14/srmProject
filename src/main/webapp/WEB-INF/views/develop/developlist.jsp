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
       					<div class="d-sm-flex align-items-end justify-content-between">
          					<div class="bg-primary px-3 py-2" style="border-top-left-radius:10px; border-top-right-radius:10px;">
            					<h6 class="mb-0 text-white">SR 개발관리</h6>
         					</div>
            				<ol class="breadcrumb">
              					<li class="breadcrumb-item">SR 관리</li>
              					<li class="breadcrumb-item active" aria-current="page">SR 개발관리</li>
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
									        	<div class="col-sm-4">
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
						                		<div class="col-sm-3">
						                			<div class="form-group row">
						                				<label class="col-sm-3 col-form-label-sm">진행상태</label>
								                    	<select class="form-control form-control-sm col-sm-9" id="exampleFormControlSelect1">
								                        	<option selected>전체</option>
								                        	<option>요청</option>
								                        	<option>검토중</option>
								                        	<option>접수</option>
								                        	<option>개발중</option>
								                        	<option>개발완료</option>
								                        	<option>재검토</option>
								                    	</select>
								                	</div>
						                		</div>
						                		<div class="col-sm-4">
						                			<div class="form-group row">
						                				<label for="exampleFormControlSelect1" class="col-sm-3 col-form-label-sm">관련시스템</label>
								                    	<select class="form-control form-control-sm col-sm-9" id="exampleFormControlSelect1" >
								                        	<option selected>전체</option>
								                        	<option>KHR시스템</option>
								                        	<option>KTH시스템</option>
								                        	<option>JHJ시스템 </option>
								                        	<option>HGH시스템 </option>
								                    	</select>
								                	</div>
						                		</div>
					                			<div class="col-sm-1"></div>
								           	</div>
						                	<div class="row">
						                		<div class="col-sm-4">
						                			<div class="form-group row">
						                				<label for="exampleFormControlSelect1" class="col-sm-3 col-form-label-sm">등록자 소속</label>
								                    	<select class="form-control form-control-sm col-sm-9" id="exampleFormControlSelect1">
								                        	<option selected>전체</option>
								                        	<option>KHR시스템</option>
								                        	<option>KTH시스템</option>
								                        	<option>JHJ시스템</option>
								                        	<option>HGH시스템</option>
								                    	</select>
								                	</div>
						                		</div>
						                		<div class="col-sm-3">
						                			<div class="form-group row">
						                				<label for="exampleFormControlSelect1" class="col-sm-3 col-form-label-sm">개발부서</label>
								                    	<select class="form-control form-control-sm col-sm-9" id="exampleFormControlSelect1">
								                        	<option selected>전체</option>
								                        	<option>한국소프트웨어 개발1팀</option>
								                        	<option>한국소프트웨어 개발2팀</option>
								                        	<option>서강소프트웨어 개발1팀</option>
								                        	<option>미래소프트웨어 개발1팀</option>
								                    	</select>
								                	</div>
						                		</div>
						                		<div class="col-sm-4">
								                	<div class="form-group row">
								                		<label for="exampleFormControlSelect1" class="col-sm-3 col-form-label-sm">키워드</label>
								                    	<input type="text" class="form-control form-control-sm col-sm-9 bg-light" 
								                   		aria-label="Search" placeholder="검색어를 입력하세요" style="border-color: #3f51b5;">
								                  	</div>
						                		</div>
						                		<div class="col-sm-1">
						                			<div class="input-group-append float-right">
														<button class="btn btn-primary btn-sm" type="button" onclick="progressList()">
															조회 <i class="fas fa-search fa-sm"></i>
														</button>
													</div>
						                		</div>
						                	</div>
				                		</form>
					               	</div>
					               	<hr/>
                                	<!-- 검색 -->
                                	
                            		<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
			                			<h6 class="m-0 font-weight-bold text-primary">SR 개발 목록</h6>
			                			<div class="d-sm-flex justify-content-end">
			                				<button class="btn btn-sm btn-secondary ">엑셀 다운로드</button>
			                  			</div>
			                		</div>
			                		
	                                <!-- 테이블 -->
	                                <div class="table-responsive p-3">
						      			<table class="table align-items-center table-flush table-hover border">
						                	<thead class="thead-light">
							                	<tr>
							                		<th class="pr-0">
								                        <div class="custom-control custom-checkbox">
								                   			<input type="checkbox" class="custom-control-input" id="customCheck${srNo}">
								                   			<label class="custom-control-label" for="customCheck${srNo}"></label>
								                 		</div>
								                 	</th>
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
							                    </tr>
						                 	</thead>
						                   	<tbody>
					                   			<c:forEach items="${developlist}" var="SrDevelopDto">
						                   			<tr onclick="location.href='${pageContext.request.contextPath}/develop/view'">
						                   				<td class="pr-0">
								                        <div class="custom-control custom-checkbox">
								                   			<input type="checkbox" class="custom-control-input" id="customCheck${srNo}">
								                   			<label class="custom-control-label" for="customCheck${srNo}"></label>
								                 		</div>
								                 		</td>
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
								                   	</tr>
						                     	</c:forEach>
			                 				</tbody>
						            	</table>
						            </div>
                                 		<!-- 테이블 -->
                                   	<div class="text-center mb-4">
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
           				<!-- row -->
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
