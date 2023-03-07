<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div>
        <div class="card shadow mb-4">
          <div class="card-header py-3">
          	<h6 class="font-weight-bold text-primary"><img src="${pageContext.request.contextPath}/resources/images/gantt.png" style="width:30px; margin-right:10px;"> 개발자 일정</h6>
          </div>
          <div class="card-body">
            <div class="graph_container">
			   <canvas id="myChart"></canvas>
			</div>
          </div>
        </div>
	</div>
   

 	<script>
 	var ctx = document.getElementById("myChart");

 	var data = {
 	  labels: ["Task 1", "Task 2", "Task 3"],
 	  datasets: [
 	    {
 	      label: "Start Date",
 	      backgroundColor: "rgba(0, 0, 255, 0.2)",
 	      borderColor: "rgba(0, 0, 255, 1)",
 	      borderWidth: 1,
 	      pointRadius: 0,
 	      data: [
 	        {
 	          x: new Date("2022-01-01"),
 	          y: 0,
 	        },
 	        {
 	          x: new Date("2022-02-01"),
 	          y: 1,
 	        },
 	        {
 	          x: new Date("2022-03-01"),
 	          y: 2,
 	        },
 	      ],
 	    },
 	    {
 	      label: "Duration",
 	      backgroundColor: "rgba(255, 0, 0, 0.2)",
 	      borderColor: "rgba(255, 0, 0, 1)",
 	      borderWidth: 1,
 	      pointRadius: 0,
 	      data: [
 	        {
 	          x: new Date("2022-01-01"),
 	          y: 1,
 	        },
 	        {
 	          x: new Date("2022-02-01"),
 	          y: 2,
 	        },
 	        {
 	          x: new Date("2022-03-01"),
 	          y: 3,
 	        },
 	      ],
 	    },
 	  ],
 	};

 	var options = {
 	  scales: {
 	    xAxes: [
 	      {
 	        type: "time",
 	        time: {
 	          unit: "month",
 	        },
 	        ticks: {
 	          min: new Date("2021-12-01"),
 	          max: new Date("2022-04-01"),
 	        },
 	      },
 	    ],
 	    yAxes: [
 	      {
 	        ticks: {
 	          beginAtZero: true,
 	        },
 	      },
 	    ],
 	  },
 	};

 	var myChart = new Chart(ctx, {
 		plugins : [ChartDataLabels],
 	  type: "line",
 	  data: data,
 	  options: options,
 	});

 	</script>