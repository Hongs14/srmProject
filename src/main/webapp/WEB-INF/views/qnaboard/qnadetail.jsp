<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<script>
		var qCountCmnt = parseInt("${countQstnComment}",10);
	
  		$(document).ready(function(){
  			readComment();
  		});
  		
  		function readComment(){
  			//댓글 불러오기
  			let qstnNo ='${qstn.qstnNo}';
  			let sysNo = "${session}";
  			$.ajax({
		    	url:"${pageContext.request.contextPath}/qna/"+sysNo+"/read/comment?qstnNo="+qstnNo,
		        type:"get",
		        dataType: "html",
		        success:function(data){
		        	$('#qComment').html(data);
		        	
		         }
		    });
  		};
  		
  		
		function writeComment(){
			//댓글 작성
			let content = $('#qnaCmntCn').val();
			let qcwriterNo = '${sessionScope.loginUser.userNo}';
			let qstnNo = '${qstn.qstnNo}';
			let sysNo = "${session}";
			
			let data = {userNo: qcwriterNo, qstnNo: qstnNo, qstnCmntCn: content, sysNo:sysNo};
			$.ajax({
				url: "${pageContext.request.contextPath}/qna/"+sysNo+"/write/comment",
				method: "post",
				data: JSON.stringify(data),
				contentType: "application/json; charset=UTF-8"
			}).done((data) => {
				$('#qnaCmntCn').val('');
				readComment();
				$('#cmntCount').html('댓글('+(qCountCmnt+1)+')');
        		qCountCmnt += 1;
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
			let sysNo = "${session}";
		 	let qstnCmntNo = i;
			let data = {qstnCmntNo: qstnCmntNo, qstnCmntCn: content};  
			$.ajax({
				url: "${pageContext.request.contextPath}/qna/"+sysNo+"/update/comment",
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
			let sysNo = "${session}";
			let qstnCmntNo = i;
			$.ajax({
				url: "${pageContext.request.contextPath}/qna/"+sysNo+"/delete/comment",
				method: "get",
				data: 'qstnCmntNo='+qstnCmntNo
			}).done((data) => {
				$('#cmntCount').html('댓글('+(qCountCmnt-1)+')');
        		qCountCmnt -= 1;
				$('#qComment').empty(); 
				readComment();
				
			});
		};
		
		function updateQstn(qstnNo){
			$("#mainQstnMenu").removeClass("d-sm-flex");
			$("#mainQstnMenu").hide();
			$("#qstnMenu").show();
			$("#mainQstn").attr("class","col-lg-7");
			$("#miniView").attr("class","col-lg-5");
			let sysNo = $('#sysNo').val();
		
			$.ajax({ 
				url: "${pageContext.request.contextPath}/qna/"+sysNo+"/update?qstnNo="+qstnNo,
				method: "GET",
				dataType : "html"
			}).done((data)=>{
				$('#miniView').html(data);
				
			});
		}
		
		function deleteQstn(qstnNo){
	    	$("#modalHeader").html("<b>Qna삭제</b>");
	    	$("#modalBody").html("<h4>삭제하시겠습니까?</h4>"); 
	    	$("#qstnModal").modal('show');
	    	let sysNo = $('#sysNo').val();
	    	$('#qstnSubmit').on("click", function(){
	    		$('#qstnForm').attr("action", "${pageContext.request.contextPath}/qna/"+sysNo+"/delete/"+qstnNo);
	    		$('#qstnForm').submit(); 
	    	});
		}
	</script>

    <!-- 메인 컨테이너 Container Fluid-->
 	<div class="d-sm-flex align-items-end justify-content-between">
		<div class="bg-primary px-3 py-2" style="border-top-left-radius:10px; border-top-right-radius:10px;">
			<h6 class="mb-0 text-white">상세보기</h6>
		</div>
      	<ol class="breadcrumb">
        	<li class="breadcrumb-item">Q&A</li>
           	<li class="breadcrumb-item active" aria-current="page">목록보기</li>
        </ol>
    </div>
    
    <!-- Row -->
    <div class="card mb-4 detail">
    	<div class="d-flex flex-row align-items-center justify-content-between px-3 pt-3">
			<div>
				<small class="m-0 font-weight-bold text-primary">질문사항 No.${qstn.qstnNo}</small>
			</div>
			<div>
				<small>조회수 : ${qstn.qstnInqCnt} </small>
			</div>
		</div>
		
        <div class="p-3 d-flex flex-column">
       		<form id="qstnForm" method="post">
       			<div class="row align-items-center mb-1 ">
					<div class=" col-sm-2 text-center">
						<label class="col-form-label">작성자</label>
					</div>
					<div class="col-sm-4">
						<span>${qstn.userNm}</span>
					</div>
					<div class=" col-sm-2 text-center">
						<label class="col-form-label">작성일</label>
					</div>
					<div class="col-sm-4">
						<span>${qstn.qstnWrtDate}</span>
					</div>
				</div>	
       			<div class="row align-items-center mb-2">
					<div class="col-sm-2 text-center">
						<label class="col-form-label">제목</label>
					</div>
					<div class="col-sm-10">
						<span class="font-weight-bold text-primary col-form-label">${qstn.qstnTtl}</span>
					</div>
				</div>
       			<div class="row mb-1">
					<div class=" col-sm-2 text-center">
						<label class="col-form-label">내용</label>
					</div>
					<div class="col-sm-10 border p-2" style="height:200px; overflow-y: scroll;" > 
						<span>${qstn.qstnCn}</span>
					</div>
				</div>
       			<div class="row align-items-center">
					<div class=" col-sm-2 text-center">
						<label class="col-form-label">첨부파일</label>
					</div>
					<div class="col-sm-10">	
						<c:forEach var="qstnFile" items="${qstnFile}">
							<span><a href="${pageContext.request.contextPath}/qna/file?qstnFileNo=${qstnFile.qstnFileNo}">${qstnFile.qstnFileActlNm}</a></span>
						</c:forEach>	                            		
					</div>
				</div>
           		<div class="d-sm-flex justify-content-end"> 
           			<input type="hidden" id="sysNo" name="sysNo" value="${qstn.sysNo}"/>
           			<input type="hidden" id="qstnNo" name="qstnNo" value="${qstn.qstnNo}"/>
           			<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/qna/${qstn.sysNo}/list'">목록</button>
           			<c:if test="${qstn.userNo eq sessionScope.loginUser.userNo}">
           				<input type="button" class="btn btn-primary ml-1" value="수정" onclick="updateQstn(${qstn.qstnNo})"/>
           				<button type="button" class="btn btn-primary ml-1" onclick="deleteQstn(${qstn.qstnNo})">삭제</button>
           			</c:if>
           			
           		</div>
			</form>
		</div>
	</div>
                    			
	<!-- 댓글 -->
	<div class="card p-4 mb-4">
		<div  class="mx-3 mb-2"><span id="cmntCount">댓글(${countQstnComment})</span></div>
		<div class="cmnts" style="overflow-y: scroll; height:200px;">
			<div class="mx-3 p-1" >
				<div class="row  justify-content-between">
					<div class="col-sm-2 form-group">
						${sessionScope.loginUser.userNm}
					</div>
					<div class="col-sm-8 ">
						<textarea  class="form-control" id="qnaCmntCn"></textarea>
					</div>
					<div class="col-sm-2 text-right">
						<button type="button" class="btn btn-primary btn-sm" onclick="writeComment();">등록하기</button>
					</div>
				</div>
			</div>
			<div class="px-4" id="qComment">              		
			</div>  
		</div>
	</div>
</html>