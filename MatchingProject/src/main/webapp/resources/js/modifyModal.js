$(function() {
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