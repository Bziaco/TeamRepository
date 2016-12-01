$(function() {
	/*로그인*/
	$("#idFindModal #btnFindId").click(function() {
		var memail = $("#idFindModal #memail").val();
		
		
		/*console.log("mid: " + mid);
		console.log("mpassword: " + mpassword);*/
		
		
		$.ajax({
			url:"/mymatch/member/findMid",
			data: {memail:memail},
			method: "post",
			success: function(data) {
				if(data.result =! null) {
			    	$("#idFindModal").show();
			    	$("#main-navbar #btnLogin ").hide();
			    	$("#main-navbar #btnResist").hide();
			    	$("#idFindModal").modal('hide');
				} else if(data.result == null){
					alert("이메일이 틀렸습니다.");
				}
			}
		});
		
	});
});