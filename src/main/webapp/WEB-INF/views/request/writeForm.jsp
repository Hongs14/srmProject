<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>

<div class="d-sm-flex align-items-end justify-content-between">
	<div class="bg-primary px-3 py-2"
		style="border-top-left-radius: 10px; border-top-right-radius: 10px;">
		<h6 class="mb-0 text-white">SR 요청등록</h6>
	</div>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><b>SR 관리</b></li>
		<li class="breadcrumb-item active" aria-current="page">SR
			요청등록</li>
	</ol>
</div>
<div class="card">
	<div class="p-5">
		<form method="post" action="<c:url value='/request/write'/>" method="post" enctype="multipart/form-data">
			<div class="row mb-2 mr-0" >
					<label class="font-weight-bold col-sm-2">등록자: </label> 
					<input  class="col-sm-4" disabled value="${sessionScope.loginUser.userNm}" />
					<span class="font-weight-bold col-sm-2">소속: </span> 
					<input class="col-sm-4" disabled value="${sessionScope.loginUser.userDpNm}" />
			</div>
			
			<div class="row mb-2 mr-0">
				<span class=" font-weight-bold col-sm-2">등록일: </span> 
				<div class="form-group col-sm-4 px-0" id="simple-date1" >
					<div class="input-group date" >
						<div class="input-group-prepend">
							<span class="input-group-text" name="srRegDate"><i class="fas fa-calendar" ></i></span>
						</div>
						<input type="text" class="form-control" value="" id="dateInput"  style="height:30px;" disabled>
					</div>
				</div>
				<span class=" font-weight-bold col-sm-3">관련시스템: </span> 
				<input name="sysNm" class="col-sm-3" disabled value="${sessionScope.loginUser.sysNm}" style="height:30px;"/>
			</div>
			<hr>
			<div class="row mb-2 align-items-center">
				<span class=" font-weight-bold col-sm-2">SR 제목: </span> 
				<input name="srTtl" class="col-sm-10" type="text" class="form-control form-control-sm"/>
			</div>
			<div class="row mb-2 align-items-center">
				<label class=" font-weight-bold col-sm-2">관련근거: </label> 
				<input name="srStd" class="col-sm-10" type="text" class="form-control form-control-sm"/>
			</div>
			<div class="row mb-2">
					<label class=" font-weight-bold col-sm-2">SR 내용: </label> 
					<textarea name="srCn" rows="10" class="form-control form-control-sm col-sm-10"></textarea>
			</div>
			<div class="row mb-2">
				<span class=" font-weight-bold col-sm-2">첨부파일: </span> 
				<div class="custom-file col-sm-10">
					<input type="file" class="custom-file-input form-control" id="customFile" multiple> 
					<label class="custom-file-label text-truncate" for="customFile">파일 선택</label>
				</div>
			</div>
			<div class="row mb-2">
				<span class=" font-weight-bold col-sm-2">파일목록: </span> 
				<div class="col-sm-10" id="userfile"></div>
			</div>
			<div class="modal-footer justify-content-center">
		       <button type="button" class="btn btn-outline-primary" data-dismiss="modal">취소</button>
		       <button type="submit" class="btn btn-primary">저장</button>
		    </div>
		</form>
		<script src="${pageContext.request.contextPath}/resources/js/writeForm.js"></script>
	</div>
</div>