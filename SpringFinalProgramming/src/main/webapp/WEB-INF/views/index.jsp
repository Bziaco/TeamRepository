<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/resources/css/justified-nav.css"
	rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".nav li").on("click", function() {
			$(".nav li").removeClass("active");
			//this.setAttribute("class", "active");
			$(this).addClass("active");
		});
	});
</script>
</head>

<body style="background-image: url(${pageContext.servletContext.contextPath}/resources/image/photo11.jpg)">
	<div class="container">
		<div class="masthead">
			<h3 class="text-muted">Bziaco</h3>
			<nav>
				<ul class="nav nav-justified">
					<li class="active"><a target="iframe" href="${pageContext.servletContext.contextPath}/home">Home</a></li>
					<li><a target="iframe" href="${pageContext.servletContext.contextPath}/member/login">로그인</a></li>
					<li><a target="iframe" href="${pageContext.servletContext.contextPath}/freeboard/list">자유게시판</a></li>
					<li><a target="iframe" href="${pageContext.servletContext.contextPath}/photoboard/list">포토게시판</a></li>
				</ul>
			</nav>
		</div>

		<%-- <div class="jumbotron">
			<h1>Spring Final Programming</h1>
			<p class="lead">Java, SQL, JDBC, HTML5, CSS3, JavaScript, jQuery,
				AJAX, JSP, Spring</p>
			<p>
				<a class="btn btn-lg btn-success" href="#" role="button">다
					까먹었네...</a>
			</p>
		</div> --%>
		
		<iframe style="width:100%;height:400px;border-width:0px;" name="iframe" src="home"></iframe>
		
		<div class="row bg-warning">
			<div class="col-lg-4">
				<h2>회원서비스</h2>
				<p class="text-danger">회원가입</p>
				<p>로그인</p>
				<p>로그아웃</p>
				<p>
					<a class="btn btn-primary" href="#" role="button">자세한 설명</a>
				</p>
			</div>
			<div class="col-lg-4">
				<h2>자유게시판</h2>
				<p>게시물 목록</p>
				<p>게시물 쓰기</p>
				<p>게시물 보기</p>
				<p>게시물 수정</p>
				<p>게시물 삭제</p>
				<p>
					<a class="btn btn-primary" href="#" role="button">자세한 설명</a>
				</p>
			</div>
			<div class="col-lg-4">
				<h2>포토게시판</h2>
				<p>게시물 목록</p>
				<p>게시물 쓰기</p>
				<p>게시물 보기</p>
				<p>게시물 수정</p>
				<p>게시물 삭제</p>
				<p>
					<a class="btn btn-primary" href="#" role="button">자세한 설명</a>
				</p>
			</div>
		</div>

		<footer class="footer">
			<p>&copy; 2016 Company, Inc.</p>
		</footer>

	</div>
	<%-- container --%>


	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
