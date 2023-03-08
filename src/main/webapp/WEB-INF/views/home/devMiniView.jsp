<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div>
        <div class="card shadow mb-4">
          <div class="card-header py-3">
          	<h6 class="font-weight-bold text-primary"><img src="${pageContext.request.contextPath}/resources/images/gantt.png" style="width:30px; margin-right:10px;"> 개발자 일정</h6>
          </div>
          <div class="card-body">
			
			   <div class="chartBox">
			     <canvas id="myChart"></canvas>
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
        barPercentage: 0.7
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