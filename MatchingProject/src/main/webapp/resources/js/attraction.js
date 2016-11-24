$(function() {
	$("#btnInfo").click(function() {
    	var name = $(this).attr("data-location");
		console.log("aaa")
    	
    	$.ajax({
    		url:"/mymatch/attraction/attractionList",
    		data:{aname:name},
    		method:"post",
    		success: function(data) {
    			console.log(data);
    			$("#ainfo").html(data);		
    			//$("#collapseOne").modal("show");
    		}
    	});
    });
});








