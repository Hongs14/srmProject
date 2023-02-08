<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<%@include file="/WEB-INF/views/common/head.jsp" %>
	</head>
	<body>
	<div class="d-flex flex-column vh-100">
		<div class="container-fluid flex-grow-1">
			<div class="row h-100">
				<div class="col-md-2 bg-dark text-white">
					<%@include file="/WEB-INF/views/common/menu.jsp" %>
				</div>
				<div class="col-md-10">
				<div class="card-header">
						AJAX
					</div>
					<div class="card-body">
						<div class="card">
							<div class="card-header">
								HTML조각 받아오기
							</div>
							<div  class="card-body">
								<button class="btn btn-info btn-sm" onclick="ajax1()">HTML요청하기</button>
								<hr/>
								<div id="div1"></div>
							</div>
							<script>
								function ajax1(){
									console.log("ajax1() 실행");
									/*$.ajax({
										url:"ajax1",
										success: function(data){
											$("#div1").html(data);
										}
									});*/
									$.ajax({
										url:"ajax1"
									}).done((data) => {
										$("#div1").html(data);
									});
								}
							</script>
						</div>
						
						<div class="card">
							<div class="card-header">
								JSON 받아오기
							</div>
							<div  class="card-body">
								<button class="btn btn-info btn-sm" onclick="ajax2()">JSON요청하기</button>
								<hr/>
								<div id="div21"></div>
								<div id="div22">
									<img src="${pageContext.request.contextPath}/resources/images/photo1.jpg" width="200px"/>
								</div>
							</div>
							<script>
								function ajax2(){
									console.log("ajax2() 실행");
									
									$.ajax({
										url:"ajax2"
									}).done((data) => {
										console.log(data)
										data.name
										let img = "<img src='${pageContext.request.contextPath}/resources/images/"+ data.name + "' width='200px'/>";
										$("#div21").html(img);
										$("#div22 > img").attr("src", "${pageContext.request.contextPath}/resources/images/"+ data.name);
									});
								}
							</script>
						</div>
						
						<div class="card">
							<div class="card-header">
								JSON 보내고 받기
							</div>
							<div  class="card-body">
								<button class="btn btn-info btn-sm" onclick="ajax3()">JSON요청하기</button>
								<hr/>
								<div id="div3"></div>
							</div>
							<script>
								function ajax3(){
									console.log("ajax3() 실행");
									
									let data = {name:"photo8.jpg", info:"여행 사진"};
									
									
									$.ajax({
										url:"ajax3",
										method: "post",
										data: JSON.stringify(data),
										contentType: "application/json; charset=UTF-8"
										
									}).done((data) => {
										console.log(data)
										data.name
										let img = "<img src='${pageContext.request.contextPath}/resources/images/"+ data.name + "' width='200px'/>";
										$("#div3").html(img);
									});
								}
							</script>
						</div>
					</div>
					
				</div>
			</div>
		</div>
			<%@include file="/WEB-INF/views/common/bottom.jsp" %>
	</div>
	</body>
</html>
