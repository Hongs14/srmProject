<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="d-sm-flex align-items-end justify-content-between">
	<div class="bg-primary px-3 py-2"
		style="border-top-left-radius: 10px; border-top-right-radius: 10px;">
		<h6 class="mb-0 text-white">SR 검토 상세</h6>
	</div>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><b>SR 관리</b></li>
		<li class="breadcrumb-item active" aria-current="page">SR
			검토상세</li>
	</ol>
</div>
<div class="card mb-4">
	<div>
		<div class="mb-1 mt-5 px-5" style="max-width:1050px">
 			<form method="post" action="detail">
	 			<div class="my-2">
		  			<span class="text-primary font-weight-bold">SR No.</span> 
		  			<span>${examine.srNo}</span>
		  			<input type="hidden" id="srNo" name="srNo" value="${examine.srNo}">
	 			</div>
	   			<hr>
	                			
	       		<div class="row mb-2 mr-0" >
					<div class="col-sm-2">
						<span class="font-weight-bold">등록자: </span> 
					</div>
					<div class="col-sm-4">
						<span>${examine.userNm}</span> 
					</div>
					<div class="col-sm-2">
						<span class="font-weight-bold">소속: </span> 
					</div>
					<div class="col-sm-4">
						<span>${examine.userOgdp}</span> 
					</div>
				</div>
				
				<div class="row mb-2 mr-0">
					<div class="col-sm-2">
						<span class=" font-weight-bold">등록일: </span> 
					</div>
					<div class="col-sm-4">
						<span>${examine.srRegDate}</span> 
					</div>
					<div class="col-sm-2">
						<span class=" font-weight-bold">관련시스템: </span> 
					</div>
					<div class="col-sm-4">
						<span>${examine.sysNm}</span> 
					</div>
				</div>
				<hr/>

				<div class="row mb-2 mr-0">
					<div class="col-sm-2">
						<span><b>SR 검토</b></span>
					</div>
				</div>
				<hr>
				<div class="row mb-2 mr-0">
					<div class="col-6">
			   			<span>요청구분</span>
			   			<select class="form-control" id="srReqSe" name="srReqSe">
			   				<option>개발(신규)</option>
			   				<option>개발(개선)</option>
			   			</select>
					</div>
					<div class="col-6">
						<span>중요 여부</span>
						<select class="form-control" id="srPry" name="srPry">
		   					<option>상</option>
			   				<option>중</option>
			   				<option>하</option>
			   			</select>
					</div>
				</div>
	   			<div class="row mb-2 mr-0">
	   				<div class="col-12">
				   		<span>검토 상태</span>
				   		<select class="form-control" id="sttsNm" name="sttsNm">
				   			<option>검토중</option>
				   			<option>반려</option>
				   			<option>재검토</option>
				   			<option>접수</option>
				   		</select>
	   				</div>
	   			</div>
	   			<div class="row mb-2 mr-0">
	   				<div class="col-12">
				   		<span>검토 의견</span>
				   		<textarea class="form-control" rows="3" id="srOpnn" name="srOpnn">${examine.srOpnn}</textarea>
	   				</div>
	   			</div>
				<!-- 하단 버튼들 -->
				<div id="buttons" class="m-3 text-right">
					<button type="submit" class="btn btn-primary">저장</button>
				</div>
			</form>
   		
   			<hr>
			<div class="row mb-4">
				<div class="col-sm-2">
					<span class=" font-weight-bold">SR 제목: </span> 
				</div>
				<div class="col-sm-10 border-bottom border-light">
					<span>${examine.srTtl}</span> 
				</div>
			</div>
			<div class="row mb-4">
				<div class="col-sm-2">
					<span class="font-weight-bold">관련근거: </span> 
				</div>
				<div class="col-sm-10 border-bottom border-light">
					<span>${examine.srStd}</span> 
				</div>
			</div>
			<div class="row mb-4">
				<div class="col-sm-2">
					<span class=" font-weight-bold">SR 내용: </span> 
				</div>
				<div class="col-sm-10 border-bottom border-light">
					<span>${examine.srCn}</span>
				</div>
			</div>
			<!-- 첨부파일 -->
			<div class="row mb-2">
				<div class="col-sm-2">
					<span class="font-weight-bold">첨부파일: </span> 
				</div>
				<div class="col-sm-10">
					<div class="custom-file">
						<c:forEach var="examineFileList" items="${examineFileList}">
							<span><a href="fileDownload?srFileNo=${examineFileList.srFileNo}">${examineFileList.srFileActlNm}</a></span>
	               		</c:forEach>
					</div>
				</div>
			</div>
		</div> 
	</div>
</div>