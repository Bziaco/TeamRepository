﻿$(function() {
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
       var btitle = $("#writeModal #btitle").val();
       var bcontent = $("#writeModal #bcontent").val();
       
       $.ajax({
         url:"/mymatch/board/write",
         data: {btitle:btitle, bcontent:bcontent},
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
       var bno = $(this).attr("data-bno");
       $("#deleteModal #btnYes").click(function(event){
          $.ajax({
             url:"/mymatch/board/delete",
             data: {bno:bno},
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
       var bno = $(this).attr("data-bno");
       /*console.log("bno:"+ bno);*/
       
       $.ajax({
          url:"/mymatch/board/getBoard",
          data: {bno:bno},
          success: function(data) {
             $("#updateModal").modal("show");
             $("#updateModal #btitle").val(data.btitle);
             $("#updateModal #bcontent").val(data.bcontent);
          }
      });
       
       
       $("#updateModal #btnUpdate").click(function(event){
          $.ajax({
             url:"/mymatch/board/update",
             data: {bno:bno, btitle:$("#updateModal #btitle").val(), bcontent:$("#updateModal #bcontent").val()},
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
       location.href = "boardList?pageNo=1&keyword="+keyword;
    });
    
    
    $(".btnDetailModal").click(function() {
       var bno = $(this).attr("data-bno");
       
       $.ajax({
          url:"/mymatch/board/getBoard",
          data:{bno:bno},
          method:"post",
          success: function(data) {
             console.log(data);
             $("#detailModal #date").html(data.bdate);
             $("#detailModal #title").html(data.btitle);
             $("#detailModal #content").html(data.bcontent);
             $("#detailModal #writer").html(data.mid);
             $("#detailModal #hitcount").html(data.bhitcount);             
             $("#detailModal").modal("show");
          }
       });
    });
});







