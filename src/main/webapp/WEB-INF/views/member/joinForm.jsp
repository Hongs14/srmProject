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
						회원 가입 폼
					</div>
					<div class="card-body">
						<form method="post" action="join">
							<div class="form-group">
							    <label for="mid">Member ID</label>
							    <input type="text" class="form-control" id="mid" name="mid">
							</div>
							<div class="form-group">
							    <label for="mname">Member Name</label>
							    <input type="text" class="form-control" id="mname" name="mname">
							</div>
							<div class="form-group">
								<label for="mpassword">Member Password</label>
								<input type="password" class="form-control" id="mpassword" name="mpassword">
							</div>
							<div class="form-group">
								<label for="mrole">Member Role</label>
								<select class="form-control" id="mrole" name="mrole">
									<option value="ROLE_ADMIN">Admin</option>
									<option value="ROLE_MANAGER">Manager</option>
									<option value="ROLE_USER" selected>User</option>
								</select>
							</div>
							<div class="form-group">
								<label for="memail">Member Email</label>
								<input type="email" class="form-control" id="memail" name="memail">
							</div>
							<button type="submit" class="btn btn-info btn-sm mt-2">회원가입</button>
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

