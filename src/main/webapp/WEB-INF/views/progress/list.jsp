<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<%@include file="/WEB-INF/views/common/head.jsp"%>
</head>

<body id="page-top">
	<div id="wrapper">
		<!-- Sidebar -->
		<%@include file="/WEB-INF/views/common/sidebar.jsp"%>


		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<!-- TopBar -->
				<%@include file="/WEB-INF/views/common/topbar.jsp"%>
				<!-- 메인 컨테이너 Container Fluid-->
				<div class="container-fluid" id="container-wrapper">
					<div class="row">
						<!-- 진척관리 테이블 -->
						<div class="col-lg-12">
							<div class="card mb-4">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">SR 진척관리</h6>
								</div>
								<div class="col-lg-12">
									<div class="card mb-4">
										<div class="card-body">
											<div class="form-group">
												<div class="row">
													<div class="col-lg-1">
														<label style="margin:10px 0px">시스템 구분</label>
													</div>
													<div class="col-lg-2">
														<div style="margin:10px 0px; width:100%">
															<select class="select2-single from-control" style="width:100%">
																<option value="">Select</option>
																<option value="system1">시스템1</option>
																<option value="system2">시스템2</option>
																<option value="system3">시스템3</option>
																<option value="system4">시스템4</option>
																<option value="system5">시스템5</option>
															</select>
														</div>
													</div>
													<div class="col-lg-1">
														<label for="" style="margin:10px 0px">업무 구분</label>
													</div>
													<div class="col-lg-2">
														<div style="margin:10px 0px; width:100%">
															<select class="select2-single from-control" style="width:100%">
																<option value="">Select</option>
																<option value="system1">시스템1</option>
																<option value="system2">시스템2</option>
																<option value="system3">시스템3</option>
																<option value="system4">시스템4</option>
																<option value="system5">시스템5</option>
															</select>
														</div>
													</div>
													<div class="col-lg-1">
														<label for="" style="margin:10px 0px">진행 상태</label>
													</div>
													<div class="col-lg-2">
														<div style="margin:10px 0px; width:100%">
															<select class="select2-single from-control" style="width:100%">
																<option value="">Select</option>
																<option value="system1">시스템1</option>
																<option value="system2">시스템2</option>
																<option value="system3">시스템3</option>
																<option value="system4">시스템4</option>
																<option value="system5">시스템5</option>
															</select>
														</div>
													</div>
													<div class="col-lg-3">
														<div class="input-group-append float-right">
															<button class="btn btn-primary" type="button" style="margin:3px 0px">
																<i class="fas fa-search fa-sm"></i>
															</button>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-lg-1">
														<label for="" style="margin:10px 0px">SR 제목</label>
													</div>
													<div class="col-lg-2">
														<div style="margin:10px 0px; width:100%">
															<select class="select2-single from-control" style="width:100%">
																<option value="">Select</option>
																<option value="system1">시스템1</option>
																<option value="system2">시스템2</option>
																<option value="system3">시스템3</option>
																<option value="system4">시스템4</option>
																<option value="system5">시스템5</option>
															</select>
														</div>
													</div>
													<div class="col-lg-1">
														<label for="" style="margin:10px 0px">SR 번호</label>
													</div>
													<div class="col-lg-2">
														<div style="margin:10px 0px; width:100%">
															<select class="select2-single from-control" style="width:100%">
																<option value="">Select</option>
																<option value="system1">시스템1</option>
																<option value="system2">시스템2</option>
																<option value="system3">시스템3</option>
																<option value="system4">시스템4</option>
																<option value="system5">시스템5</option>
															</select>
														</div>
													</div>
													<div class="col-lg-1">
														<label for="system" style="margin:10px 0px">키워드</label>
													</div>
													<div class="col-lg-2">
														<form class="navbar-search">
															<div class="input-group" style="margin:2px 0px">
																<input type="text" class="form-control bg-light border-1 small" aria-label="Search">
															</div>
														</form>
													</div>
													<div class="col-lg-3">
														<div class="input-group-append float-right">
															<button class="btn btn-danger" type="button" style="margin:3px 5px">
																초기화
															</button>
															<button class="btn btn-dark" type="button" style="margin:3px 0px">
																엑셀 다운로드
															</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="table-responsive p-3">
									<table class="table align-items-center table-flush table-hover">
										<thead class="thead-light">
											<tr>
												<th>SR 번호</th>
												<th>시스템 구분</th>
												<th>업무 구분</th>
												<th>SR 명</th>
												<th>요청자</th>
												<th>완료 요청일</th>
												<th>완료 예정일</th>
												<th>진행 상태</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th>13</th>
												<th>황건희 시스템</th>
												<th>황건희 댓글 추가</th>
												<th>건희 건희</th>
												<th>황 아저씨</th>
												<th>건희씨 생일</th>
												<th>건희씨 생일쯤 ^^</th>
												<th>많이 됬을걸?</th>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 로그아웃 모달 -->
					<%@include file="/WEB-INF/views/common/logout.jsp"%>
				</div>
				<!---Container Fluid-->
			</div>

		</div>
	</div>
	<%@include file="/WEB-INF/views/common/bottom.jsp"%>
</body>

</html>
														