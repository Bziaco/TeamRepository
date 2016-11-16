<%@ page contentType="text/html;charset=UTF-8"%>

﻿<!DOCTYPE html >
<html>
<head>
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/style.css" />	
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/prefixfree.min.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/custom.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery.simple-sidebar.min.js"></script>  
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
					<li id="btn1"><a href="">Tourist resist</a></li>
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




	
	<div class="wrap">
	
		<!-- 로고 영역 -->
		<h1>
			<strong>Paris</strong>	<br />	
			<img src="${pageContext.servletContext.contextPath}/resources/img/logo.png" /><br />
			<span>Exceptional Creation</span>
		</h1>
		
		<!-- 슬로건 영역 -->
		<p class="txt">
			French Jewelry & <span>Watch Maker</span>
		</p>
		
		<!-- 웹 아이콘 버튼 모음 -->
		<ul class="sns">
			<li><a href="#"><i class="fa fa-facebook"></i></a></li>
			<li><a href="#"><i class="fa fa-twitter"></i></a></li>
			<li><a href="#"><i class="fa fa-youtube"></i></a></li>
			<li><a href="#"><i class="fa fa-envelope"></i></a></li>
		</ul>
		
		<!-- section 영역 -->
		<section class="contents">
		
			<!-- article 영역 -->
			<article>
				<h2>Jewelry</h2>
				<video loop="loop" preload="auto">
					<source src="${pageContext.servletContext.contextPath}/resources/img/vid1.mp4" type="video/mp4" />
				</video>
				<div></div>
				<h3>Jewelry</h3>
				<p>
					Nulla ex risus, varius at mauris quis, fringilla accumsan urna. Cras eleifend tempor nunc id cursus. Mauris in elit ut risus feugiat tincidunt a nec erat. Donec ornare finibus massa. In facilisis finibus rutrum. Sed tempor vitae erat sit amet molestie. Integer eros tellus, molestie a dictum sit amet, lobortis non turpis. 
				</p>
			</article>
			
			<!-- article 영역 -->
			<article>
				<h2>Watches</h2>
				<video loop="loop" preload="auto">
					<source src="${pageContext.servletContext.contextPath}/resources/img/vid2.mp4" type="video/mp4" />
				</video>
				<div></div>
				<h3>Watches</h3>
				<p>
					Nulla ex risus, varius at mauris quis, fringilla accumsan urna. Cras eleifend tempor nunc id cursus. Mauris in elit ut risus feugiat tincidunt a nec erat. Donec ornare finibus massa. 
				</p>
			</article>
			
			<!-- article 영역 -->
			<article>
				<h2>Accessories</h2>
				<video loop="loop" preload="auto">
					<source src="${pageContext.servletContext.contextPath}/resources/img/vid3.mp4" type="video/mp4" />
				</video>
				<div></div>
				<h3>Accessories</h3>
				<p>
					Nulla ex risus, varius at mauris quis, fringilla accumsan urna. Cras eleifend tempor nunc id cursus. Mauris in elit ut risus feugiat tincidunt a nec erat. Donec ornare finibus massa. In facilisis finibus rutrum. Sed tempor vitae erat sit amet molestie. 
				</p>
			</article>
			
			<!-- article 영역 -->
			<article>
				<h2>Gifts</h2>
				<video loop="loop" preload="auto">
					<source src="${pageContext.servletContext.contextPath}/resources/img/vid4.mp4" type="video/mp4" />
				</video>
				<div></div>
				<h3>Gifts</h3>
				<p>
					Nulla ex risus, varius at mauris quis, fringilla accumsan urna. Cras eleifend tempor nunc id cursus. Mauris in elit ut risus feugiat tincidunt a nec erat. Donec ornare finibus massa. In facilisis finibus rutrum. Sed tempor vitae erat sit amet molestie. Integer 
				</p>
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
	
</body>
</html>
