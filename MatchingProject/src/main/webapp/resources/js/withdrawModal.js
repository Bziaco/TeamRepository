$(function() {
	/*탈퇴*/
	$("#withdrawModal #Okwithdraw").click(function(){

		$.ajax({
			url:"/mymatch/member/withdraw",
			success: function(data){
				console.log("withdraw");
			}
		});
	});
});