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
	<div class="mb-4 mt-4 px-5" style="max-width:850px">
	
		<div class="row mb-2 mr-0" id="sr_no">
			<div class="col-6">
	  			<span class="text-primary font-weight-bold">SR No.</span>  
	  			<span>${sr.srNo}</span>
			</div>
			<div class="col-6 text-right">
				<c:if test="${sr.sttsNm eq '요청'}"><span class="badge badge-dark" style="font-size:100%">${sr.sttsNm}</span></c:if>
				<c:if test="${sr.sttsNm eq '검토중'}"><span  class="badge badge-outline-primary" style="font-size:100%; border: 1px solid black;">${sr.sttsNm}</span></c:if>
				<c:if test="${sr.sttsNm eq '접수'}"><span class="badge badge-primary" style="font-size:100%; border: 1px solid black;">${sr.sttsNm}</span></c:if>
				<c:if test="${sr.sttsNm eq '개발계획'}"><span class="badge text-white" style="font-size:100%; background-color:#0a8091;">${sr.sttsNm}</span></c:if>
				<c:if test="${sr.sttsNm eq '개발중'}"><span class="badge badge-info" style="font-size:100%">${sr.sttsNm}</span></c:if>
				<c:if test="${sr.sttsNm eq '개발 완료'}"><span class="badge badge-success" style="font-size:100%">개발완료</span></c:if>
				<c:if test="${sr.sttsNm eq '반려'}"><span class="badge badge-danger" style="font-size:100%">${sr.sttsNm}</span></c:if>
				<c:if test="${sr.sttsNm eq '재검토'}"><span class="badge badge-warning" style="font-size:100%">${sr.sttsNm}</span></c:if>
				<c:if test="${sr.sttsNm eq '완료요청'}"><span class="badge text-white" style="font-size:100%; background-color:#a33bff;">${sr.sttsNm}</span></c:if>
				<c:if test="${sr.sttsNm eq '계획조정'}"><span class="badge text-white" style="font-size:100%; background-color:#78380c;">${sr.sttsNm}</span></c:if>
			</div>
		</div>
  		<hr>
               			
      	<div class="row mb-2 mr-0" >
			<div class="col-sm-2">
				<span class="font-weight-bold">등록자: </span> 
			</div>
			<div class="col-sm-3">
				<span>${sr.userNm}</span> 
			</div>
			<div class="col-sm-3">
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
			<div class="col-sm-3">
				<span>${sr.srRegDate}</span> 
			</div>
			<div class="col-sm-3">
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
			<div class="col-sm-10 border border-light p-2" style="height:320px; overflow-y: scroll;">
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
			<div class="col-sm-10 custom-file">
				<c:forEach var="requestFile" items="${srFile}">
						<span><a href="fileDownload?requestFileNo=${requestFile.srFileNo}&srNo=${sr.srNo}">${requestFile.srFileActlNm}</a></span>
           		</c:forEach>
			</div>	
		</div>
		<c:if test="${sr.sttsNm eq '반려'}">
			<div class="row mb-4" style="min-height:50px; border-radius:5px; border:2px solid #f7d0ce;">
				<div class="col-sm-2 text-center" style="background:#f7d0ce;">
					<span class=" font-weight-bold"><i class="fas fa-exclamation-triangle" style="font-size:30px; color:#FFA426;"></i><br>반려사유</span> 
				</div>
				<div class="col-sm-10 border-bottom border-light">
					<span>${sr.srOpnn}</span> 
				</div>
			</div>
		</c:if>
		<c:if test="${sr.sttsNm eq '재검토'}">
			<div class="row mb-4" style="min-height:50px; border-radius:5px; border:2px solid #f7d0ce;">
				<div class="col-sm-2 text-center" style="background:#f7d0ce;">
					<span class=" font-weight-bold"><i class="fas fa-exclamation-triangle" style="font-size:30px; color:#FFA426;"></i><br>검토의견</span> 
				</div>
				<div class="col-sm-10 border-bottom border-light">
					<span>${sr.srOpnn}</span> 
				</div>
			</div>
		</c:if>
		<!-- 하단 버튼들 -->
		<div id="buttons" class="m-3 text-right">
			<a href='<c:url value="/request/list"/>'><button type="button" class="btn btn-primary btn-sm">글목록</button></a>
			
			<!-- 삭제 modal 버튼-->
			<c:if test="${sr.sttsNm eq '요청' and sessionScope.userNo eq sr.srCustNo}">
				<a><button type="button" onclick="getUpdateForm('${sr.srNo}')"class="btn btn-primary btn-sm">수정</button></a>
				<button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#deleteFun">삭제</button>
			</c:if>
			<c:if test="${sr.sttsNm eq '재검토' and sessionScope.userNo eq sr.srCustNo}">
				<a><button type="button" onclick="getUpdateForm('${sr.srNo}')"class="btn btn-warning btn-sm">재작성</button></a>
			</c:if>
			<!-- Modal -->
			<div class="modal" id="deleteFun" tabindex="-1" role="dialog" aria-labelledby="deleteFunLabel" aria-hidden="true">
			   <div class="modal-dialog" role="document" style="max-width:450px;">
			     <div class="modal-content">
			       <div class="modal-header bg-primary">
			         	<h5 class="modal-title" id="deleteFunLabel"> 
				          	<img src="${pageContext.request.contextPath}/resources/images/logoOnly.png" style="width:20px;">
				        	<small class="text-white"><b id="modalHeadText">요청 삭제</b></small>
				        </h5>
			         <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
			           <span aria-hidden="true">&times;</span>
			         </button>
			       </div>
			       <div class="modal-body justify-content-center text-center p-5">
				       <div class="d-flex align-items-center">
					       <div id="iconWrapper" class="mr-4">
						       	<i class="fas fa-exclamation-triangle" style="font-size:3rem; color:#FFA426;"></i>
					       </div>
					       <div id="dialogWrapper" class="text-left">
						     <h5 id="modalBodyText"> 정말 삭제하시겠습니까? </h5>
					       </div>
				       </div>
			       </div>
			       <div class="modal-footer justify-content-center text-center">
			           	<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			        	<button type="button" class="btn btn-warning" onclick="deleteRequest('${sr.srNo}')">삭제</button>
			       </div>
			     </div>
			   </div>
			 </div>
			<!-- Modal -->
			<script>
			/* SR 삭제 */
			function deleteRequest(srNo) {
				 $.ajax({
						type: "GET",
						url: "delete/"+srNo,
				    }).done((data) => {
				    	$("#deleteFun").modal('hide');
				    	$("#requestModal").modal();
				    	$("#modalHeadText").text("SR 삭제");
				    	$("#modalBodyText").text("SR 삭제가 완료되었습니다.");
				    	setTimeout(function() {
				    		location.href = '<c:url value="/request/list" />';
			    		}, 2000);
						
				    });
			}
			</script>
		</div>
 	</div> 
</div>
