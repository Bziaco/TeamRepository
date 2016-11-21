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
	href="${pageContext.servletContext.contextPath}/resources/css/bestGuideList.css" />
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
	src="${pageContext.servletContext.contextPath}/resources/js/bestGuide.js"></script>
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
									href="#">Seoul</a></li>

								<li class="list-group-item"><span
									class="glyphicon glyphicon-pencil text-primary"></span> <a
									href="#">Pusan</a></li>

								<li class="list-group-item"><span
									class="glyphicon glyphicon-pencil text-primary"></span> <a
									href="#">Daejun</a></li>

								<li class="list-group-item"><span
									class="glyphicon glyphicon-pencil text-primary"></span> <a
									href="#">Ulsan</a></li>
								<li class="list-group-item"><span
									class="glyphicon glyphicon-pencil text-primary"></span> <a
									href="#">Gwangju</a></li>
								<li class="list-group-item"><span
									class="glyphicon glyphicon-pencil text-primary"></span> <a
									href="#">Incheon</a></li>
								<li class="list-group-item"><span
									class="glyphicon glyphicon-pencil text-primary"></span> <a
									href="#">Kangwon</a></li>
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
								<div class="btn-toolbar">
									<button class="btn btn-primary" id="btnWrite" type="button"
										data-toggle="modal" data-target="#writeModal">Write</button>
								</div>
							</div>

						</div>
					</div>
					<div class="panel-body">
						<table class="table table-striped table-bordered table-list">
							<thead>
								<tr>
									<th><em class="fa fa-cog"></em></th>
									<th class="hidden-xs">ID</th>
									<th>Name</th>
									<th>Email</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td align="center">1</td>
									<td class="hidden-xs">Bziaco</td>
									<td>John Doe</td>
									<td>johndoe@example.com</td>
								</tr>
							</tbody>
						</table>

					</div>
					<div class="panel-footer">
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
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>