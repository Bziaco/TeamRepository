$(function() {
	
	 $("#btnSearch").click(function() {
	    	var keyword = $("#keyword").val();
	    	var url = location.href;
	    	var index = url.indexOf("attractionList");
	    	if(index != -1) {
	    		url = url.substring(0, index+15);
	    	}
	    	location.href = url + "?keyword="+keyword;
	    });
	    
	    
	    $(".btnDetailModal").click(function() {
	    	var ano = $(this).attr("data-ano");
	    	
	    	$.ajax({
	    		url:"/mymatch/attraction/getAttraction",
	    		data:{ano:ano},
	    		method:"post",
	    		success: function(data) {
	    			$("#attractionModal #savedfile").attr('src', "/mymatch/attraction/getPhoto?savedfile=" +data.savedfile);
	    			$("#attractionModal #ano").html(data.ano);
	    			$("#attractionModal #aname").html(data.aname);
	    			$("#attractionModal #ainfo").html(data.ainfo);
	    			$("#attractionModal #alocation").html(data.alocation);   			
	    			$("#attractionModal").modal("show");
	    		}
	    	});
	    });
});








