<%@ page contentType = "text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">

		<link href="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/css/bootstrap.min.css" rel="stylesheet">
		<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery-1.12.4.min.js"></script>

	</head>
	<body>
		<!-- 메뉴 -->
	<div id="main-navbar">
		<h1><a>MatchingProject</a></h1>
		<div id="toggle-sidebar"><img src="http://minimar0.dothome.co.kr/img/btn_menu.png" width="28" alt="메뉴 전체보기" /></div>
	</div>
		<div id="main-sidebar">
			<div class="close-sb">HOME</div>
				<nav>
		<ul>
			<li id="menu1" class="depth1"><a>My Page</a>
				<ul style = "display:none" id="change_me1">
					<li><a href="${pageContext.servletContext.contextPath}/mypage/modify">Modify</a></li>
					<li><a href="">Info</a></li>
					<li><a href="">withdraw</a></li>
				</ul>
			</li>
			<li id="menu2" class="depth2"><a>Resist</a>
				<ul style = "display:none" id="change_me2">
					<li><a href="${pageContext.servletContext.contextPath}/resist/guideResist">Guide resist</a></li>
					<li><a href="">Tourist resist</a></li>
				</ul>
			</li>
			<li id="menu3" class="depth3"><a>My Two+</a>
				<ul style = "display:none" id="change_me3">
					<li><a href="">My Schedule</a></li>
					<li><a href="">Matching Tourist</a></li>
					<li><a href="">Matching Guide</a></li>
				</ul>
			</li>
		</ul>
	</nav>
		</div>
	</body>
</html>