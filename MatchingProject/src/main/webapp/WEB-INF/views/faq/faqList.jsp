
<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/css/bootstrap.min.css"
	rel="stylesheet">

<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/jquery-2.1.1.min.js"></script>

<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/faq.css" />

<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/faq.js"></script>


<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>


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
						<button class="btn btn-primary" id="btnWrite" type="button"
              				 data-toggle="modal" data-target="#writeModal">Write</button>
						<button class="btn">Update</button>
						<button class="btn">Delete</button>
					</div>

					<div class="container">
						<div class="row">
							<div class="col-md-12">
								<h3>Two Plus+</h3>
								<div class="table-responsive">


									<table id="mytable" class="table table-bordred table-striped">

										<thead>

											<th><input type="checkbox" id="checkall" /></th>
											<th>No</th>
											<th>Title</th>
											<th>Content</th>
											<th>Writer</th>
											<th>Count</th>
											<th>Edit</th>
											<th>Delete</th>
										</thead>
										<tbody>

											<tr>
												<td><input type="checkbox" class="checkthis" /></td>
												<td>1</td>
												<td>오늘도</td>
												<td>노트북은 거지다....느려 터졌어</td>
												<td>조옥현</td>
												<td>1000</td>
												<td><p data-placement="top" data-toggle="tooltip"
														title="Edit">
														<button class="btn btn-primary btn-xs" data-title="Edit"
															data-toggle="modal" data-target="#edit">
															<span class="glyphicon glyphicon-pencil"></span>
														</button>
													</p></td>
												<td><p data-placement="top" data-toggle="tooltip"
														title="Delete">
														<button class="btn btn-danger btn-xs" data-title="Delete"
															data-toggle="modal" data-target="#delete">
															<span class="glyphicon glyphicon-trash"></span>
														</button>
													</p></td>
											</tr>

											<tr>
												<td><input type="checkbox" class="checkthis" /></td>
												<td>2</td>
												<td>5시 각이군....</td>
												<td>게시판 드디어 끝이다.....</td>
												<td>조옥현</td>
												<td>1000</td>
												<td><p data-placement="top" data-toggle="tooltip"
														title="Edit">
														<button class="btn btn-primary btn-xs" data-title="Edit"
															data-toggle="modal" data-target="#edit">
															<span class="glyphicon glyphicon-pencil"></span>
														</button>
													</p></td>
												<td><p data-placement="top" data-toggle="tooltip"
														title="Delete">
														<button class="btn btn-danger btn-xs" data-title="Delete"
															data-toggle="modal" data-target="#delete">
															<span class="glyphicon glyphicon-trash"></span>
														</button>
													</p></td>
											</tr>


											<tr>
												<td><input type="checkbox" class="checkthis" /></td>
												<td>3</td>
												<td>아..</td>
												<td>어려워...디자인 버려..</td>
												<td>조옥현</td>
												<td>777</td>
												<td><p data-placement="top" data-toggle="tooltip"
														title="Edit">
														<button class="btn btn-primary btn-xs" data-title="Edit"
															data-toggle="modal" data-target="#edit">
															<span class="glyphicon glyphicon-pencil"></span>
														</button>
													</p></td>
												<td><p data-placement="top" data-toggle="tooltip"
														title="Delete">
														<button class="btn btn-danger btn-xs" data-title="Delete"
															data-toggle="modal" data-target="#delete">
															<span class="glyphicon glyphicon-trash"></span>
														</button>
													</p></td>
											</tr>



											<tr>
												<td><input type="checkbox" class="checkthis" /></td>
												<td>4</td>
												<td>주말에 잠좀 자야지..</td>
												<td>금요일 좋아... 불금..굿</td>
												<td>조옥현</td>
												<td>555</td>
												<td><p data-placement="top" data-toggle="tooltip"
														title="Edit">
														<button class="btn btn-primary btn-xs" data-title="Edit"
															data-toggle="modal" data-target="#edit">
															<span class="glyphicon glyphicon-pencil"></span>
														</button>
													</p></td>
												<td><p data-placement="top" data-toggle="tooltip"
														title="Delete">
														<button class="btn btn-danger btn-xs" data-title="Delete"
															data-toggle="modal" data-target="#delete">
															<span class="glyphicon glyphicon-trash"></span>
														</button>
													</p></td>
											</tr>


											<tr>
												<td><input type="checkbox" class="checkthis" /></td>
												<td>5</td>
												<td>오늘</td>
												<td>ㅎㅎㅎㅎ</td>
												<td>조옥현</td>
												<td>10000</td>
												<td><p data-placement="top" data-toggle="tooltip"
														title="Edit">
														<button class="btn btn-primary btn-xs" data-title="Edit"
															data-toggle="modal" data-target="#edit">
															<span class="glyphicon glyphicon-pencil"></span>
														</button>
													</p></td>
												<td><p data-placement="top" data-toggle="tooltip"
														title="Delete">
														<button class="btn btn-danger btn-xs" data-title="Delete"
															data-toggle="modal" data-target="#delete">
															<span class="glyphicon glyphicon-trash"></span>
														</button>
													</p></td>
											</tr>
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
</body>

<!-- 글쓰기 모달 -->
<div class="modal fade" id="writeModal" tabindex="-1" role="dialog"
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
					<input class="form-control " type="text" placeholder="writer">
				</div>
				<div class="form-group">

					<input class="form-control " type="text" placeholder="Title">
				</div>
				<div class="form-group">
					<textarea rows="2" class="form-control" placeholder="Content"></textarea>
				</div>
			</div>
			<div class="modal-footer ">
					<button type="button" class="btn btn-warning btn-lg"
						style="width: 100%;">
						<span class="glyphicon glyphicon-ok-sign"></span> Submit
					</button>
				</div>
		</div>
	</div>
</div>


	<!-- 에디트 모달 -->
	<div class="modal fade" id="edit" tabindex="-1" role="dialog"
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
						<input class="form-control " type="text" placeholder="writer">
					</div>
					<div class="form-group">

						<input class="form-control " type="text" placeholder="Title">
					</div>
					<div class="form-group">
						<textarea rows="2" class="form-control" placeholder="Content"></textarea>


					</div>
				</div>
				<div class="modal-footer ">
					<button type="button" class="btn btn-warning btn-lg"
						style="width: 100%;">
						<span class="glyphicon glyphicon-ok-sign"></span> Update
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>





	<!-- 딜리트 모달 -->
	<div class="modal fade" id="delete" tabindex="-1" role="dialog"
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
					<button type="button" class="btn btn-success">
						<span class="glyphicon glyphicon-ok-sign"></span> Yes
					</button>
					<button type="button" class="btn btn-default"
						data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> No
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
</html>


