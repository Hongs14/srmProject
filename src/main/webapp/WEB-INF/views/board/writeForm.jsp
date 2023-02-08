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
					<div class="card m-3">
					   <div class="card-header">
					      	게시물 쓰기
					   </div>
					   <div class="card-body">
					   		 <form method="post" action="write" enctype="multipart/form-data">
							  <div class="form-group">
							    <label for="btitle">Title</label>
							    <input type="text" class="form-control" id="btitle" name="btitle">
							  </div>
							  <div class="form-group">
							    <label for="bcontent">Content</label>
							    <textarea rows="5" cols="50"  id="bcontent" name="bcontent" class="form-control"></textarea>
							  </div>
							  <div class="form-group">
							    <label for="bwriter">Writer</label>
							    <input type="text" class="form-control" id="mid" name="mid" value="user1" readonly>
							  </div>
							  <div class="form-group">
							    <label for="battach">Attach</label>
							    <input type="file" class="form-control" id="battach" name="battach">
							  </div>
							  
							  <button type="submit" class="btn btn-warning btn-sm">게시물 쓰기</button>
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
