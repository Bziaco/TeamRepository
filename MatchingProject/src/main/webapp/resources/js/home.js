$(function() {
	/*레지스트*/
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
	
	/*로그인*/
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
	
	
	/*로그아웃*/
	$("#btnLogout").click(function() {
		$.ajax({
			url:"/mymatch/member/logout",
			success: function(data) {
			}
		});
		
	});
	
	
	/*패스워드 확인*/
	$("#passwordmodifyModal #inputPassword").click(function(){
		var mpassword = $("#passwordmodifyModal #mpassword").val();
		
		$.ajax({
			url:"/mymatch/member/passwordmodify",
			data: {mpassword:mpassword},
			method: "post",
			success: function(data) {
				if(data.result == "success")  {
					$("#passwordmodifyModal").modal('hide');
					$("#modifyModal").modal('show');
					$("#modifyModal #mid").val(data.member.mid);
					$("#modifyModal #mname").val(data.member.mname);
					$("#modifyModal #mnickname").val(data.member.mnickname);
					$("#modifyModal #mage").val(data.member.mage);
					$("#modifyModal #msex").val(data.member.msex);
					$("#modifyModal #memail").val(data.member.memail);
					$("#modifyModal #mlocal").val(data.member.mlocal);
					$("#modifyModal #mtel").val(data.member.mtel);
				} else {
					alert("패스워드가 틀림");
				}
			}
		});
	});
	
	
	/*수정*/
	$("#modifyModal #btnModify").click(function(){
		var mpassword = $("#modifyModal #mid").val();
		var mpassword = $("#modifyModal #mpassword").val();
		var mnickname = $("#modifyModal #mnickname").val();
		var mname = $("#modifyModal #mname").val();
		var mage = $("#modifyModal #mage").val();
		var msex = $("#modifyModal #msex").val();
		var memail = $("#modifyModal #memail").val();
		var mlocal = $("#modifyModal #mlocal").val();
		var mtel = $("#modifyModal #mtel").val();
		
		var data = new FormData();
		data.append("mpassword", mpassword);
		data.append("mnickname", mnickname);
		data.append("mname", mname);
		data.append("mage", mage);
		data.append("msex", msex);
		data.append("memail", memail);
		data.append("mlocal", mlocal);
		data.append("mtel", mtel);
		if($("#modifyModal #mphoto")[0].files.length != 0) {
			var mphoto = $("#modifyModal #mphoto")[0].files[0];
			data.append("mphoto", mphoto);	
		}
		
		$.ajax({
			url:"/mymatch/member/modify",
			data: data,
			method: "post",
			cache: false,
			processData: false,
			contentType: false,
			success: function(data) {
				if(data.result == "success") {
					$("#modifyModal").modal('hide');
					console.log("mpassword: " + mpassword);
					console.log("mnickname: " + mnickname);
					console.log("mname: " + mname);
					console.log("mage: " + mage);
					console.log("msex: " + msex);
					console.log("memail: " + memail);
					console.log("mlocal: " + mlocal);
					console.log("mtel: " + mtel);
					console.log("mphoto: " + mphoto);
				} else {
					alert("수정에 실패했습니다.");
				}
			}
		});
	});
});








