<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.Enumeration" %>
<% session.removeAttribute("message"); %>
    
<!DOCTYPE html>
	<div class="table-responsive">
	<div class="input-group-append float-right mb-3">
		<button class="btn btn-primary btn-sm mr-2" type="button" data-toggle="modal" data-target="#progressFileModal" id="#modalScroll" onclick="progressFileAdd()">
			추가
		</button>
		<button class="btn btn-primary btn-sm mr-2" type="button" data-toggle="modal" data-target="#progressRateModal" id="#modalScroll" onclick="progressFileDelete()">
			삭제
		</button>
	</div>
		<table class="table align-items-center table-flush table-hover">
			<thead class="thead-light">
				<tr>
					<th></th>
					<th>산출물 구분</th>
					<th>첨부파일명</th>
					<th>등록일</th>
				</tr>
			</thead>
			<c:forEach var="list" items="${progressFileList}">
				<tr>
					<th>
						<input type="checkbox" name="progressFileCheckBox">
					</th>
					<th>${list.progTypeNm}</th>
					<th>
						<a href="progressFiledownload/${srNo}/?progFileNo=${list.progFileNo}">
							${list.progFileActlNm}
						</a>
					</th>
					<th>${list.progRegDate}</th>
					<th style="display:none">${list.progFilePhysNm}</th>
					<th style="display:none">${list.progFileNo}</th>
				</tr>
			</c:forEach>
		</table>
	<!-- 모달 창 -->
	<div class="modal fade" id="progressFileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
		<div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable" role="document">
			<div class="modal-content">
				<div id="progressFileModalView"></div>
			</div>
		</div>
	</div>
</div>

<script>
	function progressFileAdd() {
		var srNo = "${srNo}";
		
		$.ajax({
			url : "progressFileAdd/" + srNo,
			method : "get"
		}).done((data) => {
			$("#progressFileModalView").html(data)
		});
	}
	
	function progressFileDelete() {
		var srNo = "${srNo}";
		
		var progressFile = new Array();
		var checkbox = $("input[name=progressFileCheckBox]:checked");
		
		// 체크된 박스의 값을 가져옴
		checkbox.each(function(i) {
			var tr = checkbox.parent().parent().eq(i);
			var th = tr.children();
			
			var progFilePhysNm = th.eq(4).text();
			var progFileNo = th.eq(5).text();
			
			let data = {progFilePhysNm : progFilePhysNm, progFileNo : progFileNo};
			
			progressFile.push(data);
		});
		
		data = {srNo : srNo, progressFile : progressFile};
		
		console.log(data);
		
		$.ajax({
			url : "progressFileRemove/",
			method : "post",
			data : JSON.stringify(data),
			contentType: "application/json; charset=UTF-8"
		}).done((data) => {
			window.location.href = srNo;
		});
	}
</script>