<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<div>
        <div class="card shadow mb-4" style="min-height: 200px;">
          <div class="card-header d-sm-flex justify-content-between align-items-center">
          	<h6 class="font-weight-bold text-primary"><img src="${pageContext.request.contextPath}/resources/images/gantt.png" style="width:30px; margin-right:10px;">SR 진행현황</h6>
          	<a class="btn btn-sm btn-primary" href="${pageContext.request.contextPath}/request/list/${progressdetail.srNo}">
          		SR 진척관리 확인<i class="fa-solid fa-caret-right m-1"></i>
          	</a>
          </div>
          <c:if test="${empty progressdetail.srNo}">
	          <div class="d-flex justify-content-center align-items-center pt-2">
	          	<div class="p-3" style="background-color:#EAECF4; border-radius:5px;">
	          		<h6><i class="fa-solid fa-quote-left fa-xs mr-2"></i>SR 번호를 클릭하시면 일정상세를 확인할 수 있습니다.<i class="fa-solid fa-quote-right fa-xs ml-2"></i></h6>
	          	</div>
	          </div>
          </c:if>
          <c:if test="${!empty progressdetail.srNo}">
	          <div class="card-body pt-0" id="managerMiniViewDetail" style="display:none;">
	            <div class="d-flex">
				   <div class="d-flex align-items-center">
					   <div class="devStage px-5 py-3">
					   
					   		<div class="d-sm-flex justify-content-between align-items-center">
		                      	<h6 class="text-center" style="border-bottom: 2px solid #263b65; padding:0 10px;">SR No.${progressdetail.srNo}
		                      		<span class="badge badge-warning m-1" >${progressdetail.srTypeNm}</span>
		                      	</h6>
		                  	</div>
		                  	
		                  	<div class="d-sm-flex justify-content-start align-items-center mb-2">
		                      	<p><i class="fa-solid fa-quote-left fa-2xs mr-1 ml-2"></i>${progressdetail.srTtl}<i class="fa-solid fa-quote-right fa-2xs ml-1"></i></p>
		                  	</div>
		                  	
							<div class="d-flex align-items-center mb-4">
								<c:if test="${!(progressdetail.sttsNm == '반려' || progressdetail.sttsNm == '재검토' || progressdetail.sttsNm == '개발계획' || progressdetail.sttsNm == '계획조정')}">
			                  		<c:set var="count" value="0"/>
			                  		<c:forEach var="list" items="${list}">
			                  			<c:if test="${list == progressdetail.sttsNm}">
		    								<div class="d-flex flex-column">
												<div class="circle execute current">
													<c:choose>
														<c:when test="${list == '요청'}">
															<i class="fa-sharp fa-regular fa-pen-to-square"></i>
														</c:when>
														<c:when test="${list == '검토중'}">
															<i class="fa-solid fa-magnifying-glass"></i>
														</c:when>
														<c:when test="${list == '접수'}">
															<i class="fa-solid fa-file-circle-check"></i>
														</c:when>
														<c:when test="${list == '개발중'}">
															<i class="fa-solid fa-laptop-code"></i>
														</c:when>
														<c:when test="${list == '완료요청'}">
															<i class="fa-solid fa-magnifying-glass-arrow-right"></i>
														</c:when>
														<c:when test="${list == '개발 완료'}">
															<i class="fa-solid fa-square-check"></i>
														</c:when>
													</c:choose>
													<p>${list}</p>
												</div> 
									   			<c:choose>
										   			<c:when test="${list == '요청'}">
										   				<span class="badge badge-secondary dateBadge">요청일자 <br> ${progressdetail.srRegDate}</span> 
										   			</c:when>
										   			<c:when test="${list == '개발중'}">
										   				<span class="badge badge-secondary dateBadge">${progressdetail.srStartDate} ~<br>${progressdetail.srEndDate}</span> 
										   			</c:when>
										   			<c:when test="${list == '개발 완료'}">
										   				<span class="badge badge-secondary dateBadge">완료예정일<br>${progressdetail.srDdlnDate}</span> 
										   			</c:when>
										   			<c:otherwise>
										   				<span class="dateBadge"></span>
										   			</c:otherwise>
									   			</c:choose>
											</div>
											<c:if test = "${list != '개발 완료'}">
												<i class="fa-solid fa-caret-right"></i>
											</c:if>
											<c:set var="count" value="1"/>
			                  			</c:if>
			                  			<c:if test="${list != progressdetail.sttsNm}">
			                  				<c:if test="${count == 0}">
		            							<div class="d-flex flex-column">
										   			<div class="circle plan">
														<c:choose>
															<c:when test="${list == '요청'}">
																<i class="fa-sharp fa-regular fa-pen-to-square"></i>
															</c:when>
															<c:when test="${list == '검토중'}">
																<i class="fa-solid fa-magnifying-glass"></i>
															</c:when>
															<c:when test="${list == '접수'}">
																<i class="fa-solid fa-file-circle-check"></i>
															</c:when>
															<c:when test="${list == '개발중'}">
																<i class="fa-solid fa-laptop-code"></i>
															</c:when>
															<c:when test="${list == '완료요청'}">
																<i class="fa-solid fa-magnifying-glass-arrow-right"></i>
															</c:when>
															<c:when test="${list == '개발 완료'}">
																<i class="fa-solid fa-square-check"></i>
															</c:when>
														</c:choose>
										   				<p>${list}</p>
										   			</div>
										   			<c:choose>
											   			<c:when test="${list == '요청'}">
											   				<span class="badge badge-secondary dateBadge">요청일자 <br> ${progressdetail.srRegDate}</span> 
											   			</c:when>
											   			<c:when test="${list == '개발중'}">
											   				<span class="badge badge-secondary dateBadge">${progressdetail.srStartDate} ~<br>${progressdetail.srEndDate}</span> 
											   			</c:when>
											   			<c:when test="${list == '개발 완료'}">
											   				<span class="badge badge-secondary dateBadge">완료예정일<br>${progressdetail.srDdlnDate}</span> 
											   			</c:when>
											   			<c:otherwise>
											   				<span class="dateBadge"></span>
											   			</c:otherwise>
										   			</c:choose>
							                  	</div>
							                  	<c:if test = "${list != '개발 완료'}">
													<i class="fa-solid fa-caret-right"></i>
												</c:if>
			                  				</c:if>
			                  				<c:if test="${count == 1}">
		         								<div class="d-flex flex-column">
													<div class="circle evaluate">
														<c:choose>
															<c:when test="${list == '요청'}">
																<i class="fa-sharp fa-regular fa-pen-to-square"></i>
															</c:when>
															<c:when test="${list == '검토중'}">
																<i class="fa-solid fa-magnifying-glass"></i>
															</c:when>
															<c:when test="${list == '접수'}">
																<i class="fa-solid fa-file-circle-check"></i>
															</c:when>
															<c:when test="${list == '개발중'}">
																<i class="fa-solid fa-laptop-code"></i>
															</c:when>
															<c:when test="${list == '완료요청'}">
																<i class="fa-solid fa-magnifying-glass-arrow-right"></i>
															</c:when>
															<c:when test="${list == '개발 완료'}">
																<i class="fa-solid fa-square-check"></i>
															</c:when>
														</c:choose>
														<p>${list}</p>
													</div> 
													<span class="dateBadge"></span>
												</div>
							                  	<c:if test = "${list != '개발 완료'}">
													<i class="fa-solid fa-caret-right"></i>
												</c:if>
			                  				</c:if>
			                  			</c:if>
			                  		</c:forEach>
		                  		</c:if>
		                  		<c:if test="${(progressdetail.sttsNm == '반려' || progressdetail.sttsNm == '재검토')}">
		                  			<div class="d-flex flex-column">
		                  				<div class="circle plan"><i class="fa-sharp fa-regular fa-pen-to-square"></i><p>요청</p></div>
		                  				<span class="badge badge-secondary dateBadge">요청일자 <br> ${progressdetail.srRegDate}</span>
		                  			</div>	
		                  			<i class="fa-solid fa-caret-right"></i>
		                  			<c:if test="${progressdetail.sttsNm == '반려'}">
			                  			<div class="d-flex flex-column">
			                  				<div class="circle execute current">
			                  					<i class="fa-solid fa-file-circle-minus"></i>
			                  					<p>${progressdetail.sttsNm}</p>
			                  				</div>
			                  				<span class="dateBadge"></span>
			                  			</div>
		                  			</c:if>
	    				            <c:if test="${progressdetail.sttsNm == '재검토'}">
			                  			<div class="d-flex flex-column">
			                  				<div class="circle execute current">
			                  					<i class="fa-solid fa-file-circle-exclamation"></i>
			                  					<p>${progressdetail.sttsNm}</p>
			                  				</div>
			                  				<span class="dateBadge"></span>
			                  			</div>
		                  			</c:if>
		                  		</c:if>
		                  		<c:if test="${(progressdetail.sttsNm == '개발계획' || progressdetail.sttsNm == '계획조정')}">
									<div class="d-flex flex-column">
		                  				<div class="circle plan"><i class="fa-sharp fa-regular fa-pen-to-square"></i><p>요청</p></div>
		                  				<span class="badge badge-secondary dateBadge">요청일자 <br> ${progressdetail.srRegDate}</span>
		                  			</div>
		                  			<i class="fa-solid fa-caret-right"></i>
		                  			<div class="d-flex flex-column">
		                  				<div class="circle plan"><i class="fa-solid fa-magnifying-glass"></i><p>검토중</p></div>
		                  				<span class="dateBadge"></span>
		                  			</div>
		                  			<i class="fa-solid fa-caret-right"></i>
		                  			<div class="d-flex flex-column">
		                  				<div class="circle plan"><i class="fa-solid fa-file-circle-check"></i><p>접수</p></div>
		                  				<span class="dateBadge"></span>
		                  			</div>
		                  			<i class="fa-solid fa-caret-right"></i>
		                  			<c:if test="${progressdetail.sttsNm == '개발계획'}">
			                  			<div class="d-flex flex-column">
			                  				<div class="circle execute current"><i class="fa-regular fa-calendar-check"></i><p>개발계획</p></div>
			                  				<span class="badge badge-secondary dateBadge">${progressdetail.srStartDate} ~<br>${progressdetail.srEndDate}</span> 
			                  			</div>
			                  		</c:if>
		                  			<c:if test="${progressdetail.sttsNm == '계획조정'}">
			                  			<div class="d-flex flex-column">
			                  				<div class="circle execute current"><i class="fa-regular fa-calendar-plus"></i><p>계획조정</p></div>
			                  				<span class="dateBadge"></span>
			                  			</div>
		                  			</c:if>
		                  			<i class="fa-solid fa-caret-right"></i>
	         				        <div class="d-flex flex-column">
		                  				<div class="circle evaluate"><i class="fa-solid fa-magnifying-glass-arrow-right"></i><p>완료요청</p></div>
		                  				<span class="dateBadge"></span>
		                  			</div>
		                  			<i class="fa-solid fa-caret-right"></i>
	         				        <div class="d-flex flex-column">
		                  				<div class="circle evaluate"><i class="fa-solid fa-square-check"></i><p>개발 완료</p></div>
		                  				<span class="dateBadge"></span>
		                  			</div>
		                  		</c:if>
							</div>
							 <!-- 특수한 경우 -->
							<!-- <i class="fa-solid fa-caret-right"></i>
							<div class="circle evaluate"><i class="fa-solid fa-file-circle-minus"></i><p>반려</p></div> 평가 단계
							<i class="fa-solid fa-caret-right"></i>
							<div class="circle evaluate"><i class="fa-solid fa-file-circle-exclamation"></i><p>재검토</p></div> 평가 단계 -->
							
						   <div class="d-flex justify-content-between p-3" style="background-color:#EAECF4; border-radius:5px;">
						  		<span><i class="fa-solid fa-user-tie m-1"></i> 관련 시스템: ${progressdetail.sysNm}</span>
						  		<span><i class="fa-solid fa-user-tie m-1"></i> 신청자: ${progressdetail.requesterNm}</span>
						  		<span><i class="fa-solid fa-file-invoice-dollar m-1"></i> 예산: ${progressdetail.srBgt}만원</span>
						   </div>
						   
					   </div>
							
				   </div>
					<div id="devInfo" class="px-3">
						<div class="devTable p-2" style="width:550px">
							<c:if test="${!empty hrList}">
								<div class="d-sm-flex justify-content-between align-items-start">
									<h6 class="card-title card-title-dash">
										<i class="fa-solid fa-users-gear mx-1"></i>${hrList.get(0).userDpNm}</h6>
								</div>
								<div class="table p-2" style="width: 550px;">
									<table class="table select-table">
										<thead>
											<tr>
												<th>역할</th>
												<th>성명</th>
												<th>직무</th>
												<th>상태</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="list" items="${hrList}">
												<tr>
													<td style="width:100px">
														<c:if test="${list.hrLeader == 'Y'}">
															<span class="badge badge-warning" style="font-size: 100%">Leader</span>
														</c:if> <c:if test="${list.hrLeader != 'Y'}">
															<span class="badge badge-secondary" style="font-size: 100%">Dev</span>
														</c:if>
													</td>
													<td style="width:200px">
														<h6>${list.userNm}</h6> <small> <fmt:formatDate
																value="${list.hrStartDate}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate
																value="${list.hrEndDate}" pattern="yyyy-MM-dd" />
													</small>
													</td>
													<td style="width:100px">
														<div>
															<p class="badge badge-success" style="font-size: 100%;">${list.taskNm}</p>
														</div>
													</td>
													<td style="width:100px">
														<p class="badge" style="font-size: 100%;">${list.status}</p>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</c:if>
							<c:if test="${empty hrList}">
								<div class="alert alert-secondary m-3 p-2" role="alert">
									<h6><i class="fas fa-exclamation-triangle"></i><b> 안내 </b></h6>
									아직 개발자가 배정되지 않았습니다.
								</div>
							</c:if>
						</div>
					</div>
				</div>
	          </div>
          </c:if>
        </div>
	</div>
  <script>
  </script>