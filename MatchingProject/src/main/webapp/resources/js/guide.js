$(function() {    
	$(".btnLocation").click(function(){
		var location=$(this).attr("data-location");
		
		
		$.ajax({
			url:"/mymatch/guide/findGuide",
			data: {glocal:location},
			method: "post",
			success: function(data) {
				$("#guideTable").html(data);
			}
		});
	});
	
	
	$(document).on('click', '.btnDetailModal', function() {
		var gid = $(this).attr("data-gid");
		$.ajax({
			url:"/mymatch/guide/getList",
			data:{gid:gid},
			method: "post",
			success: function(data) {
				console.log(data);
				$("#detailModal").modal("show");
			}
		});
	});
	
});








