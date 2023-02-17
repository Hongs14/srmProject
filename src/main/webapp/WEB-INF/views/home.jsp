<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  	<%@include file="/WEB-INF/views/common/head.jsp" %>
	<style>
		.nav-tabs .nav-link{
		background-color: blue;
		}
		.nav-tabs .nav-link:active{
		background-color: white;
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
        
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">${sessionScope.loginUser.userNm} 님 환영합니다.</h1>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">나의 업무 </li>
            </ol>
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
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item" role="presentation">
								<button class="nav-link small active" id="home-tab"
									data-toggle="tab" data-target="#all" type="button"
									role="tab" aria-controls="all" aria-selected="true">전체</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link small" id="home-tab"
									data-toggle="tab" data-target="#request" type="button"
									role="tab" aria-controls="request" aria-selected="true">요청</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link small" id="profile-tab" data-toggle="tab"
									data-target="#examine" type="button" role="tab"
									aria-controls="examine" aria-selected="false">검토중</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link small" id="messages-tab" data-toggle="tab"
									data-target="#receive" type="button" role="tab"
									aria-controls="receive" aria-selected="false">접수</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link small" id="settings-tab" data-toggle="tab"
									data-target="#developing" type="button" role="tab"
									aria-controls="developing" aria-selected="false">개발중</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link small" id="settings-tab" data-toggle="tab"
									data-target="#done" type="button" role="tab"
									aria-controls="done" aria-selected="false">개발완료</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link small" id="settings-tab" data-toggle="tab"
									data-target="#reject" type="button" role="tab"
									aria-controls="reject" aria-selected="false">반려</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link small" id="settings-tab" data-toggle="tab"
									data-target="#reexamine" type="button" role="tab"
									aria-controls="reexamine" aria-selected="false">재검토</button>
							</li>
						</ul>

						<div class="tab-content">
							<div class="tab-pane active" id="all" role="tabpanel"
								aria-labelledby="home-tab">
								<div class="table-responsive">
				                  <table class="table border p-1">
				                    <thead class="thead-light">
				                      <tr>
				                        <th>SR번호 </th>
				                        <th>제목 </th>
				                        <th>관련 시스템 </th>
				                        <th>상태 </th>
				                        <th>완료예정일 </th>
				                        <th>중요 </th>
				                        <th>진척도 </th>
				                      </tr>
				                    </thead>
				                    <tbody>
				                      <tr>
				                        <td><a href="#">JHJ-SR-0001</a></td>
				                        <td>댓글기능추가</td>
				                        <td>JHJ시스템</td>
				                        <td><span class="badge badge-success">검토중</span></td>
				                        <td>2023/04/14 </td>
				                        <td>상</td>
				                        <td>
			                        	<div class="progress">
										  <div class="progress-bar bg-danger" role="progressbar" 
										  style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
										  </div>
										</div>
										</td>
				                      </tr>
				                      <tr>
				                      <td><a href="#">JHJ-SR-0002</a></td>
				                        <td>첨부기능 보완</td>
				                        <td>JHJ시스템</td>
				                        <td><span class="badge badge-warning">개발중 </span></td>
				                        <td>2023/04/14 </td>
				                        <td>상</td>
				                        <td>
										<div class="progress">
										  <div class="progress-bar" role="progressbar" 
										  style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
										  </div>
										</div>			
										</td>
				                      </tr>
				                      <tr>
				                        <td><a href="#">JHJ-SR-0003</a></td>
				                        <td>조회 기능 보완</td>
				                        <td>JHJ시스템</td>
				                        <td><span class="badge badge-warning">반려</span></td>
				                        <td>2023/04/14 </td>
				                        <td>하 </td>
				                        <td>
				                        <div class="progress">
										  <div class="progress-bar bg-info" role="progressbar" 
										  style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">
										  </div>
										</div>
										</td>
				                      </tr>
				                      <tr>
				                      <td><a href="#">JHJ-SR-0002</a></td>
				                        <td>첨부기능 보완</td>
				                        <td>JHJ시스템</td>
				                        <td><span class="badge badge-warning">개발중 </span></td>
				                        <td>2023/04/14 </td>
				                        <td>상</td>
				                        <td>
				                        <div class="progress">
										  <div class="progress-bar bg-warning" role="progressbar" 
										  style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
										  </div>
										</div>
												
										</td>
				                      </tr>
				                      
				                    </tbody>
				                  </table>
				                </div>
							</div>
							<div class="tab-pane" id="request" role="tabpanel"
								aria-labelledby="profile-tab">요청</div>
							<div class="tab-pane" id="examine" role="tabpanel"
								aria-labelledby="profile-tab">검토</div>
							<div class="tab-pane" id="receive" role="tabpanel"
								aria-labelledby="messages-tab">접수</div>
							<div class="tab-pane" id="developing" role="tabpanel"
								aria-labelledby="settings-tab">개발중</div>
							<div class="tab-pane" id="done" role="tabpanel"
								aria-labelledby="settings-tab">개발완료</div>
							<div class="tab-pane" id="reject" role="tabpanel"
								aria-labelledby="settings-tab">반려</div>
							<div class="tab-pane" id="reexamine" role="tabpanel"
								aria-labelledby="settings-tab">재검토</div>
						</div>

					</div>
                <div class="card-footer"></div>
              </div>
            </div>
            <div class="col-xl-4 col-lg-5 " id="systemMiniView">
              
            </div>
          </div>
          <div class="row mb-5">
          <div class="col-xl-6 col-lg-6 ">
              <div class="card">
                <div class="card-header align-items-center">
                  <h6 class="font-weight-bold text-primary"><i class="fas fa-fw fa-columns"></i> Notice </h6>
                </div>
                <div class="table-responsive">
                  <table class="table border mx-3 mb-3" style="max-width:550px;">
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
                        <td>공지사항1 </td>
                        <td>관리자</td>
                        <td>2023/04/14 </td>
                        <td><a href="${pageContext.request.contextPath}/notice/detail?ntcNo=114" class="btn btn-sm btn-primary">상세</a></td>
                      </tr>
                      <tr>
                        <td><a href="#">0002</a></td>
                        <td>공지사항2 </td>
                        <td>관리자</td>
                        <td>2023/04/14 </td>
                        <td><a href="${pageContext.request.contextPath}/notice/detail?ntcNo=114" class="btn btn-sm btn-primary">상세</a></td>
                      </tr>
                      <tr>
                        <td><a href="#">0003</a></td>
                        <td>공지사항3 </td>
                        <td>관리자</td>
                        <td>2023/04/14 </td>
                        <td><a href="${pageContext.request.contextPath}/notice/detail?ntcNo=114" class="btn btn-sm btn-primary">상세</a></td>
                      </tr>
                      </tbody>
                      </table>
	              </div>
	            </div>
            
          	</div>
          	<div class="col-xl-6 col-lg-6 ">
          	<div class="card">
                <div class="card-header align-items-center">
                  <h6 class="font-weight-bold text-primary"><i class="fas fa-fw fa-sticky-note"></i>QnA </h6>
                </div>
                <div class="table-responsive">
                  <table class="table border mx-3 mb-3" style="max-width:550px;">
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
 <script src="${pageContext.request.contextPath}/resources/js/home.js"></script>
</body>

</html>
