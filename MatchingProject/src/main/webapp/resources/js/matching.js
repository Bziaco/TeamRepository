$(document).ready(function(){  		
	
/*-------Search---------*/
    
    $("#btnSearch").click(function() {
    	var keyword = $("#keyword").val();
    	location.href = "matchingList?keyword="+keyword;
    });
    
    
    $(".btnDetailModal").click(function() {
    	var gid = $(this).attr("data-gid");
    	
    	$.ajax({
    		url:"/mymatch/matching/getMatching",
    		data:{gid:gid},
    		method:"post",
    		success: function(data) {
    			console.log(data);
    			$("#detailModal #matchno").html(matching.matchno);
    			$("#detailModal #gid").html(matching.gid);
    			$("#detailModal #score").html(matching.score);
    			$("#detailModal #matchdate").html(matching.matchdate);
    			$("#detailModal #mphoto").attr('src', "matching/getPhoto?savedfile=" + data.matching.mphoto);
    			$("#detailModal").modal("show");
    		}
    	});
    });
	
	
	
	
	
	
	
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


















