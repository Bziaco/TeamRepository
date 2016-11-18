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
    	var bwrite = $("#writeModal #bwrite").val();
    	var btitle = $("#writeModal #btitle").val();
    	var bcontent = $("#writeModal #bcontent").val();
    	
    	
    	/*console.log("bwrite : " + bwrite);
    	console.log("btitle : " + btitle);
    	console.log("bcontent : " + bcontent);*/
    	
    	
    	$.ajax({
			url:"/mymatch/member/login",
			data: {bwrite:bwrite, btitle:btitle, bcontent:bcontent},
			method: "post",
			success: function(data) {
				if(data.result == "LOGIN_SUCCESS") {
			    	$("#main-navbar #btnLogout").show();
			    	$("#main-navbar #btnLogin ").hide();
			    	$("#main-navbar #btnResist").hide();
			    	$("#loginModal").modal('hide');
				} else if(data.result == "LOGIN_FAIL_MID"){
					alert("아이디를 찾을 수 없음");
				} else if(data.result == "LOGIN_FAIL_MPASSWORD"){
					alert("패스워드가 틀림");
				}
			}
		});
    	
    	
    });
});








