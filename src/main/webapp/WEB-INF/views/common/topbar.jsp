<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<nav class="navbar navbar-expand navbar-light bg-navbar topbar mb-4 static-top">
          <button id="sidebarToggleTop" class="btn btn-link rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>
      <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                 <!-- <i class="fas fa-search fa-fw"></i>  -->
              </a>
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                aria-labelledby="searchDropdown">
                <form class="navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-1 small" placeholder="What do you want to look for?"
                      aria-label="Search" aria-describedby="basic-addon2" style="border-color: #3f51b5;">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <!-- <i class="fas fa-search fa-sm"></i> -->
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>
           <!-- sockJS -->
			<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
			<script>
				// 전역변수 설정
				var socket  = null;
				$(document).ready(function(){
				    // 웹소켓 연결
				    sock = new SockJS("<c:url value="/echo-ws"/>");
				    socket = sock;
				    // 데이터를 전달 받았을때 
				    sock.onmessage = onMessage; // toast 생성
				});
				
				// toast생성 및 추가
				function onMessage(evt){
				    var data = "알림이 도착했습니다.";
				    console.log(data);
				    
				    const now = new Date();	// 현재 날짜 및 시간
				    console.log(now);
				    const hours = now.getHours();
				    console.log(hours);
				    const minutes = now.getMinutes();
				    console.log(minutes);
				    // toast
				    let toast = "<div class='toast' role='alert' aria-live='assertive' aria-atomic='true'>";
				    toast += "<div class='toast-header'><i class='fas fa-bell mr-2'></i><strong class='mr-auto'>알림</strong>";
				    toast += "<small class='text-muted'>"+hours+ ":"+ minutes+"</small><button type='button' class='ml-2 mb-1 close' data-dismiss='toast' aria-label='Close' onclick='removeToast()'>";
				    toast += "<span aria-hidden='true'>&times;</span></button>";
				    toast += "</div> <div class='toast-body'>" + data + "</div></div>";
				    $("#msgStack").append(toast);   // msgStack div에 생성한 toast 추가
				    $(".toast").toast({"animation": true, "autohide": false});
				    $('.toast').toast('show');
				};
				
				function removeToast() {
					console.log("스택 지우기");
					$("#msgStack *").remove();
				}
			</script>
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
               <span class="badge badge-danger badge-counter">
               		<c:set var="alarmCnt" value="${alarmCnt}"/>
					<c:choose>
						<c:when test="${alarmCnt != 0}">
		               		<c:out value="${alarmCnt}"/>						
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
							<a class="dropdown-item d-flex align-items-center" onclick="updateCheck('${alarmList.srNo}')">
								<div class="mr-3">
									<div class="icon-circle bg-primary">
										<c:if test="${alarmList.messageCheck eq 89}">
											<i class="fas fa-check text-white"></i>
										</c:if>
										<c:if test="${alarmList.messageCheck eq 78 }">
											<i class="fas fa-exclamation-triangle text-white"></i>
										</c:if>
									</div>
								</div>
								<div>
				                    <div class="small text-gray-500">${alarmList.messageDate}</div>
				                    <span class="font-weight-bold">${alarmList.alarmTtl} : ${alarmList.message}</span>
				                </div>
			                </a>
		                </c:forEach>					
					</c:otherwise>
				</c:choose>	
                <a class="dropdown-item text-center small text-gray-500" href="${pageContext.request.contextPath}/alarm/list">Show All Alerts</a>
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
                <a class="dropdown-item" href="#">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>설정
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