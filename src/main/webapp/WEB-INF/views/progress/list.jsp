<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<%@include file="/WEB-INF/views/common/head.jsp"%>
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
					<div class="d-sm-flex align-items-center justify-content-between mb-4">
						안녕
					</div>
					
					<!-- 로그아웃 모달 -->
					<%@include file="/WEB-INF/views/common/logout.jsp"%>
				</div>
				<!---Container Fluid-->
			</div>

		</div>
	</div>
	<%@include file="/WEB-INF/views/common/bottom.jsp"%>
</body>

</html>
