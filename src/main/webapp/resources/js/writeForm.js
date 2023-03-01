
 //날짜 선택
 $(document).ready(function () {
	const today = new Date();
	
     // Bootstrap Date Picker
     $('#simple-date1 .input-group.date').datepicker({
       format: 'yyyy/mm/dd',
       todayBtn: 'linked',
       todayHighlight: true,
       autoclose: true,        
     });
 });
 
//오늘 날짜 디폴트로 입력
$(document).ready(function() {
	var todayResult = getTimeStamp();
	console.log(todayResult);
	document.getElementById('dateInput').value = todayResult;
});
	
//오늘 날짜 양식
function getTimeStamp() {
  var d = new Date();

  var s =
    leadingZeros(d.getFullYear(), 4) + '/' +
    leadingZeros(d.getMonth() + 1, 2) + '/' +
    leadingZeros(d.getDate(), 2);

  return s;
}


//오늘 날짜 양식 (+두자리)
function leadingZeros(n, digits) {
  var zero = '';
  n = n.toString();

  if (n.length < digits) {
    for (i = 0; i < digits - n.length; i++)
      zero += '0';
  }
  return zero + n;
}

//파일 js
var fileNo = 0;
var filesArr = new Array();

/* 첨부파일 추가 */
function addRequestFile(obj){
	var maxFileCnt = 5; // 첨부파일 최대 개수
	var curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수
	console.log(curFileCnt);
	for (const file of obj.files) {
		var reader = new FileReader();
		reader.onload = function() {
			filesArr.push(file);
		};
		reader.readAsDataURL(file);
		
		// 목록 추가
		let htmlData = '';
		htmlData += '<div id="file' + fileNo + '" class="filebox row">';
		htmlData += '   <a class="delete col-1" onclick="deleteFile(' + fileNo + ');"><i class="far fa-minus-square"></i></a>';
		htmlData += '   <p class="name col-11 text-left">' + file.name + '</p>';
		htmlData += '</div>';
		$('#userfile').append(htmlData);
		fileNo++;
	}
	// 초기화
    document.querySelector("input[type=file]").value = "";
}

/* 첨부파일 삭제 */
function deleteFile(num) {
	document.querySelector("#file" + num).remove();
	filesArr[num].is_delete = true;
}

/* ajax 처리 */
function requestWrite() {
	// 폼 데이터 담기
	var form = document.querySelector("form");
    var formData = new FormData(form);
    for (var i = 0; i < filesArr.length; i++) {
        // 삭제되지 않은 파일만 폼데이터에 담기
        if (!filesArr[i].is_delete) {
        	console.log("돌아감");
        	console.log(filesArr[i]);
            formData.append("requestMFile", filesArr[i]);
        }
    }
    var srRegDate=document.getElementById('srRegDate').value;
    
    var sysNm=document.getElementById('sysNm').value;
    formData.append("sysNm",sysNm);
    
    var srTtl = document.getElementById('srTtl').value;
    formData.append("srTtl",srTtl);
    
    if($('#srStd').val() != ""){
    	var srStd = document.getElementById('srStd').value;
    	formData.append("srStd",srStd);
    }
    
    var srCn = document.getElementById('srCn').value;
    formData.append("srCn",srCn);
    
    var userNo = document.getElementById('userNo').value;
    formData.append("userNo",userNo);
    
    $.ajax({
		type: "POST",
		enctype: 'multipart/form-data',	// 필수
		url: 'write',
		data: formData,		// 필수
		processData: false,	// 필수
		contentType: false	// 필수
    }).done((data) => {
    	$('#colNo2').html(data);
    });
    
}

let fileNmArray = [];

/* 기존의 첨부파일 삭제 */
function deleteExistingFile(srFilePhysNm, srFileNo) {
	fileNmArray.push(srFilePhysNm);
	console.log(fileNmArray);
	
	document.querySelector("#file" + srFileNo).remove();
}

/* ajax 업데이트 처리 */
function requestUpdate() {
	// 폼 데이터 담기
	var form = document.querySelector("form");
    var formData = new FormData(form);
    for (var i = 0; i < filesArr.length; i++) {
        // 삭제되지 않은 파일만 폼데이터에 담기
        if (!filesArr[i].is_delete) {
        	console.log("돌아감");
        	console.log(filesArr[i]);
            formData.append("requestMFile", filesArr[i]);
        }
    }
    
    for (var j = 0; j< fileNmArray.length; j++){
    	console.log(fileNmArray[j]);
    	formData.append("deleteFile",fileNmArray[j]);
    }
    var srRegDate=document.getElementById('srRegDate').value;
    var srNo = document.getElementById('srNo').value;
    formData.append("srNo",srNo);
    var sysNm=document.getElementById('sysNm').value;
    formData.append("sysNm",sysNm);
    
    var srTtl = document.getElementById('srTtl').value;
    formData.append("srTtl",srTtl);
    
    if($('#srStd').val() != ""){
    	var srStd = $('#srStd').val();
    	formData.append("srStd",srStd);
    }
    var srCn = document.getElementById('srCn').value;
    formData.append("srCn",srCn);
    
    var userNo = document.getElementById('userNo').value;
    formData.append("userNo",userNo);
    
    $.ajax({
		type: "POST",
		enctype: 'multipart/form-data',	// 필수
		url: 'update',
		data: formData,		// 필수
		processData: false,	// 필수
		contentType: false	// 필수
    }).done((data) => {
//    	console.log("update:: "+"srNo"+srNo+"sysNm"+sysNm+"srTtl"+srTtl+"srStd"+srStd+"srCn"+srCn+userNo);
    	$('#colNo2').html(data);
    });
    
    
    
}
