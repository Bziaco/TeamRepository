$(function() {
	
	 $("#btnSearch").click(function() {
	    	var keyword = $("#keyword").val();
	    	var url = location.href;
	    	var index = url.indexOf("attractionList");
	    	if(index != -1) {
	    		url = url.substring(0, index+11);
	    	}
	    	location.href = url + "?keyword="+keyword;
	    });
	    
	    
	    $(".btnDetailModal").click(function() {
	    	var ano = $(this).attr("data-ano");
	    	console.log("aaa")
	    	
	    	$.ajax({
	    		url:"/mymatch/attraction/getAttraction",
	    		data:{ano:ano},
	    		method:"post",
	    		success: function(data) {
	    			console.log(data);
	    			$("#detailModal #ano").html(data.ano);
	    			$("#detailModal #aname").html(data.aname);
	    			$("#detailModal #ainfo").html(data.ainfo);
	    			$("#detailModal #alocation").html(data.alocation);   			
	    			$("#attractionModal").modal("show");
	    		}
	    	});
	    });
});








