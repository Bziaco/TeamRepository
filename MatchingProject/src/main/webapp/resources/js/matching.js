$(function() {	
	
/*-------Search---------*/
    
    $("#btnSearch").click(function() {
    	var keyword = $("#keyword").val();
    	location.href = "matchList?pageNo=1&keyword="+keyword;
    });
    
    
    $("#mytable .btnDetailModal").click(function() {
    	var gid = $(this).attr("data-gid");
    	 console.log("aaa");
    	 
    	$.ajax({
    		url:"/mymatch/matching/getMatching",
    		data:{gid:gid},
    		method:"post",
    		success: function(data) {
    			console.log("bbb");
    			$("#detailModal #matchno").html(data.matching.matchno);
    			$("#detailModal #gid").html(data.matching.gid);
    			$("#detailModal #mphoto").attr('src', "/mymatch/matching/getPhoto?savedfile="+ data.matching.savedfile);
    			$("#detailModal #score").html(data.matching.score);
    			$("#detailModal #matchdate").html(data.matching.matchdate);
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


















