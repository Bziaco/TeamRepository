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
});