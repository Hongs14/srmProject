<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="row mb-5 p-5">
	<table>
		<tbody>			
			<div>categoryAlarm</div>									
			<c:choose>
				<c:when test="${fn:length(alarmList) == 0 }">
					<span>알림 내역이 없습니다.</span>
				</c:when>
				<c:otherwise>
					<c:forEach var="alarmList" items="${alarmList}">
						<tr style="cursor:pointer;">
							<td>
								<c:if test="${alarmList.messageCheck eq 89}">
									<i class="fa-regular fa-square-check fa-lg"></i>
		                    	</c:if>
		                    	<c:if test="${alarmList.messageCheck eq 78 }">
			                      <i class="fas fa-exclamation-triangle"></i>
		                    	</c:if>
								<span class="col-3 " style="border-top:0; margin:0px;font-size:1.2rem;"><b>${alarmList.alarmTtl}</b></span>
								<span>${alarmList.messageDate}</span>
								<br/>			
								<div class="col-3" style="font-size:0.7rem">${alarmList.srNo}</div>
								<span class="d-none" id="alarmNo">${alarmList.alarmNo}</span>
								<span class="d-none" id="sttsNm">${alarmList.sttsNm}</span>
								<span class="col-3 ">${alarmList.message}</span>
								<hr/>
							</td>
							<td>
								<i class="fas fa-trash" data-toggle="modal" data-target="#alarmBtn" id="#modalScroll"></i>
							</td>
						</tr>																
					</c:forEach>
				</c:otherwise>
			</c:choose>										
		</tbody>
	</table>
</div>