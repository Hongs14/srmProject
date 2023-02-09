<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

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
			        
			        	<div class="d-sm-flex align-items-center justify-content-between mb-4">
			            	<h1 class="h3 mb-0 text-gray-800">Q&A 게시판</h1>
			            	<ol class="breadcrumb">
			              		<li class="breadcrumb-item"><a href="./">Home</a></li>
			              		<li class="breadcrumb-item active" aria-current="page">Q&A</li>
			           		</ol>
			          	</div>
					
			         	<!-- Row -->
			         	<div>
			          		<div class="qnacontent mx-3 my-0">
					         	<div class="container-fluid searchboard">
					         		<div class="col-6 row">
					         			<div>조회기간</div>
						         		<input type="date"/> ~
						         		<input type="date"/>
						         		<button class="btn btn-info">조회</button>
					         		</div>
					         		<div class="col-6 row">
					         			<div>
					         				<input type="text"/>
					         			</div>
					         			<button class="btn btn-info">검색</button>
					         		</div>
					         	</div>
					         	
					         	<!-- table -->
					         	<div class="col-lg-12">
									<div class="card mb-4">
						            	<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						            		<h6 class="m-0 font-weight-bold text-primary">QNA 게시글</h6>
						                </div>
						                <div class="table-responsive p-3">
						                	<table class="table align-items-center table-flush table-hover" id="dataTableHover">
						                    	<thead class="thead-light">
								                	<tr>
								                    	<th>번호</th>
								                        <th>글제목</th>
								                        <th>작성자</th>
								                        <th>작성일</th>
								                        <th>조회수</th>
								                    </tr>
						                   		</thead>
						                   		<tbody>
						                      		<tr>
						                        		<td></td>
								                        <td>Pre-Sales Support</td>
								                        <td>New York</td>
								                        <td>21</td>
								                        <td>$106,450</td>
						                     		</tr>
						                 		</tbody>
						                  	</table>
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
