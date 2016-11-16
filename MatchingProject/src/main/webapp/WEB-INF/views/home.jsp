<%@ page contentType="text/html;charset=UTF-8"%>

﻿
<!DOCTYPE html >
<html>
<head>
<link
	href="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/style.css" />
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/prefixfree.min.js"></script>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/custom.js"></script>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/jquery.simple-sidebar.min.js"></script>
</head>
<body>

	<!-- 메뉴 -->
	<div id="main-navbar">
		<h1 style="margin-top: 10px;text-align: center;font-size: 25px;">
			<a>MatchingProject</a>
			<div style="float: right;margin-right:10px;">
				<button type="button" class="btn btn-default">Login</button>
				<button type="button" class="btn btn-default">Resist</button>
			
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
						<li><a data-toggle="modal" data-target="#modifyModal">Modify</a></li>
						<li><a data-toggle="modal" data-target="#infoModal">Info</a></li>
						<li><a data-toggle="modal" data-target="#withdrawModal">withdraw</a></li>
					</ul></li>
				<li id="menu2" class="depth2"><a>Resist</a>
					<ul style="display: none" id="change_me2">
						<li><a data-toggle="modal" data-target="#guideModal">Guide Resist</a></li>
						<li><a data-toggle="modal" data-target="#touristModal">Tourist resist</a></li>
					</ul></li>
				<li id="menu3" class="depth3"><a>My Two+</a>
					<ul style="display: none" id="change_me3">
						<li><a data-toggle="modal" data-target="#scheduleModal">My Schedule</a></li>
						<li><a data-toggle="modal" data-target="#matchtouristModal">Matching Tourist</a></li>
						<li><a data-toggle="modal" data-target="#matchguideModal">Matching Guide</a></li>
					</ul></li>
			</ul>
		</nav>
	</div>

	<div class="wrap">

		<%-- <!-- 로고 영역 -->
		<h1>
			<strong>Paris</strong>	<br />	
			<img src="${pageContext.servletContext.contextPath}/resources/img/logo.png" /><br />
			<span>Exceptional Creation</span>
		</h1> --%>

		<!-- 슬로건 영역 -->
		<p class="txt">
			Two<span>Plus+</span>
		</p>

		<%-- <!-- 웹 아이콘 버튼 모음 -->
		<ul class="sns">
			<li><a href="#"><i class="fa fa-facebook"></i></a></li>
			<li><a href="#"><i class="fa fa-twitter"></i></a></li>
			<li><a href="#"><i class="fa fa-youtube"></i></a></li>
			<li><a href="#"><i class="fa fa-envelope"></i></a></li>
		</ul> --%>

		<!-- section 영역 -->
		<section class="contents">

			<!-- article 영역 -->
			<article clss="one">
				<a
					href="${pageContext.servletContext.contextPath}/resources/member/joinFom"><h2>Q
						& A</h2></a>
				<video loop="loop" preload="auto">
					<source src="${pageContext.servletContext.contextPath}/resources/img/vid12.mp4" type="video/mp4" />
				</video>
				<div></div>
				<h3>Q & A</h3>
				<p>Nulla ex risus, varius at mauris quis, fringilla accumsan
					urna. Cras eleifend tempor nunc id cursus. Mauris in elit ut risus
					feugiat tincidunt a nec erat. Donec ornare finibus massa. In
					facilisis finibus rutrum. Sed tempor vitae erat sit amet molestie.
					Integer eros tellus, molestie a dictum sit amet, lobortis non
					turpis.</p>
			</article>

			<!-- article 영역 -->
			<article clss="two">
				<a
					href="${pageContext.servletContext.contextPath}/resources/member/bestGuide"><h2>Best
						Guide</h2></a>
				<video loop="loop" preload="auto">
					<source src="${pageContext.servletContext.contextPath}/resources/img/vid13.mp4" type="video/mp4" />
				</video>
				<div></div>
				<h3>Best Guide</h3>
				<p>Nulla ex risus, varius at mauris quis, fringilla accumsan
					urna. Cras eleifend tempor nunc id cursus. Mauris in elit ut risus
					feugiat tincidunt a nec erat. Donec ornare finibus massa.</p>
			</article>

			<!-- article 영역 -->
			<article class="three">
				<a
					href="${pageContext.servletContext.contextPath}/resources/member/resistration"><h2>Resistration</h2></a>
				<video loop="loop" preload="auto">
					<source src="${pageContext.servletContext.contextPath}/resources/img/vid11.mp4" type="video/mp4" />
				</video>
				<div></div>
				<h3>Resistration</h3>
				<p>Nulla ex risus, varius at mauris quis, fringilla accumsan
					urna. Cras eleifend tempor nunc id cursus. Mauris in elit ut risus
					feugiat tincidunt a nec erat. Donec ornare finibus massa. In
					facilisis finibus rutrum. Sed tempor vitae erat sit amet molestie.
				</p>
			</article>

			<!-- article 영역 -->
			<article class="four">
				<a
					href="${pageContext.servletContext.contextPath}/resources/member/matching"><h2>Matching</h2></a>
				<video loop="loop" preload="auto">
					<source src="${pageContext.servletContext.contextPath}/resources/img/vid10.mp4" type="video/mp4" />
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
			<ul>
				<li><a href="#">sitemap</a></li>
				<li><a href="#">contact</a></li>
				<li><a href="#">community</a></li>
			</ul>
			<span>copyright 2015 Cartier All right reserved.</span>
		</footer>

	</div>

	<!-- modify 모달 -->
	<div style="z-index: 5000" class="modal fade" id="modifyModal" tabindex="5"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">modify</h4>
				</div>
				<div class="modal-body">
					<p>Some text in the modal.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	
	<!-- info 모달 -->
	<div style="z-index: 5000" class="modal fade" id="infoModal" tabindex="5"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">info</h4>
				</div>
				<div class="modal-body">
					<p>Some text in the modal.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	
	<!-- withdraw 모달 -->
	<div style="z-index: 5000" class="modal fade" id="withdrawModal" tabindex="5"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">withdraw</h4>
				</div>
				<div class="modal-body">
					<p>Some text in the modal.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	
	<!-- guideresist 모달 -->
	<div style="z-index: 5000" class="modal fade" id="guideModal" tabindex="5"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">guideresist</h4>
				</div>
				<div class="modal-body">
					<p>Some text in the modal.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	
	<!-- touristresist 모달 -->
	<div style="z-index: 5000" class="modal fade" id="touristModal" tabindex="5"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">tourist</h4>
				</div>
				<div class="modal-body">
					<p>Some text in the modal.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	
	<!-- schedule 모달 -->
	<div style="z-index: 5000" class="modal fade" id="scheduleModal" tabindex="5"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">schedule</h4>
				</div>
				<div class="modal-body">
					<p>Some text in the modal.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	
	<!-- matchtourist 모달 -->
	<div style="z-index: 5000" class="modal fade" id="matchtouristModal" tabindex="5"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">matchtourist</h4>
				</div>
				<div class="modal-body">
					<p>Some text in the modal.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	
	<!-- matchguide 모달 -->
	<div style="z-index: 5000" class="modal fade" id="matchguideModal" tabindex="5"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">matchguide</h4>
				</div>
				<div class="modal-body">
					<p>Some text in the modal.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
</body>
</html>
