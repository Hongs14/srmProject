<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="card">
	<div class="card-header align-items-center">
		<i class="far fa-fw fa-window-maximize"></i> 
		<span class="m-0 font-weight-bold text-primary">My System </span>
	</div>
	<div>
		<div class="customer-message align-items-center">
			<a class="font-weight-bold" href="#">
				<p class="text-truncate message-title">${system.sysNm}</p>
				<p class="small text-gray-500 message-time font-weight-bold">시스템 담당자: ${system.managerNm}</p>
				<p class="small text-gray-500 message-time font-weight-bold">시스템 업데이트일자: ${system.sysUpdtDate}</p>
			</a>
		</div>

		<div class="card-footer text-center">
			<a class="m-0 small text-primary card-link" href="#">View More <i
				class="fas fa-chevron-right"></i></a>
		</div>
	</div>
</div>