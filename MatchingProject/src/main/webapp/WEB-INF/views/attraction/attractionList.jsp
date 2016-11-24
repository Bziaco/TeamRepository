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
</head>

<body id="wrap" style="overflow: hidden;">
	<div class="container">
		<div class="mail-box">
			<aside class="lg-side">
				<div class="inbox-head">
					<h3>Photo Board</h3>
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
					<div class="container">
						<!-- table -->
							<table style="width: 1200px">
								<tr>
									<td>
										<c:forEach var="attraction" items="${list}">
											<a href="#">
												<div style="width:200px; height:170px; display:inline-block; margin:5px; background-image:url(${pageContext.servletContext.contextPath}/resources/img/${attraction.savedfile}); background-size: 200px 170px;">
													<div style="height: 140px;">
													</div>
													<div>
														<table style="width: 100%; height: 30px; background-color: black; opacity: 0.7;">
															<tr>
																<td style="text-align: left; color: white">${attraction.aname}</td>
															</tr>
														</table>
													</div>
												</div>
											</a>
										</c:forEach>
									</td>
								</tr>
							</table>
							
							
							<!--페이지 -->
							<div class="clearfix">
								<ul class="pagination pull-right">
									<li class="disabled"><a href="#">«</a></li>
									<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#">»</a></li>
								</ul>
							</div>
					
					</div>
				</div>
			</aside>
		</div>
	</div>
</body>
</html>