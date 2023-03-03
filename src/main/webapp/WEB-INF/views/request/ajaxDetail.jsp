<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% pageContext.setAttribute("replaceChar", "\n"); %>

<div class="d-sm-flex align-items-end justify-content-between">
	<div class="bg-primary px-3 py-2"
		style="border-top-left-radius: 10px; border-top-right-radius: 10px;">
		<h6 class="mb-0 text-white">SR 요청상세</h6>
	</div>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><b>SR 관리</b></li>
		<li class="breadcrumb-item active" aria-current="page">SR 요청상세</li>
	</ol>
</div>
<div class="card mb-4 ajaxDetail">
	<div>
		<div class="mb-1 mt-5 px-5" style="max-width:850px">
 			<div class="my-2" id="sr_no">
	  			<span class="text-primary font-weight-bold">SR N0.</span> 
	  			<span>${sr.srNo}</span>
 			</div>
   			<hr>
                			
       		<div class="row mb-2 mr-0" >
				<div class="col-sm-2">
					<span class="font-weight-bold">등록자: </span> 
				</div>
				<div class="col-sm-4">
					<span>${sr.userNm}</span> 
				</div>
				<div class="col-sm-2">
					<span class="font-weight-bold">소속: </span> 
				</div>
				<div class="col-sm-4">
					<span>${sr.userOgdp}</span> 
				</div>
			</div>
			
			<div class="row mb-2 mr-0">
				<div class="col-sm-2">
					<span class=" font-weight-bold">등록일: </span> 
				</div>
				<div class="col-sm-4">
					<span>${sr.srRegDate}</span> 
				</div>
				<div class="col-sm-2">
					<span class=" font-weight-bold">관련시스템: </span> 
				</div>
				<div class="col-sm-4">
					<span>${sr.sysNm}</span> 
				</div>
			</div>
			<hr/>
			<div class="row mb-4">
				<div class="col-sm-2">
					<span class=" font-weight-bold">SR 제목: </span> 
				</div>
				<div class="col-sm-10 border-bottom border-light">
					<span>${sr.srTtl}</span> 
				</div>
			</div>
			<div class="row mb-4">
				<div class="col-sm-2">
					<span class="font-weight-bold">관련근거: </span> 
				</div>
				<div class="col-sm-10 border-bottom border-light">
					<span>${sr.srStd}</span> 
				</div>
			</div>
			<div class="row mb-4">
				<div class="col-sm-2">
					<span class=" font-weight-bold">SR 내용: </span> 
				</div>
				<div class="col-sm-10 border border-light p-2" style="min-height: 320px;">
					<span class="sr_content"> 
						${fn: replace(sr.srCn, replaceChar, "") } 
					</span> 
				</div>
			</div>
			<!-- 첨부파일 -->
			<div class="row mb-2">
				<div class="col-sm-2">
					<span class="font-weight-bold">첨부파일: </span> 
				</div>
				<div class="col-sm-10">
					<div class="custom-file">
						<c:forEach var="requestFile" items="${srFile}">
							<span><a href="fileDownload?requestFileNo=${requestFile.srFileNo}&srNo=${sr.srNo}">${requestFile.srFileActlNm}</a></span>
	               		</c:forEach>
					</div>
				</div>	
			</div>
			<!-- 하단 버튼들 -->
			<div id="buttons" class="m-3 text-right">
			<a href='<c:url value="/request/list"/>'><button type="button" class="btn btn-primary">글목록</button></a>
			<a><button type="button" onclick="getUpdateForm('${sr.srNo}')"class="btn btn-primary">수정</button></a>
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#deleteFun">삭제</button>
			
			
			<!-- Modal -->
			<div class="modal fade" id="deleteFun" tabindex="-1" aria-labelledby="deleteFunLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="deleteFunLabel">요청 삭제</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body text-left">
			      	 정말 삭제하시겠습니까? 
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			        <a type="button" class="btn btn-warning" href= '<c:url value="/request/delete/${sr.srNo}"/>'>삭제</a>
			      </div>
			    </div>
			  </div>
			</div>
			<!-- Modal -->
		</div>
      </div> 
	</div>
</div>
