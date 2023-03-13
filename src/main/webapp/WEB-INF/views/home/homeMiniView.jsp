<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<div class="tab-content" style="min-height: 400px;">
		<div class="tab-pane active" id="all" role="tabpanel"
			aria-labelledby="home-tab">
			<div class="table-responsive">
				<table class="table table-hover border p-1" >
					<thead class="thead-light">
						<tr>
							<th style="width:130px">SR번호</th>
							<th style="width:320px">제목</th>
							<th style="width:110px">관련 시스템</th>
							<th style="width:90px">상태</th>
							<th style="width:100px">완료예정일</th>
							<th style="width:40px">중요</th>
							<th style="width:100px">진척도</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${srList}" varStatus="status">
						<tr id="bg-${list.srNo}" class="homeSrList">
							<c:if test="${sessionScope.loginUser.userType eq '관리자'}">
								<td style="width:130px">
									<a onclick="managerMiniView('${list.srNo}')" style="cursor:pointer;" id="srNo-${status.index}">
										<b>
											${list.srNo}
										</b>
									</a>
								</td>
								<td style="width:50px;">
									<a onclick="managerMiniView('${list.srNo}')" style="width:300px; overflow:hidden; text-overflow: ellipsis; display:block; cursor:pointer;">
										<b>
											${list.srTtl}
										</b>
									</a>
								</td>
							</c:if>
							<c:if test="${sessionScope.loginUser.userType eq '고객사'}">
								<td style="width:130px;">
									<a href="${pageContext.request.contextPath}/request/list/${list.srNo}" style="cursor:pointer; text-decoration:none;">
										<b>
											${list.srNo}
										</b>
									</a>
								</td>
								<td style="width:50px;">
									<a href="${pageContext.request.contextPath}/request/list/${list.srNo}" style="width:300px; overflow:hidden; text-overflow: ellipsis; display:block; cursor:pointer; text-decoration:none;">
										<b>
											${list.srTtl}
										</b>
									</a>
								</td>
							</c:if>
							<c:if test="${sessionScope.loginUser.userType eq '개발자'}">
								<td style="width:130px">
									<a onclick="devMiniView('${list.srNo}')" style="cursor:pointer;">
										<b>
											${list.srNo}
										</b>
									</a>
								</td>
								<td>
									<a onclick="devMiniView('${list.srNo}')" style="width:300px; overflow:hidden; text-overflow: ellipsis; display:block; cursor:pointer;">
										<b>
											${list.srTtl}
										</b>
									</a>
								</td>
							</c:if>
							<td style="width:110px">${list.sysNm}</td>
							<td style="width:90px">
								<c:choose>
										<c:when test="${list.sttsNm eq '요청'}">
											<span class="badge badge-outline-secondary" style="border: 1px solid gray; font-size:90%;">${list.sttsNm}</span>
										</c:when>
										<c:when test="${list.sttsNm eq '검토중'}">
											<span class="badge badge-secondary" style="font-size:90%">${list.sttsNm}</span>
										</c:when>
										<c:when test="${list.sttsNm eq '접수'}">
											<span class="badge badge-warning" style="font-size:90%">${list.sttsNm}</span>
										</c:when>
										<c:when test="${list.sttsNm eq '개발중'}">
											<span class="badge badge-info" style="font-size:90%">${list.sttsNm}</span>
										</c:when>
										<c:when test="${list.sttsNm eq '완료요청'}">
											<span class="badge text-white" style="background-color:#a33bff; font-size:90%;">${list.sttsNm}</span>
										</c:when>
										<c:when test="${list.sttsNm eq '개발 완료'}">
											<span class="badge badge-success" style="font-size:90%">${list.sttsNm}</span>
										</c:when>
										<c:when test="${list.sttsNm eq '개발계획'}">
											<span class="badge text-white" style="background-color:#476A6F; font-size:90%;">${list.sttsNm}</span>
										</c:when>
										<c:otherwise>
											<span class="badge badge-danger" style="font-size:90%">${list.sttsNm}</span>
										</c:otherwise>
									</c:choose>
							</td>
							<td style="width:100px">${list.srRegDate}</td>
							<td style="width:40px">
								<c:if test="${list.srPry eq '상'}"><span class="badge badge-danger" style="font-size:90%">${list.srPry}</span></c:if>
								<c:if test="${list.srPry eq '중'}"><span class="badge badge-primary" style="font-size:90%">${list.srPry}</span></c:if>
								<c:if test="${list.srPry eq '하'}"><span class="badge badge-secondary" style="font-size:90%">${list.srPry}</span></c:if>
							</td>
							<td style="width:100px">
								<div class="progress">
									<c:choose>
										<c:when test="${list.sttsNm eq '검토중'}">
											<div class="progress-bar bg-danger" role="progressbar" 
											style="width:20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
										</c:when>
										<c:when test="${list.sttsNm eq '접수'}">
											<div class="progress-bar bg-warning" role="progressbar" 
											style="width:40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
										</c:when>
										<c:when test="${list.sttsNm eq '개발중'}">
											<div class="progress-bar bg-info" role="progressbar" 
											style="width:60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
										</c:when>
										<c:when test="${list.sttsNm eq '완료요청'}">
											<div class="progress-bar" role="progressbar" 
											style="width:80%; background-color:#a33bff;" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
										</c:when>
										<c:when test="${list.sttsNm eq '개발 완료'}">
											<div class="progress-bar bg-success" role="progressbar" 
											style="width:100%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
										</c:when>
										<c:when test="${list.sttsNm eq '개발계획'}">
											<div class="progress-bar" role="progressbar" 
											style="width:50%; background-color:#476A6F;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
										</c:when>
										<c:when test="${list.sttsNm eq '계획조정'}">
											<div class="progress-bar bg-danger" role="progressbar" 
											style="width:70%;" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
										</c:when>
										<c:otherwise>
											<div class="progress-bar bg-danger" role="progressbar" 
											style="width:0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
										</c:otherwise>
									</c:choose>
								</div>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<script>
					function managerMiniView(srNo) {
						var className = $(".homeSrList");
						className.removeClass("on");
						
						data = {srNo : srNo}
						
						$.ajax({
							url : "managerMiniView",
							method : "post",
							data : JSON.stringify(data),
							contentType: "application/json; charset=UTF-8"
						}).done((data) => {
							$('#managerMiniView').html(data);
							$("#managerMiniViewDetail").show();
							var bg = "bg-" + srNo;
							$('#' + bg).addClass("on");
						})
						
					}
					
					function devMiniView(srNo) {
						var className = $(".homeSrList");
						className.removeClass("on");
					
						data = {srNo : srNo}
						
						$.ajax({
							url : "devMiniView",
							method : "post",
							data : JSON.stringify(data),
							contentType: "application/json; charset=UTF-8"
						}).done((data) => {
							$('#devMiniView').html(data);
							$("#devPlanDetail").show();
							var bg = "bg-" + srNo;
							$('#' + bg).addClass("on");
						})
					}
				</script>
				
				<c:if test="${pager.totalRows != 0}">
					<div class="pager d-flex justify-content-center my-3">
						<div class="pagingButtonSet d-flex justify-content-center">
							<c:if test="${pager.totalPageNo > 5}">
								<c:if test="${pager.pageNo > 1}">
									<a onclick="homeMiniViewChange(${sttsNo}, 1)" type="button" class="btn btn-outline-primary btn-sm m-1">처음</a>
								</c:if>
							</c:if>
							<c:if test="${pager.groupNo > 1}">
								<a onclick="homeMiniViewChange(${sttsNo}, ${pager.startPageNo-1})" type="button" class="btn btn-outline-info btn-sm m-1">이전</a>
							</c:if>
			
							<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
								<c:if test="${pager.pageNo != i}">
									<a onclick="homeMiniViewChange(${sttsNo}, ${i})" type="button" class="btn btn-outline-info btn-sm m-1">${i}</a>
								</c:if>
								<c:if test="${pager.pageNo == i}">
									<a onclick="homeMiniViewChange(${sttsNo}, ${i})" type="button" class="btn btn-primary btn-sm m-1">${i}</a>
								</c:if>
							</c:forEach>
			
							<c:if test="${pager.groupNo < pager.totalGroupNo }">
								<a onclick="homeMiniViewChange(${sttsNo}, ${pager.endPageNo+1})" type="button" class="btn btn-outline-info btn-sm m-1">다음</a>
							</c:if>
							<c:if test="${pager.totalPageNo > 5}">
								<c:if test="${pager.pageNo < pager.totalPageNo }">
									<a onclick="homeMiniViewChange(${sttsNo}, ${pager.totalPageNo})" type="button" class="btn btn-outline-primary btn-sm m-1">맨끝</a>
								</c:if>
							</c:if>
						</div>
					</div>
				</c:if>
			</div>
		</div>
		<c:if test="${empty srList}">
			<div class="alert alert-secondary m-3 p-2" role="alert">
                  <h6><i class="fas fa-exclamation-triangle"></i><b> 안내 </b></h6>
                  	조건에 맞는 SR건이 존재하지 않습니다.
			</div>
		</c:if>
	</div>
