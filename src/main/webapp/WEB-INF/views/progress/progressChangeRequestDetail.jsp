<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
	<div class="modal-header bg-primary">
		<h5 class="modal-title" id="exampleModalScrollableTitle">
			<img src="${pageContext.request.contextPath}/resources/images/logoOnly.png" style="width:20px;">
        	<small class="text-white">
        		<b>기간 추가 확정</b>
        	</small>
		</h5>
	</div>
	<div class="modal-body" style="white-space: normal;">
		<div class="p-5" style="text-align:left">
			<!-- 등록자, 계획 변경 날짜 -->
			<div class="row">
				<div class="col-6">
					<span class="font-weight-bold">요청자: </span>
					<span>${changeRequest.userNm}</span>
				</div>
				<div class="col-6">
					<span class="font-weight-bold">요청 날짜: </span>
					<span>${changeRequest.crRegDate}</span>
				</div>
			</div>
			<br/>
			<!-- 제목 -->
			<div class="row">
				<div class="col-12">
					<span class="font-weight-bold">제목: </span>
					<span>${changeRequest.crTtl}</span>
				</div>
			</div>
			<br/>
			<!-- 내용 -->
			<div class="row mb-1">
				<div class="col-2">
					<span class="font-weight-bold ">내용 </span>
				</div>
				<div class="col-10 border" style="min-height:100px;">
					<span>${changeRequest.crCn}</span>
				</div>
			</div>
			<br/>
			<!-- 계획 날짜, 상태 -->
			<div class="row">
				<div class="col-6">
					<span class="font-weight-bold">계획 연장 날짜: </span>
					<span>${changeRequest.crDdlnDate}</span>
				</div>
				<div class="col-6">
					<span class="font-weight-bold">신청 결과: </span>
					<span>${changeRequest.crResult}</span>
				</div>
			</div>
			<br/>
			<!-- 첨부파일 -->
			<div class="row">
				<div class="col-12">
					<span class="font-weight-bold ">첨부 파일</span>
					<div>
						<a href="ChangeRequestFileDownload/${changeRequest.crNo}">
							<span class="font-weight-bold ">${changeRequest.crFileActlNm}</span>
							<br/>
						</a>
					</div>
				</div>
			</div>
			
			<div class="modal-footer justify-content-right mr-0">
				<button type="submit" class="btn btn-primary" onclick="changeRequest()">
					저장
				</button>
			</div>
		</div>
	</div>
	
	<script>
		
	</script>
	