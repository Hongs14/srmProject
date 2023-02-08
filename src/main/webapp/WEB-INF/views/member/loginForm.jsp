<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
				<!-- ********************************** -->
				<div class="card m-2">
					<div class="card-header">
						로그인 폼
					</div>
					<div class="card-body">
						<form method="post" action="login">
							<div class="form-group">
							    <label for="mid">Member ID</label>
							    <input type="text" class="form-control" id="mid" name="mid" value="${member.mid}">
							    <c:if test="${result == 'wrongMid'}">
							   		<small id="midHelp" class="form-text text-danger">아이디가 존재하지 않음</small>
							    </c:if>
							</div>
							<div class="form-group">
								<label for="mpassword">Member Password</label>
								<input type="password" class="form-control" id="mpassword" name="mpassword">
								<c:if test="${result == 'wrongMpassword'}">
									<small id="mpasswordHelp" class="form-text text-danger">패스워드가 존재하지 않음</small>
							    </c:if>
							</div>
							<button type="submit" class="btn btn-info btn-sm mt-2">로그인</button>
						</form>	
					</div>
				</div>
				<!-- ********************************** -->
				</div>
			</div>
		</div>
	<%@include file="/WEB-INF/views/common/bottom.jsp" %>
	</div>
</body>
