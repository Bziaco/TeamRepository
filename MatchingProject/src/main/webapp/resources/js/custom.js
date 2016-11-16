$(document).ready(function(){  		
	
	//메뉴 클릭 변수
	var isClicked = false;
	
	// 마우스 오버시
	$("article").on("mouseover",function(){		
	
		// 변수 vid에 video파일 참조
		var vid = $(this).find("video").get(0);
		// 동영상의 재생위치를 처음(0)으로 설정
		vid.currentTime=0;
		// 동영상을 재생
		vid.play();	
		
		$(this).stop().animate({"width":"39%"},1000,function(){
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
    
});


















