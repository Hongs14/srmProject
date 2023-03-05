<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
<style>
.nav-link {
	cursor: pointer;
}
</style>
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
	        <div class="card mb-4 p-3">
	        	<div class="d-sm-flex align-items-center justify-content-between">
	            <h4 class="mb-0 text-gray-800 m-1 "><b>${sessionScope.loginUser.userNm} 님 환영합니다.</b></h4>
	            <ol class="breadcrumb">
	              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Home</a></li>
	              <li class="breadcrumb-item active" aria-current="page">나의 업무 </li>
	            </ol>
	          </div>
	        </div>
          
		
          <!-- Row -->
          <div class="row">
	     	<div class="col-xl-8 col-lg-7 mb-4">
              <div class="card">
               <div class="card-header align-items-center">
					<a href="${pageContext.request.contextPath}/request/list">
					<i class="fas fa-tasks fa-fw"></i> 
					<span class="m-0 font-weight-bold text-primary">My SR </span>
					</a>
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
							<li class="nav-item" role="presentation">
								<a class="nav-link" data-toggle="pill" onclick="homeMiniViewChange(3, 1)">반려</a>
							</li>
							<li class="nav-item" role="presentation">
								<a class="nav-link" data-toggle="pill" onclick="homeMiniViewChange(7, 1)">재검토</a>
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
									$("#homeMiniView").html(data)
								});
								
								$.ajax({
									url : "${pageContext.request.contextPath}/systemMiniView",
									type : "GET",
									datatype : "html",
									success : function(data){
										$('#systemMiniView').html(data);
										console.log(data);
									}
								});
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
						
						<div id="homeMiniView">
						
						</div>

					</div>
              </div>
            </div>
            <div class="col-xl-4 col-lg-5 " id="systemMiniView">
              
            </div>
          </div>
          <div class="row mb-5">
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
                    	<c:forEach var="list" items="${noticeList}" end="4">
                      <tr>
                        <td>${list.seq}</td>
                        <td>${list.ntcTtl} </td>
                        <td>${list.userId}</td>
                        <td>${list.ntcWrtDate}</td>
                        <td><a href="${pageContext.request.contextPath}/notice/detail?ntcNo=${list.ntcNo}" class="btn btn-sm btn-primary">상세</a></td>
                      </tr>
                      </c:forEach>
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
                      <tr>
                        <td><a href="#">0001</a></td>
                        <td>QnA1 </td>
                        <td>관리자</td>
                        <td>2023/04/14 </td>
                        <td><a href="${pageContext.request.contextPath }/qna/view?qstnNo=21" class="btn btn-sm btn-primary">상세</a></td>
                      </tr>
                      <tr>
                        <td><a href="#">0002</a></td>
                        <td>QnA2 </td>
                        <td>관리자</td>
                        <td>2023/04/14 </td>
                        <td><a href="${pageContext.request.contextPath }/qna/view?qstnNo=21" class="btn btn-sm btn-primary">상세</a></td>
                      </tr>
                      <tr>
                        <td><a href="#">0003</a></td>
                        <td>QnA3 </td>
                        <td>관리자</td>
                        <td>2023/04/14 </td>
                        <td><a href="${pageContext.request.contextPath }/qna/view?qstnNo=21" class="btn btn-sm btn-primary">상세</a></td>
                      </tr>
                      <tr>
                        <td><a href="#">0003</a></td>
                        <td>QnA3 </td>
                        <td>관리자</td>
                        <td>2023/04/14 </td>
                        <td><a href="${pageContext.request.contextPath }/qna/view?qstnNo=21" class="btn btn-sm btn-primary">상세</a></td>
                      </tr>
                      <tr>
                        <td><a href="#">0004</a></td>
                        <td>QnA3 </td>
                        <td>관리자</td>
                        <td>2023/04/14 </td>
                        <td><a href="${pageContext.request.contextPath }/qna/view?qstnNo=21" class="btn btn-sm btn-primary">상세</a></td>
                      </tr>
                      </tbody>
                    </table>
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
     <%@include file="/WEB-INF/views/common/footer.jsp" %>
      </div>
      <!-- Footer -->
    </div>
 <%@include file="/WEB-INF/views/common/bottom.jsp" %>
</body>

</html>
