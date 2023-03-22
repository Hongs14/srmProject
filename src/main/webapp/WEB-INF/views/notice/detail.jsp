<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html lang="en">


<script>
	var ntcCountCmnt = parseInt("${countNtcComment}",10);
	
	$(document).ready(function(){
	   readComment();
	});
	
	function readComment(){
	   //댓글 불러오기
	   let ntcNo ='${notice.ntcNo}';
	   $.ajax({
    	url:"${pageContext.request.contextPath}/notice/read/comment?ntcNo="+ntcNo,
     	type:"get",
     	dataType: "html",
     	success:function(data){
        	$('#ntcComment').html(data);
	        
     		}
		});
	};
	
	
	function writeComment(){
		//댓글 작성
		let content = $('#ntcCmntCn').val();
		let userNo = '${sessionScope.loginUser.userNo}';
		let ntcNo = '${notice.ntcNo}';
		
		let data = {userNo: userNo, ntcNo: ntcNo, ntcCmntCn: content};
		$.ajax({
		   url: "${pageContext.request.contextPath}/notice/write/comment",
		   method: "post",
		   data: JSON.stringify(data),
		   contentType: "application/json; charset=UTF-8"
		}).done((data) => {
		   $('#ntcCmntCn').val('');
		   readComment();
		   $('#cmntCount').html('댓글('+(ntcCountCmnt+1)+')');
		   ntcCountCmnt += 1;
		});
	}
	
	function updateCButton(i){
		$('#commentContent'+i).removeAttr("disabled");
		$('#updateToggle'+i).html("변경");
		$('#updateToggle'+i).attr('onclick', 'udpateComplete('+i+')');
	};
	
	function udpateComplete(i){
		//댓글 수정
		let content = $('#commentContent'+i).val();
		 let ntcCmntNo = i;
		let data = {ntcCmntNo: ntcCmntNo, ntcCmntCn: content};  
		$.ajax({
		   url: "${pageContext.request.contextPath}/notice/update/comment",
		   method: "post",
		   data: JSON.stringify(data),
		   contentType: "application/json; charset=UTF-8"
		}).done((data) => {
		   $('#commentContent'+i).attr('disabled','disabled');
		   $('#updateToggle'+i).html("수정");
		   $('#updateToggle'+i).attr('onclick', 'updateCButton('+i+')');
		}); 
	};
	
	function deleteComment(i){
		//댓글 삭제
		let ntcCmntNo = i;
		$.ajax({
		   url: "${pageContext.request.contextPath}/notice/delete/comment",
		   method: "get",
		   data: 'ntcCmntNo='+ntcCmntNo
		}).done((data) => {
		   $('#cmntCount').html('댓글('+(ntcCountCmnt-1)+')');
		   ntcCountCmnt -= 1;
		   $('#ntcComment').empty(); 
		   readComment();
		   
		});
	};

</script>

<!-- 메인 컨테이너 Container Fluid-->

<div class="d-sm-flex align-items-center justify-content-between">
	<div class="bg-primary px-3 py-2" style="border-top-left-radius: 10px; border-top-right-radius: 10px;">
		<h6 class="mb-0 text-white">공지사항</h6>
	</div>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Home</a></li>
		<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/notice/list">공지사항</a></li>
	</ol>
</div>
<!-- Row -->


<div class="card mb-4 ajaxDetail">
	<div class="d-flex flex-row align-items-center justify-content-between px-3 pt-3">
		<div>
			<small class="m-0 font-weight-bold text-primary">공지사항 No.${notice.ntcNo}</small>
		</div>
		<div>
			<small>조회수 : ${notice.ntcInqCnt} </small>
		</div>
	</div>
	<div class=" p-3 d-flex flex-column">
		<div class="row align-items-center mb-1 ">
			<div class=" col-sm-2 text-center">
				<label class="col-form-label">작성자</label>
			</div>
			<div class="col-sm-4">
				<span>${notice.userId}</span>
			</div>
			<div class=" col-sm-2 text-center">
				<label class="col-form-label">작성일</label>
			</div>
			<div class="col-sm-4">
				<span>${notice.ntcWrtDate}</span>
			</div>
		</div>	
		<div class="row align-items-center mb-2">
			<div class="col-sm-2 text-center">
				<label class="col-form-label">제목</label>
			</div>
			<div class="col-sm-10">
				<span class="font-weight-bold text-primary col-form-label">${notice.ntcTtl}</span>
			</div>
		</div>	
		<div class="row mb-1">
			<div class=" col-sm-2 text-center">
				<label class="col-form-label">내용</label>
			</div>
			<div class="col-sm-10 border p-2" style="height:300px; overflow-y: scroll;" > 
				<span>${fn: replace(notice.ntcCn, replaceChar,"")}</span>
			</div>
		</div>
		<div class="row align-items-center">
			<div class=" col-sm-2 text-center">
				<label class="col-form-label">첨부파일</label>
			</div>
			<div class="col-sm-10">	
				<c:forEach var="noticeFile" items="${noticeFile}">
					<span><a href="${pageContext.request.contextPath}/notice/fileDownload?ntcFileNo=${noticeFile.ntcFileNo}">${noticeFile.ntcFileActlNm}</a></span>
				</c:forEach>	                            		
			</div>
		</div>			                            		
		<div class="d-sm-flex justify-content-end">
			<a href="${pageContext.request.contextPath}/notice/list?sysNo=${notice.sysNo}" class="btn btn-primary mr-1">목록</a>
			<c:if test="${sessionScope.loginUser.userType eq '관리자'}">
				<c:if test="${sysNo eq notice.sysNo or notice.sysNo eq 'SRM'}">
					<a onclick="getNoticeUpdate('${notice.ntcNo}')" class="btn btn-primary mr-1">수정</a>
					<form method="post" action="${pageContext.request.contextPath}/notice/delete" enctype="multipart/form-data">
						<input type="hidden" id="ntcNo" name="ntcNo" value="${notice.ntcNo}"/>
						<input type="hidden" id="sysNo" name="sysNo" value="${notice.sysNo}"/>
						<button type="submit" class="btn btn-primary">삭제</button>
					</form>
				</c:if>
			</c:if>
		</div>
	</div>
</div>
<!-- 댓글 -->
<div class="card p-4 mb-4">
	<div  class="mx-3 mb-2"><span id="cmntCount">댓글(${countNtcComment})</span></div>
	<div class="cmnts" style="overflow-y: scroll; height:200px;">
		<div class="mx-3 p-1" >
			<div class="row  justify-content-between">
				<div class="col-sm-2 form-group">
					${sessionScope.loginUser.userNm}
				</div>
				<div class="col-sm-8 ">
					<textarea  class="form-control" id="ntcCmntCn"></textarea>
				</div>
				<div class="col-sm-2 text-right">
					<button type="button" class="btn btn-primary btn-sm" onclick="writeComment();">등록하기</button>
				</div>
			</div>
		</div>
		<div id="ntcComment"></div>
	</div>
</div>



