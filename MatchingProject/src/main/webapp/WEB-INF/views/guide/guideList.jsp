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
   href="${pageContext.servletContext.contextPath}/resources/css/guide.css" />
<script type="text/javascript"
   src="${pageContext.servletContext.contextPath}/resources/js/board.js"></script>
<script type="text/javascript"
   src="${pageContext.servletContext.contextPath}/resources/js/custom.js"></script>
<script type="text/javascript"
   src="${pageContext.servletContext.contextPath}/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript"
   src="${pageContext.servletContext.contextPath}/resources/js/jquery.simple-sidebar.min.js"></script>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/guide.js"></script>


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
               <h3>가이드 찾기</h3>
            </div>
            <div class="inbox-body">
               <div class="container">
                  <div class="row">
                     <div class="col-md-12">
                        <table id="guideList">
                        	<tr>
                        		<td style="vertical-align: top;">
									<div id="collapseOne" class="panel-collapse collapse in" style="width:300px; display: inline-block;">
										<ul class="list-group" role="tablist">
											<li class="list-group-item"><span
												class="glyphicon glyphicon-pencil text-primary"></span> <a
												href="#" class="btnLocation" data-location="Seoul">서울</a></li>
								
											<li class="list-group-item"><span
												class="glyphicon glyphicon-pencil text-primary"></span> <a
												href="#" class="btnLocation" data-location="Busan">부산</a></li>
								
											<li class="list-group-item"><span
												class="glyphicon glyphicon-pencil text-primary"></span> <a
												href="#" class="btnLocation" data-location="Daejun">대전</a></li>
								
											<li class="list-group-item"><span
												class="glyphicon glyphicon-pencil text-primary"></span> <a
												href="#" class="btnLocation" data-location="Ulsan">울산</a></li>
											<li class="list-group-item"><span
												class="glyphicon glyphicon-pencil text-primary"></span> <a
												href="#" class="btnLocation" data-location="Gwangju">광주</a></li>
											<li class="list-group-item"><span
												class="glyphicon glyphicon-pencil text-primary"></span> <a
												href="#" class="btnLocation" data-location="Incheon">인천</a></li>
											<li class="list-group-item"><span
												class="glyphicon glyphicon-pencil text-primary"></span> <a
												href="#" class="btnLocation" data-location="Kangwon">강원</a></li>
										</ul>
									</div>
                        		</td>
                        		<td>
									<div id="board1" class="container" style="width:800px; display: inline-block; margin-left: 0px; padding-top: 0px;" >
										<div class="panel panel-default panel-table">
											<div class="panel-heading">
												<div class="row">
													<div class="col col-xs-6">
														<h3 class="panel-title">Best Guide</h3>
													</div>
								
												</div>
											</div>
											<div id="guideTable" class="panel-body">
											</div>
										</div>
									</div>
                        		</td>
                        	</tr>
                        </table>
                     </div>
                  </div>
               </div>
            </div>
         </aside>
      </div>
   </div>
   
   
   	<!-- Guide Detail -->
	<div id="detailModal" style="z-index: 5000" class="modal fade"
		tabindex="5" role="dialog" aria-labelledby="edite">
		<div>
			<div class="container1" style="position: absolute;  top: 70px;  left: 450px;  width: 1000px;">
				<div class="">
					<div
						class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xs-offset-0 col-sm-offset-0 col-md-offset-1 col-lg-offset-1">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h2 class="panel-title">지역별 가이드 찾기</h2>
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
													<td>ID:</td>
													<td id="id"></td>
												</tr>
												<tr>
													<td>Local:</td>
													<td id="local"></td>
												</tr>
												<tr>
													<td>Intro:</td>
													<td id="intro"></td>
												</tr>
												<tr>
													<td>Count:</td>
													<td id="count"></td>
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

