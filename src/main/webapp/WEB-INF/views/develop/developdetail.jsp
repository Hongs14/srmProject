<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
	  	<%@include file="/WEB-INF/views/common/head.jsp" %>
	  	<link href="${pageContext.request.contextPath}/resources/vendor/select2/dist/css/select2.min.css" rel="stylesheet" type="text/css">
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
		        	<div class="d-sm-flex align-items-center justify-content-between mb-4">
			            <h1 class="h3 mb-0 text-gray-800">SR개발관리 - 상세페이지</h1>
			            <ol class="breadcrumb">
			            	<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Home</a></li>
			            	<li class="breadcrumb-item active" aria-current="page">개발관리 수정 </li>
			            </ol>
		          	</div>
          		
          			
					<div class="developContent mx-3 my-0">
					
	       				<div class="col-lg-12">
                     		<div class="card mb-4  p-3">
                     			<div class="mb-4"><h6 class="m-0 font-weight-bold text-primary">SR개발 수정</h6></div>
                             	<div class="card-header mx-3">
                                 	<div class="d-flex flex-row align-items-center justify-content-between">
                                 		<div class="col-6">
		                                 	<div class="row">
		                                 		<div class="4">등록자: </div>
		                                 		<div class="col-8">김지율</div>
		                                 	</div>
		                                 	<div class="row">
		                                 		<div class="4">등록일: </div>
		                                 		<div class="col-8">2023-02-03</div>
		                                 	</div>
	                                 	</div>
	                                 	<div class="col-6">
	                                 		<div class="row">
		                                 		<div class="4">소속: </div>
		                                 		<div class="col-8">JHJ시스템</div>
		                                 	</div>
		                                 	<div class="row">
		                                 		<div class="4">관련시스템: </div>
		                                 		<div class="col-8">JHJ시스템</div>
		                                 	</div>
	                                 	</div>
                                 	</div>
                                 	<hr/>
                              	</div>   
	                            <div class="mx-3 p-3 d-flex flex-column">
	                            	<form>
		                            	<!-- 개발 내용 -->
		                            	<div class="d-flex flex-row align-items-center justify-content-between">
		                            		<div class="col-6">
		                            			<div class="form-group row">
		                            				<div class="col-sm-3 col-form-label">개발담당자</div>
		                            				<div class="col-sm-9">
		                            					<input type="text" class="form-control"/>
		                            				</div>
		                            			</div>
		                            			<div class="form-group row">
		                            				<div class="col-sm-3 col-form-label">개발부서</div>
		                            				<div class="col-sm-9">
		                            					<select class="form-control">
		                            						<option></option>
		                            						<option>개발1팀</option>
		                            						<option>개발2팀</option>
		                            					</select>
		                            				</div>
		                            			</div>
		                            			<div class="form-group row">
		                            				<div class="col-sm-3 col-form-label">진행상태</div>
		                            				<div class="col-sm-9">
		                            					<select class="form-control">
		                            						<option></option>
		                            						<option>개발중</option>
		                            						<option>개발완료</option>
		                            					</select>
		                            				</div>
		                            			</div>
		                            			
		                            			<div class="row mb-2">
		                            				<div class="col-3">투입인력</div>
		                            				<div class="col-9">
		                            					<select class="select-multiple form-control" name="dev_hr[]" multiple="multiple">
															<option>황건희</option>
															<option>김태희</option>
														</select>
													</div>	                            			
												</div>
		                            		</div>
		                            		
		                            		<div class="col-6">
		                            			<div class="form-group row">
		                            				<div class="col-sm-3 col-form-label">완료(예정)일</div>
		                            				<div class="col-sm-9">
		                            					<input type="date" class="form-control"/>
		                            				</div>
		                            			</div>
		                            			<div class="form-group row">
		                            				<div class="col-sm-3 col-form-label">소요예산</div>
		                            				<div class="col-sm-9">
		                            					<input type="text" class="form-control"/>
		                            				</div>
		                            			</div>
		                            			<div class="form-group row">
		                            				<div class="col-sm-3 col-form-label">계획 시작일</div>
		                            				<div class="col-sm-9">
		                            					<input type="date" class="form-control"/>
		                            				</div>
		                            			</div>
		                            			<div class="form-group row">
		                            				<div class="col-sm-3 col-form-label">계획 종료일</div>
		                            				<div class="col-sm-9">
		                            					<input type="date" class="form-control"/>
		                            				</div>
		                            			</div>
		                            			
		                            		</div>
		                            	</div>
		                            	
		                            	<div class="ml-2">
		                            		<div class="form-group row">
		                            			<div class="col-sm-2 col-form-control pr-0">개발 내용</div>
		                            			<div class="col-sm-10 p-0">
		                            				<textarea style="width: 80%"></textarea>
		                            			</div>
		                            		</div>
		                            		
		                            	</div>
		                         
		                            	<!-- SR내용 -->
		                            	<hr/>
	                            		<div class="row mb-2">
		                            		<div class="col-sm-3">SR제목</div>
		                            		<div class="col-sm-9">
		                            			버튼 수정
		                            		</div>
	                            		</div>	
	                            		<div class="row mb-2">
		                            		<div class="col-sm-3">관련근거(목적)</div>
		                            		<div class="col-sm-9">
		                            			첨부파일 참고
		                            		</div>
	                            		</div>
	                            		<div class="row mb-2">
		                            		<div class="col-sm-3">SR내용</div>
		                            		<div class="col-sm-9">
		                            			버튼을 누르면 다른 링크로 넘어갑니다.
		                            		</div>
	                            		</div>
	                            		<div class="row mb-2">
		                            		<div class="col-sm-3">첨부파일</div>
		                            		<div class="col-sm-9">
		                            			화면캡처.png
		                            		</div>
	                            		</div>
	                            		<div class="text-right"> 
	                            			<input type="button" class="btn btn-primary" value="수정"/>
	                            			<button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/develop/list'">목록</button>
	                            		</div>
                            		</form>
	                            </div>
                      		</div>
                   		</div> 
       				</div>
       				
          			<!-- 로그아웃 모달 -->
          			<%@include file="/WEB-INF/views/common/logout.jsp" %>
        		</div>
        	<!---Container Fluid-->
      		</div>
     		<%@include file="/WEB-INF/views/common/footer.jsp" %>
     	</div>
     	<!-- Footer -->
    </div>
 	<%@include file="/WEB-INF/views/common/bottom.jsp" %>
	</body>

</html>