<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<div>
        <div class="card shadow mb-4">
          <div class="card-header pt-3">
          	<h6 class="font-weight-bold text-primary"><img src="${pageContext.request.contextPath}/resources/images/gantt.png" style="width:30px; margin-right:10px;"> 개발자 일정</h6>
          </div>
          <div class="card-body d-flex pt-0">
				<div id="chartWrapper" class="d-flex flex-column">
				<div class="d-flex justify-content-between px-1">
					<div class="d-sm-flex flex-column align-items-center">
                      	<h6 class="text-center" style="border-bottom: 2px solid #263b65; padding:0 10px;">###SR No.00001 ${progressdetail.srNo}
                    		<span class="badge badge-warning m-1" >#개발 (계획)${progressdetail.srTypeNm}</span>
                    	</h6>
                    	<p><i class="fa-solid fa-quote-left fa-2xs mr-1 ml-2"></i> ######이거 왜 안돼요?  ${progressdetail.srTtl}<i class="fa-solid fa-quote-right fa-2xs ml-1"></i></p>
                	</div>
                	
                	<div class="progFile m-1">
	                	<div style="background-color: rgba(255, 206, 86, 0.5); width: 300px; padding:10px; border-radius:5px;">
	                		<h6><i class="fa-regular fa-folder-open mx-1"></i>산출물</h6>
	                		<div class="d-flex justify-content-between align-items-center">
	                			<i class="fa-solid fa-angle-right fa-lg ml-3"></i>
		                		<h4 class="p-0 m-0">총 <span style="color:#a80000;">3</span> 건</h4>
								<a class=" btn btn-sm btn-primary"><i class="fa-solid fa-link mx-1"></i>산출물</a>
	                		</div>
	                	</div>
                	</div>
                </div>
                	
	               	<div class="chartBox d-flex">
	               		<div style="width:600px">
					     <canvas id="myChart"></canvas>
					     </div>
					     <div id="progFile">
					     	<div class="d-sm-flex flex-column mt-3" style="background-color:#EAECF4; border-radius:5px;">
						     	<div class="d-flex p-1 align-items-center">
							  		<span class="progIcon"><i class="fa-solid fa-user-tie m-1"></i></span> <small class="m-1">한국대학교스마트LMS ${progressdetail.sysNm}</small>
						     	</div>
						     	<div class="d-flex p-1 align-items-center">
							  		<span class="progIcon"><i class="fa-solid fa-user-tie m-1"></i></span> <small class="m-1">신청자: 김주하 ${progressdetail.requesterNm}</small>
						     	</div>
						     	<div class="d-flex p-1 align-items-center">
							  		<span class="progIcon"><i class="fa-solid fa-user-tie m-1"></i></span> <small class="m-1">예산: 5000 ${progressdetail.srBgt}만원</small>
						     	</div>
							</div>
					     </div>
					 </div>
				</div>
			  
			   
			   <!-- DevInfo -->
            	<div id="devInfo" class="px-3">
					<div class="devTable p-2" style="width:550px">
						<c:if test="${!empty hrList}">
							<div class="d-sm-flex justify-content-between align-items-start">
								<h6 class="card-title card-title-dash">
									<i class="fa-solid fa-users-gear mx-1"></i>${hrList.get(0).userDpNm}</h6>
							</div>
							<div class="table p-2" style="width: 550px;">
								<table class="table select-table">
									<thead>
										<tr>
											<th>리더여부</th>
											<th>성명</th>
											<th>직무</th>
											<th>상태</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="list" items="${hrList}">
											<tr>
												<td><c:if test="${list.hrLeader == 'Y'}">
														<span class="badge badge-warning" style="font-size: 100%">Leader</span>
													</c:if> <c:if test="${list.hrLeader != 'Y'}">
														<span class="badge badge-secondary" style="font-size: 100%">Dev</span>
													</c:if></td>
												<td>
													<h6>${list.userNm}</h6> <small> <fmt:formatDate
															value="${list.hrStartDate}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate
															value="${list.hrEndDate}" pattern="yyyy-MM-dd" />
												</small>
												</td>
												<td>
													<div>
														<p class="badge badge-success" style="font-size: 100%;">${list.taskNm}</p>
													</div>
												</td>
												<td>
													<p class="badge" style="font-size: 100%;">대기</p>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</c:if>
						<c:if test="${empty hrList}">
							<div class="alert alert-secondary m-3 p-2" role="alert">
								<h6><i class="fas fa-exclamation-triangle"></i><b> 안내 </b></h6>
								아직 개발자가 배정되지 않았습니다.
							</div>
						</c:if>
					</div>
				</div>
          </div>
        </div>
	</div>
	
    <script>
    // setup 
    var data = {
      labels: ['요구정의', '분석/설계', '구현', '테스트', '완료요청', '개발완료'],
      datasets: [{
        label: '개발 계획', 
        data: [
			['2022-02-01','2022-02-03'],
			['2022-02-03','2022-02-06'],
			['2022-02-06','2022-02-07'],
			['2022-02-07','2022-02-09'],
			['2022-02-09','2022-02-13'],
			['2022-02-13','2022-02-15']
        	],
        backgroundColor: [
          'rgba(255, 26, 104, 0.5)',
          'rgba(54, 162, 235, 0.5)',
          'rgba(255, 206, 86, 0.5)',
          'rgba(75, 192, 192, 0.5)',
          'rgba(153, 102, 255, 0.5)',
          'rgba(255, 159, 64, 0.5)',
          'rgba(0, 0, 0, 0.5)'
        ],
        borderColor: [
          'rgba(255, 26, 104, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
          'rgba(153, 102, 255, 1)',
          'rgba(255, 159, 64, 1)',
          'rgba(0, 0, 0, 1)'
        ],
        borderWidth: 1,
        barPercentage: 0.7,
        borderRadius:0.5
      }]
    };

    // config 
    const config = {
      type: 'bar',
      data,
      options: {
    	indexAxis: 'y',
        scales: {
          x: {
        	  min:'2022-02-01',
        	  type: 'time',
              time: {
            	  unit: 'day'
              }
          },
          y: {
            beginAtZero: true
          }
        },
        plugins: {
        	legend:{
        		display:false
        	},
        	label:{
        		display:false
        	},
        	tooltip: {
        		displayColor: false, //컬러박스 지움
        		callbacks:{
        			label: (ctx)=>{
        				return ''
        			},
        			title: (ctx)=>{
        				var startDate = new Date(ctx[0].raw[0])
        				var endDate = new Date(ctx[0].raw[1])
        				var formattedStartDate = startDate.toLocaleString([],{
        					year:'numeric',
        					month: 'short',
        					day:'numeric',
        				});
        				var formattedEndDate = endDate.toLocaleString([],{
        					year:'numeric',
        					month: 'short',
        					day:'numeric',
        				});
        				var Dates = formattedStartDate + ' ㅡ '+ formattedEndDate;
        				return [ctx[0].label, Dates];
        			}
        		}
        	}
        	
        }
      }
    };

    // render init block
    var myChart = new Chart(
      document.getElementById('myChart'),
      config
    );

    
    </script>

  </body>