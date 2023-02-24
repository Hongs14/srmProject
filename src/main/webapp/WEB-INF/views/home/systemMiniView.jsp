<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="px-3">
        <div class="card shadow mb-4">
          <div class="card-header py-3">
           	<div class="table-responsive">
          	 	<c:forEach var="list" items="${system}">
				    <table class="table" >
						<thead class="thead-light">
							  <tr>
							    <th>
							    	<i class="far fa-fw fa-window-maximize"></i>
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
	    	 </div>
          </div>
          <div class="card-body">
            <div class="chart-pie">
              <canvas id="myPieChart" style="height:100px; weight:100px"></canvas>
            </div>
          </div>
        </div>
	</div>
 <script src="${pageContext.request.contextPath}/resources/vendor/chart.js/Chart.js"></script>
 <script src="${pageContext.request.contextPath}/resources/js/demo/chart-pie-demo.js"></script>
 <script src="${pageContext.request.contextPath}/resources/vendor/chart.js/chartjs-plugin-datalabels.js"></script>
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
				      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#4e73df', '#1cc88a', '#36b9cc'],
				      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf', '#4e73df', '#1cc88a', '#36b9cc'],
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
				    			var idx = context.dataIndex; // 각 데이터 인덱스
				    			
				    			// 출력 텍스트
				    			return context.chart.data.labels[idx];
				    		},
				    		font : {
				    			size : '15',
				    		},
				    		color : '#000',
				    	},
				    },
				  },
				});
            </script>