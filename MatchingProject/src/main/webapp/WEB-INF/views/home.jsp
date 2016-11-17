<%@ page contentType="text/html;charset=UTF-8"%>

﻿
<!DOCTYPE html >
<html>
<head>
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
		<h1 style="margin-top: 10px; text-align: center; font-size: 25px;">
			<a>MatchingProject</a>
			<div style="float:right;margin-right:10px;">
				<button id="btnLogin" type="button" class="btn btn-default" data-toggle="modal"
					data-target="#loginModal">Login</button>
				<button id="btnLogout" type="button" class="btn btn-default" style="display:none;">Logout</button>
				<button type="button" class="btn btn-default" data-toggle="modal"
					data-target="#resistModal">Resist</button>

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
				<a href="${pageContext.servletContext.contextPath}/information/info"><h2>Information</h2></a>
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
				<a href="${pageContext.servletContext.contextPath}/faq/faqList"><h2>Q & A</h2></a>
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
					href="${pageContext.servletContext.contextPath}/bestGuide/bestGuideList"><h2>Best Guide</h2></a>
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
				<a href="${pageContext.servletContext.contextPath}/matching/matchList"><h2>Matching</h2></a>
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
			<ul>
				<li><a href="#">sitemap</a></li>
				<li><a href="#">contact</a></li>
				<li><a href="#">community</a></li>
			</ul>
			<span>copyright 2016 Cartier All right reserved.</span>
		</footer>

	</div>

	<!-- login 모달 -->
	<div style="z-index: 5000" class="modal fade" id="loginModal"
		tabindex="5" role="dialog" aria-labelledby="myModalLabel"
		style="position:relavtive;">
		<div class="modal-dialog"
			style="position: absolute; right: 1000px; bottom: 800px">
			<div class="container">
				<div class="row">
					<div class="col-md-offset-5 col-md-3">
						<div class="form-login">
							<h4>LOGIN</h4>
							<input type="text" id="userName"
								class="form-control input-sm chat-input" placeholder="username" />
							</br> <input type="text" id="userPassword"
								class="form-control input-sm chat-input" placeholder="password" />
							</br>
							<div class="wrapper">
								<span class="group-btn"> <a id="btnLogin" href="#"
									class="btn btn-primary btn-md">login <iclass="fa fa-sign-in"></i></a></span>
							</div>
							<br /> <a href="" style="margin-right: 15px; margin-left: 30px">Find
								ID</a><a href="">Find Password</a>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- logout 모달 -->
	<!-- <div style="z-index: 5000" class="modal fade" id="logoutModal" tabindex="5"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog">

			Modal content
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">logout</h4>
				</div>
				<div class="modal-body">
					<p>Some text in the modal.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div> -->

	<!-- Resist 모달 -->
	<div style="z-index: 5000" class="modal fade" id="resistModal"
		tabindex="5" role="dialog" aria-labelledby="myModalLabel"
		style="position:relavtive">
		<div class="modal-dialog"
			style="position: absolute; right: 1000px; bottom: 900px">
			<div class="container">
				<div class="row">
					<div class="col-md-offset-5 col-md-3">
						<div class="form-login">
							<h4>RESIST</h4>
							<input type="text" id="userId"
								class="form-control input-sm chat-input" placeholder="ID" /> </br> <input
								type="text" id="userPassword"
								class="form-control input-sm chat-input" placeholder="Password" />
							</br> <input type="text" id="userNickname"
								class="form-control input-sm chat-input" placeholder="Nickname" />
							</br> <input type="text" id="userName"
								class="form-control input-sm chat-input" placeholder="Name" />
							</br> <input type="text" id="userAge"
								class="form-control input-sm chat-input" placeholder="Age" /> </br>
							<input type="text" id="userSex"
								class="form-control input-sm chat-input" placeholder="Sex" /> </br>
							<input type="text" id="userEmail"
								class="form-control input-sm chat-input" placeholder="Email" />
							</br> <input type="text" id="userLocal"
								class="form-control input-sm chat-input" placeholder="Local" />
							</br> <input type="text" id="userTel"
								class="form-control input-sm chat-input" placeholder="Tel" /> </br>

							<div class="wrapper">
								<span class="group-btn"> <a href="#"
									class="btn btn-primary btn-md">Resist <i
										class="fa fa-sign-in"></i></a></span>
							</div>

							<br />

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- modify 패스워드 확인 -->
	<div style="z-index: 5000" class="modal fade" id="passwordmodifyModal"
		tabindex="5" role="dialog" aria-labelledby="myModalLabel"
		style="position:relavtive">
		<div class="modal-dialog"
			style="position: absolute; right: 1000px; bottom: 900px">
			<div class="container">
				<div class="row">
					<div class="col-md-offset-5 col-md-3">
						<div class="form-login">
							<h4>Password Modification</h4>
							<input type="text" id="userPassword"
								class="form-control input-sm chat-input" placeholder="Password" />
							</br> <span class="group-btn"> <a id="inputPassword" href="#" data-toggle="modal"
								data-target="#modifyModal" class="btn btn-primary btn-md"
								data-trigger="focus">Input Password <i class="fa fa-sign-in"></i></a></span>
						</div>
						<br />
					</div>

				</div>
			</div>
		</div>

	</div>


	<!-- modify 모달 -->
	<div style="z-index: 5000" class="modal fade" id="modifyModal"
		tabindex="5" role="dialog" aria-labelledby="myModalLabel"
		style="position:relavtive">
		<div class="modal-dialog"
			style="position: absolute; right: 1000px; bottom: 900px">
			<div class="container">
				<div class="row">
					<div class="col-md-offset-5 col-md-3">
						<div class="form-login">
							<h4>Modification</h4>
							<input type="text" id="userId"
								class="form-control input-sm chat-input" placeholder="ID" /> </br> <input
								type="text" id="userPassword"
								class="form-control input-sm chat-input" placeholder="Password" />
							</br> <input type="text" id="userNickname"
								class="form-control input-sm chat-input" placeholder="Nickname" />
							</br> <input type="text" id="userName"
								class="form-control input-sm chat-input" placeholder="Name" />
							</br> <input type="text" id="userAge"
								class="form-control input-sm chat-input" placeholder="Age" /> </br>
							<input type="text" id="userSex"
								class="form-control input-sm chat-input" placeholder="Sex" /> </br>
							<input type="text" id="userEmail"
								class="form-control input-sm chat-input" placeholder="Email" />
							</br> <input type="text" id="userLocal"
								class="form-control input-sm chat-input" placeholder="Local" />
							</br> <input type="text" id="userTel"
								class="form-control input-sm chat-input" placeholder="Tel" /> </br>
							<span class="group-btn"> <a href="#"
								class="btn btn-primary btn-md">modify <i
									class="fa fa-sign-in"></i>
							</a></span>
						</div>
						<br />
					</div>

				</div>
			</div>
		</div>

	</div>





	<!-- info 모달 -->
	<div style="z-index: 5000" class="modal fade" id="infoModal"
		tabindex="5" role="dialog" aria-labelledby="myModalLabel">
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
	<div style="z-index: 5000" class="modal fade" id="withdrawModal"
		tabindex="5" role="dialog" aria-labelledby="myModalLabel"
		style="position:relavtive;">
		<div class="modal-dialog"
		style="position: absolute; right: 900px; bottom: 900px">

			<div class="container">
				<div class="row">
					<div class="col-md-offset-5 col-md-3">
						<div class="form-login">
							<h4>really want to leave?</h4>
							<div class="wrapper">
								<span class="group-btn"> <a href="#"
									class="btn btn-primary btn-md" style="margin-right:30px">OK <i class="fa fa-sign-in"></i></a></span>
								<span class="group-btn"> <a href="#"
									class="btn btn-primary btn-md">Cancle <i class="fa fa-sign-in"></i></a></span>
							</div>
							<br />
						</div>

					</div>
				</div>
			</div>

		</div>
	</div>

	<!-- guideresist 모달 -->
	<div style="z-index: 5000" class="modal fade" id="guideModal"
		tabindex="5" role="dialog" aria-labelledby="myModalLabel"
		style="position:relavtive;">
		<div class="modal-dialog"
			style="position: absolute; right: 900px; bottom: 900px">

			<div class="container">
				<div class="row">
					<div class="col-md-offset-5 col-md-3">
						<div class="form-login">
							<h4>GUIDED RESIST</h4>
							<input type="text" id="guideLocal"
								class="form-control input-sm chat-input"
								placeholder="Guide Local" /> </br>
							<textarea id="guideIntro"
								class="form-control input-sm chat-input"
								placeholder="Guide Introuce"></textarea>
							</br>
							<div class="wrapper">
								<span class="group-btn"> <a href="#"
									class="btn btn-primary btn-md">Resist <i
										class="fa fa-sign-in"></i></a></span>
							</div>
							<br />
						</div>

					</div>
				</div>
			</div>

		</div>
	</div>

	<!-- touristresist 모달 -->
	<div style="z-index: 5000" class="modal fade" id="touristModal"
		tabindex="5" role="dialog" aria-labelledby="myModalLabel"
		style="position:relavtive;">
		<div class="modal-dialog"
			style="position: absolute; right: 900px; bottom: 900px">

			<div class="container">
				<div class="row">
					<div class="col-md-offset-5 col-md-3">
						<div class="form-login">
							<h4>TOURIST RESIST</h4>
							<input type="text" id="touristLocal"
								class="form-control input-sm chat-input"
								placeholder="Tourist Local" /> </br>
							<textarea id="touristIntro"
								class="form-control input-sm chat-input"
								placeholder="Tourlist Introuce"></textarea>
							</br>

							<input type="date" class="form-control input-sm chat-input"/>
							~
							<input type="date" class="form-control input-sm chat-input"/>
								<!--
							    <span class="add-on">
							      <i data-time-icon="icon-time" data-date-icon="icon-calendar">
							      </i>
							    </span> -->

							<div class="wrapper">
								<span class="group-btn"> <a href="#"
									class="btn btn-primary btn-md">Resist <i
										class="fa fa-sign-in"></i></a></span>
							</div>
							<br />
						</div>

					</div>
				</div>
			</div>

		</div>
	</div>

	<!-- schedule 모달 -->
	<div style="z-index: 5000" class="modal fade" id="scheduleModal"
		tabindex="5" role="dialog" aria-labelledby="myModalLabel">
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
	<div style="z-index: 5000" class="modal fade" id="matchtouristModal"
		tabindex="5" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog">


			<div class="container" id="tourpackages-carousel">
				<div class="row">
					<div class="col-lg-12"></div>
					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
						<div class="thumbnail">
							<div class="caption">
								<div class='col-lg-12'>
									<span class="glyphicon glyphicon-credit-card"></span> <span
										class="glyphicon glyphicon-trash pull-right text-primary"></span>
								</div>
								<div class='col-lg-12 well well-add-card'>
									<h4>John Deo Mobilel</h4>
								</div>
								<div class='col-lg-12'>
									<p>4111xxxxxxxx3265</p>
									<p class='text-muted'>Exp: 12-08</p>
								</div>
								<button type="button"
									class="btn btn-primary btn-xs btn-update btn-add-card"
									title="Dismissible popover" data-toggle="popover"
									data-trigger="focus" data-placement="bottom"
									data-content="Click anywhere in the document to close this popover">
									Info</button>
								<button type="button"
									class="btn btn-danger btn-xs btn-update btn-add-card" data-toggle="modal"
									data-target="#messageModal">CHATTING
								</button>
								<span
									class='glyphicon glyphicon-exclamation-sign text-danger pull-right icon-style'></span>
							</div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
						<div class="thumbnail">
							<div class="caption">
								<div class='col-lg-12'>
									<span class="glyphicon glyphicon-credit-card"></span> <span
										class="glyphicon glyphicon-trash pull-right text-primary"></span>
								</div>
								<div class='col-lg-12 well well-add-card'>
									<h4>John Deo Mobilel</h4>
								</div>
								<div class='col-lg-12'>
									<p>4111xxxxxxxx3265</p>
									<pclass"text-muted">Exp: 12-08
									</p>
								</div>
								<button type="button"
									class="btn btn-primary btn-xs btn-update btn-add-card">Update</button>
							</div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
						<div class="thumbnail">
							<div class="caption">
								<div class='col-lg-12'>
									<span class="glyphicon glyphicon-credit-card"></span> <span
										class="glyphicon glyphicon-trash pull-right text-primary"></span>
								</div>
								<div class='col-lg-12 well well-add-card'>
									<h4>John Deo Mobilel</h4>
								</div>
								<div class='col-lg-12'>
									<p>4111xxxxxxxx3265</p>
									<pclass"text-muted">Exp: 12-08
									</p>
								</div>
								<button type="button"
									class="btn btn-primary btn-xs btn-update btn-add-card">Update</button>
							</div>
						</div>
					</div>

					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
						<div class="thumbnail">
							<div class="caption">
								<div class='col-lg-12'>
									<span class="glyphicon glyphicon-credit-card"></span> <span
										class="glyphicon glyphicon-trash pull-right text-primary"></span>
								</div>
								<div class='col-lg-12 well well-add-card'>
									<h4>John Deo Mobilel</h4>
								</div>
								<div class='col-lg-12'>
									<p>4111xxxxxxxx3265</p>
									<pclass"text-muted">Exp: 12-08
									</p>
								</div>
								<button type="button"
									class="btn btn-primary btn-xs btn-update btn-add-card">Update</button>
							</div>
						</div>
					</div>

					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
						<div class="thumbnail">
							<div class="caption">
								<div class='col-lg-12'>
									<span class="glyphicon glyphicon-credit-card"></span> <span
										class="glyphicon glyphicon-trash pull-right text-primary"></span>
								</div>
								<div class='col-lg-12 well well-add-card'>
									<h4>John Deo Mobilel</h4>
								</div>
								<div class='col-lg-12'>
									<p>4111xxxxxxxx3265</p>
									<pclass"text-muted">Exp: 12-08
									</p>
								</div>
								<button type="button"
									class="btn btn-primary btn-xs btn-update btn-add-card">Update</button>
								<button type="button"
									class="btn btn-danger btn-xs btn-update btn-add-card">Vrify
									Now</button>
								<span
									class='glyphicon glyphicon-exclamation-sign text-danger pull-right icon-style'></span>
							</div>
						</div>
					</div>

					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
						<div class="thumbnail">
							<div class="caption">
								<div class='col-lg-12'>
									<span class="glyphicon glyphicon-credit-card"></span> <span
										class="glyphicon glyphicon-trash pull-right text-primary"></span>
								</div>
								<div class='col-lg-12 well well-add-card'>
									<h4>John Deo Mobilel</h4>
								</div>
								<div class='col-lg-12'>
									<p>4111xxxxxxxx3265</p>
									<pclass"text-muted">Exp: 12-08
									</p>
								</div>
								<button type="button"
									class="btn btn-primary btn-xs btn-update btn-add-card">Update</button>
							</div>
						</div>
					</div>

					<div class="col-lg-12">
						<a href="#">View Deleted Cards</a>
					</div>
				</div>
				<!-- End row -->
			</div>
			<!-- End container -->




		</div>
	</div>

	<!-- matchguide 모달 -->
	<div style="z-index: 9000" class="modal fade" id="matchguideModal"
		tabindex="5" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog">

			<div class="container" id="tourpackages-carousel">
				<div class="row">
					<div class="col-lg-12">
						<h1>
							My Card <a class="btn icon-btn btn-primary pull-right" href="#"><span
								class="glyphicon btn-glyphicon glyphicon-plus img-circle"></span>
								Add New Card</a>
						</h1>
					</div>
					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
						<div class="thumbnail">
							<div class="caption">
								<div class='col-lg-12'>
									<span class="glyphicon glyphicon-credit-card"></span> <span
										class="glyphicon glyphicon-trash pull-right text-primary"></span>
								</div>
								<div class='col-lg-12 well well-add-card'>
									<h4>John Deo Mobilel</h4>
								</div>
								<div class='col-lg-12'>
									<p>4111xxxxxxxx3265</p>
									<pclass"text-muted">Exp: 12-08
									</p>
								</div>
								<button type="button"
									class="btn btn-primary btn-xs btn-update btn-add-card">Update</button>
								<button type="button"
									class="btn btn-danger btn-xs btn-update btn-add-card">Vrify
									Now</button>
								<span
									class='glyphicon glyphicon-exclamation-sign text-danger pull-right icon-style'></span>
							</div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
						<div class="thumbnail">
							<div class="caption">
								<div class='col-lg-12'>
									<span class="glyphicon glyphicon-credit-card"></span> <span
										class="glyphicon glyphicon-trash pull-right text-primary"></span>
								</div>
								<div class='col-lg-12 well well-add-card'>
									<h4>John Deo Mobilel</h4>
								</div>
								<div class='col-lg-12'>
									<p>4111xxxxxxxx3265</p>
									<pclass"text-muted">Exp: 12-08
									</p>
								</div>
								<button type="button"
									class="btn btn-primary btn-xs btn-update btn-add-card">Update</button>
							</div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
						<div class="thumbnail">
							<div class="caption">
								<div class='col-lg-12'>
									<span class="glyphicon glyphicon-credit-card"></span> <span
										class="glyphicon glyphicon-trash pull-right text-primary"></span>
								</div>
								<div class='col-lg-12 well well-add-card'>
									<h4>John Deo Mobilel</h4>
								</div>
								<div class='col-lg-12'>
									<p>4111xxxxxxxx3265</p>
									<pclass"text-muted">Exp: 12-08
									</p>
								</div>
								<button type="button"
									class="btn btn-primary btn-xs btn-update btn-add-card">Update</button>
							</div>
						</div>
					</div>

					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
						<div class="thumbnail">
							<div class="caption">
								<div class='col-lg-12'>
									<span class="glyphicon glyphicon-credit-card"></span> <span
										class="glyphicon glyphicon-trash pull-right text-primary"></span>
								</div>
								<div class='col-lg-12 well well-add-card'>
									<h4>John Deo Mobilel</h4>
								</div>
								<div class='col-lg-12'>
									<p>4111xxxxxxxx3265</p>
									<pclass"text-muted">Exp: 12-08
									</p>
								</div>
								<button type="button"
									class="btn btn-primary btn-xs btn-update btn-add-card">Update</button>
							</div>
						</div>
					</div>

					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
						<div class="thumbnail">
							<div class="caption">
								<div class='col-lg-12'>
									<span class="glyphicon glyphicon-credit-card"></span> <span
										class="glyphicon glyphicon-trash pull-right text-primary"></span>
								</div>
								<div class='col-lg-12 well well-add-card'>
									<h4>John Deo Mobilel</h4>
								</div>
								<div class='col-lg-12'>
									<p>4111xxxxxxxx3265</p>
									<pclass"text-muted">Exp: 12-08
									</p>
								</div>
								<button type="button"
									class="btn btn-primary btn-xs btn-update btn-add-card">Update</button>
								<button type="button"
									class="btn btn-danger btn-xs btn-update btn-add-card">Vrify
									Now</button>
								<span
									class='glyphicon glyphicon-exclamation-sign text-danger pull-right icon-style'></span>
							</div>
						</div>
					</div>

					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
						<div class="thumbnail">
							<div class="caption">
								<div class='col-lg-12'>
									<span class="glyphicon glyphicon-credit-card"></span> <span
										class="glyphicon glyphicon-trash pull-right text-primary"></span>
								</div>
								<div class='col-lg-12 well well-add-card'>
									<h4>John Deo Mobilel</h4>
								</div>
								<div class='col-lg-12'>
									<p>4111xxxxxxxx3265</p>
									<pclass"text-muted">Exp: 12-08
									</p>
								</div>
								<button type="button"
									class="btn btn-primary btn-xs btn-update btn-add-card">Update</button>
							</div>
						</div>
					</div>

					<div class="col-lg-12">
						<a href="#">View Deleted Cards</a>
					</div>
				</div>
				<!-- End row -->
			</div>
			<!-- End container -->
		</div>
	</div>
	
	<!-- 메세지 -->
	<div style="z-index: 8000" class="modal fade messageBody" id="messageModal"
		tabindex="5" role="dialog" aria-labelledby="myModalLabel"
		style="position:relavtive;">
		<div class="modal-dialog" style="position: absolute; left:800px; bottom: 400px; width: 2000px;" >
			<div class="container">
    <div class="row chat-window col-xs-5 col-md-3" id="chat_window_1" style="margin-left:10px;">
        <div class="col-xs-12 col-md-12">
        	<div class="panel panel-default">
                <div class="panel-heading top-bar">
                    <div class="col-md-8 col-xs-8">
                        <h3 class="panel-title"><span class="glyphicon glyphicon-comment"></span> Chat - Miguel</h3>
                    </div>
                    <div class="col-md-4 col-xs-4" style="text-align: right;">
                        <a href="#"><span id="minim_chat_window" class="glyphicon glyphicon-minus icon_minim"></span></a>
                        <a href="#"><span class="glyphicon glyphicon-remove icon_close" data-id="chat_window_1"></span></a>
                    </div>
                </div>
                <div class="panel-body msg_container_base">
                    <div class="row msg_container base_sent">
                        <div class="col-md-10 col-xs-10">
                            <div class="messages msg_sent">
                                <p>that mongodb thing looks good, huh?
                                tiny master db, and huge document store</p>
                                <time datetime="2009-11-13T20:00">Timothy • 51 min</time>
                            </div>
                        </div>
                        <div class="col-md-2 col-xs-2 avatar">
                            <img src="http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg" class=" img-responsive ">
                        </div>
                    </div>
                    <div class="row msg_container base_receive">
                        <div class="col-md-2 col-xs-2 avatar">
                            <img src="http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg" class=" img-responsive ">
                        </div>
                        <div class="col-md-10 col-xs-10">
                            <div class="messages msg_receive">
                                <p>that mongodb thing looks good, huh?
                                tiny master db, and huge document store</p>
                                <time datetime="2009-11-13T20:00">Timothy • 51 min</time>
                            </div>
                        </div>
                    </div>
                    <div class="row msg_container base_receive">
                        <div class="col-md-2 col-xs-2 avatar">
                            <img src="http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg" class=" img-responsive ">
                        </div>
                        <div class="col-xs-10 col-md-10">
                            <div class="messages msg_receive">
                                <p>that mongodb thing looks good, huh?
                                tiny master db, and huge document store</p>
                                <time datetime="2009-11-13T20:00">Timothy • 51 min</time>
                            </div>
                        </div>
                    </div>
                    <div class="row msg_container base_sent">
                        <div class="col-xs-10 col-md-10">
                            <div class="messages msg_sent">
                                <p>that mongodb thing looks good, huh?
                                tiny master db, and huge document store</p>
                                <time datetime="2009-11-13T20:00">Timothy • 51 min</time>
                            </div>
                        </div>
                        <div class="col-md-2 col-xs-2 avatar">
                            <img src="http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg" class=" img-responsive ">
                        </div>
                    </div>
                    <div class="row msg_container base_receive">
                        <div class="col-md-2 col-xs-2 avatar">
                            <img src="http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg" class=" img-responsive ">
                        </div>
                        <div class="col-xs-10 col-md-10">
                            <div class="messages msg_receive">
                                <p>that mongodb thing looks good, huh?
                                tiny master db, and huge document store</p>
                                <time datetime="2009-11-13T20:00">Timothy • 51 min</time>
                            </div>
                        </div>
                    </div>
                    <div class="row msg_container base_sent">
                        <div class="col-md-10 col-xs-10 ">
                            <div class="messages msg_sent">
                                <p>that mongodb thing looks good, huh?
                                tiny master db, and huge document store</p>
                                <time datetime="2009-11-13T20:00">Timothy • 51 min</time>
                            </div>
                        </div>
                        <div class="col-md-2 col-xs-2 avatar">
                            <img src="http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg" class=" img-responsive ">
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <div class="input-group">
                        <input id="btn-input" type="text" class="form-control input-sm chat_input" placeholder="Write your message here..." />
                        <span class="input-group-btn">
                        <button class="btn btn-primary btn-sm" id="btn-chat">Send</button>
                        </span>
                    </div>
                </div>
    		</div>
        </div>
    </div>
    
    <div class="btn-group dropup">
        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
            <span class="glyphicon glyphicon-cog"></span>
            <span class="sr-only">Toggle Dropdown</span>
        </button>
        <ul class="dropdown-menu" role="menu">
            <li><a href="#" id="new_chat"><span class="glyphicon glyphicon-plus"></span> Novo</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-list"></span> Ver outras</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-remove"></span> Fechar Tudo</a></li>
            <li class="divider"></li>
            <li><a href="#"><span class="glyphicon glyphicon-eye-close"></span> Invisivel</a></li>
        </ul>
    </div>
</div>
			
			
			
		</div>
	</div>
</body>
</html>
