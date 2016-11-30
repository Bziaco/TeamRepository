$(function() {
	$("#matchtouristModal").on("show.bs.modal", function() {
		$.ajax({
			url:"/mymatch/matching/tourList",
			method: "post", 
			success: function(data){
				$("#matchtouristModal #matchtourlist").html(data);
			}
		});
	});
});