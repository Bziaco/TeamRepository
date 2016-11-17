$(document).ready(function(){  		
	
	//메뉴 클릭 변수
	var isClicked = false;
	
	// 마우스 오버시
	$("article").on("mouseover",function(){	
		var vid = $(this).find("video").get(0);
		setTimeout(function () {      
			// 동영상의 재생위치를 처음(0)으로 설정
			//vid.currentTime=0;
			// 동영상을 재생
			vid.play();	
		}, 550);
		// 변수 vid에 video파일 참조
		//var vid = $(this).find("video").get(0);
		// 동영상의 재생위치를 처음(0)으로 설정
		//vid.currentTime=0;
		// 동영상을 재생
		//vid.play();	
		
		$(this).stop().animate({"width":"39%"},500,function(){
			//article이 넓어진 바로 후에 아래 구문이 실행됩니다.
			$(this).find("h3").stop().animate({"right":"10px"},400);
			$(this).find("p").stop().animate({"right":"10px"},800);	
		});
		$(this).find("video").stop().animate({"opacity":"1", "width":"850px"},1200);		
	});
	
	// 마우스 아웃시
	$("article").on("mouseout",function(){	
		// 변수 vid에 video파일 참조
		var vid = $(this).find("video").get(0);
		// 동영상을 정지
		vid.pause();
		$(this).stop().animate({"width":"12%"},700);
		$(this).find("video").stop().animate({"opacity":"0"},2000);	
		$(this).find("h3").stop().animate({"right":"-310px"},200);
		$(this).find("p").stop().animate({"right":"-310px"},500);	
	});
	
	$('#main-sidebar').simpleSidebar({
		opener: '#toggle-sidebar',
		wrapper: '#main',
		animation: {
			easing: "easeOutQuint"
		},
		sidebar: {
			align: 'left',
			closingLinks: '.close-sb',
		},
		sbWrapper: {
			display: true
		}
	});

    $(".depth1").click(function() {
    	if(!isClicked){
    		$("#change_me1").slideDown("slow");
    		isClicked = true;
    	}else{
    		$("#change_me1").slideUp("slow");
    		isClicked = false;
     	}
    });
    
    $('#menu1').mouseover(function(){
    	$('#menu1').addClass('pointer');
    });
    /*----------------------------------------*/
    $(".depth2").click(function() {
    	if(!isClicked){
    		$("#change_me2").slideDown("slow");
    		isClicked = true;
    	}else{
    		$("#change_me2").slideUp("slow");
    		isClicked = false;
     	}
    });

    $('#menu2').mouseover(function(){
    	$('#menu2').addClass('pointer');
    });
    /*------------------------------------------*/
    $(".depth3").click(function() {
    	if(!isClicked){
    		$("#change_me3").slideDown("slow");
    		isClicked = true;
    	}else{
    		$("#change_me3").slideUp("slow");
    		isClicked = false;
     	}
    });
    
    $('#menu3').mouseover(function(){
    	$('#menu3').addClass('pointer');
    });
    
    $("#myBtn").click(function(){
        $("#myModal").modal();
    });
    
    $("#btn1").click(function(){
        $("#test2").html("${pageContext.servletContext.contextPath}/resist/guideResist");
    });
    
    /*login*/
    $("#loginModal #btnLogin").click(function() {
    	var userName = $("#loginModal #userName").val();
    	var userPassword = $("#loginModal #userPassword").val();
    	$("#main-navbar #btnLogout").show();
    	$("#main-navbar #btnLogin").hide();
    	$("#loginModal").modal('hide');
    });
    /*logout*/
    $("#main-navbar #btnLogout").click(function() {
    	$("#main-navbar #btnLogout").hide();
    	$("#main-navbar #btnLogin").show();
    });
    
    /*modify*/
    $("#passwordmodifyModal #inputPassword").click(function(){
    	$("#passwordmodifyModal").modal('hide');
    });
    
    /*popover*/
    $('[data-toggle="popover"]').popover();
    
    
    /*message*/
    $(document).on('click', '.panel-heading span.icon_minim', function (e) {
        var $this = $(this);
        if (!$this.hasClass('panel-collapsed')) {
            $this.parents('.panel').find('.panel-body').slideUp();
            $this.addClass('panel-collapsed');
            $this.removeClass('glyphicon-minus').addClass('glyphicon-plus');
        } else {
            $this.parents('.panel').find('.panel-body').slideDown();
            $this.removeClass('panel-collapsed');
            $this.removeClass('glyphicon-plus').addClass('glyphicon-minus');
        }
    });
    $(document).on('focus', '.panel-footer input.chat_input', function (e) {
        var $this = $(this);
        if ($('#minim_chat_window').hasClass('panel-collapsed')) {
            $this.parents('.panel').find('.panel-body').slideDown();
            $('#minim_chat_window').removeClass('panel-collapsed');
            $('#minim_chat_window').removeClass('glyphicon-plus').addClass('glyphicon-minus');
        }
    });
    $(document).on('click', '#new_chat', function (e) {
        var size = $( ".chat-window:last-child" ).css("margin-left");
         size_total = parseInt(size) + 400;
        alert(size_total);
        var clone = $( "#chat_window_1" ).clone().appendTo( ".container" );
        clone.css("margin-left", size_total);
    });
    $(document).on('click', '.icon_close', function (e) {
        //$(this).parent().parent().parent().parent().remove();
        $( "#chat_window_1" ).remove();
    });
    
    //모달창 드래그 이동
    $("#messageModal").draggable({
    	handle:"#chat_window_1"
    });
});


















