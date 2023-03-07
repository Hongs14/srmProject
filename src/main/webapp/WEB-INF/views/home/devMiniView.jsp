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
   

  <script src="${pageContext.request.contextPath}/resources/gantt/dist/jquery-gantt.js"></script>
  <script src="${pageContext.request.contextPath}/resources/gantt/examples/js/demo-events.js"></script>
  <script>
  	$('#demo').gantt({
      data: eventsData,
      startDate: new Date('2023-01-01'),
      endDate: new Date('2023-04-01'),
    });

     $('#demo2').gantt({
      data: eventsData2,
      startDate: new Date('2023-01-01'),
      endDate: new Date('2023-04-01'),
    });
  </script>