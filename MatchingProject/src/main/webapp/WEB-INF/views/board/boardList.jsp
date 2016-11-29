<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet"
   href="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/css/bootstrap.min.css">
<link rel="stylesheet"
   href="${pageContext.servletContext.contextPath}/resources/css/style.css" />
<link rel="stylesheet"
   href="${pageContext.servletContext.contextPath}/resources/css/login.css" />
<link rel="stylesheet"
   href="${pageContext.servletContext.contextPath}/resources/css/message.css" />
<link rel="stylesheet"
   href="${pageContext.servletContext.contextPath}/resources/css/matchtourist.css" />
<script type="text/javascript"
   src="${pageContext.servletContext.contextPath}/resources/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript"
   src="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/js/bootstrap.min.js"></script>
<link rel="stylesheet"
   href="${pageContext.servletContext.contextPath}/resources/css/board.css" />
<script type="text/javascript"
   src="${pageContext.servletContext.contextPath}/resources/js/board.js"></script>
<script type="text/javascript"
   src="${pageContext.servletContext.contextPath}/resources/js/custom.js"></script>
<script type="text/javascript"
   src="${pageContext.servletContext.contextPath}/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript"
   src="${pageContext.servletContext.contextPath}/resources/js/jquery.simple-sidebar.min.js"></script>
<script type="text/javascript"
   src="${pageContext.servletContext.contextPath}/resources/js/home.js"></script>


<script type="text/javascript">
   document.onkeydown = trapRefresh;
   function trapRefresh() {
      if (event.keyCode == 116) {
         event.keyCode = 0; 
         event.cancelBubble = true; 
         event.returnValue = false;
         document.location.reload();
      }
   }
   
   function searchEnter() {
      var keyword = $("#keyword").val();
       location.href = "boardList?pageNo=1&keyword="+keyword;
   }
</script>

</head>

<body id="wrap" style="overflow: hidden;">

   <div class="container">
      <div class="mail-box">
         <aside class="lg-side">
            <div class="inbox-head">
               <h3>Free Board</h3>
               <form class="pull-right position" onsubmit="return false">
                  <div class="input-append">
                     <input id="keyword" type="text" class="sr-input" onkeydown="if(event.keyCode==13){javascript:searchEnter();}"
                        placeholder="Search">
                     <button id="btnSearch" class="btn sr-btn" type="button">
                        <i class="fa fa-search"></i>
                     </button>
                  </div>
               </form>
            </div>

            <div class="inbox-body">
               <div class="btn-toolbar">
                  <button class="btn btn-primary" id="btnWrite" type="button"
                     data-toggle="modal" data-target="#writeModal">Write</button>
               </div>

               <div class="container">
                  <div class="row">
                     <div class="col-md-12">
                        <h3>Two Plus+</h3>
                        <div class="table-responsive">
                           <table id="mytable" class="table table-bordred table-striped">
                              <thead>
                                 <th>No</th>
                                 <th>Title</th>
                                 <th>Content</th>
                                 <th>Writer</th>
                                 <th>Count</th>
                                 <th>Date</th>
                                 <th>Update</th>
                                 <th>Delete</th>
                              </thead>
                              <tbody>
                                 <c:forEach var="board" items="${list}">
                                    <tr>
                                       <td>${board.bno}</td>
                                       <td><a class="btnDetailModal" href="#"
                                          data-bno="${board.bno}">${board.btitle}</a></td>
                                       <td>${board.bcontent}</td>
                                       <td>${board.mid}</td>
                                       <td>${board.bhitcount}</td>
                                       <td>${board.bdate}</td>
                                       <td><p data-placement="top" data-toggle="tooltip"
                                             title="Edit">
                                             <button id="btnUpdate" class="btn btn-primary btn-xs"
                                                data-bno="${board.bno}">
                                                <span class="glyphicon glyphicon-pencil"></span>
                                             </button>
                                          </p></td>
                                       <td><p data-placement="top" data-toggle="tooltip"
                                             title="Delete">
                                             <button class="btn btn-danger btn-xs" id="btnDelete"
                                                data-bno="${board.bno}">
                                                <span class="glyphicon glyphicon-trash"></span>
                                             </button>
                                          </p></td>
                                    </tr>
                                 </c:forEach>
                              </tbody>
                           </table>

                           <div class="clearfix"></div>
                           <ul class="pagination pull-right">
                              <li><c:if test="${groupNo==1}">
                                    <span class="glyphicon glyphicon-chevron-left"
                                       style="color: gray"></span>
                                 </c:if> <c:if test="${groupNo>1}">
                                    <a
                                       href="boardList?pageNo=${startPageNo-1}&keyword=${keyword}"><span
                                       class="glyphicon glyphicon-chevron-left"
                                       style="color: green"></span></a>
                                 </c:if></li>

                              <c:forEach var="i" begin="${startPageNo}" end="${endPageNo}">
                                 <li <c:if test="${pageNo==i}">class="active"</c:if>><a
                                    href="boardList?pageNo=${i}&keyword=${keyword}">${i}</a></li>
                              </c:forEach>

                              <li><c:if test="${groupNo==totalGroupNo}">
                                    <span class="glyphicon glyphicon-chevron-right"
                                       style="color: gray"></span>
                                 </c:if> <c:if test="${groupNo<totalGroupNo}">
                                    <a href="boardList?pageNo=${endPageNo+1}&keyword=${keyword}"><span
                                       class="glyphicon glyphicon-chevron-right"
                                       style="color: green"></span></a>
                                 </c:if></li>
                           </ul>
                        </div>

                     </div>
                  </div>
               </div>
            </div>
         </aside>
      </div>
   </div>

   <!-- 글쓰기 모달 -->
   <div style="z-index: 5000" class="modal fade" id="writeModal"
      role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal"
                  aria-hidden="true">
                  <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
               </button>
               <h4 class="modal-title custom_align" id="Heading">Do you went
                  to write?</h4>
            </div>
            <div class="modal-body">
               <div class="form-group">
                  <input class="form-control " type="text" placeholder="Title"
                     id="btitle">
               </div>
               <div class="form-group">
                  <textarea rows="2" class="form-control" placeholder="Content"
                     id="bcontent"></textarea>
               </div>
            </div>
            <div class="modal-footer ">
               <a class="btn btn-warning btn-lg" id="btnwrite" href="#"> <span
                  class="glyphicon glyphicon-ok-sign"></span> Submit
               </a>
            </div>
         </div>
      </div>
   </div>


   <!-- 수정 모달 -->
   <div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
      aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal"
                  aria-hidden="true">
                  <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
               </button>
               <h4 class="modal-title custom_align" id="Heading">Edit Your
                  Detail</h4>
            </div>
            <div class="modal-body">
               <div class="form-group">
                  <input id="btitle" class="form-control " type="text"
                     placeholder="Title">
               </div>
               <div class="form-group">
                  <textarea id="bcontent" rows="2" class="form-control"
                     placeholder="Content"></textarea>
               </div>
            </div>
            <div class="modal-footer ">
               <button id="btnUpdate" type="button" class="btn btn-warning btn-lg">
                  <span class="glyphicon glyphicon-ok-sign"></span> Update
               </button>
            </div>
         </div>
         <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
   </div>





   <!-- 딜리트 모달 -->
   <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
      aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal"
                  aria-hidden="true">
                  <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
               </button>
               <h4 class="modal-title custom_align" id="Heading">Delete this
                  entry</h4>
            </div>
            <div class="modal-body">

               <div class="alert alert-danger">
                  <span class="glyphicon glyphicon-warning-sign"></span> Are you
                  sure you want to delete this Record?
               </div>

            </div>
            <div class="modal-footer ">
               <button id="btnYes" type="button" class="btn btn-success">
                  <span class="glyphicon glyphicon-ok-sign"></span> Yes
               </button>
               <button id="btnNo" type="button" class="btn btn-default"
                  data-dismiss="modal">
                  <span class="glyphicon glyphicon-remove"></span> No
               </button>
            </div>
         </div>
         <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
   </div>




   <!-- Detail page -->
   <div style="z-index: 5000" class="modal fade" id="detailModal"
      tabindex="5" role="dialog" aria-labelledby="edite">
      <div>
         <div class="container">
            <div class="">
               <div
                  class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xs-offset-0 col-sm-offset-0 col-md-offset-1 col-lg-offset-1">
                  <div class="panel panel-primary">
                     <div class="panel-heading">
                        <h2 class="panel-title">Board Detail</h2>
                     </div>
                     <div class="panel-body">
                        <button type="button" class="close" data-dismiss="modal"
                              aria-hidden="true">
                              <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                           </button>
                        <div class="row">
                           <div class="col-md-3 col-lg-3 hidden-xs hidden-sm">
                              <img class="img-thumbnail" id="mphoto"
                                 src="${pageContext.servletContext.contextPath}/resources/img/info.jpg"
                                 width="200px" height="300px"></img>
                           </div>

                           <div class="col-md-9 col-lg-9 hidden-xs hidden-sm">
                              <strong id="mname"></strong><br>
                              <table class="table table-user-information" style="height:250px;">
                                 <tbody>
                                    <tr>
                                       <td>Date:</td>
                                       <td id="date"></td>
                                    </tr>
                                    <tr>
                                       <td>Title:</td>
                                       <td id="title"></td>
                                    </tr>
                                    <tr>
                                       <td>Content:</td>
                                       <td id="content"></td>
                                    </tr>
                                    <tr>
                                       <td>Writer:</td>
                                       <td id="writer"></td>
                                    </tr>
                                    <tr>
                                       <td>Hitcount:</td>
                                       <td id="hitcount"></td>
                                    </tr>
                                 </tbody>
                              </table>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>

</body>
</html>

