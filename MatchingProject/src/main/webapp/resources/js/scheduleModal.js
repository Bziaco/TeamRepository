$(function() {
	$("#scheduleModal").on("show.bs.modal", function() {
		$("#scheduleModal #iframe").attr("src", "schedule/scheduleList");
		
	});
	
	$("#scheduleModal #btnWrite").click(function(){
		$("#scheduleWriteModal").modal("show");
	});
	
    $("#scheduleWriteModal #btnWrite").click(function(){
       var stitle = $("#scheduleWriteModal #stitle").val();
       var scontent = $("#scheduleWriteModal #scontent").val();
       var sstart = $("#scheduleWriteModal #sstart").val();
       var send = $("#scheduleWriteModal #send").val();
       
       $.ajax({
         url:"/mymatch/schedule/write",
         data: {stitle:stitle, scontent:scontent, sstart:sstart, send:send},
         method: "post",
         success: function(data) {
            if(data.result=="success") {
               $("#scheduleWriteModal").modal('hide');
               $("#scheduleModal #iframe")[0].contentWindow.location.reload(true);
            }
         }
      });
    });   
    
    $("#scheduleWriteModal #btnUpdate").click(function(event){
       var sno = $(this).attr("data-sno");
       
       $.ajax({
          url:"/mymatch/schedule/getSchedule",
          data: {sno:sno},
          success: function(data) {
             $("#updateModal").modal("show");
             $("#updateModal #btitle").val(data.stitle);
             $("#updateModal #bcontent").val(data.scontent);
          }
      });
       
       
       $("#updateModal #btnUpdate").click(function(event){
          $.ajax({
             url:"/mymatch/board/update",
             data: {sno:sno, stitle:$("#updateModal #btitle").val(), scontent:$("#updateModal #bcontent").val()},
             method: "post",
             success: function(data) {
                if(data.result=="success") {
                   $("#updateModal").modal('hide');
                   $('.modal-backdrop').remove();
                   location.reload(true);
                }
             }
          });
           
        });
    });
    
    
    $("#scheduleWriteModal #btnDetail").click(function() {
       var sno = $(this).attr("data-sno");
       
       $.ajax({
          url:"/mymatch/schedule/getSchedule",
          data:{sno:sno},
          method:"post",
          success: function(data) {
             $("#detailModal #date").html(data.sdate);
             $("#detailModal #title").html(data.stitle);
             $("#detailModal #content").html(data.scontent);
             $("#detailModal #writer").html(data.mid);           
             $("#detailModal").modal("show");
          }
       });
    });
});


function onClickBtnScheduleDelete(sno) {
	$.ajax({
        url:"/mymatch/schedule/delete",
        data:{sno:sno},
        method:"post",
        success: function(data) {
        	$("#scheduleModal #iframe")[0].contentWindow.location.reload(true);
        }
     });
}

function onClickBtnScheduleDetail(sno) {
	$("#scheduleDetailModal").modal("show");
	$.ajax({
        url:"/mymatch/schedule/getSchedule",
        data:{sno:sno},
        method:"post",
        success: function(data) {
        	$("#scheduleDetailModal #mid").val(data.mid);
        	$("#scheduleDetailModal #stitle").val(data.stitle);
        	$("#scheduleDetailModal #scontent").text(data.scontent);
        	$("#scheduleDetailModal #sstart").val(data.sstart);
        	$("#scheduleDetailModal #send").val(data.send);
        }
	});
}

function onClickBtnAddGuideSchedule(sno) {
	$.ajax({
        url:"/mymatch/schedule/addGuideSchedule",
        data:{sno:sno},
        method:"post",
        success: function(data) {
        	$("#scheduleModal #iframe")[0].contentWindow.location.reload(true);
        }
	});
}

function onClickBtnCancelGuideSchedule(sno) {
	$.ajax({
        url:"/mymatch/schedule/cancelGuideSchedule",
        data:{sno:sno},
        method:"post",
        success: function(data) {
        	$("#scheduleModal #iframe")[0].contentWindow.location.reload(true);
        }
	});
}






