$(function() {
	
	/*관광객 등록*/
	$("#touristModal #btnTouristResist").click(function(){
		var touristLocal = $("#touristModal #touristLocal").val();
		var touristIntro = $("#touristModal #touristIntro").val();
		var toDate = $("#touristModal #toDate").val();
		var fromDate = $("#touristModal #fromDate").val();
		
		console.log("touristLocal: " + touristLocal);
		console.log("touristIntro: " + touristIntro);
		console.log("toDate: " + toDate);
		console.log("fromDate: " + fromDate);
		console.log(typeof(toDate));
		
		$.ajax({
			url:"/mymatch/tourist/touristResist",
			data: {"tlocal":touristLocal, "tintro":touristIntro, "tstartdate":toDate, "tenddate":fromDate},
			method: "post",
			success: function(data){
				if(data.result == "success") {
					$("#touristModal").modal("hide");
				} else {
					alert("관광객 등록 실패");
				}
			}
		});
	});
	
	
	
	
	
});