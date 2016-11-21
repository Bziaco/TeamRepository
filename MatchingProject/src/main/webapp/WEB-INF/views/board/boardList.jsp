<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/css/bootstrap.min.css">
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/board.css" />
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/board.js"></script>

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css"
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/style.css" />
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/login.css" />
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/custom.js"></script>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/jquery.simple-sidebar.min.js"></script>
</head>

<body id="wrap">

	<div id="main-navbar">
		<h1 style="margin-top: 10px; text-align: center; font-size: 25px;">
			<a>Q & A</a>
			<div style="float: right; margin-right: 10px;">
				<button id="btnLogin" type="button" class="btn btn-default"
					data-toggle="modal" data-target="#loginModal">Login</button>
				<button id="btnLogout" type="button" class="btn btn-default"
					style="display: none;">Logout</button>
				<button id="btnResist" type="button" class="btn btn-default"
					data-toggle="modal" data-target="#resistModal">Resist</button>

			</div>
		</h1>
		<div id="toggle-sidebar">
			<img src="http://minimar0.dothome.co.kr/img/btn_menu.png" width="28"
				alt="메뉴 전체보기" />
		</div>
	</div>
	<div id="main-sidebar">
		<div class="close-sb">HOME</div>
		<nav>
			<ul>
				<li id="menu1" class="depth1"><a>My Page</a>
					<ul style="display: none" id="change_me1">
						<li><a data-toggle="modal" data-target="#passwordmodifyModal">Modify</a></li>
						<li><a data-toggle="modal" data-target="#infoModal">Info</a></li>
						<li><a data-toggle="modal" data-target="#withdrawModal">withdraw</a></li>
					</ul></li>
				<li id="menu2" class="depth2"><a>Resist</a>
					<ul style="display: none" id="change_me2">
						<li><a data-toggle="modal" data-target="#guideModal">Guide
								Resist</a></li>
						<li><a data-toggle="modal" data-target="#touristModal">Tourist
								resist</a></li>
					</ul></li>
				<li id="menu3" class="depth3"><a>My Two+</a>
					<ul style="display: none" id="change_me3">
						<li><a data-toggle="modal" data-target="#scheduleModal">My
								Schedule</a></li>
						<li><a data-toggle="modal" data-target="#matchtouristModal">Matching
								Tourist</a></li>
						<li><a data-toggle="modal" data-target="#matchguideModal">Matching
								Guide</a></li>
					</ul></li>
			</ul>
		</nav>
	</div>

	<!-- 여기까지 -->



	<div class="container">
		<div class="mail-box">
			<aside class="lg-side">
				<div class="inbox-head">
					<h3>Free Board</h3>
					<form class="pull-right position">
						<div class="input-append">
							<input id="keyword" type="text" class="sr-input"
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
													<td>${board.btitle}</td>
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
</body>
</html>


