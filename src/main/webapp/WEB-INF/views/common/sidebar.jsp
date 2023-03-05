<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<ul class="navbar-nav sidebar sidebar-light accordion" id="accordionSidebar">
	<li>
		<a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/home">
	        <div class="sidebar-brand-icon">
	          <img src="${pageContext.request.contextPath}/resources/images/logoOnly.png">
	        </div>
	        <div class="sidebar-brand-text mx-2 mt-1">SRM SYSTEM</div>
      	</a>
	</li>
	<li class="nav-item active">
	  <a class="nav-link" href="${pageContext.request.contextPath}/home">
	    <i class="fas fa-fw fa-tachometer-alt"></i>
	    <span>My Home</span></a>
	</li>
	<hr class="sidebar-divider">
	<li class="sidebar-heading">
	  SR 관리 
	</li>
	<li class="nav-item">
	  <a class="nav-link" href="${pageContext.request.contextPath}/request/list">
	    <i class="far fa-fw fa-window-maximize"></i>
	    <span>SR 요청 관리</span>
	  </a>
	</li>
	<c:if test="${sessionScope.loginUser.userType != '고객사'}">
	<li class="nav-item">
	  <a class="nav-link" href="${pageContext.request.contextPath}/examine/list">
	    <i class="fab fa-fw fa-wpforms"></i>
	    <span>SR 검토 관리 </span>
	  </a>
	</li>
	<li class="nav-item">
	  <a class="nav-link" href="${pageContext.request.contextPath}/develop/list/1">
	    <i class="fas fa-fw fa-file-code"></i>
	    <span>SR 개발 관리</span>
	  </a>
	</li>
	<li class="nav-item">
	  <a class="nav-link" href="${pageContext.request.contextPath}/progress/list/1">
	    <i class="fas fa-fw fa-chart-bar"></i>
	    <span>SR 진척 관리</span>
	  </a>
	</li>
	</c:if>
	<hr class="sidebar-divider">
	<li class="sidebar-heading">
	  게시판 
	</li>
	<li class="nav-item">
       <a class="nav-link collapsed" href="${pageContext.request.contextPath}/notice/list" data-toggle="collapse" data-target="#collapsePage"
       aria-expanded="false" aria-controls="collapsePage">
      		<i class="fas fa-fw fa-columns"></i>
  			<span>공지사항 </span>
       </a>
      	<div id="collapsePage" class="collapse" aria-labelledby="headingPage" data-parent="#accordionSidebar" style="">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="${pageContext.request.contextPath}/notice/list/KOREASOFT_SRM">전체 공지사항</a>
            <c:if test="${sessionScope.loginUser.userOgdp eq '레드주컴퍼니' or sessionScope.loginUser.userOgdp eq '한국소프트SRM'}">            
	            <a class="collapse-item" href="${pageContext.request.contextPath}/notice/list/JHJ">JHJ시스템 공지</a>
            </c:if>
            <c:if test="${sessionScope.loginUser.userOgdp eq '티에이치컴퍼니' or sessionScope.loginUser.userOgdp eq '한국소프트SRM'}">
	            <a class="collapse-item" href="${pageContext.request.contextPath}/notice/list/KTH">KTH시스템 공지</a>
            </c:if>
            <c:if test="${sessionScope.loginUser.userOgdp eq '에이치알컴퍼니' or sessionScope.loginUser.userOgdp eq '한국소프트SRM'}">
	            <a class="collapse-item" href="${pageContext.request.contextPath}/notice/list/KHR">KHR시스템 공지</a>
            </c:if>
            <c:if test="${sessionScope.loginUser.userOgdp eq '지에이치컴퍼니' or sessionScope.loginUser.userOgdp eq '한국소프트SRM'}">
	            <a class="collapse-item" href="${pageContext.request.contextPath}/notice/list/HGH">HGH시스템 공지</a>
            </c:if>
          </div>
        </div>
	</li>
	<li class="nav-item">
	  <a class="nav-link collapsed" href="${pageContext.request.contextPath}/qna/list" data-toggle="collapse" data-target="#collapsePage"
       aria-expanded="false" aria-controls="collapsePage">
	    <i class="fas fa-fw fa-sticky-note"></i>
	    <span>QnA게시판</span>
	  </a>
	  <div id="collapsePage" class="collapse" aria-labelledby="headingPage" data-parent="#accordionSidebar" style="">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="${pageContext.request.contextPath}/qna/KOREASOFT_SRM/list">전체 공지사항</a>
            <c:if test="${sessionScope.loginUser.userOgdp eq '레드주컴퍼니' or sessionScope.loginUser.userOgdp eq '한국소프트SRM'}">            
	            <a class="collapse-item" href="${pageContext.request.contextPath}/qna/JHJ/list">JHJ시스템 공지</a>
            </c:if>
            <c:if test="${sessionScope.loginUser.userOgdp eq '티에이치컴퍼니' or sessionScope.loginUser.userOgdp eq '한국소프트SRM'}">
	            <a class="collapse-item" href="${pageContext.request.contextPath}/qna/KTH/list">KTH시스템 공지</a>
            </c:if>
            <c:if test="${sessionScope.loginUser.userOgdp eq '에이치알컴퍼니' or sessionScope.loginUser.userOgdp eq '한국소프트SRM'}">
	            <a class="collapse-item" href="${pageContext.request.contextPath}/qna/KHR/list">KHR시스템 공지</a>
            </c:if>
            <c:if test="${sessionScope.loginUser.userOgdp eq '지에이치컴퍼니' or sessionScope.loginUser.userOgdp eq '한국소프트SRM'}">
	            <a class="collapse-item" href="${pageContext.request.contextPath}/qna/HGH/list">HGH시스템 공지</a>
            </c:if>
          </div>
       </div>
	</li>
	<li class="version my-5" id="version-ruangadmin"></li>
    </ul>