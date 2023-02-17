$(document).ready(function(){
	$.ajax({
		url : "/webapp/home/systemMiniView",
		type : "GET",
		datatype : "html",
		success : function(data){
			$('#systemMiniView').html(data);
			console.log(data);
		}
	});
});