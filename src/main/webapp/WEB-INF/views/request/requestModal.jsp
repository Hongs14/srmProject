<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="modal fade" id="requestModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelRequest" aria-hidden="true">
   <div class="modal-lg modal-dialog" id="requestModal-dialog" role="document">
     <div class="modal-content">
       <div class="modal-header">
         <h5 class="modal-title text-primary font-weight-bold" id="exampleModalLabelRequest">요청 등록</h5>
         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
           <span aria-hidden="true">&times;</span>
         </button>
       </div>
       <div class="modal-body">
		<form>
			<div class="row mb-2" >
				<div class="col-sm-2">
					<span class="font-weight-bold">등록자: </span> 
				</div>
				<div class="col-sm-4">
					<input disabled value="${sessionScope.loginUser.userNm}" />
				</div>
				<div class="col-sm-2">
					<span class="font-weight-bold">소속: </span> 
				</div>
				<div class="col-sm-4">
					<input disabled value="${sessionScope.loginUser.userDpNm}" />
				</div>
			</div>
			
			<div class="row mb-2">
				<div class="col-sm-2">
					<span class=" font-weight-bold">등록일: </span> 
				</div>
				<div class="col-sm-4">
					<div class="form-group pr-3" id="simple-date1" >
						<div class="input-group date" >
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-calendar" ></i></span>
							</div>
							<input type="text" class="form-control" value="" id="simpleDataInput"  style="height:30px;">
						</div>
					</div>
				</div>
				<div class="col-sm-2">
					<span class=" font-weight-bold">관련시스템: </span> 
				</div>
				<div class="col-sm-4">
					<input disabled value="${sessionScope.loginUser.userOgdp}" />
				</div>
			</div>
			<hr>
			<div class="row mb-2 align-items-center">
				<div class="col-sm-2">
					<span class=" font-weight-bold">SR 제목: </span> 
				</div>
				<div class="col-sm-10">
					<input type="text" class="form-control form-control-sm"/>
				</div>
			</div>
			<div class="row mb-2 align-items-center">
				<div class="col-sm-2">
					<span class=" font-weight-bold">관련 근거(목적): </span> 
				</div>
				<div class="col-sm-10">
					<input type="text" class="form-control form-control-sm"/>
				</div>
			</div>
			<div class="row mb-2">
				<div class="col-sm-2">
					<span class=" font-weight-bold">SR 내용: </span> 
				</div>
				<div class="col-sm-10">
					<textarea rows="10" class="form-control form-control-sm"></textarea>
				</div>
			</div>
			<div class="row mb-2">
				<div class="col-sm-2">
					<span class=" font-weight-bold">첨부파일: </span> 
				</div>
				<div class="col-sm-10">
					<div class="custom-file">
						<input type="file" class="custom-file-input form-control" id="customFile" multiple> 
						<label class="custom-file-label text-truncate" for="customFile">파일 선택</label>
					</div>
				</div>
			</div>
			<div class="row mb-2">
				<div class="col-sm-2">
					<span class=" font-weight-bold">파일목록: </span> 
				</div>
				<div class="col-sm-10">
				<div>
					<div id="userfile"></div>
				</div>
				</div>
			</div>
				
		</form>
			</div>
       <div class="modal-footer justify-content-center">
         <button type="button" class="btn btn-outline-primary" data-dismiss="modal">취소</button>
         <a href="${pageContext.request.contextPath}/user/logout" class="btn btn-primary">저장</a>
       </div>
     </div>
   </div>
 </div>
 
 <script>
 $(document).ready(function () {
	const today = new Date();
	
     // Bootstrap Date Picker
     $('#simple-date1 .input-group.date').datepicker({
       format: 'yyyy/mm/dd',
       todayBtn: 'linked',
       todayHighlight: true,
       autoclose: true,        
     });
 });

	$(document).ready(function() {
	    $("#customFile").on('change',function(){
	        if(window.FileReader){
	        	var files = $(this)[0].files;
	            var filename = files[0].name+"<a href='#' class='btn btn-danger btn-sm' >X</a>" ;
	            
	            for(var i=1; i<files.length; i++){
	            	filename += "<br>" +
	            	 files[i].name +
	            	 "<a href='#' class='btn btn-danger btn-sm' >X</a>" ;
	            }
	        } else {
	            var filename = $(this).val.split('/').pop().split('\\').pop();
	        }

	        //filename insert
	        $('#userfile').html(filename);
	    });
	});
	
	
 </script>