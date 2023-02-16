<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<ul class="navbar-nav sidebar sidebar-light accordion" id="accordionSidebar">
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}">
        <div class="sidebar-brand-icon">
          <img src="${pageContext.request.contextPath}/resources/images/logoOnly.png">
        </div>
        <div class="sidebar-brand-text mx-2 mt-1">SRM SYSTEM</div>
      </a>
      <hr class="sidebar-divider my-0">
      <li class="nav-item active">
        <a class="nav-link" href="${pageContext.request.contextPath}">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>My Home</span></a>
      </li>
      <hr class="sidebar-divider">
      <div class="sidebar-heading">
        SR 관리 
      </div>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/request/list">
          <i class="far fa-fw fa-window-maximize"></i>
          <span>SR 요청 관리</span>
        </a>
      </li>
      <c:if test="sessionScope.loginUser.userType != '고객사'">
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/examine/list">
          <i class="fab fa-fw fa-wpforms"></i>

          <span>SR 검토 관리 </span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/develop/list">
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
      <div class="sidebar-heading">
        게시판 
      </div>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/notice/list">
          <i class="fas fa-fw fa-columns"></i>
          <span>공지사항 </span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/qna/list">
          <i class="fas fa-fw fa-sticky-note"></i>
          <span>QnA게시판</span>
        </a>
      </li>
      <hr class="sidebar-divider">
      <div class="version" id="version-ruangadmin"></div>
    </ul>