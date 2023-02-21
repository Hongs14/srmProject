<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<style>
	.requsetTtl{
	width: 190px;
	overflow: hidden;
	text-overflow: ellipsis;
	display:block;
	}	
	</style>
  	<%@include file="/WEB-INF/views/common/head.jsp" %>
  	
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
            <h6 class="mb-0 text-white">SR 요청관리</h6>
          </div>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><b>SR 관리</b></li>
              <li class="breadcrumb-item active" aria-current="page">SR 요청관리</li>
            </ol>
          </div>
		
          <!-- Row -->
        <div class="row">
     	<div class="col-lg-12">
         	<div class="card mb-4 ">
         		<!-- 검색 -->
                <div class="mb-1 mt-5 px-5">
                <form class="navbar-search">
                	<div class="row">
                		<div class="col-4">
                			<div class="form-group row" id="simple-date4" >
			                	<div class="input-daterange input-group input-group-sm">
			                		<label for="startDate" class="col-sm-3 col-form-label-sm">조회기간</label>
			                    	<input type="text" class="input-sm form-control form-control-sm col-sm-9" name="start" id="startDate"/>
			                    	<div class="input-group-prepend">
			                    		<span class="input-group-text" style="height:31px;">~</span>
			                    	</div>
			                    	<input type="text" class="input-sm form-control form-control-sm" name="end" />
			                    </div>
			            	</div>
                		</div>
                		
                		<div class="col-3">
                			<div class="form-group row">
                				<label class="col-sm-3 col-form-label-sm" for="srStts">진행상태</label>
                				<select class="form-control form-control-sm col-sm-9" id="srSttsNo">
									<option value="0" selected>전체</option>
									<c:forEach var="item" items="${requestFilter.srSttsList}">
										<option value="${item.sttsNo}">${item.sttsNm}</option>
									</c:forEach>
		                    	</select>
		                	</div>
                		</div>
                		<div class="col-4">
                			<div class="form-group row">
                				<label for="srSystem" class="col-sm-3 col-form-label-sm">관련시스템</label>
                				<select class="form-control form-control-sm col-sm-9" id="sysNo">
									<option value="0" selected>전체</option>
									<c:forEach var="item" items="${requestFilter.sysNmList}">
										<option value="${item.sysNo}">${item.sysNm}</option>
									</c:forEach>
		                    	</select>
		                	</div>
                		</div>
                		<div class="col-1">
                			
                		</div>
                		
                	</div>
                	<div class="row">
                		<div class="col-4">
                			<div class="form-group row">
                				<label for="srOgdp" class="col-sm-3 col-form-label-sm">등록자 소속</label>
		                    	<select class="form-control form-control-sm col-sm-9" id="srOgdp">
		                        	<option value="0" selected>전체</option>
									<c:forEach var="item" items="${requestFilter.sysNmList}">
										<option value="${item.sysNo}">${item.sysNm}</option>
									</c:forEach>
		                    	</select>
		                	</div>
                		</div>
                		<div class="col-3">
                			<div class="form-group row">
                			<label for="srDept" class="col-sm-3 col-form-label-sm">개발부서</label>
		                    	<select class="form-control form-control-sm col-sm-9" id="srDevDp">
		                        	<option selected>전체</option>
		                        	<option>한국소프트웨어 개발1팀</option>
		                        	<option>한국소프트웨어 개발2팀</option>
		                        	<option>서강소프트웨어 개발1팀</option>
		                        	<option>미래소프트웨어 개발1팀</option>
		                    	</select>
		                	</div>
                		</div>
                		<div class="col-4">
		                	<div class="form-group row">
		                		<label for="srKeyWord" class="col-sm-3 col-form-label-sm">키워드</label>
		                    	<input type="text" id="srKeyWord" class="form-control form-control-sm col-sm-9 bg-light" 
		                   		aria-label="Search" placeholder="검색어를 입력하세요" style="border-color: #3f51b5;">
		                  	</div>
                		</div>
                		<div class="col-1">
                			<div class="input-group-append float-right">
								<button class="btn btn-primary btn-sm" type="button" onclick="requestList()" >
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
							href="<c:url value='/request/write/'/>"> 요청등록 </a>
						<button class="btn btn-sm btn-secondary ">엑셀 다운로드</button>
					</div>
				</div>
                <div id="ajaxList">
                
                </div>
              </div>
          </div>
          </div>
          <!-- Row -->
<script>
	$(document).ready(function () {
		console.log("시작");
		var sysNoSelect = document.getElementById("sysNo");
		var sttsNoSelect = document.getElementById("srSttsNo");
		
		var sysNo = sysNoSelect.options[document.getElementById("sysNo").selectedIndex].text;
		var srSttsNo = sttsNoSelect.options[document.getElementById("srSttsNo").selectedIndex].value;
		
		console.log(sysNo);
		console.log(srSttsNo);
		
		let data = {sysNo : sysNo, srSttsNo : srSttsNo};
		
		console.log(data);
		
		$.ajax({
			url : "filter/1",
			method : "post",
			data : JSON.stringify(data),
			contentType: "application/json; charset=UTF-8"
		}).done((data) => {
			$("#ajaxList").html(data)
		});
	});

	function requestList(pageNo) {
		console.log(pageNo);
		var sysNoSelect = document.getElementById("sysNo");
		var sttsNoSelect = document.getElementById("srSttsNo");
		
		var sysNo = sysNoSelect.options[document.getElementById("sysNo").selectedIndex].text;
		var srSttsNo = sttsNoSelect.options[document.getElementById("srSttsNo").selectedIndex].value;
		
		
		let data = {sysNo : sysNo, srSttsNo : srSttsNo};
		
		console.log(data);
		
		$.ajax({
			url : "filter/"+pageNo,
			method : "post",
			data : JSON.stringify(data),
			contentType: "application/json; charset=UTF-8"
		}).done((data) => {
			$("#ajaxList").html(data)
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
