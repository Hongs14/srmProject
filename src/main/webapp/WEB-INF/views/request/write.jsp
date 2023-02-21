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
	text-overflow:ellipsis; 
	overflow: hidden; 
	display: block;
	}	
</style>
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
							<%@include file="/WEB-INF/views/request/summaryList.jsp" %>
						</div>
						<div class="col-lg-5">
							<%@include file="/WEB-INF/views/request/writeForm.jsp" %>
						</div>
					</div>
				</div>
			</div>
			<!-- Row -->
			<!-- 로그아웃 모달 -->
			<%@include file="/WEB-INF/views/common/logout.jsp"%>
			<!-- Footer -->
			<%@include file="/WEB-INF/views/common/footer.jsp"%>
			</div>
			<!---Container Fluid-->
		</div>
	<%@include file="/WEB-INF/views/common/bottom.jsp"%>
	 <script src="${pageContext.request.contextPath}/resources/js/writeRequest.js"></script>
	 <script>
	$(document).ready(function () {
		console.log("시작");
		var sysNoSelect = document.getElementById("sysNo");
		var sttsNoSelect = document.getElementById("sttsNo");
		var userOgdpSelect = document.getElementById("userOgdp");
		var srDevDpSelect = document.getElementById("srDevDp");
		
	
		var sysNo = sysNoSelect.options[document.getElementById("sysNo").selectedIndex].value;
		var sttsNo = sttsNoSelect.options[document.getElementById("sttsNo").selectedIndex].value;
		var userOgdp = userOgdpSelect.options[document.getElementById("userOgdp").selectedIndex].value;
 		var srDevDp = srDevDpSelect.options[document.getElementById("srDevDp").selectedIndex].value;  
		
		let data = {sysNo : sysNo, sttsNo : sttsNo, userOgdp : userOgdp, srDevDp : srDevDp};
		
		console.log(data);
		
		$.ajax({
			url : "summarylist/1",
			method : "post",
			data : JSON.stringify(data),
			contentType: "application/json; charset=UTF-8"
		}).done((data) => {
			$("#ajaxList").html(data);
		});
	});

	function requestList(pageNo) {
		console.log(pageNo);
		var sysNoSelect = document.getElementById("sysNo");
		var sttsNoSelect = document.getElementById("sttsNo");
		var userOgdpSelect = document.getElementById("userOgdp");
		var srDevDpSelect = document.getElementById("srDevDp");
		
		var sysNo = sysNoSelect.options[document.getElementById("sysNo").selectedIndex].value;
		var sttsNo = sttsNoSelect.options[document.getElementById("sttsNo").selectedIndex].value;
		var userOgdp = userOgdpSelect.options[document.getElementById("userOgdp").selectedIndex].value;
 		var srDevDp = srDevDpSelect.options[document.getElementById("srDevDp").selectedIndex].value;  
		
		
 		let data = {sysNo : sysNo, sttsNo : sttsNo, userOgdp : userOgdp, srDevDp : srDevDp};
		
		console.log(data);
		
		$.ajax({
			url : "summarylist/"+pageNo,
			method : "post",
			data : JSON.stringify(data),
			contentType: "application/json; charset=UTF-8"
		}).done((data) => {
			$("#ajaxList").html(data);
		});
	}
</script>
</body>

</html>
