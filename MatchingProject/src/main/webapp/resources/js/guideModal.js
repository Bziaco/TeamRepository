$(function() {
	/*가이드 등록*/
	$("#guideModal #btnguideresist").click(function(){
		var guideLocal = $("#guideModal #guideLocal").val();
		var guideIntroduce = $("#guideModal #guideIntro").val();
		
		console.log("guideLocal: " + guideLocal);
		console.log("guideIntro: " + guideIntroduce);
		
		$.ajax({
			url:"/mymatch/guide/guideResist",
			data: {glocal:guideLocal, gintro:guideIntroduce},
			method:"post",
			success: function(data) {
				if(data.result == "success") {
					$("#guideModal").modal("hide");
				} else {
					alert("가이드 등록 실패");
				}
			}
		});
	});
});