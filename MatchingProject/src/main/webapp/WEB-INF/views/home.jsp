<%@ page contentType="text/html;charset=UTF-8"%>

﻿<!DOCTYPE html >
<html>
<head>
	<link href="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/style.css" />	
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/js/bootstrap.min.js"></script>	
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/prefixfree.min.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/custom.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery.simple-sidebar.min.js"></script>  
	<script type="text/javascript">
		/* function test() {
			$("#main-sidebar").hide();
			$("#myModal").focus();
		} */
	</script>
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
					<li><a onclick="test()" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">Launch demo modal</a></li>
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
				<a href="${pageContext.servletContext.contextPath}/resources/member/joinFom"><h2>Q & A</h2></a>
				<video loop="loop" preload="auto">
					<source src="${pageContext.servletContext.contextPath}/resources/img/vid12.mp4" type="video/mp4" />
				</video>
				<div></div>
				<h3>Q & A</h3>
				<p>
					Nulla ex risus, varius at mauris quis, fringilla accumsan urna. Cras eleifend tempor nunc id cursus. Mauris in elit ut risus feugiat tincidunt a nec erat. Donec ornare finibus massa. In facilisis finibus rutrum. Sed tempor vitae erat sit amet molestie. Integer eros tellus, molestie a dictum sit amet, lobortis non turpis. 
				</p>
			</article>
			
			<!-- article 영역 -->
			<article clss="two">
				<a href="${pageContext.servletContext.contextPath}/resources/member/bestGuide"><h2>Best Guide</h2></a>
				<video loop="loop" preload="auto">
					<source src="${pageContext.servletContext.contextPath}/resources/img/vid13.mp4" type="video/mp4" />
				</video>
				<div></div>
				<h3>Best Guide</h3>
				<p>
					Nulla ex risus, varius at mauris quis, fringilla accumsan urna. Cras eleifend tempor nunc id cursus. Mauris in elit ut risus feugiat tincidunt a nec erat. Donec ornare finibus massa. 
				</p>
			</article>
			
			<!-- article 영역 -->
			<article class="three">
				<a href="${pageContext.servletContext.contextPath}/resources/member/resistration"><h2>Resistration</h2></a>
				<video loop="loop" preload="auto">
					<source src="${pageContext.servletContext.contextPath}/resources/img/vid11.mp4" type="video/mp4" />
				</video>
				<div></div>
				<h3>Resistration</h3>
				<p>
					Nulla ex risus, varius at mauris quis, fringilla accumsan urna. Cras eleifend tempor nunc id cursus. Mauris in elit ut risus feugiat tincidunt a nec erat. Donec ornare finibus massa. In facilisis finibus rutrum. Sed tempor vitae erat sit amet molestie. 
				</p>
			</article>
			
			<!-- article 영역 -->
			<article class="four">
				<a href="${pageContext.servletContext.contextPath}/resources/member/matching"><h2>Matching</h2></a>
				<video loop="loop" preload="auto">
					<source src="${pageContext.servletContext.contextPath}/resources/img/vid10.mp4" type="video/mp4" />
				</video>
				<div></div>
				<h3>Matching</h3>
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
	
	<!-- 모달 -->
	<div style="z-index:5000" class="modal fade" id="myModal" tabindex="5" role="dialog" aria-labelledby="myModalLabel">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Modal Header</h4>
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
