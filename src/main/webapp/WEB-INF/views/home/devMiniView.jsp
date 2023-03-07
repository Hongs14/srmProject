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
			   <div id="demo"></div>
			</div>
          </div>
        </div>
	</div>
   

 	<canvas id="myChart"></canvas>
    <script>
        var ctx = document.getElementById("myChart");
        
        var chart = new Chart(ctx, {
            type: 'horizontalBar',
            data: {
                labels: ['Task 1', 'Task 2', 'Task 3'],
                datasets: [{
                    label: 'Start',
                    backgroundColor: 'rgba(0, 0, 255, 0.2)',
                    data: [
                        new Date('2023-03-01T00:00:00.000Z'),
                        new Date('2023-03-05T00:00:00.000Z'),
                        new Date('2023-03-10T00:00:00.000Z')
                    ]
                }, {
                    label: 'End',
                    backgroundColor: 'rgba(255, 0, 0, 0.2)',
                    data: [
                        new Date('2023-03-10T00:00:00.000Z'),
                        new Date('2023-03-15T00:00:00.000Z'),
                        new Date('2023-03-20T00:00:00.000Z')
                    ]
                }]
            },
            options: {
                scales: {
                    xAxes: [{
                        type: 'time',
                        time: {
                            unit: 'day',
                            displayFormats: {
                                day: 'MMM D'
                            }
                        }
                    }]
                },
                tooltips: {
                    callbacks: {
                        title: function(tooltipItem, data) {
                            return data.labels[tooltipItem[0].index];
                        },
                        label: function(tooltipItem, data) {
                            var datasetLabel = data.datasets[tooltipItem.datasetIndex].label;
                            var date = new Date(tooltipItem.xLabel);
                            return datasetLabel + ': ' + date.toLocaleDateString();
                        }
                    }
                }
            }
        });
    </script>