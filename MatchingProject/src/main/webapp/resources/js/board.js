$(function() {
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
    
    $("[data-toggle=tooltip]").tooltip();
    
    
    $("#writeModal #btnwrite").click(function(){
    	var btitle = $("#writeModal #btitle").val();
    	var bcontent = $("#writeModal #bcontent").val();
    	
    	$.ajax({
			url:"/mymatch/board/write",
			data: {btitle:btitle, bcontent:bcontent},
			method: "post",
			success: function(data) {
				if(data.result=="success") {
					$("#writeModal").modal('hide');
					$('.modal-backdrop').remove();
				}
			}
		});
    });
});








