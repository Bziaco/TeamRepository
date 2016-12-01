$(function() {
	/*로그인*/
	$("#passwordFindModal #btnFindPassword").click(function() {
		var mid = $("#loginModal #mid").val();
		var mpassword = $("#loginModal #mpassword").val();
		
		
		/*console.log("mid: " + mid);
		console.log("mpassword: " + mpassword);*/
		
		
		$.ajax({
			url:"/mymatch/member/login",
			data: {mid:mid, mpassword:mpassword},
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