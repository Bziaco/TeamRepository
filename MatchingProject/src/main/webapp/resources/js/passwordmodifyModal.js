$(function() {
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
});