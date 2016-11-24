$(function() {
	/*
	$("#mytable #checkall").click(function () {
        if ($("#mytable #checkall").is(':checked')) {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", true);
            });

        } else {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", false);
            });
        }
    });
    
    $("[data-toggle=tooltip]").tooltip();*/
	
	
	
	 $("#btnSearch").click(function() {
	    	var keyword = $("#keyword").val();
	    	var url = location.href;
	    	var index = url.indexOf("boardList");
	    	if(index != -1) {
	    		url = url.substring(0, index+9);
	    	}
	    	location.href = url + "?keyword="+keyword;
	    });
	    
	    
	    $(".btnDetailModal").click(function() {
	    	var aname = $(this).attr("data-aname");
	    	
	    	$.ajax({
	    		url:"/mymatch/attraction/getAttraction",
	    		data:{aname:aname},
	    		method:"post",
	    		success: function(data) {
	    			console.log(data);
	    			$("#detailModal #ano").html(data.ano);
	    			$("#detailModal #aname").html(data.aname);
	    			$("#detailModal #ainfo").html(data.ainfo);
	    			$("#detailModal #alocation").html(data.alocation);    			
	    			$("#detailModal").modal("show");
	    		}
	    	});
	    });
});








