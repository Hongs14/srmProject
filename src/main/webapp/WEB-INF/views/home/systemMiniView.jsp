<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="card">
	<div class="card-header align-items-center">
		<i class="far fa-fw fa-window-maximize"></i> 
		<span class="m-0 font-weight-bold text-primary">My System </span>
	</div>
	<div>
	<div class="customer-message align-items-center">
	<div class="px-3">
        <div class="card shadow mb-4">
          <div class="card-header py-3">
           	<div class="table-responsive">
			    <table class="table" >
					<thead class="thead-light">
						  <tr>
						    <th>${system.sysNm} </th>
						  </tr>
					</thead>
				    <tbody>
					      <tr>
					        <td><b>시스템 담당자 :  ${system.managerNm}</b></td>
					      </tr>
					      <tr>
					        <td style="border:0;"><b>시스템 업데이트일자 :   ${system.sysUpdtDate}</b></td>
					      </tr>
				     </tbody>
			     </table>
	    	 </div>
          </div>
          <div class="card-body">
            <div class="chart-pie">
              <canvas id="myPieChart"></canvas>
            </div>
            <hr>
          </div>
        </div>
	</div>
	</div>
	</div>
</div>
 <script src="${pageContext.request.contextPath}/resources/vendor/chart.js/Chart.js"></script>
 <script src="${pageContext.request.contextPath}/resources/js/demo/chart-pie-demo.js"></script>