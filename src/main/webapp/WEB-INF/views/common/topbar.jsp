<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<nav class="navbar navbar-expand navbar-light bg-navbar topbar mb-4 static-top">
          <button id="sidebarToggleTop" class="btn btn-link rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>
      <ul class="navbar-nav ml-auto">
      	<div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
      		<form class="navbar-search"></form>
      	</div>
		<!-- sockJS -->
		<script>
			// 전역변수 설정
			var socket  = null;
			$(document).ready(function(){
			    // 웹소켓 연결
			    sock = new SockJS("<c:url value="/echo-ws"/>");
			    socket = sock;
			    
			    sock.onopen = function() {
			    
		       };
			    // 데이터를 전달 받았을때 
			    sock.onmessage = onMessage; 
			    
			    sock.onclose = function (event) {
			    
		       };
			
			});
			
			function onMessage(){
				let userType = "${sessionScope.loginUser.userType}";
				
				countUp();					
				
			};
			
			function countUp() {

				var count = document.getElementById("count").innerText;
				let num1 = parseInt(count);
				num1++;
				document.getElementById("count").innerText=num1;
				
			}
		</script>
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
               <span class="badge badge-danger badge-counter" id="alarmCount">
               		<c:set var="alarmCnt" value="${alarmCnt}"/>
					<c:choose>
						<c:when test="${alarmCnt != 0}">
		               		<div id="count">${alarmCnt}</div>			
						</c:when>
						<c:otherwise>
							0
						</c:otherwise>
					</c:choose>
               </span>
              </a>
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                aria-labelledby="alertsDropdown">
                <h6 class="dropdown-header">받은 알림</h6>
				<c:choose>
					<c:when test="${fn:length(alarmList) == 0 }">
						<span class="dropdown-item d-flex align-items-center">알림 내역이 없습니다.</span>
					</c:when>
					<c:otherwise>
	               		<c:forEach var="alarmList" items="${alarmList}"  begin="0" end="2" step="1">                
							<a class="dropdown-item d-flex align-items-center" onclick="updateCheck('${alarmList.srNo}','${alarmList.alarmNo}','${alarmList.sttsNm }')">
								<div class="mr-3">
									<div class="icon-circle bg-primary">
										<c:if test="${alarmList.messageCheck eq 89}">
											<i class="fas fa-check text-white"></i>
										</c:if>
										<c:if test="${alarmList.messageCheck eq 78}">
											<i class="fas fa-exclamation-triangle text-white"></i>
										</c:if>
									</div>
								</div>
								<div>
									<span class="d-none" id="alarmNo">${alarmList.alarmNo}</span>
									<span class="d-none" id="sttsNm">${alarmList.sttsNm}</span>
				                    <div class="small text-gray-500">${alarmList.messageDate}</div>
				                    <span class="font-weight-bold">${alarmList.alarmTtl} : ${alarmList.message}</span>
				                </div>
			                </a>
		                </c:forEach>					
					</c:otherwise>
				</c:choose>	
                <a class="dropdown-item text-center small text-gray-500" href="${pageContext.request.contextPath}/alarm/list">Show All Alerts</a>
                <script>
	                function updateCheck(i,j,k) {
						var srNo = i;
						var alarmNo = j;
						var sttsNm = k;
						var userType="${sessionScope.loginUser.userType}";
						let data = {alarmNo : alarmNo};
						let url = "";

						var userType = "${userType}";

						if(userType == "관리자" || userType == "개발자" ){
							if(sttsNm == "완료요청" || sttsNm =="계획조정" || sttsNm=="개발중"){
								url = "${pageContext.request.contextPath}/progress/detail/"+srNo;
							}else if(sttsNm == "요청" && userType == "관리자"){
								url = "${pageContext.request.contextPath}/examine/list/"+srNo;
							}else if(sttsNm == "개발계획"){
								url = "${pageContext.request.contextPath}/develop/view/"+srNo;
							}
						}else{
							url = "${pageContext.request.contextPath}/request/list/"+srNo;
						}
						
						$.ajax({
							url : "${pageContext.request.contextPath}/alarm/updateAlarmCheck",
							method : "post",
							data : JSON.stringify(data),
							contentType: "application/json; charset=UTF-8"
						}).done((data) => {
							window.location.href = url;
						});
					}	
				</script>
              </div>
            </li>
            <li class="nav-item dropdown no-arrow mt-3">
             <button class="btn" style="border: 1px solid white; color:white; cursor: default;" >
             	<c:if test="${sessionScope.loginUser.userType eq '고객사'}">고객사</c:if>
             	<c:if test="${sessionScope.loginUser.userType eq '개발자'}">개발자</c:if>
             	<c:if test="${sessionScope.loginUser.userType eq '관리자'}">관리자</c:if>
             </button>
            </li>
            
            <div class="topbar-divider d-none d-sm-block"></div>
           
            <li class="dropdown no-arrow row mt-2">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <img class="img-profile rounded-circle" src="${pageContext.request.contextPath}/resources/images/user.png" style="max-width: 30px; border:0px; ">
                <c:if test="${!empty sessionScope.loginUser.userId}">
              		<button class= "btn text-white" style="background-color:transparent; border:0px;">${sessionScope.loginUser.userNm} 님</button>
              	</c:if>
              </a>
              
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="${pageContext.request.contextPath}/user/myinfo/${sessionScope.loginUser.userId}">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>나의 정보 확인
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="javascript:void(0);" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>로그아웃 
                </a>
              </div>
            </li>
            <li class="mt-3">
            	<c:if test="${empty sessionScope.loginUser.userId}">
            	  <a class="btn btn-sm btn-primary" href="${pageContext.request.contextPath}/user/login">로그인</a>
              	</c:if>
             	<c:if test="${!empty sessionScope.loginUser.userId}">
            	  <a class="btn btn-sm btn-primary" href="javascript:void(0);" data-toggle="modal" data-target="#logoutModal">로그아웃</a>
              	</c:if>
            </li>
          </ul>
        </nav>