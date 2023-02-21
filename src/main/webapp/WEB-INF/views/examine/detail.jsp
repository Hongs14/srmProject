<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@include file="/WEB-INF/views/common/head.jsp"%>
<style>
	.requsetTtl{
	width: 190px;
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
		<%@include file="/WEB-INF/views/common/sidebar.jsp"%>


		<div id="content-wrapper" class="d-flex flex-column">
			
			<div id="content">

				<!-- TopBar -->
				<%@include file="/WEB-INF/views/common/topbar.jsp"%>


				<!-- 메인 컨테이너 Container Fluid-->
				<div class="container-fluid" id="container-wrapper">

					<!-- Row -->
					<div class="row justify-content-md-center">
						<div class="col-lg-7">
							<!-- 리스트 요약본 출력 -->
							<%@include file="/WEB-INF/views/examine/summaryList.jsp" %>
						</div>
						<div class="col-lg-5">
							<div class="container-fluid">
								<!-- 요청 상세 조회 -->
								<div class="row" id="detailView">
									<div class="col-12">
										<%@include file="/WEB-INF/views/examine/detailView.jsp" %>
									</div>
								</div>
								<!-- 검토 처리 -->
								
							</div>
						</div>
					</div>
				</div>
				<!-- Row -->
				
				<!-- 로그아웃 모달 -->
				<%@include file="/WEB-INF/views/common/logout.jsp"%>
				
			</div>


			<!-- Footer -->
			<%@include file="/WEB-INF/views/common/footer.jsp"%>
		</div>
		
	</div>
	
	<%@include file="/WEB-INF/views/common/bottom.jsp"%>
</body>

</html>