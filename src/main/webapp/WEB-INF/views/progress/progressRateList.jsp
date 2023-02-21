<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
	<div class="table-responsive">
	<div class="input-group-append float-right mb-3">
		<button class="btn btn-primary btn-sm mr-2" type="button" data-toggle="modal" data-target="#progressRateModal" id="#modalScroll" onclick="progressRateAdd()">
			추가
		</button>
	</div>
		<table class="table align-items-center table-flush table-hover">
			<thead class="thead-light">
				<tr>
					<th></th>
					<th>작업 구분</th>
					<th>시작일</th>
					<th>종료일</th>
					<th>진척율(누적)</th>
					<th>산출물</th>
				</tr>
			</thead>
			<c:forEach var="list" items="${progressRateList}">
				<tr>
					<th>
						<div class="custom-control custom-radio">
							<input type="radio" id="ProgNo+${list.progNo}" name="progressRateRadioList" class="custom-control-input" value="${list.progNo}">
							<label class="custom-control-label" for="ProgNo+${list.progNo}"></label>
						</div>
					</th>
					<th>${list.progTypeNm}</th>
					<th>${list.progStartDate}</th>
					<th>${list.progEndDate}</th>
					<th>${list.progRate}</th>
					<th>
						<c:if test="${list.progressFile[0].progFileNo != null}">
							<div class="row">
								<c:forEach var="fileList" items="${list.progressFile}">
									<a href="progressFiledownload/${list.srNo}/?progFileNo=${fileList.progFileNo}">
										<span>[${fileList.progFileActlNm}]</span>
									</a>
								</c:forEach>
							</div>
						</c:if>
					</th>
					<th id="progType-${list.progNo}" style="display:none">${list.progType}</th>
				</tr>
			</c:forEach>
		</table>
	<!-- 모달 창 -->
	<div class="modal fade" id="progressRateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
		<div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable" role="document">
			<div class="modal-content">
				<div id="progressRateModalView"></div>
			</div>
		</div>
	</div>
</div>

<script>
	function progressRateAdd() {
		const progressRateRadioList = document.getElementsByName('progressRateRadioList');
		let progNo = null;
		
		progressRateRadioList.forEach((node) => {
			if(node.checked) {
				progNo = node.value;
			}
		});
		
		$.ajax({
			url : "progressRateAdd/" + progNo,
			method : "post"
		}).done((data) => {
			$("#progressRateModalView").html(data)
		});
	}
</script>