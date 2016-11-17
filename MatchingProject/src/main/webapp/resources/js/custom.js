$(function () {
	$('[data-toggle="calendar"] > .row > .calendar-day > .events > .event').popover({
		container: 'body',
		content: 'Hello World',
		html: true,
		placement: 'bottom',
		template: '<div class="popover calendar-event-popover" role="tooltip"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>'
	});

	$('[data-toggle="calendar"] > .row > .calendar-day > .events > .event').on('show.bs.popover', function () {
		var attending = parseInt($(this).find('div.progress>.progress-bar').attr('aria-valuenow')),
			total = parseInt($(this).find('div.progress>.progress-bar').attr('aria-valuemax')),
			remaining = total - attending,
			displayAttending = attending - $(this).find('div.attending').children().length,
			html = [
				'<button type="button" class="close"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>',
				'<h4>'+$(this).find('h4').text()+'</h4>',
				'<div class="desc">'+$(this).find('div.desc').html()+'</div>',
				'<div class="location">'+$(this).find('div.location').html()+'</div>',
				'<div class="datetime">'+$(this).find('div.datetime').html()+'</div>',
				'<div class="space">Attending <span class="pull-right">Available spots</span></div>',
				'<div class="attending">',
					$(this).find('div.attending').html(),
					'<span class="attending-overflow">+'+displayAttending+'</span>', 
					'<span class="pull-right">'+remaining+'</span>',
				'</div>',
				'<a href="#signup" class="btn btn-success" role="button">Sign up</a>'
			].join('\n');

		$(this).attr('title', $(this).find('h4').text());
		$(this).attr('data-content', html);
	});

	$('[data-toggle="calendar"] > .row > .calendar-day > .events > .event').on('shown.bs.popover', function () {
		var $popup = $(this);
		$('.popover:last-child').find('.close').on('click', function(event) {
			$popup.popover('hide');
		});
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
    
    
    /*날짜*/
    $('#fromDate').datetimepicker({
    	  language : 'ko', /*화면에 출력될 언어를 한국어로 설정한다.*/
    	  pickTime : false, /*사용자로부터 시간 선택을 허용하려면 true를 설정하거나 pickTime 옵션을 생략한다.*/
    	  defalutDate : new Date() /*기본값으로 오늘 날짜를 입력한다. 기본값을 해제하려면 defaultDate 옵션을 생략한다.*/
    	});

    	$('#toDate').datetimepicker({
    	  language : 'ko',
    	  pickTime : false,
    	  defalutDate : new Date()
    	});
    
    /*popover*/
    $('[data-toggle="popover"]').popover();

    /*chat*/
    
});
