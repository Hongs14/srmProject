<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div>
        <div class="card shadow mb-4">
          <div class="card-header py-3">
           	<div class="table-responsive">
           		<c:if test="${userType == '관리자' || userType == '고객사'}">
	          	 	<c:forEach var="list" items="${system}">
					    <table class="table" >
							<thead class="thead-light">
								  <tr>
								    <th>
								    	<i class="fa-solid fa-chart-pie"></i>
								    	${list.sysNm} 
								    </th>
								  </tr>
							</thead>
						    <tbody>
							      <tr>
							        <td><b>시스템 담당자 :  ${list.managerNm}</b></td>
							      </tr>
							      <tr>
							        <td style="border:0;"><b>시스템 업데이트일자 : ${list.sysUpdtDate}</b></td>
							      </tr>
						     </tbody>
					     </table>
				     </c:forEach>
			     </c:if>
			     <c:if test="${userType == '개발자'}">
			     	<table class="table" >
			     		<thead class="thead-light">
			     			<tr>
			     				<th>
			     					<i class="far fa-fw fa-window-maximize"></i>
			     					나의 업무 통계
			     				</th>
			     			</tr>
			     		</thead>
					    <tbody>
						      <tr>
						        <td><b>부서 : ${loginUser.userDpNm}</b></td>
						      </tr>
						      <tr>
						        <td style="border:0;"><b>직급 : ${loginUser.userJbps}</b></td>
						      </tr>
					     </tbody>
			     	</table>
			     </c:if>
	    	 </div>
          </div>
          <div class="card-body">
            <div class="chart-pie">
              <canvas id="myPieChart" style="height:100px; weight:100px"></canvas>
            </div>
          </div>
        </div>
	</div>

             <script>
             	labelse = [];
             	data = [];
             	<c:forEach var="list" items="${donutList}">
             		labelse.push('${list.sttsNm}');
             		data.push(${list.count});
             	</c:forEach>
             	console.log(labelse);
             	console.log(data);
             	
             
				var ctx = document.getElementById("myPieChart");
				var myPieChart = new Chart(ctx, {
				  plugins : [ChartDataLabels],
				  type: 'doughnut',
				  data: {
				    labels: labelse,
				    datasets: [{
				      data: data,
				      /* 6e707e회색, ffa426주황 , #eaecf4연연청, 66bb6a초록, a11811빨강, 36b9cc하늘 ,#ffd59a연주황,#3f5195보라*/
				      backgroundColor: ['#eaecf4','#a11811','#6e707e', '#36b9cc', '#66bb6a',  '#ffd59a','#3f5195'],
				      hoverBorderColor: "rgba(234, 236, 244, 1)",
				    }],
				  },
				  options: {	
				    maintainAspectRatio: false,
				    tooltips: {
				      backgroundColor: "rgb(255,255,255)",
				      bodyFontColor: "#858796",
				      borderColor: '#dddfeb',
				      borderWidth: 1,
				      xPadding: 15,
				      yPadding: 15,
				      displayColors: false,
				      caretPadding: 10,
				    },
				    legend: {
				    	position : 'bottom',
				    	labels : {
				    		boxWidth : 10
				    	}
				    },
				    cutoutPercentage: 60,
				    plugins : {
				    	datalabels : {
				    		formatter : function (value, context) {
				    			var idx = context.dataIndex; 
				    			
				    			return context.chart.data.labels[idx] + value + "건";
				    		},
				    		display : 'auto',
				    		font : {
				    			size : '15',
				    		},
				    		color : '#000',
				    	},
				    },
				  },
				});
            </script>