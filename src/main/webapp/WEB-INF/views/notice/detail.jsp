<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html lang="en">


<script>
	$(document).ready(function(){
		console.log("시작");
	  	readComment();
	});
	  		
	function readComment(){
		let noticeNo ='${notice.ntcNo}';
	  	console.log(noticeNo);
	  	$.ajax({
			url:"${pageContext.request.contextPath}/notice/read/comment"
			,type:"get"
			,data: 'ntcNo='+noticeNo
			,success:function(data){
			console.log(data);
			$.each(data, function(index, item){
				let comment = '<hr/>';
				comment += '<div id="readCmnt">';
				comment += 	'<div class="d-flex px-2 flex-row align-items-center justify-content-between">';
				comment += 		'<div>';
				comment += 			'<span style="color: #406882; margin-right:20px;"><b>'+item.userId+'</b></span>';
				comment += 			'<span>'+item.ntcCmntDate+'</span>';
				comment +=		'</div>';
				comment += 		'<div>';
				comment += 			'<input type="hidden" id="ntcCmntNo" value="'+item.ntcCmntNo+'"/>';
				comment += 			'<a id="updateToggle'+item.ntcCmntNo+'" onclick="updateCButton('+item.ntcCmntNo+')">수정</a> | <a onclick="deleteComment('+item.ntcCmntNo+')">삭제</a> |';
				comment += 		'</div>';
				comment += 	'</div>';
				comment += 	'<textarea id="commentContent'+item.ntcCmntNo+'" disabled="disabled" style="border: none; resize:none; width:90%">'+item.ntcCmntCn+'</textarea>';
				comment +='</div>'; 
			    $('#ntcComment').append(comment); 
			});
			        	
			}
		})
	};
	  		
	function writeComment(){
		console.log("댓글달기 실행");
		let content = $('#ntcCmntCn').val();
		let ntcWriterNo = '${sessionScope.loginUser.userNo}';
		let ntcwriter = '${sessionScope.loginUser.userId}';
		let ntcNo = '${notice.ntcNo}';
				
		let data = {userNo: ntcWriterNo, ntcNo: ntcNo, ntcCmntCn: content};
		console.log(data);
		console.debug("noticeDetail.jsp::socket",socket);
		console.debug("noticeDetail.jsp::content",content);
		socket.send(content);
		$.ajax({
			url: "${pageContext.request.contextPath}/notice/write/comment",
			method: "post",
			data: JSON.stringify(data),
			contentType: "application/json; charset=UTF-8"
		}).done((item) => {
			console.log(item);
					
			let comment = '<hr/>';
	        comment += '<div class="d-flex px-2 flex-row align-items-center justify-content-between">';
	        comment += 	'<div>'
			comment += 		'<span style="color: #406882; margin-right:20px;"><b>'+ntcwriter+'</b></span>';
			comment += 		'<span>'+item.ntcCmntDate+'</span>';
			comment +=	'</div>'
			comment += 	'<div>'
			comment += 		'<input type="hidden" id="ntcCmntNo" value="'+item.ntcCmntNo+'"/>'
			comment += 		'<a id="updateToggle'+data.ntcCmntNo+'" onclick="updateCButton('+item.ntcCmntNo+')">수정</a> | <a onclick="deleteComment('+item.ntcCmntNo+')">삭제</a> |';
			comment += 	'</div>';
			comment +='</div>';
			comment += '<textarea id="commentContent'+item.ntcCmntNo+'" disabled="disabled" style="border: none; resize:none; width:90%">'+item.ntcCmntCn+'</textarea>';
				
	        $('#ntcComment').append(comment); 
	        $('#cmntCount').empty();
	        $('#cmntCount').append('댓글('+(${notice.countCmnt}+1)+')');
	        $('#ntcCmntCn').val('');
	        
					
		});
	}
			
	function updateCButton(i){
		console.log(i);
		$('#commentContent'+i).removeAttr("disabled");
		console.log("수정 버튼 실행");
		$('#updateToggle'+i).html("변경");
		$('#updateToggle'+i).attr('onclick', 'udpateComplete('+i+')');
				
	};

	function udpateComplete(i){
		console.log("댓글수정 ajax");
		console.log(i);
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
			console.log(data);
		}); 
	};
			
	function deleteComment(i){
		console.log("댓글삭제"+i);
		let ntcCmntNo = i;
		$.ajax({
			url: "${pageContext.request.contextPath}/notice/delete/comment",
			method: "get",
			data: 'ntcCmntNo='+ntcCmntNo,
		}).done((data) => {
			console.log("성공");
			$('#cmntCount').empty();
	        $('#cmntCount').append('댓글('+(${notice.countCmnt}-1)+')');
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
	<div id="cmntCount" class="mx-3 mb-2">댓글<span>(${notice.countCmnt})</span></div>
	<div class="cmnts" style="overflow-y: scroll; height:200px;">
		<div class="mx-3 p-1" >
			<div class="row  justify-content-between">
				<div class="col-sm-2 form-group">
					${sessionScope.loginUser.userId}
				</div>
				<div class="col-sm-8 ">
					<textarea  class="form-control" id="ntcCmntCn"></textarea>
				</div>
				<div class="col-sm-2 text-right">
					<button type="button" class="btn btn-primary btn-sm" onclick="writeComment();">등록하기</button>
				</div>
			</div>
		</div>
		<div class="px-4" id="ntcComment">              		
		</div>  
	</div>
</div> 	



