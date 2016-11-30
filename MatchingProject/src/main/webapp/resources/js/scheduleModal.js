$(function() {
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
    
    $('body', $('#iframe')[0].contentWindow.document).on("click", ".btnScheduleDelete", function() {
    //$("#scheduleModal #iframe").contents().find(".btnScheduleDelete").on("click", function(){
    	console.log("btnScheduleDelete");
       /*var sno = $(this).attr("data-sno");
       $("#deleteModal #btnYes").click(function(event){
          $.ajax({
             url:"/mymatch/schedule/delete",
             data: {sno:sno},
             method: "post",
             success: function(data) {
                if(data.result=="success") {
                   $("#deleteModal").modal('hide');
                   $('.modal-backdrop').remove();
                   location.reload(true);
                }
             }
          });
           
        });
       $("#deleteModal").modal("show");*/
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
             console.log(data);
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
	console.log("onClickBtnScheduleDelete");
}




