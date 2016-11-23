<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
﻿
<!DOCTYPE html >
<html>
<head>
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/style.css" />
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/login.css" />
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/message.css" />
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/matchtourist.css" />
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/prefixfree.min.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/custom.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery.simple-sidebar.min.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/home.js"></script>
</head>
<body>

	<div class="wrap">
		<!-- 슬로건 영역 -->
		<p class="txt">
			Two<span>Plus+</span>
		</p>
		<!-- section 영역 -->
		<section class="contents">

			<!-- article 영역 -->
			<article clss="one">
				<a href="${pageContext.servletContext.contextPath}/attraction/attractionList"><h2>Information</h2></a>
				<video loop="loop" preload="auto">
					<source
						src="${pageContext.servletContext.contextPath}/resources/img/vid12.mp4"
						type="video/mp4" />
				</video>
				<div></div>
				<h3>Information</h3>
				<p>Nulla ex risus, varius at mauris quis, fringilla accumsan
					urna. Cras eleifend tempor nunc id cursus. Mauris in elit ut risus
					feugiat tincidunt a nec erat. Donec ornare finibus massa. In
					facilisis finibus rutrum. Sed tempor vitae erat sit amet molestie.
					Integer eros tellus, molestie a dictum sit amet, lobortis non
					turpis.</p>
			</article>

			<!-- article 영역 -->
			<article clss="two">
				<a href="${pageContext.servletContext.contextPath}/board/boardList"><h2>Q
						& A</h2></a>
				<video loop="loop" preload="auto">
					<source
						src="${pageContext.servletContext.contextPath}/resources/img/vid13.mp4"
						type="video/mp4" />
				</video>
				<div></div>
				<h3>Q & A</h3>
				<p>Nulla ex risus, varius at mauris quis, fringilla accumsan
					urna. Cras eleifend tempor nunc id cursus. Mauris in elit ut risus
					feugiat tincidunt a nec erat. Donec ornare finibus massa.</p>
			</article>

			<!-- article 영역 -->
			<article class="three">
				<a
					href="${pageContext.servletContext.contextPath}/guide/guideList"><h2>Best
						Guide</h2></a>
				<video loop="loop" preload="auto">
					<source
						src="${pageContext.servletContext.contextPath}/resources/img/vid11.mp4"
						type="video/mp4" />

				</video>
				<div></div>
				<h3>Best Guide</h3>
				<p>Nulla ex risus, varius at mauris quis, fringilla accumsan
					urna. Cras eleifend tempor nunc id cursus. Mauris in elit ut risus
					feugiat tincidunt a nec erat. Donec ornare finibus massa. In
					facilisis finibus rutrum. Sed tempor vitae erat sit amet molestie.
				</p>
			</article>

			<!-- article 영역 -->
			<article class="four">
				<a
					href="${pageContext.servletContext.contextPath}/matching/matchList"><h2>Matching</h2></a>
				<video loop="loop" preload="auto">
					<source
						src="${pageContext.servletContext.contextPath}/resources/img/vid10.mp4"
						type="video/mp4" />
				</video>
				<div></div>
				<h3>Matching</h3>
				<p>Nulla ex risus, varius at mauris quis, fringilla accumsan
					urna. Cras eleifend tempor nunc id cursus. Mauris in elit ut risus
					feugiat tincidunt a nec erat. Donec ornare finibus massa. In
					facilisis finibus rutrum. Sed tempor vitae erat sit amet molestie.
					Integer</p>
			</article>
		</section>

		<!-- footer -->
		<footer>
			
			<span>copyright 2016 Cartier All right reserved.</span>
		</footer>

	</div>

</body>
</html>