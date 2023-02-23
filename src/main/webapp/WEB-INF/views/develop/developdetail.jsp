<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
        <%@include file="/WEB-INF/views/common/head.jsp" %>
        <link href="${pageContext.request.contextPath}/resources/vendor/select2/dist/css/select2.min.css" rel="stylesheet" type="text/css">
   		
   		<script>
   			function selectDev(obj){
   				let pickDp = obj.value.toString();
   				$('#srDevDp').val(pickDp);
   			};
   			
   			function registerDevelop(){
   				console.log("개발계획 등록");
   				let srDevCn = $('#srDevCn').val();
   				let srDdlnDate = $('#srDdlnDate').val();
   				let srStartDate = $('#srStartDate').val();
   				let srEndDate =  $('#srEndDate').val();
   				let srDevDp = $('#srDevDp').val();
   				let sttsNo = $('#sttsNo').val();
   				let srBgt = $('#srBgt').val();
   				let srNo = $('#srNo').val();
   				
   				let data = {srDevCn: srDevCn, srBgt: srBgt, sttsNo: sttsNo, srDdlnDate: srDdlnDate, srStartDate: srStartDate, 
   						srEndDate: srEndDate, srDevDp: srDevDp, srNo: srNo};
   				console.log(data);
				
   				$.ajax({
   					url: '<c:url value="/develop/register"/>',
   					method: "post",
   					data: JSON.stringify(data),
   					contentType: "application/json; charset=UTF-8",
   					success: function(result){
   						console.log("성공");
   						$('#modalBody')
   						$('#modalBody').append('<div><h5>['+$('#srDevDp').val()+']</h5></div>');
   					/* 	$('#pickDevNm').append($('#srDLeader option:selected').text()); */
   						
   						selectList();
   					}  
   				 }); 
   			};
   			
   			function selectList(){
   				let userDpNm = $('#srDevDp').val();
   				console.log(userDpNm);	
   				
   				let data = {userDpNm: userDpNm};
   				
   				$.ajax({
   					url: '<c:url value="/develop/devlist"/>',	
   					type: "post",
   					dataType : "html",
   					data: JSON.stringify(data),
   					contentType: "application/json; charset=UTF-8",
   					success: function(data){
   						console.log(data);
   						$("#modalContent").html(data);
   					},
   					error: function(request, status, error){
   						console.log("실패");
   					  	alert("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
   					}
   				});
   			};
   			
   			/* function submitDev(){
   				var checkBoxArr = [];
   		  		$("input:checkbox[name='devName']:checked").each(function(i) {
   		 	 		//체크박스값 배열에 넣기
   		  			checkBoxArr.push($(this).val());
   		  		});

   		  		$.ajax({
   		  			url: '<c:url value="/develop/selectNm"/>',
   		  			type : 'post',
   		  			traditional : true,
   		  			data : {
   		  				checkBoxArr : checkBoxArr
   		  			},
   		  			success: function(data){
   		  				console.log(data);
   		  				
   		  			}
   		  		}); */
		  function submitDev(){
              var checkBoxArr = [];
                $("input:checkbox[name='devName']:checked").each(function(i) {
                   //체크박스값 배열에 넣기
                   var userNo = $(this).val();
                   var data = {userNo : userNo};
                   checkBoxArr.push(data);
                });
                
                console.log(checkBoxArr);

                $.ajax({
                   url: '<c:url value="/develop/selectNm"/>',
                   type : 'post',
                   data: JSON.stringify(checkBoxArr),
                   contentType: "application/json; charset=UTF-8",
                   success: function(data){
                      console.log(data);
                      $('#HrList').html(data);
                   }
                });
          
   			};
   		</script>
   
   </head>

   	<body id="page-top">
	<div id="wrapper">
    	<!-- Sidebar -->
        <%@include file="/WEB-INF/views/common/sidebar.jsp" %>
         
        <div id="content-wrapper" class="d-flex flex-column">
        	<div id="content">
       			<!-- TopBar -->
            	<%@include file="/WEB-INF/views/common/topbar.jsp" %>

            	<!-- 메인 컨테이너 Container Fluid-->
              	<div class="container-fluid" id="container-wrapper">
                	<div class="d-sm-flex align-items-end justify-content-between">
						<div class="bg-primary px-3 py-2" style="border-top-left-radius:10px; border-top-right-radius:10px;">
 							<h6 class="mb-0 text-white">SR 개발관리</h6>
						</div>
            			<ol class="breadcrumb">
              				<li class="breadcrumb-item">SR 관리</li>
              				<li class="breadcrumb-item active" aria-current="page">SR 개발관리</li>
            			</ol>
          			</div>
          			
          			<!-- Row -->
					<div class="row">
                    	<div class="col-lg-12">
                        	<div class="card mb-4 px-5">
                           		<div class="mb-1 mt-5">
                    				<div class="align-items-center justify-content-between">
                    					<div class="row">
	                             			<div class="col-6">
	                             				<div class="row">
	                                           		<div class="col-sm-4"><h6 class="m-0 font-weight-bold text-primary">등록자</h6></div>
	                                           		<div class="col-sm-8">${dlist.userNm}</div>
	                                        	</div>
	                                        	<div class="row">
	                                           		<div class="col-sm-4"><h6 class="m-0 font-weight-bold text-primary">등록일</h6></div>
	                                          		<div class="col-sm-8">${dlist.srRegDate}</div>
	                                        	</div>
	                                    	</div>
	                                    	<div class="col-6">
	                                    		<div class="row">
	                                        		<div class="col-sm-4"><h6 class="m-0 font-weight-bold text-primary">소속</h6></div>
	                                            	<div class="col-sm-8">${dlist.userOgdp}</div>
	                                        	</div>
	                                        	<div class="row">
	                                        		<div class="col-sm-4"><h6 class="m-0 font-weight-bold text-primary">관련시스템</h6></div>
	                                            	<div class="col-sm-8">${dlist.sysNm}</div>
	                                        	</div>
	                                   		</div>
                                   		</div>
                                  	</div>
                                 	<hr/>
                               	</div> 
                                 
                                 <!-- 개발단계 관련 내용 -->
                               	<div class="d-flex flex-column">
                                	<form  id="devleopForm" name="developForm">
                                    	<div class="align-items-center justify-content-between">
                                    		<div class="row">
	                                        	<div class="col-6">
	                                           		<div class="form-group row">
	                                              		<div class="col-sm-3 col-form-label"><h6 class="m-0 font-weight-bold text-primary">개발담당자</h6></div>
	                                              		<div class="col-sm-9">
			                                                 <select onchange="selectDev(this);" id="srDLeader" class="form-control">
			                                                 	<option></option>
			                                                 	<c:forEach var="users" items="${devlist}">
				                                                    <option value="${users.userDpNm}">${users.userNm}</option>
				                                             	</c:forEach>
			                                                 </select>
	                                             		 </div>
	                                          		</div>
		                                           	<div class="form-group row">
		                                            	<div class="col-sm-3 col-form-label"><h6 class="m-0 font-weight-bold text-primary">개발부서</h6></div>
		                                            	<div class="col-sm-9">
			                                            	<input id="srDevDp" class="form-control" type="text" value="" readonly/>
		                                              	</div>
	                                           		</div>
		                                           	<div class="form-group row">
		                                            	<div class="col-sm-3 col-form-label"><h6 class="m-0 font-weight-bold text-primary">진행상태</h6></div>
		                                              	<div class="col-sm-9">
			                                            	<select id="sttsNo" name="sttsNo" class="form-control">
			                                                	<option></option>
			                                                    <option value="5">개발중</option>
			                                                    <option value="6">개발완료</option>
			                                            	</select>
			                                           	</div>
		                                          	</div>
	                                           
	                                           		<div class="form-group row mb-2">
	                                              		<div class="col-sm-3 col-form-control pr-0"><h6 class="m-0 font-weight-bold text-primary">개발 내용</h6></div>
		                                           		<div class="col-sm-9 p-2">
		                                            		<textarea name="srDevCn" id="srDevCn" style="width: 100%"></textarea>
		                                          		</div>                                 
	                                    			</div>
	                                     		</div>
	                                        
												<div class="col-6">
	                                           		<div class="form-group row">
	                                            		<div class="col-sm-3 col-form-label"><h6 class="m-0 font-weight-bold text-primary">완료(예정)일</h6></div>
	                                            		<div class="col-sm-9">
	                                                 		<input type="date" id="srDdlnDate" name="srDdlnDate" class="form-control"/>
	                                              		</div>
	                                           		</div>
		                                           	<div class="form-group row">
		                                            	<div class="col-sm-3 col-form-label"><h6 class="m-0 font-weight-bold text-primary">소요예산</h6></div>
		                                            	<div class="col-sm-9">
		                                                	<input type="text" id ="srBgt" name="srBgt" class="form-control" value=""/>
		                                              	</div>
		                                          	</div>
		                                        	<div class="form-group row">
		                                     			<div class="col-sm-3 col-form-label"><h6 class="m-0 font-weight-bold text-primary">계획 시작일</h6></div>
		                                              	<div class="col-sm-9">
		                                                	<input type="date" id="srStartDate" name="srStartDate" class="form-control"/>
		                                             	 </div>
		                                           	</div>
		                                    		<div class="form-group row">
		                                            	<div class="col-sm-3 col-form-label"><h6 class="m-0 font-weight-bold text-primary">계획 종료일</h6></div>
		                                            	<div class="col-sm-9">
		                                                	<input type="date" id="srEndDate" name="srEndDate" class="form-control" required/>
		                                              	</div>
		                                           	</div>
		                                           	<div class="text-right">
		                                           		<input type="hidden" id="srNo" value="${dlist.srNo}"/>
		                                           		<button type="button" id="button" class="btn btn-sm btn-primary" onclick="registerDevelop()">저장</button>
		                                           	</div>
	                                        	</div>
                                        	</div>
                                     	</div>
                                     	<hr/>
                                     </form>
                                    
                                    <!-- 모달 시작-->	
                                    <div>
                                    	<div class="row" style="white-space:normal;">
                                    		<div class="col-2"><h6 class="text-primary font-weight-bold">투입인력</h6></div>
                                    		<div class="col-10"><button class="btn btn-secondary btn-sm addlist" data-toggle="modal" data-target="#exampleModalScrollable" id="#modalScroll">추가하기</button></div>
                                    	</div>
                                    	<div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog"
								            aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
								        	<div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable" role="document">
								            	<div class="modal-content">
								                	<div class="modal-header">
								                  		<h5 class="modal-title" id="exampleModalScrollableTitle">개발자 등록하기</h5>
								                  		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								                    		<span aria-hidden="true">&times;</span>
								                  		</button>
								                	</div>
								                	<div class="modal-body" style="white-space:normal;"> 
								                  		<div id="modalBody">
								                  		
								                  		</div>
								                  		<div id="modalContent">
								                  		
								                  		</div>
								                	</div>
									                <div class="modal-footer">
									                	<button type="button" class="btn btn-outline-primary" data-dismiss="modal">닫기</button>
									                	<button type="button" onclick="submitDev()" class="btn btn-primary" data-dismiss="modal">등록</button>
									                </div>
								             	</div>
								            </div>
								      	</div>
								      	<!-- 모달 끝-->
								      	<form action="insertU">
								      		<div class="p-2 mt-3" style="border: 1px solid gray">
									      		<%-- <div class="row mb-1" id="dvleaderHr">
									      			<div id="devNameInput" class="col-sm-2 col-form-label">
									      				<input name="userNo" type="hidden" value="${users.userNo}"/>
									      				<div id="pickDevNm"></div>
									      			</div>
									      			<div class="col-sm-2">
									      				<select class="form-control">
									      					<option>작업구분</option>
									      					<option>설계</option>
									      					<option>구현</option>
									      					<option>테스트</option>
									      				</select>
									      			</div>
									      			<div class="col-8">
									      				<div class="row">
									      					<div class="col-sm-2 col-form-label"><h6 class="m-0 font-weight-bold text-primary">시작일</h6></div>
		                                              		<div class="col-sm-4">
		                                                		<input type="date" class="form-control"/>
		                                             	 	</div>
		                                             	 	<div class="col-sm-2 col-form-label"><h6 class="m-0 font-weight-bold text-primary">종료일</h6></div>
		                                              		<div class="col-sm-4">
		                                                		<input type="date" class="form-control"/>
		                                             	 	</div>
	                                             	 	</div>
	                                             	 </div>
									      		</div> --%>
										      	<div id="HrList">
										      		<div class="row mb-1" id="dvleaderHr">
									      			<div id="devNameInput" class="col-sm-2 col-form-label">
									      				<input name="userNo" type="hidden" value="${users.userNo}"/>
									      				<div id="pickDevNm"></div>
									      			</div>
									      			<div class="col-sm-2">
									      				<select class="form-control">
									      					<option>작업구분</option>
									      					<option>설계</option>
									      					<option>구현</option>
									      					<option>테스트</option>
									      				</select>
									      			</div>
									      			<div class="col-8">
									      				<div class="row">
									      					<div class="col-sm-2 col-form-label"><h6 class="m-0 font-weight-bold text-primary">시작일</h6></div>
		                                              		<div class="col-sm-4">
		                                                		<input type="date" class="form-control"/>
		                                             	 	</div>
		                                             	 	<div class="col-sm-2 col-form-label"><h6 class="m-0 font-weight-bold text-primary">종료일</h6></div>
		                                              		<div class="col-sm-4">
		                                                		<input type="date" class="form-control"/>
		                                             	 	</div>
	                                             	 	</div>
	                                             	 </div>
										      	
									      		</div>
										      	</div>
									      	</div>
								      	</form> 
                                    </div>
                                    	
                                    
                                    <!-- SR내용 -->
                               		<div id="srContent">	
                               			<hr/>
	                                   	<div class="row mb-2">
	                                      	<div class="col-sm-2"><h6 class="m-0 font-weight-bold text-primary">SR제목</h6></div>
	                                      	<div class="col-sm-10">${dlist.srTtl}</div>
	                                   	</div>   
	                                    <div class="row mb-2">
	                                    	<div class="col-sm-2"><h6 class="m-0 font-weight-bold text-primary">관련근거(목적)</h6></div>
	                                        <div class="col-sm-10">${dlist.srStd}</div>
	                                    </div>
	                                   	<div class="row mb-2">
	                                       	<div class="col-sm-2"><h6 class="m-0 font-weight-bold text-primary">SR내용</h6></div>
	                                       	<div class="col-sm-10">${dlist.srCn}</div>
	                                    </div>
	                                    <div class="row mb-2">
	                                       	<div class="col-sm-2"><h6 class="m-0 font-weight-bold text-primary">첨부파일</h6></div>
	                                       	<div class="col-sm-10">  화면캡처.png</div>
	                                   	</div>
	                                    <div class="text-right mb-3"> 
	                                    	<input type="button" class="btn btn-primary" value="저장"/>
	                                        <button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/develop/list'">목록</button>
	                                    </div>
                                    </div>
                               	</div>
                               	<!-- 개발단계 관련 내용 -->
                               	
                            </div>
						</div> 
					</div>
                   	<!-- 로그아웃 모달 -->
                   	<%@include file="/WEB-INF/views/common/logout.jsp" %>
              	</div>
           		<!---Container Fluid-->
            </div>
        </div>
        <!-- Footer -->
    </div>
    <%@include file="/WEB-INF/views/common/bottom.jsp" %>
   </body>
</html>