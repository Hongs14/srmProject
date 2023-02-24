
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

 //파일 선택
$(document).ready(function() {
	
    $("#customFile").on('change',function(){
        if(window.FileReader){
        	var files = $(this)[0].files;
            var filename = files[0].name + "<button type='button' onclick='function1()' class='btn btn-danger btn-sm m-1'  >X</button>";
            
            for(var i=1; i<files.length; i++){
            	filename += "<br>" +
            	 files[i].name +
            	 "<a href='#' class='btn btn-danger btn-sm m-1' >X</a>" ;
            }
        } else {
            var filename = $(this).val.split('/').pop().split('\\').pop();
        }

        //filename insert
        $('#userfile').html(filename);
    });
}); 
//파일 이름 출력 
$(document).ready(function() {
    $("#customFile").on('change',function(){
    	let formData = new FormData();
        if(window.FileReader){
        	var files = $(this)[0].files;
        	var filename;
        	for(var i=0; i<files.length; i++){
             	filename = files[i].name;
             	console.log(filename);
             	
            }
        } else {
            var filename = $(this).val.split('/').pop().split('\\').pop();
        }

        //filename insert
        $('#userfile').html(filename);
    });
});

	 