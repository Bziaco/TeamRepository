$(function() {
	$("#resistModal #btnResist").click(function() {
		var mid = $("#resistModal #mid").val();
		var mpassword = $("#resistModal #mpassword").val();
		var mnickname = $("#resistModal #mnickname").val();
		var mname = $("#resistModal #mname").val();
		var mage = $("#resistModal #mage").val();
		var msex = $("#resistModal #msex").val();
		var memail = $("#resistModal #memail").val();
		var mlocal = $("#resistModal #mlocal").val();
		var mtel = $("#resistModal #mtel").val();
		var mphoto = $("#resistModal #mphoto")[0].files[0];
		
		
		/*console.log("mid: " + mid);
		console.log("mpassword: " + mpassword);
		console.log("mnickname: " + mnickname);
		console.log("mname: " + mname);
		console.log("mage: " + mage);
		console.log("msex: " + msex);
		console.log("memail: " + memail);
		console.log("mlocal: " + mlocal);
		console.log("mtel: " + mtel);
		console.log("mphoto: " + mphoto);*/
		
		var data = new FormData();
		data.append("mid", mid);
		data.append("mpassword", mpassword);
		data.append("mnickname", mnickname);
		data.append("mname", mname);
		data.append("mage", mage);
		data.append("msex", msex);
		data.append("memail", memail);
		data.append("mlocal", mlocal);
		data.append("mtel", mtel);
		data.append("mphoto", mphoto);	
		
		$.ajax({
			url:"/mymatch/member/join",
			data: data,
			method: "post",
			cache: false,
			processData: false,
			contentType: false,
			success: function(data) {
				if(data.result == "success") {
					$("#resistModal").modal("hide");
				} else {
					alert("회원가입 실패");
				}
			}
		});
	});
	
	
	$("#loginModal #btnLogin").click(function() {
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








