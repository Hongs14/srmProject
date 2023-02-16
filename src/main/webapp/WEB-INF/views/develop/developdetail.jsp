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
	                                           		<div class="col-sm-8">김지율</div>
	                                        	</div>
	                                        	<div class="row">
	                                           		<div class="col-sm-4"><h6 class="m-0 font-weight-bold text-primary">등록일</h6></div>
	                                          		<div class="col-sm-8">2023-02-03</div>
	                                        	</div>
	                                    	</div>
	                                    	<div class="col-6">
	                                    		<div class="row">
	                                        		<div class="col-sm-4"><h6 class="m-0 font-weight-bold text-primary">소속</h6></div>
	                                            	<div class="col-sm-8">JHJ시스템</div>
	                                        	</div>
	                                        	<div class="row">
	                                        		<div class="col-sm-4"><h6 class="m-0 font-weight-bold text-primary">관련시스템</h6></div>
	                                            	<div class="col-sm-8">JHJ시스템</div>
	                                        	</div>
	                                   		</div>
                                   		</div>
                                  	</div>
                                 	<hr/>
                               	</div> 
                                 
                                 <!-- 개발단계 관련 내용 -->
                               	<div class="d-flex flex-column">
                                	<form>
                                    	<div class="align-items-center justify-content-between">
                                    		<div class="row">
	                                        	<div class="col-6">
	                                           		<div class="form-group row">
	                                              		<div class="col-sm-3 col-form-label"><h6 class="m-0 font-weight-bold text-primary">개발담당자</h6></div>
	                                              		<div class="col-sm-9">
			                                                 <select class="form-control">
			                                                    <option></option>
			                                                    <option>김태희</option>
			                                                 </select>
	                                             		 </div>
	                                          		</div>
		                                           	<div class="form-group row">
		                                            	<div class="col-sm-3 col-form-label"><h6 class="m-0 font-weight-bold text-primary">개발부서</h6></div>
		                                            	<div class="col-sm-9">
			                                            	<select class="form-control">
			                                                	<option></option>
			                                                    <option>개발1팀</option>
			                                                    <option>개발2팀</option>
			                                                </select>
		                                              	</div>
	                                           		</div>
		                                           	<div class="form-group row">
		                                            	<div class="col-sm-3 col-form-label"><h6 class="m-0 font-weight-bold text-primary">진행상태</h6></div>
		                                              	<div class="col-sm-9">
			                                            	<select class="form-control">
			                                                	<option></option>
			                                                    <option>개발중</option>
			                                                    <option>개발완료</option>
			                                            	</select>
			                                           	</div>
		                                          	</div>
	                                           
	                                           		<div class="form-group row mb-2">
	                                              		<div class="col-sm-3 col-form-control pr-0"><h6 class="m-0 font-weight-bold text-primary">개발 내용</h6></div>
		                                           		<div class="col-sm-9 p-2">
		                                            		<textarea style="width: 100%"></textarea>
		                                          		</div>                                 
	                                    			</div>
	                                     		</div>
	                                        
												<div class="col-6">
	                                           		<div class="form-group row">
	                                            		<div class="col-sm-3 col-form-label"><h6 class="m-0 font-weight-bold text-primary">완료(예정)일</h6></div>
	                                            		<div class="col-sm-9">
	                                                 		<input type="date" class="form-control"/>
	                                              		</div>
	                                           		</div>
		                                           	<div class="form-group row">
		                                            	<div class="col-sm-3 col-form-label"><h6 class="m-0 font-weight-bold text-primary">소요예산</h6></div>
		                                            	<div class="col-sm-9">
		                                                	<input type="text" class="form-control"/>
		                                              	</div>
		                                          	</div>
		                                        	<div class="form-group row">
		                                     			<div class="col-sm-3 col-form-label"><h6 class="m-0 font-weight-bold text-primary">계획 시작일</h6></div>
		                                              	<div class="col-sm-9">
		                                                	<input type="date" class="form-control"/>
		                                             	 </div>
		                                           	</div>
		                                    		<div class="form-group row">
		                                            	<div class="col-sm-3 col-form-label"><h6 class="m-0 font-weight-bold text-primary">계획 종료일</h6></div>
		                                            	<div class="col-sm-9">
		                                                	<input type="date" class="form-control"/>
		                                              	</div>
		                                           	</div>
		                                           	<div class="text-right">
		                                           		<input type="button" class="btn btn-sm btn-primary" value="등록"/>
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
                                    		<div class="col-10"><button class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#exampleModalScrollable" id="#modalScroll">추가하기</button></div>
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
								                  		<div><h5>개발1팀</h5></div>
								                 		<div class="row">
								                 			<div class="col-1">선택</div>
								                 			<div class="col-1">직책</div>
								                 			<div class="col-2">성명</div>
								                 			<div class="col-3">전화번호</div>
								                 			<div class="col-5">업무사항</div>
								                 		</div>
								                 		<div class="row">
								                 			<div class="col-1"><input type="checkbox"></div>
								                 			<div class="col-1">사원</div>
								                 			<div class="col-2">황태률</div>
								                 			<div class="col-3">010-1234-9876</div>
								                 			<div class="col-5">
								                 				<div class="row">
								                 					<div>2023.03.01</div>
								                 					 ~<div>2023.03.09 </div>
								                 					&nbsp;<div>SR제목</div>
								                 					&nbsp;-&nbsp;<div>테스트</div>
								                 				</div>
								                 			
								                 				<div class="row">
								                 					<div>2023.03.01</div>
								                 					 ~<div>2023.03.09 </div>
								                 					 &nbsp;<div>SR제목</div>
								                 					&nbsp;-&nbsp;<div>구현</div>
								                 				</div>
								                 				
								                 				<div class="row">
								                 					<div>2023.03.01</div>
								                 					 ~<div>2023.03.09 </div>
								                 					 <div>테스트</div>
								                 				</div>
								                 			</div>
								                 		</div>
								                 		<hr/>
								                 		
								                 		<div class="row">
								                 			<div class="col-1"><input type="checkbox"></div>
								                 			<div class="col-1">부장</div>
								                 			<div class="col-2">정건희</div>
								                 			<div class="col-md-3">010-1234-9876</div>
								                 			<div class="col-5">
								                 				<div class="row">
								                 					<div>2023.03.06</div>
								                 					~<div>2023.03.020 </div>
								                 					 &nbsp;<div>SR제목</div>
								                 					&nbsp;-&nbsp;<div>테스트</div>
								                 				</div>
								                 			
								                 				<div class="row">
								                 					<div>2023.03.01</div>
								                 					 ~<div>2023.03.09 </div>
								                 					 &nbsp;<div>SR제목</div>
								                 					&nbsp;-&nbsp;<div>테스트</div>
								                 				</div>
								                 				
								                 			</div>
								                 		</div>
								                 		<hr/>
								                 		
								                 		<div class="row">
								                 			<div class="col-1"><input type="checkbox"></div>
								                 			<div class="col-1">차장</div>
								                 			<div class="col-2">정희희</div>
								                 			<div class="col-3">010-1234-9876</div>
								                 			<div class="col-5">
								                 				
								                 			</div>
								                 		</div>
								                 		<hr/>
								                	</div>
									                <div class="modal-footer">
									                	<button type="button" class="btn btn-outline-primary" data-dismiss="modal">닫기</button>
									                	<button type="button" class="btn btn-primary">등록</button>
									                </div>
								             	</div>
								            </div>
								      	</div>
								      	<!-- 모달 끝-->
								      	<form>
									      	<div id="HrList" class="p-2 mt-3" style="border: 1px solid gray">
									      		<div class="row mb-1">
									      			<div class="col-sm-2 col-form-label">
									      				정희희
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
									      		<div class="row mb-1">
									      			<div class="col-sm-2 col-form-label">
									      				황태률
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
								      	</form>
                                    </div>
                                    	
                                    
                                    <!-- SR내용 -->
                               		<div id="srContent">	
                               			<hr/>
	                                   	<div class="row mb-2">
	                                      	<div class="col-sm-2"><h6 class="m-0 font-weight-bold text-primary">SR제목</h6></div>
	                                      	<div class="col-sm-10">1</div>
	                                   	</div>   
	                                    <div class="row mb-2">
	                                    	<div class="col-sm-2"><h6 class="m-0 font-weight-bold text-primary">관련근거(목적)</h6></div>
	                                        <div class="col-sm-10"> 첨부파일 참고 </div>
	                                    </div>
	                                   	<div class="row mb-2">
	                                       	<div class="col-sm-2"><h6 class="m-0 font-weight-bold text-primary">SR내용</h6></div>
	                                       	<div class="col-sm-10">  버튼을 누르면 다른 링크로 넘어갑니다. </div>
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