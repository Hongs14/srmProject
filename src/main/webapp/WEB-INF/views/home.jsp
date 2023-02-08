<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<%@include file="/WEB-INF/views/common/head.jsp" %>
	</head>
	<body>
	<div class="d-flex flex-column vh-100">
		<%@include file="/WEB-INF/views/common/top.jsp" %>
		<div class="container-fluid flex-grow-1">
			<div class="row h-100">
				<div class="col-md-2 bg-dark text-white">
					<%@include file="/WEB-INF/views/common/menu.jsp" %>
				</div>
				<div class="col-md-10">
				<div class="card-header">
						SpringFramework복습
					</div>
					<div class="card-body">
				</div>
				</div>
			</div>
		</div>
			<%@include file="/WEB-INF/views/common/bottom.jsp" %>
	</div>
	</body>
</html>
