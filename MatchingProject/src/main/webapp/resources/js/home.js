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
	
	/*로그인*/
	$("#loginModal #btnLogin").click(function() {
		var mid = $("#loginModal #mid").val();
		var mpassword = $("#loginModal #mpassword").val();
		
		
		/*console.log("mid: " + mid);
		console.log("mpassword: " + mpassword);*/
		
		
		$.ajax({
			url:"/mymatch/member/login",
			data: {mid:mid, mpassword:mpassword},
			method: "post",
			success: function(data) {
				if(data.result == "LOGIN_SUCCESS") {
			    	$("#main-navbar #btnLogout").show();
			    	$("#main-navbar #btnLogin ").hide();
			    	$("#main-navbar #btnResist").hide();
			    	$("#loginModal").modal('hide');
				} else if(data.result == "LOGIN_FAIL_MID"){
					alert("아이디를 찾을 수 없음");
				} else if(data.result == "LOGIN_FAIL_MPASSWORD"){
					alert("패스워드가 틀림");
				}
			}
		});
		
	});
	
	
	/*로그아웃*/
	$("#btnLogout").click(function() {
		$.ajax({
			url:"/mymatch/member/logout",
			success: function(data) {
			}
		});
		
	});
	
	
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
	
	/*유저정보*/
	$("#btninfo").click(function(){
		
		$.ajax({
			url:"/mymatch/member/info",
			method: "post", 
			cache: false,
			processData: false,
			contentType: false,
			success: function(data) {
				$("#infoModal #mname").html(data.member.mname);
				$("#infoModal #mnickname").html(data.member.mnickname);
				$("#infoModal #mage").html(data.member.mage);
				$("#infoModal #msex").html(data.member.msex);
				$("#infoModal #memail").html(data.member.memail);
				$("#infoModal #mlocal").html(data.member.mlocal);
				$("#infoModal #mtel").html(data.member.mtel);
				$("#infoModal #mphoto").attr('src', "member/getPhoto?savedfile=" + data.member.mphoto)
				$("#infoModal").modal("show");
			}
		});
	});
	
	/*탈퇴*/
	$("#withdrawModal #Okwithdraw").click(function(){

		$.ajax({
			url:"/mymatch/member/withdraw",
			success: function(data){
				console.log("withdraw");
			}
		});
	});
	
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
	
	/*매칭된 관광객*/
	$(".btnMatchingTourist").click(function(){
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
	$(".btnMatchingGuide").click(function(){
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
