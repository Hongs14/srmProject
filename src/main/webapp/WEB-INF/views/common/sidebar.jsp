<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<ul class="navbar-nav sidebar sidebar-light accordion" id="accordionSidebar">
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}">
        <div class="sidebar-brand-icon">
          <img src="${pageContext.request.contextPath}/resources/images/logoOnly.png">
        </div>
        <div class="sidebar-brand-text mx-3">SRM SYSTEM</div>
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
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseForm" aria-expanded="true"
          aria-controls="collapseForm">
          <i class="fab fa-fw fa-wpforms"></i>
          <span>SR 검토 관리 </span>
        </a>
        <div id="collapseForm" class="collapse" aria-labelledby="headingForm" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Forms</h6>
            <a class="collapse-item" href="form_basics.html">Form Basics</a>
            <a class="collapse-item" href="form_advanceds.html">Form Advanceds</a>
          </div>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/develop/list">
          <i class="fas fa-fw fa-palette"></i>
          <span>SR 개발 관리</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/progress/list/1">
          <i class="fas fa-fw fa-palette"></i>
          <span>SR 진척 관리</span>
        </a>
      </li>
      <hr class="sidebar-divider">
      <div class="sidebar-heading">
        게시판 
      </div>
      <li class="nav-item">
        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/notice/list" data-toggle="collapse" data-target="#collapsePage" aria-expanded="true"
          aria-controls="collapsePage">
          <i class="fas fa-fw fa-columns"></i>
          <span>공지사항 </span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="charts.html">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>QnA게시판</span>
        </a>
      </li>
      <hr class="sidebar-divider">
      <div class="version" id="version-ruangadmin"></div>
    </ul>