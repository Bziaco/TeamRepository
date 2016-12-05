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
	   src="${pageContext.servletContext.contextPath}/resources/js/custom.js"></script>
	<script type="text/javascript"
	   src="${pageContext.servletContext.contextPath}/resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript"
	   src="${pageContext.servletContext.contextPath}/resources/js/jquery.simple-sidebar.min.js"></script>
</head>

<body id="wrap" style="height:0px;">
   <div class="container" style="width:100%;padding:0px;height:100%;">
      <div class="mail-box" style="position: static;">
         <aside class="lg-side" style="border-radius: 0px;">
            <div class="inbox-body">
               <div class="container">
                  <div class="row">
                     <div class="col-md-12">
                        <h3>Two Plus+</h3>
                        <div class="table-responsive">
                           <table id="mytable" class="table table-bordred table-striped" style="height:100%">
                              <thead>
                                 <th>번호</th>
                                 <th>제목</th>
                                 <th>글쓴이</th>
                                 <th>쓴날짜</th>
                                 <th>시작일</th>
                                 <th>종료일</th>
                                 <th>가이드 신청</th> 
                                 <th>Delete</th>
                              </thead>
                              <tbody>
                                 <c:forEach var="schedule" items="${list}">
                                    <tr>
                                       <td>${schedule.sno}</td>
                                       <td><a href="javascript:parent.onClickBtnScheduleDetail(${schedule.sno})" data-sno="${schedule.sno}">${schedule.stitle}</a></td>
                                       <td>${schedule.mid}</td>
                                       <td>${schedule.sdate}</td>
                                       <td>${schedule.sstart}</td>
                                       <td>${schedule.send}</td>
                                       <td>
                                       		 <c:if test="${schedule.guideRequest}">
	                                             <button class="btn btn-info btn-xs"  onclick="parent.onClickBtnCancelGuideSchedule(${schedule.sno})">
	                                                가이드 취소
	                                             </button>  
                                       		 </c:if>
                                       		 <c:if test="${!schedule.guideRequest}">
	                                             <button class="btn btn-warning btn-xs"  onclick="parent.onClickBtnAddGuideSchedule(${schedule.sno})">
	                                                가이드 신청
	                                             </button>                                       		 
                                       		 </c:if>
                                       </td>
                                       <td>
                                             <button class="btn btn-danger btn-xs" onclick="parent.onClickBtnScheduleDelete(${schedule.sno})">
                                                <span class="glyphicon glyphicon-trash"></span>
                                             </button>
                                      </td>
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
                                       href="scheduleList?pageNo=${startPageNo-1}&keyword=${keyword}"><span
                                       class="glyphicon glyphicon-chevron-left"
                                       style="color: green"></span></a>
                                 </c:if></li>

                              <c:forEach var="i" begin="${startPageNo}" end="${endPageNo}">
                                 <li <c:if test="${pageNo==i}">class="active"</c:if>><a
                                    href="scheduleList?pageNo=${i}&keyword=${keyword}">${i}</a></li>
                              </c:forEach>

                              <li><c:if test="${groupNo==totalGroupNo}">
                                    <span class="glyphicon glyphicon-chevron-right"
                                       style="color: gray"></span>
                                 </c:if> <c:if test="${groupNo<totalGroupNo}">
                                    <a href="scheduleList?pageNo=${endPageNo+1}&keyword=${keyword}"><span
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

</body>
</html>

