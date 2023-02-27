<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  	<%@include file="/WEB-INF/views/common/head.jsp" %>
	<style>
	
	.requsetTtl{
		width: 190px;
		overflow: hidden;
		text-overflow: ellipsis;
		display:block;
	}	
	
	#requestList > .table th, 
	#requestList > .table td {
    	padding: 0.5rem;
    }
    
	</style>
  	
	<script>
	  	$(document).ready(function () {
		    $('#simple-date4 .input-daterange').datepicker({        
		        format: 'yyyy/mm/dd',        
		        autoclose: true,     
		        todayHighlight: true,   
		        todayBtn: 'linked',
		      });  
	  	});
	  	
	  	
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
        
          <div class="d-sm-flex align-items-end justify-content-between"  id="srMenu">
          	<div class="bg-primary px-3 py-2" style="border-top-left-radius:10px; border-top-right-radius:10px; width:121px;">
			 	<h6 class="mb-0 text-white">SR 요청관리</h6>
			</div>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><b>SR 관리</b></li>
              <li class="breadcrumb-item active" aria-current="page">SR 요청관리</li>
            </ol>
          </div>
		
          <!-- Row -->
        <div class="row">
     	<div class="col-lg-12" id="colNo1">
	     	<div class="bg-primary px-3 py-2" style="border-top-left-radius:10px; border-top-right-radius:10px; width:121px; display:none;" id="srMiniMenu">
			 	<h6 class="mb-0 text-white">SR 요청관리</h6>
			</div>
         	<div class="card mb-4 ">
         		<!-- 검색 -->
                <div class="mb-1 mt-5 px-3">
                <form class="navbar-search">
                	<div class="row text-right">
                		<div class="col-4">
                			<div class="form-group row" id="simple-date4" >
	                			<div class="input-daterange input-group input-group-sm">
	                				<label for="start" class="col-sm-3 col-form-label-sm ">조회기간</label>
	                    			<input type="text" class="input-sm form-control form-control-sm col-sm-9" name="start" id="dateStart"/>
	                    			<div class="input-group-prepend">
	                    				<span class="input-group-text" style="height:31px;">~</span>
	                    			</div>
	                    			<input type="text" class="input-sm form-control form-control-sm" name="end" id="dateEnd"/>
	                    		</div>
	            			</div>
                		</div>
                		
                		<div class="col-3">
                			<div class="form-group row">
                				<label for="sttsNo" class="col-sm-4 col-form-label-sm" >진행상태</label>
                				<select id="sttsNo" class="form-control form-control-sm col-sm-8" >
									<option selected>전체</option>
									<c:forEach var="item" items="${requestFilter.srSttsList}">
										<option value="${item.sttsNo}">${item.sttsNm}</option>
									</c:forEach>
		                    	</select>
		                	</div>
                		</div>
                		<div class="col-4">
                			<div class="form-group row">
                				<label for="sysNo" class="col-sm-4 col-form-label-sm">관련시스템</label>
                				<select  id="sysNo" class="form-control form-control-sm col-sm-8">
									<option selected>전체</option>
									<c:forEach var="item" items="${requestFilter.sysNmList}">
										<option value="${item.sysNo}">${item.sysNm}</option>
									</c:forEach>
		                    	</select>
		                	</div>
                		</div>
                		<div class="col-1">
                			
                		</div>
                		
                	</div>
                	<div class="row text-right">
                		<div class="col-4">
                			<div class="form-group row">
                				<label for="userOgdp" class="col-sm-3 col-form-label-sm">등록자소속</label>
		                    	<select id="userOgdp" class="form-control form-control-sm col-sm-9">
		                        	<option selected>전체</option>
									<c:forEach var="item" items="${requestFilter.userOgdpList}">
										<option class="text-black" value="${item.userOgdp}">${item.userOgdp}</option>
									</c:forEach>
		                    	</select>
		                	</div>
                		</div>
                		<div class="col-3">
                			<div class="form-group row">
                			<label for="srDevDp" class="col-sm-4 col-form-label-sm">개발부서</label>
		                    	<select id="srDevDp" class="form-control form-control-sm col-sm-8" >
		                        	<option selected>전체</option>
									<c:forEach var="item" items="${requestFilter.srDevDpList}">
										<option value="${item.srDevDp}">${item.srDevDp}</option>
									</c:forEach>
		                    	</select>
		                	</div>
                		</div>
                		<div class="col-4">
		                	<div class="form-group row">
		                		<label for="srKeyWord" class="col-sm-4 col-form-label-sm">키워드</label>
		                    	<input type="text" id="keyword" class="form-control form-control-sm col-sm-8 bg-light" 
		                   		aria-label="Search" placeholder="검색어를 입력하세요" style="border-color: #3f51b5;">
		                  	</div>
                		</div>
                		<div class="col-1">
                			<div class="input-group-append float-right">
								<button class="btn btn-primary btn-sm" type="button" onclick="requestList(1)" >
									조회 <i class="fas fa-search fa-sm"></i>
								</button>
							</div>
                		</div>
                	</div>
                </form>
                </div>
                <hr/>
         		<!-- SR 검토 목록 -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">SR 요청 목록</h6>
					<div class="d-sm-flex justify-content-end">
						<a class="btn btn-sm btn-secondary mr-1"
							onclick="getWriteForm()"> 요청등록 </a>
						<button class="btn btn-sm btn-secondary ">엑셀 다운로드</button>
					</div>
				</div>
                <div id="ajaxList">
                
                </div>
              </div>
          </div>
          
          <div id="colNo2">
          
          </div>
          
          </div>
          <!-- Row -->
			<script>
				$(document).ready(function () {
					console.log("시작");
					var sysNoSelect = document.getElementById("sysNo");
					var sttsNoSelect = document.getElementById("sttsNo");
					var userOgdpSelect = document.getElementById("userOgdp");
					var srDevDpSelect = document.getElementById("srDevDp");
					
					var sysNo = sysNoSelect.options[document.getElementById("sysNo").selectedIndex].value;
					var sttsNo = sttsNoSelect.options[document.getElementById("sttsNo").selectedIndex].value;
					var userOgdp = userOgdpSelect.options[document.getElementById("userOgdp").selectedIndex].value;
			 		var srDevDp = srDevDpSelect.options[document.getElementById("srDevDp").selectedIndex].value;  
			 		
			 		var srRegStartDate = document.getElementById("dateStart").value;
					var srRegEndDate = document.getElementById("dateEnd").value;
					var srTtl = document.getElementById("keyword").value;
					if(srTtl !== "") {
						srTtl = "%" + srTtl + "%";
					}
			 		
					let data = {sysNo : sysNo, sttsNo : sttsNo, userOgdp : userOgdp, srDevDp : srDevDp, srRegStartDate : srRegStartDate, srRegEndDate : srRegEndDate, srTtl : srTtl};
					
					
					$.ajax({
						url : "filter/1",
						method : "post",
						data : JSON.stringify(data),
						contentType: "application/json; charset=UTF-8"
					}).done((data) => {
						$("#ajaxList").html(data);
					});
					
					
				});
			
				function requestList(pageNo) {
					console.log(pageNo);
					var sysNoSelect = document.getElementById("sysNo");
					var sttsNoSelect = document.getElementById("sttsNo");
					var userOgdpSelect = document.getElementById("userOgdp");
					var srDevDpSelect = document.getElementById("srDevDp");
					
					var sysNo = sysNoSelect.options[document.getElementById("sysNo").selectedIndex].value;
					var sttsNo = sttsNoSelect.options[document.getElementById("sttsNo").selectedIndex].value;
					var userOgdp = userOgdpSelect.options[document.getElementById("userOgdp").selectedIndex].value;
			 		var srDevDp = srDevDpSelect.options[document.getElementById("srDevDp").selectedIndex].value;  
					
			 		var srRegStartDate = document.getElementById("dateStart").value;
					var srRegEndDate = document.getElementById("dateEnd").value;
					var srTtl = document.getElementById("keyword").value;
					if(srTtl !== "") {
						srTtl = "%" + srTtl + "%";
					}
					
					let data = {sysNo : sysNo, sttsNo : sttsNo, userOgdp : userOgdp, srDevDp : srDevDp, srRegStartDate : srRegStartDate, srRegEndDate : srRegEndDate, srTtl : srTtl};
					
					$.ajax({
						url : "filter/"+pageNo,
						method : "post",
						data : JSON.stringify(data),
						contentType: "application/json; charset=UTF-8"
					}).done((data) => {
						$("#ajaxList").html(data);
					});
				}
				
				
				function getSrDetail(i){
					let srNo = i;
					$("#srMenu").removeClass("d-sm-flex");
					$("#srMenu").hide();
					$("#srMiniMenu").show();
					$("#colNo1").attr("class","col-lg-7");
					$("#colNo2").attr("class","col-lg-5");
					
					$.ajax({
						url : "detail/"+srNo,
						type : "GET",
						dataType : "html",
						success : function(data) {
							$('#colNo2').html(data);
						}
					});
					
				}
				
				function getWriteForm(){
					$("#srMenu").removeClass("d-sm-flex");
					$("#srMenu").hide();
					$("#srMiniMenu").show();
					$("#colNo1").attr("class","col-lg-7");
					$("#colNo2").attr("class","col-lg-5");
					
					$.ajax({
						url :"write",
						type : "GET",
						dataType : "html",
						success : function(data) {
							$('#colNo2').html(data);
						}
					});
					
				}
				
				function getUpdateForm(srNo){
					$("#srMenu").removeClass("d-sm-flex");
					$("#srMenu").hide();
					$("#srMiniMenu").show();
					$("#colNo1").attr("class","col-lg-7");
					$("#colNo2").attr("class","col-lg-5");
					
					$.ajax({
						url :"update/"+srNo,
						type : "GET",
						dataType : "html",
						success : function(data) {
							$('#colNo2').html(data);
						}
					});
					
				}
			</script>
          

          <!-- 로그아웃 모달 -->
           <%@include file="/WEB-INF/views/common/logout.jsp" %>
        </div>
        <!---Container Fluid-->
      </div>
      
      <!-- Footer -->
     <%@include file="/WEB-INF/views/common/footer.jsp" %>

    </div>
  </div>
 <%@include file="/WEB-INF/views/common/bottom.jsp" %>
</body>

</html>
