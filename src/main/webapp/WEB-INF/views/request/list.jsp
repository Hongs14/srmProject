<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  	<%@include file="/WEB-INF/views/common/head.jsp" %>
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
            <h6 class="mb-0 text-white">SR 요청관리</h6>
          </div>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/request/list">SR 관리</a></li>
              <li class="breadcrumb-item active" aria-current="page">SR 요청관리</li>
            </ol>
          </div>
		
          <!-- Row -->
        <div class="row">
     	<div class="col-lg-12">
         	<div class="card mb-4 ">
         		<!-- 검색 -->
                <div class="mb-1 mt-5 px-5">
                <form class="navbar-search">
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
                		
                		<div class="col-3">
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
                		<div class="col-4">
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
                		<div class="col-1">
                			
                		</div>
                		
                	</div>
                	<div class="row">
                		<div class="col-4">
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
                		<div class="col-3">
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
                		<div class="col-4">
		                	<div class="form-group row">
		                		<label for="exampleFormControlSelect1" class="col-sm-3 col-form-label-sm">키워드</label>
		                    	<input type="text" class="form-control form-control-sm col-sm-9 bg-light" 
		                   		aria-label="Search" placeholder="검색어를 입력하세요" style="border-color: #3f51b5;">
		                  	</div>
                		</div>
                		<div class="col-1">
                			<div class="input-group-append float-right">
								<button class="btn btn-primary btn-sm" type="button" onclick="progressList()" >
									조회 <i class="fas fa-search fa-sm"></i>
								</button>
							</div>
                		</div>
                	</div>
                </form>
                </div>
                <hr/>
         		<!-- SR 검토 목록 -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">SR 요청 목록</h6>
                  <div class="d-sm-flex justify-content-end">
                	<button class="btn btn-sm btn-secondary mr-1">일괄 처리 (검토중)</button>
                	<button class="btn btn-sm btn-secondary mr-1">일괄 처리 (접수)</button>
                	<button class="btn btn-sm btn-secondary ">엑셀 다운로드</button>
                  </div>
                </div>
                
                
                <div class="table-responsive p-3">
                  <table class="table align-items-center table-flush table-hover border" id="dataTableHover">
                    <thead class="thead-light">
                      <tr>
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
                        <th>상세보기 </th>
                      </tr>
                    </thead>
                    
                    <tbody>
                    <tr>
                        <td>JHJ-SR-0001</td>
                        <td>댓글 기능 추가 부탁드립니다.</td>
                        <td>JHJ쇼핑몰</td>
                        <td>정홍주 </td>
                        <td>관리팀 </td>
                        <td>미배정 </td>
                        <td>미검토 </td>
                        <td>2023/02/09 </td>
                        <td>2023/04/08 </td>
                        <td>상 </td>
                        <td><a class="btn btn-sm btn-primary text-white" id="RequestDetail">상세보기</a></td>
                      </tr>
                      <tr>
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
                        <td><a class="btn btn-sm btn-primary text-white" id="RequestDetail">상세보기</a></td>
                      </tr>
                      <tr>
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
                        <td><a class="btn btn-sm btn-primary text-white" id="RequestDetail">상세보기</a></td>
                      </tr>
                      <tr>
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
                        <td><a class="btn btn-sm btn-primary text-white" id="RequestDetail">상세보기</a></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
                
                <div class="pagingButtonSet d-flex justify-content-center m-3">
					<c:if test="${pager.pageNo > 1}">
						<a href="1" type="button" class="btn btn-muted shadow">◀◀</a>
					</c:if>

					<c:if test="${pager.groupNo > 1}">
						<a href="${pager.startPageNo-1}" type="button" class="btn btn-muted shadow">◀</a>
					</c:if>

					<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
						<c:if test="${pager.pageNo != i}">
							<a href="${i}" type="button" class="btn btn-white shadow">${i}</a>
						</c:if>
						<c:if test="${pager.pageNo == i}">
							<a href="${i}" type="button" class="btn btn-dark shadow">${i}</a>
						</c:if>
					</c:forEach>

					<c:if test="${pager.groupNo < pager.totalGroupNo }">
						<a href="${pager.endPageNo+1}" type="button" class="btn btn-muted shadow">▶</a>
					</c:if>
					<c:if test="${pager.pageNo < pager.totalPageNo}">
                  		<a href="${pager.totalPageNo}" type="button" class="btn btn-muted shadow">▶▶</a>
               		</c:if>
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
