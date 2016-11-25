<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css"
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/style.css" />
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/login.css" />
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/guideList.css" />
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/js/bootstrap.min.js"></script>
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
</script>	
	
	
	
</head>
<body id="wrap">

	<div class="container">
		<div class="row">
			<div class="col-sm-3 col-md-3">
				<div class="panel-group" id="accordion">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseOne"><span
									class="glyphicon glyphicon-folder-close"> </span>Location</a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in">
							<ul class="list-group" role="tablist">
								<li class="list-group-item"><span
									class="glyphicon glyphicon-pencil text-primary"></span> <a
									href="#" class="btnLocation" data-location="Seoul">Seoul</a></li>

								<li class="list-group-item"><span
									class="glyphicon glyphicon-pencil text-primary"></span> <a
									href="#" class="btnLocation" data-location="Busan">Busan</a></li>

								<li class="list-group-item"><span
									class="glyphicon glyphicon-pencil text-primary"></span> <a
									href="#" class="btnLocation" data-location="Daejun">Daejun</a></li>

								<li class="list-group-item"><span
									class="glyphicon glyphicon-pencil text-primary"></span> <a
									href="#" class="btnLocation" data-location="Ulsan">Ulsan</a></li>
								<li class="list-group-item"><span
									class="glyphicon glyphicon-pencil text-primary"></span> <a
									href="#" class="btnLocation" data-location="Gwangju">Gwangju</a></li>
								<li class="list-group-item"><span
									class="glyphicon glyphicon-pencil text-primary"></span> <a
									href="#" class="btnLocation" data-location="Incheon">Incheon</a></li>
								<li class="list-group-item"><span
									class="glyphicon glyphicon-pencil text-primary"></span> <a
									href="#" class="btnLocation" data-location="Kangwon">Kangwon</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- --------------------------------------------------------- -->

	<div class="container" style="margin-left: 200px" id="board1">
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
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
					<!-- <div class="panel-footer">
						<div class="row">
							<div class="col col-xs-4">Page 1 of 5</div>
							<div class="col col-xs-8">
								<ul class="pagination hidden-xs pull-right">
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
								</ul>
								<ul class="pagination visible-xs pull-right">
									<li><a href="#">«</a></li>
									<li><a href="#">»</a></li>
								</ul>
							</div>
						</div>
					</div> -->
				</div>

			</div>
		</div>
	</div>
	
	<!-- Guide Detail -->
	<div style="z-index: 5000" class="modal fade" id="detailModal"
		tabindex="5" role="dialog" aria-labelledby="edite">
		<div>
			<div class="container1" style="position: absolute;  top: 70px;  left: 450px;  width: 1000px;">
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
	
	<!-- Guide Detail -->
	<div style="z-index: 5000" class="modal fade" id="detailModal"
		tabindex="5" role="dialog" aria-labelledby="edite">
		<div>
			<div id="container">
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
													<td>ID:</td>
													<td id="id">${guide.gid}</td>
												</tr>
												<tr>
													<td>Local:</td>
													<td id="local">${guide.glocal}</td>
												</tr>
												<tr>
													<td>Intro:</td>
													<td id="intro">${guide.gintro}</td>
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








