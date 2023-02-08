<%@ page contentType="text/html; charset=UTF-8"%>

<ul class="nav flex-column" >
	<li class="nav-item mb-2">
		<h6 class="mb-2"><b>게시판.</b></h6>
		<div class="ml-3">
			<div><a class="text-white" href="${pageContext.request.contextPath}/board/write">새글쓰기</a></div>
			<div><a class="text-white" href="${pageContext.request.contextPath}/board/list">목록</a></div>
		</div>
	</li>	
	<li class="nav-item mt-3 mb-2">
		<h6 class="mb-2"><b>자바스크립트.</b></h6>
		<div class="ml-3">
			<div><a class="text-white" href="${pageContext.request.contextPath}/ajax/content">Ajax</a></div>
		</div>
	</li>	
	
</ul>