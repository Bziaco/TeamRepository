$(function() {    
	$("#guideList .btnLocation").click(function(){
		var location=$(this).attr("data-location");
		console.log("aaa")
		
		
		$.ajax({
			url:"/mymatch/guide/findGuide",
			data: {glocal:location},
			method: "post",
			success: function(data) {
				$("#guideTable").html(data);
			}
		});
	});
	
	
	$(document).on("click", ".btnDetailModal", function() {
		var gid = $(this).attr("data-gid");
		console.log(gid);
		
		$.ajax({	
			url:"/mymatch/guide/getList",
			data: {gid:gid},
			method: "post",
			success: function(data) {
    			console.log(data);
    			$("#detailModal #id").html(data.gid);
    			$("#detailModal #local").html(data.glocal);
    			$("#detailModal #intro").html(data.gintro);
    			$("#detailModal #intro").html(data.gcount);
				$("#detailModal").modal("show");
				console.log(data.gid);
			}
		});
	});
	
});








