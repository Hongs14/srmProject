
$(document).ready(function () {
    $('#simple-date4 .input-daterange').datepicker({        
        format: 'yyyy/mm/dd',        
        autoclose: true,     
        todayHighlight: true,   
        todayBtn: 'linked',
     });  
});
								
//오늘 날짜 디폴트로 입력
$(document).ready(function() {
	getDateFilter();
});
	
function getDateFilter(){
	var todayResult = getTimeStamp();
	console.log(todayResult);
	$('#endDate').val(todayResult);
	
	var dateStart =getLastYearTimeStamp();
	console.log(dateStart);
	$('#startDate').val(dateStart);
};

function getTimeStamp() {
//오늘 날짜 양식
  var d = new Date();

  var s =
    leadingZeros(d.getFullYear(), 4) + '/' +
    leadingZeros(d.getMonth() + 1, 2) + '/' +
    leadingZeros(d.getDate(), 2);

  return s;
}


function getLastYearTimeStamp() {
//1년전 날짜 양식
	  var d = new Date();

	  var s =
	    leadingZeros(d.getFullYear()-1, 4) + '/' +
	    leadingZeros(d.getMonth() +1, 2) + '/' +
	    leadingZeros(d.getDate(), 2);

	  return s;
}


function leadingZeros(n, digits) {
//오늘 날짜 양식 (+두자리)
  var zero = '';
  n = n.toString();

  if (n.length < digits) {
    for (i = 0; i < digits - n.length; i++)
      zero += '0';
  }
  return zero + n;
}
			
		
		
function selectAll(selectAll) {
	const checkboxes = document.querySelectorAll('input[name="devleopCheck"]');
  	checkboxes.forEach((checkbox) => {
    	checkbox.checked = selectAll.checked
  	});
};

function checkSelectAll(checkbox)  {
	//체크 해제
	const selectall  = document.querySelector('input[name="devleopCheck"]');
  
  	if(checkbox.checked === false)  {
    	selectall.checked = false;
  	}
};

$(document).ready(function () {
	//처음 화면
	var sysNo = $('#sysNo').val();
	var sttsNo = $('#sttsNo').val();
	var userOgdp = $('#userOgdp').val();
	var srDevDp = $('#srDevDp').val();
	var srRegStartDate = $('#startDate').val();
	var srRegEndDate = $('#endDate').val();
	
	var srTtl = $('#keyword').val();
	
	if(srTtl !== "") {
		srTtl = "%" + srTtl + "%";
	}
	
	let data = {sysNo : sysNo, sttsNo : sttsNo, userOgdp : userOgdp, srDevDp: srDevDp,
			srRegStartDate : srRegStartDate, srRegEndDate : srRegEndDate, srTtl : srTtl};
	
	console.log(data);
	
	$.ajax({
		url : '<c:url value="/develop/filter/1"/>',
		method : "post",
		data : JSON.stringify(data),
		contentType: "application/json; charset=UTF-8"
	}).done((data) => {
		$("#ajaxList").html(data)
	});
});
		
function developList(pageNo) {
	//조건별로 검색
	var sysNo = 0;
	console.log("개발관리 조건 리스트 불러오기")
	sysNo = $('#sysNo').val(); 
	
	if($('#searchMySR').prop('checked')){
		console.log("내 목록보기 체크");
		sysNo = "${loginUser.sysNo}";
		console.log(sysNo);
	}  
	
	
	var sttsNo = $('#sttsNo').val();
	var userOgdp = $('#userOgdp').val();
	var srDevDp = $('#srDevDp').val();
	var srRegStartDate = $('#startDate').val();
	var srRegEndDate = $('#endDate').val();
	
	
	var srTtl = $('#keyword').val();
	
	if(srTtl !== "") {
		srTtl = "%" + srTtl + "%";
	};
	
	let data = {sysNo : sysNo, sttsNo : sttsNo, userOgdp : userOgdp, srDevDp: srDevDp,
			srRegStartDate : srRegStartDate, srRegEndDate : srRegEndDate, sysNo: sysNo, srTtl : srTtl };
	console.log(data);
	
	$.ajax({
		url :  '<c:url value="/develop/filter/'+pageNo+'"/>',
		method : "post",
		data : JSON.stringify(data),
		contentType: "application/json; charset=UTF-8"
	}).done((data) => {
		$("#ajaxList").html(data);
	});
};

function ExcelDownload(){
	//엑셀 다운로드
	let developSRArr = new Array();
	let checkbox = $("input[name=devleopCheck]:checked");
	
	// 체크된 체크박스의 값을 가져옴
	checkbox.each(function(i) {
		let tr = checkbox.parent().parent().eq(i);
		console.log(checkbox.parent().parent().eq(i));
		let td = tr.children();
	
		if(td.eq(1).text() != 'SR번호') {
			
			let srNo = td.eq(1).text();
			
			developSRArr.push(srNo);
		}
		console.log(developSRArr);
	});
	
 	if(developSRArr.length == 0) {
    	$('#ListExcelModal').modal('show');
    	$("#ListExcelModalMessage").text("SR을 선택해 주세요");
	} else {
		var form = document.createElement('form');
		form.setAttribute('method','post');
		form.setAttribute('action', 'excelDownload');
		document.charset = "utf-8";
		
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute('type', 'hidden');
		hiddenField.setAttribute('name', 'developSRArr');
		hiddenField.setAttribute('value', developSRArr);
		form.appendChild(hiddenField);
		
		document.body.appendChild(form);
		form.submit();
	}
	 
};
			
function searchClear(){
	console.log("검색조건 초기화");

	for(let i=0; i< $('.clear').length ; i++){
		$($('.clear')[i]).find('option:first').prop('selected', true);
	} 
	
	$("#keyword").val("");
	getDateFilter();
};
