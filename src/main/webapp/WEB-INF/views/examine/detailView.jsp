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
<div class="card mb-4 detailView" >
	<div class="mb-4 mt-4 px-5" style="max-width:1050px">

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
			<div class="col-sm-3">
				<span>${examine.userNm}</span> 
			</div>
			<div class="col-sm-3">
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
			<div class="col-sm-3">
				<span>${examine.srRegDate}</span> 
			</div>
			<div class="col-sm-3">
				<span class=" font-weight-bold">관련시스템: </span> 
			</div>
			<div class="col-sm-4">
				<span>${examine.sysNm}</span> 
			</div>
		</div>
		<c:if test="${loginUser.sysNm eq examine.sysNm}">
		<hr>
			<div id="srExamineBox">
			<div class="row mb-2">
				<div class="col-sm-2">
					<span><b>SR 검토</b></span>
				</div>
			</div>
			<div class="row mb-4">
				<div class="col-6">
		   			<span>요청구분</span>
		   			<select class="form-control form-control-sm" id="srReqSe" name="srReqSe">
		   				<option>개발(신규)</option>
		   				<option>개발(개선)</option>
		   			</select>
				</div>
				<div class="col-6">
					<span>중요 여부</span>
					<select class="form-control form-control-sm" id="srPry" name="srPry">
	   					<option>상</option>
		   				<option>중</option>
		   				<option>하</option>
		   			</select>
				</div>
			</div>
   			<div class="row mb-2 mr-0">
   				<div class="col-12">
			   		<span>검토 상태</span>
			   		<select class="form-control form-control-sm" id="examineSttsNm" name="examineSttsNm" onchange="sttsNmChange()">
			   			<option>검토중</option>
			   			<option>반려</option>
			   			<option>재검토</option>
			   			<option>접수</option>
			   		</select>
   				</div>
   			</div>
   			<div class="row mb-2 mr-0">
   				<div class="col-12">
			   		<span id="srOpnnTtl" class="d-none">검토 의견</span>
			   		<textarea class="form-control d-none" rows="3" id="srOpnn" name="srOpnn">${examine.srOpnn}</textarea>
   				</div>
   			</div>
			<div id="buttons" class="m-3 text-right">
				<button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#examineBtn" id="#modalScroll" onclick="alarmBtn()">저장</button>
			</div>
  			</div>
		</c:if>
		<script>
			function sttsNmChange() {
				var sttsNmSelect = document.getElementById("examineSttsNm");
				var sttsNm = sttsNmSelect.options[document.getElementById("examineSttsNm").selectedIndex].text;
				
				if(sttsNm == "접수" ){
					$('#srOpnn').addClass('d-none');
					$('#srOpnnTtl').addClass('d-none');
				}else if(sttsNm == "검토중"){
					$('#srOpnn').addClass('d-none');
					$('#srOpnnTtl').addClass('d-none');
				}else{
					$('#srOpnn').removeClass('d-none');
					$('#srOpnnTtl').removeClass('d-none');
				}
				
			}
		</script>
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
			<div class="col-sm-10 border border-light p-2" style="min-height: 150px;">
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
<div class="modal fade" id="examineBtn" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
		<div class="modal-content">
			<div class="modal-header bg-primary">
				<h5 class="modal-title" id="exampleModalScrollableTitle">
		          	<img src="${pageContext.request.contextPath}/resources/images/logoOnly.png" style="width:20px;">
		        	<small class="text-white">
		        		<b>SR 검토 관리</b>
		        	</small>
				</h5>
				<button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body p-5" style="white-space: normal;">
				<div class="alert alert-secondary m-3 p-2" role="alert">
					<h6><i class="fas fa-exclamation-triangle"></i><b> 안내 </b></h6>
					<div id="message"></div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-primary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<script>
	function alarmBtn() {
		
		var message = "저장되었습니다.";
		
		var srNo = document.getElementById("srNo").value;
		var srOpnn = document.getElementById("srOpnn").value;
		
		var srReqSeSelect = document.getElementById("srReqSe");
		var srPrySelect = document.getElementById("srPry");
		var sttsNmSelect = document.getElementById("examineSttsNm");
		
		var srReqSe = srReqSeSelect.options[document.getElementById("srReqSe").selectedIndex].text;
		var srPry = srPrySelect.options[document.getElementById("srPry").selectedIndex].text;
		var sttsNm = sttsNmSelect.options[document.getElementById("examineSttsNm").selectedIndex].text;
		var examineSttsNm = "${examine.sttsNm}";
		
		if(sttsNm == examineSttsNm){
			message = "이미 검토중 입니다.	";
		}else{
			let msg = '알림이 도착하였습니다.'
	   		socket.send(msg);
		}
		console.log(srOpnn);
		
		if(sttsNm == "반려" || sttsNm == "재검토"){
			if(srOpnn == ""){
				message = "검토의견을 작성해주세요";
				$("#srOpnn").addClass("border-danger");
				$("#message").text(message);
				return false;
			}
		}
		
		let data = {srNo : srNo, srReqSe : srReqSe, srPry : srPry, sttsNm : sttsNm, srOpnn : srOpnn}
		
		$.ajax({
			url : "${pageContext.request.contextPath}/examine/detail",
			method : "post",
			data : JSON.stringify(data),
			contentType : "application/json; charset=UTF-8"
		}).done((data) => {
			$("#message").text(message);
	    	setTimeout(function() {
	    		window.location.href = "${pageContext.request.contextPath}/examine/list";
	    	}, 2000);
		})
	}
</script>
