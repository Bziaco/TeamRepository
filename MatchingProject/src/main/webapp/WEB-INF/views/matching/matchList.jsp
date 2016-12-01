<%-- <%@ page contentType="text/html;charset=UTF-8"%>
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
	href="${pageContext.servletContext.contextPath}/resources/css/match.css" />
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/matching.js"></script>
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
		      location.href = "matchList?pageNo=1&keyword=" + keyword;
		   }
</script>



</head>

<body id="wrap" style="overflow: hidden;">

	<div class="container">
		<div class="mail-box">
			<aside class="lg-side">
				<div class="inbox-head">
					<h3>Matching</h3>
					<form class="pull-right position" onsubmit="return false">
						<div class="input-append">
							<input id="keyword" type="text" class="sr-input" onkeydown="if(event.keyCode==13){javascript:searchEnter();}"
								placeholder="Search">
							<button id="btnSearch" class="btn sr-btn" type="button">
								<i class="fa fa-search" aria-hidden="true"></i>
							</button>
						</div>
					</form>
				</div>
				<div class="inbox-body">
					<div class="container">
						<div class="row">
							<div class="col-md-12">
								<h3>Two Plus+</h3>
								<div class="table-responsive">
									<table id="mytable" class="table table-bordred table-striped">
										<thead>
											<th>No</th>
											<th>ID</th>
											<th>Photo</th>
											<th>Score</th>
											<th>Date</th>
										</thead>
										<tbody>
											<c:forEach var="matching" items="${list}">
												<tr>
													<td>${matching.matchno}</td>
													<td><a class="btnDetailModal" href="#"
														data-gid="${matching.gid}">${matching.gid}</a></td>
													<td><img src="getPhoto?savedfile=${matching.savedfile}" 
															width="120" height="130"></img> </td>
													<td>${matching.score}</td>
													<td>${matching.matchdate}</td>
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
													href="matchList?pageNo=${startPageNo-1}&keyword=${keyword}"><span
													class="glyphicon glyphicon-chevron-left"
													style="color: green"></span></a>
											</c:if></li>

										<c:forEach var="i" begin="${startPageNo}" end="${endPageNo}">
											<li <c:if test="${pageNo==i}">class="active"</c:if>><a
												href="matchList?pageNo=${i}&keyword=${keyword}">${i}</a></li>
										</c:forEach>

										<li><c:if test="${groupNo==totalGroupNo}">
												<span class="glyphicon glyphicon-chevron-right"
													style="color: gray"></span>
											</c:if> <c:if test="${groupNo<totalGroupNo}">
												<a href="matchList?pageNo=${endPageNo+1}&keyword=${keyword}"><span
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
								<h2 class="panel-title">Matching Detail</h2>
							</div>
							<div class="panel-body">
								<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">
										<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
									</button>
								<div class="row">
									<div class="col-md-3 col-lg-3 hidden-xs hidden-sm">
										<img class="img-thumbnail" id="mphoto"></img>
									</div>

									<div class="col-md-9 col-lg-9 hidden-xs hidden-sm">
										<strong id="mname"></strong><br>
										<table class="table table-user-information" style="height:250px;">
											<tbody>
												<tr>
													<td>No:</td>
													<td id="matchno"></td>
												</tr>
												<tr>
													<td>ID:</td>
													<td id="gid"></td>
												</tr>
												<tr>
													<td>Score:</td>
													<td id="score"></td>
												</tr>
												<tr>
													<td>Date:</td>
													<td id="matchdate"></td>
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
	
	
	<!-- 메세지 -->
	<div id="messageModal" style="z-index: 8000;" class="modal fade"
		tabindex="5" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog"
			style="position: absolute; left: 800px; bottom: 100px; width: 2000px;">
			<div class="container">
				<div class="row chat-window col-xs-5 col-md-3" id="chat_window_1"
					style="margin-left: 10px;">
					<div class="col-xs-12 col-md-12">
						<div class="panel panel-default" style="height: 600px;">
							<div class="panel-heading top-bar"
								style="background-color: orange;">
								<div class="col-md-8 col-xs-8">
									<h3 class="panel-title">
										<span class="glyphicon glyphicon-comment"></span> Message
									</h3>
								</div>
								<div class="col-md-4 col-xs-4" style="text-align: right;">
									<a id="btnMessageModalClose" data-dismiss="modal"><span
										class="glyphicon glyphicon-remove"></span></a>
								</div>
							</div>
							<div class="panel-body"
								style="height: 505px; background-color: #eeeeee; overflow-y: scroll;">
							</div>
							<div class="panel-footer" style="background-color: gray;">
								<div class="input-group">
									<input id="txtMessageInput" type="text"
										class="input-sm chat_input"
										placeholder="Write your message here..."
										style="margin-right: 10px; width: 350px;" /> <span
										class="input-group-btn">
										<button class="btn btn-primary btn-sm" id="btnMessageSend">Send</button>
									</span>
								</div> 
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> 
	
	
</body>
</html> --%>