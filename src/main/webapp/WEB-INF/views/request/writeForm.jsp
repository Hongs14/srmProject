<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% pageContext.setAttribute("replaceChar", "\n"); %>

<div class="d-sm-flex align-items-end justify-content-between">
	<div class="bg-primary px-3 py-2"
		style="border-top-left-radius: 10px; border-top-right-radius: 10px;">
		<h6 class="mb-0 text-white">
		<c:if test="${command eq 'write'}">SR요청등록</c:if>
		<c:if test="${command eq 'update'}">SR요청수정</c:if></h6>
	</div>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><b>SR 관리</b></li>
		<li class="breadcrumb-item active" aria-current="page">SR
			요청등록</li>
	</ol>
</div>
<div class="card">
	<div class="p-5">
		<form method="post" onsubmit="return false;"  enctype="multipart/form-data">
			<c:if test="${command eq 'update'}">
				<div class="my-2" id="sr_no">
		  			<span class="text-primary font-weight-bold">SR N0.</span> 
		  			<span>${sr.srNo}</span>
		  			<input id="srNo" type="hidden" name="srNo" value="${sr.srNo}"/>
	 			</div>
	   			<hr>
   			</c:if>
			<div class="row mb-2 mr-0" >
					<label class="col-sm-2">등록자 </label> 
					<input  class="col-sm-4" disabled value="${sessionScope.loginUser.userNm}" />
					<span class="col-sm-2">소속 </span> 
					<input class="col-sm-4" disabled value="${sessionScope.loginUser.userDpNm}" />
			</div>
			
			<div class="row mb-2 mr-0">
				<span class="col-sm-2">등록일 </span> 
				<div class="form-group col-sm-4 px-0" id="simple-date1" >
					<div class="input-group date" >
						<div class="input-group-prepend">
							<span class="input-group-text" id="srRegDate"><i class="fas fa-calendar" ></i></span>
						</div>
						<input type="text" class="form-control" value="" id="dateInput"  style="height:30px;" disabled>
					</div>
				</div>
				<span class="col-sm-2">관련시스템 </span> 
				<input name="sysNm" id="sysNm" class="col-sm-4" disabled value="${sessionScope.loginUser.sysNm}" style="height:30px;"/>
			</div>
			<hr>
			<div class="row mb-2 align-items-center">
				<span class=" font-weight-bold col-sm-2">SR 제목 </span> 
				<input name="srTtl" id="srTtl"class="col-sm-10" type="text" class="form-control form-control-sm" <c:if test="${command eq 'update'}">value="${sr.srTtl}"</c:if>/>
			</div>
			<div class="row mb-2 align-items-center">
				<label class=" font-weight-bold col-sm-2">관련근거 </label> 
				<input name="srStd" id="srStd" class="col-sm-10" type="text" class="form-control form-control-sm" <c:if test="${command eq 'update' and sr.srStd ne undefined}"> value="${sr.srStd}"</c:if>/>
			</div>
			<div class="row mb-2">
					<label class=" font-weight-bold col-sm-2">SR 내용 </label> 
					<textarea name="srCn" id="srCn" rows="10" class="form-control form-control-sm col-sm-10"><c:if test="${command eq 'update'}">${fn: replace(sr.srCn, "<br>","") } </c:if></textarea>
					
			</div>
			
			<!-- userNo -->	                	
			<div>
				<input type="hidden" id="userNo" name="userNo" value="${sessionScope.loginUser.userNo}">
			</div>
			
			<!-- 파일 첨부 -->
			<div class="row mb-2">
				<span class=" font-weight-bold col-sm-2">첨부파일 </span> 
				<div class="custom-file col-sm-10">
					<input type="file" class="custom-file-input form-control" id="srFile" name="srFile" onchange="addRequestFile(this)" multiple>
					<label class="custom-file-label text-truncate" for="customFile">파일 선택</label>
				</div>
			</div>
			<div class="row mb-2">
				<span class=" font-weight-bold col-sm-2">파일목록 </span> 
				
				<div class="col-sm-10" id="userfile">
					<div id="requestFile">
					<c:if test="${command eq 'update'}"> 
						<c:forEach var="requestFile" items="${srFile}">
							<div id="file${requestFile.srFileNo}" class="filebox row">
				              	<a class="delete col-1" onclick="deleteExistingFile('${requestFile.srFilePhysNm}','${requestFile.srFileNo}')"><i class="far fa-minus-square"></i></a>
				                <a href="fileDownload?requestFileNo=${requestFile.srFileNo}&srNo=${sr.srNo}">${requestFile.srFileActlNm}</a>
					        </div>
	               		</c:forEach>
	               	</c:if>
					</div>
				</div>
			</div>
			<div class="modal-footer justify-content-center">
		       <button type="button" class="btn btn-outline-primary" data-dismiss="modal">취소</button>
		       <c:if test="${command ne 'update'}"><button type="submit" class="btn btn-primary" onclick="requestWrite()">저장</button></c:if>
		       <c:if test="${command eq 'update'}"><button type="submit" class="btn btn-primary" onclick="requestUpdate()">저장</button></c:if>
		    </div>
		</form>
		<script src="${pageContext.request.contextPath}/resources/js/writeForm.js"></script>
	</div>
</div>