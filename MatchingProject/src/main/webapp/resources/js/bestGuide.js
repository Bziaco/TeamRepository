$(function() {    
	/*$(".container #collapseOne .list-group>a ").click(function(e) {
        e.preventDefault();
        $(this).siblings('a.active').removeClass("active");
        $(this).addClass("active");
        var index = $(this).index();
        $("div.container div.panel-table").removeClass("active");
        $("div.container div.panel-table").eq(index).addClass("active");
    });*/
    
    /*$(".table-responsive #btnDelete").click(function(event){
    	var bno = $(this).attr("data-bno");
    	$("#deleteModal #btnYes").click(function(event){
    		$.ajax({
    			url:"/mymatch/board/delete",
    			data: {bno:bno},
    			method: "post",
    			success: function(data) {
    				if(data.result=="success") {
    					$("#deleteModal").modal('hide');
    					$('.modal-backdrop').remove();
    					location.reload(true);
    				}
    			}
    		});
        	
        });
    	$("#deleteModal").modal("show");
    });    
    
    $(".table-responsive #btnUpdate").click(function(event){
    	var bno = $(this).attr("data-bno");
    	console.log("bno:"+ bno);
    	
    	$.ajax({
    		url:"/mymatch/board/getBoard",
    		data: {bno:bno},
    		success: function(data) {
    			$("#updateModal").modal("show");
    			$("#updateModal #btitle").val(data.btitle);
    			$("#updateModal #bcontent").val(data.bcontent);
    		}
		});
    	
    	$("#updateModal #btnUpdate").click(function(event){
    		$.ajax({
    			url:"/mymatch/board/update",
    			data: {bno:bno, btitle:$("#updateModal #btitle").val(), bcontent:$("#updateModal #bcontent").val()},
    			method: "post",
    			success: function(data) {
    				if(data.result=="success") {
    					$("#updateModal").modal('hide');
    					$('.modal-backdrop').remove();
    					location.reload(true);
    				}
    			}
    		});
        	
        });
    });
    
    $("#btnSearch").click(function() {
    	var keyword = $("#keyword").val();
    	var url = location.href;
    	var index = url.indexOf("boardList");
    	if(index != -1) {
    		url = url.substring(0, index+9);
    	}
    	location.href = url + "?keyword="+keyword;
    });*/
});








