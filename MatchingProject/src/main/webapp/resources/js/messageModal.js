$(function() {
	/*MessageBox 띄우기*/
	var mto;
	$(document).on("click", "#btnMessageModal", function() {
		mto = $("#btnMessageModal").attr("data-mto");
		$.ajax({
			url: "/mymatch/message/messageList",
			data: {mto:mto},
			success: function(data) {
				$("#messageModal").modal("show");
				$("#messageModal .panel-body").html(data);
			}
		});
	});
	

	$("#btnMessageSend").click(function() {
		var mcontent = $("#txtMessageInput").val();
		$.ajax({
			url: "/mymatch/message/messageSend",
			data: {mto:mto, mcontent:mcontent},
			success: function(data) {
				$("#messageModal").modal("show");
				$("#messageModal .panel-body").html(data);
			}
		});

	});
});