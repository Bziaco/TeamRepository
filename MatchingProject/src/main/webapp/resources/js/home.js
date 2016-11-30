$(function() {
	$("#btnLogin").click(function() {
		$("#loginModal").modal("show");
	});
	
	$("#btnResist").click(function() {
		$("#resistModal").modal("show");
	});	
	
	/*로그아웃*/
	$("#btnLogout").click(function() {
		$.ajax({
			url:"/mymatch/member/logout",
			success: function(data) {
			}
		});
		
	});
	
	/*유저정보 성공*/
	$("#btninfo").click(function(){
		
		$.ajax({
			url:"/mymatch/member/info",
			method: "post", 
			cache: false,
			processData: false,
			contentType: false,
			success: function(data) {
				if(data.result == "success") {
					$("#infoModal #mname").html(data.member.mname);
					$("#infoModal #mnickname").html(data.member.mnickname);
					$("#infoModal #mage").html(data.member.mage);
					$("#infoModal #msex").html(data.member.msex);
					$("#infoModal #memail").html(data.member.memail);
					$("#infoModal #mlocal").html(data.member.mlocal);
					$("#infoModal #mtel").html(data.member.mtel);
					$("#infoModal #mphoto").attr('src', "member/getPhoto?savedfile=" + data.member.mphoto);
					$("#infoModal").modal("show");
				} else {
					alert("로그인하세요.");
				}
			}
		});
	});
	
	$("#btnSchedule").click(function(){
		$("#scheduleModal").modal("show");
	});
	
	/*매칭된 관광객*/
	$("#btnMatchingTourist").click(function(){
		$.ajax({
			url:"/mymatch/matching/tourList",
			method: "post", 
			success: function(data){
				$("#matchtouristModal #matchtourlist").html(data);
				$("#matchtouristModal").modal("show");
			}
		});
	});
	
	/*매칭된 가이드*/
	$("#btnMatchingGuide").click(function(){
		$.ajax({
			url:"/mymatch/matching/guideList",
			method: "post",
			success: function(data){
				$("#matchguideModal #matchguidelist").html(data);
				$("#matchguideModal").modal("show");
				console.log(data);
			}
		})
	});
});
