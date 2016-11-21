<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/css/bootstrap.min.css">
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/board.css" />
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/board.js"></script>
</head>

<body id="wrap">
	<div class="container">
		<div class="mail-box">
			<aside class="lg-side">
				<div class="inbox-head">
					<h3>Free Board</h3>
					<form action="#" class="pull-right position">
						<div class="input-append">
							<input type="text" class="sr-input" placeholder="Search">
							<button class="btn sr-btn" type="button">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</form>
				</div>
				
				<div class="inbox-body">
					<div class="btn-toolbar">
						<button class="btn btn-primary" id="btnWrite" type="button" data-toggle="modal" data-target="#writeModal">Write</button>
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
															<button id="btnUpdate" class="btn btn-primary btn-xs" data-bno="${board.bno}">
																<span class="glyphicon glyphicon-pencil"></span>
															</button>
														</p></td>
													<td><p data-placement="top" data-toggle="tooltip"
															title="Delete">
															<button class="btn btn-danger btn-xs" id="btnDelete" data-bno="${board.bno}">
																<span class="glyphicon glyphicon-trash"></span>
															</button>
														</p></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>

									<div class="clearfix"></div>
									<ul class="pagination pull-right">
										<li class="disabled"><a href="#"><span
												class="glyphicon glyphicon-chevron-left"></span></a></li>
										<li class="active"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#"><span
												class="glyphicon glyphicon-chevron-right"></span></a></li>
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
	<div style="z-index: 5000" class="modal fade" id="writeModal" role="dialog"
		aria-labelledby="edit" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
					<h4 class="modal-title custom_align" id="Heading">Do you went to write?</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<input class="form-control " type="text" placeholder="Title" id="btitle">
					</div>
					<div class="form-group">
						<textarea rows="2" class="form-control" placeholder="Content" id="bcontent"></textarea>
					</div> 
				</div>
				<div class="modal-footer ">
					<a class="btn btn-warning btn-lg" id="btnwrite" href="#">
						<span class="glyphicon glyphicon-ok-sign"></span> Submit
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
						<input class="form-control " type="text" placeholder="Title">
					</div>
					<div class="form-group">
						<textarea rows="2" class="form-control" placeholder="Content"></textarea>
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
					<h4 class="modal-title custom_align" id="Heading">Delete
						this entry</h4>
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


