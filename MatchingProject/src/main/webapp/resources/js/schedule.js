$(function() {
   $("#mytable #checkall").click(function () {
        if ($("#mytable #checkall").is(':checked')) {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", true);
            });

        } else {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", false);
            });
        }
    });
    
    $("[data-toggle=tooltip]").tooltip();
    
    
    /*-------모달창---------*/
    
    $("#writeModal #btnwrite").click(function(){
       var stitle = $("#writeModal #btitle").val();
       var scontent = $("#writeModal #bcontent").val();
       
       $.ajax({
         url:"/mymatch/schedule/write",
         data: {stitle:stitle, scontent:scontent},
         method: "post",
         success: function(data) {
            if(data.result=="success") {
               $("#writeModal").modal('hide');
               $('.modal-backdrop').remove();
               location.reload(true);
            }
         }
      });
    });
    
    $(".table-responsive #btnDelete").click(function(event){
       var sno = $(this).attr("data-sno");
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
       $("#deleteModal").modal("show");
    });    
    
    
    $(".table-responsive #btnUpdate").click(function(event){
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
    
    
    /*-------Search---------*/
    
    $("#btnSearch").click(function() {
       var keyword = $("#keyword").val();
       location.href = "scheduleList?pageNo=1&keyword="+keyword;
    });
    
    
    $(".btnDetailModal").click(function() {
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







