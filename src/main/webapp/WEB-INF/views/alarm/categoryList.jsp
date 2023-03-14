<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="d-flex px-5 justify-content-center">
	<div class="myInfoWrapper shadow-sm mb-5">
		<table class="table table-hover">
			<tbody>
				<c:choose>
					<c:when test="${fn:length(categoryAlarm) == 0 }">
						<div class="alert alert-secondary m-3 p-2" role="alert">
							<h6><i class="fas fa-exclamation-triangle"></i><b> 안내 </b></h6>
							알림 내역이 없습니다.
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="categoryAlarm" items="${categoryAlarm}">
							<tr style="cursor:pointer;">
								<td class="row border-bottom" onclick="updateCheck('${categoryAlarm.srNo}')" style="border-top: 0; ">
									<div class="col-2 text-center mt-3">
										<c:if test="${categoryAlarm.messageCheck eq 89}">
											<i class="fa-regular fa-square-check icon"></i>
				                    	</c:if>
				                    	<c:if test="${categoryAlarm.messageCheck eq 78 }">
					                     	<i class="fas fa-exclamation-triangle icon"></i>
				                    	</c:if>
			                    	</div>
			                    	<div class="col-9">
			                    		<span style="border-top:0; margin:0px;font-size:1.2rem;"><b>${categoryAlarm.alarmTtl}</b></span>
										<span>${categoryAlarm.messageDate}</span>
										<br/>			
										<div style="font-size:0.7rem">${categoryAlarm.srNo}</div>
										<span class="d-none" id="alarmNo">${categoryAlarm.alarmNo}</span>
										<span class="d-none" id="sttsNm">${categoryAlarm.sttsNm}</span>
										<span >${categoryAlarm.message}</span>
			                    	</div>
									<i class="fas fa-trash col-1" data-toggle="modal" data-target="#alarmBtn" id="#modalScroll"></i>
								</td>
							</tr>																
						</c:forEach>
					</c:otherwise>
				</c:choose>																		
			</tbody>
		</table>
	</div>
</div>