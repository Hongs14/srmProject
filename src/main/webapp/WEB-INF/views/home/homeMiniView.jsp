<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<div class="tab-content" style="min-height: 400px;">
		<div class="tab-pane active" id="all" role="tabpanel"
			aria-labelledby="home-tab">
			<div class="table-responsive">
				<table class="table table-hover border p-1" >
					<thead class="thead-light">
						<tr>
							<th>SR번호</th>
							<th>제목</th>
							<th>관련 시스템</th>
							<th>상태</th>
							<th>완료예정일</th>
							<th>중요</th>
							<th>진척도</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${srList}">
						<tr>
							<c:if test="${sessionScope.loginUser.userType eq '관리자'}">
								<td><a onclick="managerMiniView('${list.srNo}')">${list.srNo}</a></td>
								<td><a onclick="managerMiniView('${list.srNo}')">${list.srTtl}</a></td>
							</c:if>
							<c:if test="${sessionScope.loginUser.userType eq '고객사'}">
								<td><a href="${pageContext.request.contextPath}/request/list/${list.srNo}">${list.srNo}</a></td>
								<td><a href="${pageContext.request.contextPath}/request/list/${list.srNo}">${list.srTtl}</a></td>
							</c:if>
							<c:if test="${sessionScope.loginUser.userType eq '개발자'}">
								<td><a onclick="devMiniView('${list.srNo}')">${list.srNo}</a></td>
								<td><a onclick="devMiniView('${list.srNo}')">${list.srTtl}</a></td>
							</c:if>
							<td>${list.sysNm}</td>
							<td style="width : 100px">
								<c:choose>
										<c:when test="${list.sttsNm eq '요청'}">
											<span class="badge badge-outline-secondary" style="border: 1px solid gray;">${list.sttsNm}</span>
										</c:when>
										<c:when test="${list.sttsNm eq '검토중'}">
											<span class="badge badge-secondary">${list.sttsNm}</span>
										</c:when>
										<c:when test="${list.sttsNm eq '접수'}">
											<span class="badge badge-warning">${list.sttsNm}</span>
										</c:when>
										<c:when test="${list.sttsNm eq '개발중'}">
											<span class="badge badge-info">${list.sttsNm}</span>
										</c:when>
										<c:when test="${list.sttsNm eq '완료요청'}">
											<span class="badge text-white" style="background-color:#a33bff;">${list.sttsNm}</span>
										</c:when>
										<c:when test="${list.sttsNm eq '개발 완료'}">
											<span class="badge badge-success">${list.sttsNm}</span>
										</c:when>
										<c:when test="${list.sttsNm eq '개발계획'}">
											<span class="badge text-white" style="background-color:#476A6F;">${list.sttsNm}</span>
										</c:when>
										<c:otherwise>
											<span class="badge badge-danger">${list.sttsNm}</span>
										</c:otherwise>
									</c:choose>
							</td>
							<td>${list.srRegDate}</td>
							<td>${list.srPry}</td>
							<td>
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
						data = {srNo : srNo}
						
						$.ajax({
							url : "managerMiniView",
							method : "post",
							data : JSON.stringify(data),
							contentType: "application/json; charset=UTF-8"
						}).done((data) => {
							$('#managerMiniView').html(data);
						})
					}
					
					function devMiniView(srNo) {
						data = {srNo : srNo}
						
						$.ajax({
							url : "devMiniView",
							method : "post",
							data : JSON.stringify(data),
							contentType: "application/json; charset=UTF-8"
						}).done((data) => {
							$('#devMiniView').html(data);
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
