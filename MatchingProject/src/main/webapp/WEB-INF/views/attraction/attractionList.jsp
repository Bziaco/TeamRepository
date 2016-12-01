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
   href="${pageContext.servletContext.contextPath}/resources/css/attracList.css" />
<link rel="stylesheet"
   href="${pageContext.servletContext.contextPath}/resources/css/matchtourist.css" />
<script type="text/javascript"
   src="${pageContext.servletContext.contextPath}/resources/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript"
   src="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/js/bootstrap.min.js"></script>
<link rel="stylesheet"
   href="${pageContext.servletContext.contextPath}/resources/css/attraction.css" />
<script type="text/javascript"
   src="${pageContext.servletContext.contextPath}/resources/js/attraction.js"></script>
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
      location.href = "attractionList?pageNo=1&keyword=" + keyword;
   }
</script>

</head>

<body id="wrap" style="overflow: hidden;">
   <div class="container">
      <div class="mail-box">
         <aside class="lg-side">
            <div class="inbox-head">
               <h3>Photo Board</h3>
               <form class="pull-right position" name="formname" onsubmit="return false">
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
               <div class="container">
                  <!-- table -->
                  <table style="width: 1200px">
                     <tr>
                        <td><c:forEach var="attraction" items="${list}">

                              <div
                                 style="width:200px; height:170px; display:inline-block; margin:5px; background-image:url(${pageContext.servletContext.contextPath}/resources/img/${attraction.savedfile}); background-size: 200px 170px;">

                                 <div style="height: 140px;"></div>
                                 <div>
                                    <table
                                       style="width: 100%; height: 30px; background-color: black; opacity: 0.7;">
                                       <tr>
                                          <td style="text-align: left; color: white"><a
                                             class="btnDetailModal" href="#"
                                             data-ano="${attraction.ano}"> ${attraction.aname}</a></td>
                                       </tr>
                                    </table>
                                 </div>
                              </div>
                           </c:forEach></td>
                     </tr>
                  </table>
                  <ul class="pagination pull-right">
                     <li><c:if test="${groupNo==1}">
                           <span class="glyphicon glyphicon-chevron-left"
                              style="color: gray"></span>
                        </c:if> <c:if test="${groupNo>1}">
                           <a
                              href="attractionList?pageNo=${startPageNo-1}&keyword=${keyword}"><span
                              class="glyphicon glyphicon-chevron-left" style="color: green"></span></a>
                        </c:if></li>

                     <c:forEach var="i" begin="${startPageNo}" end="${endPageNo}">
                        <li <c:if test="${pageNo==i}">class="active"</c:if>><a
                           href="attractionList?pageNo=${i}&keyword=${keyword}">${i}</a></li>
                     </c:forEach>

                     <li><c:if test="${groupNo==totalGroupNo}">
                           <span class="glyphicon glyphicon-chevron-right"
                              style="color: gray"></span>
                        </c:if> <c:if test="${groupNo<totalGroupNo}">
                           <a
                              href="attractionList?pageNo=${endPageNo+1}&keyword=${keyword}"><span
                              class="glyphicon glyphicon-chevron-right" style="color: green"></span></a>
                        </c:if></li>
                  </ul>
               </div>
            </div>
         </aside>
      </div>
   </div>


   <!-- modal -->
   <div style="z-index: 5000" class="modal fade" id="attractionModal"
      tabindex="5" role="dialog" aria-labelledby="edite">
      <div>
         <div class="container">
            <div class="">
               <div
                  class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xs-offset-0 col-sm-offset-0 col-md-offset-1 col-lg-offset-1">
                  <div class="panel panel-primary" style="margin-top: 30px;">
                     <div class="panel-heading">
                        <h2 class="panel-title">Attraction Detail</h2>
                     </div>
                     <div class="panel-body">
                        <button type="button" class="close" data-dismiss="modal"
                           aria-hidden="true">
                           <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                        </button>
                        <!-- 사진 -->
                        <img  id="savedfile" style="width:360px; height:360px"></img>
                                 
                        <div class="row" style="display:inline; position: absolute; left: 400px;">
                           <div ></div>

                           <div >
                              <strong id="mname"></strong><br>
                              <table class="table table-user-information"
                                 style="height: 250px; font-size: 15px; font-weight: bolder;">
                                 <tbody>
                                    <tr>
                                       <td>No:</td>
                                       <td id="ano"></td>
                                    </tr>
                                    <tr>
                                       <td>Name:</td>
                                       <td id="aname"></td>
                                    </tr>
                                    <tr>
                                       <td>Info:</td>
                                       <td id="ainfo" style="height: 200px; overflow-y: scroll;"></td>
                                    </tr>
                                    <tr>
                                       <td>Location:</td>
                                       <td id="alocation"></td>
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