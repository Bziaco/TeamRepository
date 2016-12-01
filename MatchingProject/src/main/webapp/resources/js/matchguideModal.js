$(function() {
	$("#matchguideModal").on("show.bs.modal", function() {
		$.ajax({
			url:"/mymatch/matching/guideList",
			method: "post", 
			success: function(data){
				$("#matchguideModal #matchguidelist").html(data);
			}
		});
	});
});