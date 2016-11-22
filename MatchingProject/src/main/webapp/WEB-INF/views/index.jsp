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
	<%-- <script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/prefixfree.min.js"></script> --%>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/custom.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery.simple-sidebar.min.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/home.js"></script>
</head>
<body>

	<!-- 메뉴 -->
	<div id="main-navbar">
		<h1 style="margin-top: 10px; text-align: center; font-size: 25px;">
	
			<div style="float: right; margin-right: 10px;">
				<c:if test="${empty login}">
					<button id="btnLogin" type="button" class="btn btn-default" data-toggle="modal" data-target="#loginModal">Login</button>
					<button id="btnLogout" type="button" class="btn btn-default" style="display: none;">Logout</button>
					<button id="btnResist" type="button" class="btn btn-default" data-toggle="modal" data-target="#resistModal">Resist</button>
				</c:if>
				<c:if test="${not empty login}">
					<button id="btnLogin" type="button" class="btn btn-default" data-toggle="modal" data-target="#loginModal" style="display: none;">Login</button>
					<button id="btnLogout" type="button" class="btn btn-default">Logout</button>
					<button id="btnResist" type="button" class="btn btn-default" data-toggle="modal" data-target="#resistModal" style="display: none;">Resist</button>
				</c:if>
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
						<li><a id="btninfo" href="#">Info</a></li>
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

	<iframe src="home" style="width: 100%; height: 98%; overflow: hidden;"></iframe>

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
							<input type="text" id="mid"
								class="form-control input-sm chat-input" placeholder="username" value="test" />
							</br> <input type="password" id="mpassword"
								class="form-control input-sm chat-input" placeholder="password" value="kosa12345" />
							</br>
							<div class="wrapper">
								<span class="group-btn"> <a id="btnLogin" href="#"
									class="btn btn-primary btn-md">login <i class ="fafa-sign-in">
										</i></a></span>
							</div>
							<br/> <a href="" style="margin-right: 15px; margin-left: 30px">Find
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
							<input type="text" id="mid"
								class="form-control input-sm chat-input" placeholder="ID" value="test"/> </br> 
							<input type="password" id="mpassword"
								class="form-control input-sm chat-input" placeholder="Password" value="kosa12345"/></br> 
							<input type="text" id="mnickname"
								class="form-control input-sm chat-input" placeholder="Nickname" value="테스트" /></br> 
							<input type="text" id="mname"
								class="form-control input-sm chat-input" placeholder="Name" value="조옥현" /></br>
							<input type="number" id="mage"
								class="form-control input-sm chat-input" placeholder="Age" value="30"/> </br>
							<select class="form-control input-sm chat-input" id="msex">
								<option checked value="M">Male</option>
								<option value="F">Female</option>
							</select></br>
							<input type="text" id="memail"
								class="form-control input-sm chat-input" placeholder="Email"  value="test@naver.com"/></br>
							<input type="text" id="mlocal"
								class="form-control input-sm chat-input" placeholder="Local" value="Seoul"/></br> 
							<input type="text" id="mtel"
								class="form-control input-sm chat-input" placeholder="Tel" value="010-123-1234"/> </br>
							<input type="file" id="mphoto" multiple/> <br/>
	
							<div class="wrapper">
								<span class="group-btn"> <a id="btnResist" href="#"
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
							<input type="password" id="mpassword"
								class="form-control input-sm chat-input" placeholder="Password" value="kosa12345"/>
							</br> <span class="group-btn"> <a id="inputPassword" href="#" 
								class="btn btn-primary btn-md" data-trigger="focus">Input
									Password <i class="fa fa-sign-in"></i>
							</a></span>
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
							<input type="file" id="mphoto" multiple/> <br/>
							<input type="password" id="mpassword" class="form-control input-sm chat-input" placeholder="Password" />
							</br> <input type="text" id="mnickname"
								class="form-control input-sm chat-input" placeholder="Nickname"/>
							</br> <input type="text" id="mname"
								class="form-control input-sm chat-input" placeholder="Name"/>
							</br> <input type="number" id="mage"
								class="form-control input-sm chat-input" placeholder="Age"/> </br>
							<select class="form-control input-sm chat-input" id="msex">
								<option checked value="M">Male</option>
								<option value="F">Female</option>
							</select></br>							
							<input type="text" id="memail"
								class="form-control input-sm chat-input" placeholder="Email"/>
							</br> <input type="text" id="mlocal"
								class="form-control input-sm chat-input" placeholder="Local"/>
							</br> <input type="text" id="mtel"
								class="form-control input-sm chat-input" placeholder="Tel"/> </br>
							<span class="group-btn"> 
								<a id="btnModify" href="#" class="btn btn-primary btn-md">modify<i class="fa fa-sign-in"></i>
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
		tabindex="5" role="dialog" aria-labelledby="myModalLabel"
		style="position:relavtive">
		<div class="modal-dialog" style="position: absolute; right: 800px; bottom: 900px">
	
	
			<div class="container">
					<div class="">
						<div
							class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xs-offset-0 col-sm-offset-0 col-md-offset-1 col-lg-offset-1">
							<div class="panel panel-primary">
								<div class="panel-heading">
									<h3 class="panel-title">User information</h3>
								</div>
								<div class="panel-body">
									<div class="row">
										<div class="col-md-3 col-lg-3 hidden-xs hidden-sm">
											<img class="img-thumbnail"
												src="${pageContext.servletContext.contextPath}/resources/img/bae.jpg"
												 width="130" height="130">
										</div>

										<div class="col-md-9 col-lg-9 hidden-xs hidden-sm">
											<strong id="mname"></strong><br>
											<table class="table table-user-information">
												<tbody>
													<tr>
														<td>Nickname:</td>
														<td id="mnickname"></td>
													</tr>
													<tr>
														<td>E-mail:</td>
														<td id="memail"></td>
													</tr>
													<tr>
														<td>Age:</td>
														<td id="mage"></td>
													</tr>
													<tr>
														<td>Local:</td>
														<td id="mlocal"></td>
													</tr>
													<tr>
														<td>Tel:</td>
														<td id="mtel"></td>
													</tr>
												</tbody>  
											</table>
										</div>
									</div>
								</div>
								<div class="panel-footer">
										<button class="btn btn-sm btn-danger" type="button"
											data-toggle="tooltip" data-original-title="Remove this user">
											<i class="glyphicon glyphicon-remove"></i>
										</button>
									</span>
								</div>
							</div>
						</div>
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
								<span class="group-btn"> <a id="Okwithdraw" href="#"
									class="btn btn-primary btn-md" style="margin-right: 30px">OK
										<i class="fa fa-sign-in"></i>
								</a></span> <span class="group-btn"> <a id="Canclewithdraw" href="#"
									class="btn btn-primary btn-md">Cancle <i
										class="fa fa-sign-in"></i></a></span>
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
								<span class="group-btn"> <a id="btnguideresist" href="#"
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
							</br> <input type="date" class="form-control input-sm chat-input"
								placeholder="to" /> ~ <input type="date"
								class="form-control input-sm chat-input" placeholder="from" />
							<!--
							    <span class="add-on">
							      <i data-time-icon="icon-time" data-date-icon="icon-calendar">
							      </i>
							    </span> -->
							</br> </br>
							<div class="wrapper">
								<span class="group-btn"> <a id="btnTouristResist"
									href="#" class="btn btn-primary btn-md">Resist <i
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
	<div style="z-index: 5000;" class="modal fade" id="matchtouristModal"
		tabindex="5" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" style="margin-left: 500px; margin-top: 180px;">
			<div class="container" id="tourpackages-carousel" style="width: 1175px; height:650px; overflow: auto;  background-color: white; border-radius: 20px;">
				<table>
					<tr>
						<td>
							<c:forEach var="i" begin="1" end="6">
								<div class="thumbnail" style="width:350px; display: inline-block;margin:6px;">
									<div class="caption">
										<div>   
											<!--
												<span class="glyphicon glyphicon-credit-card"></span>
												<span class="glyphicon glyphicon-trash pull-right text-primary"></span> 
											-->
										</div>
										<div>
											<h4>3Team</h4>
										</div>
										<div style="margin:0px 10px;">
											<img
												src="${pageContext.servletContext.contextPath}/resources/img/bae.jpg"
												style="float: right" class="img-rounded" alt="Cinque Terre"
												width="120" height="130"> <span
												style="font-weight: bold">Name: </span>Jae-Hwan Bae<br /> <span
												style="font-weight: bold">Local: </span>Pusan<br /> <span
												style="font-weight: bold">Tel: </span>010-1234-2501<br /> <span
												style="font-weight: bold">Email: </span>Bziaco@naver.com<br /> <span
												style="font-weight: bold">age: </span>26<br /> <span
												style="font-weight: bold">Sex: </span>Male<br /> <span
												style="font-weight: bold">Matching: </span>2016.12.16<br />
										</div>
										<button type="button"
											class="btn btn-primary btn-xs btn-update btn-add-card"
											title="Introduce" data-toggle="popover" data-trigger="focus"
											data-placement="bottom"
											data-content="Hi, My hobby is coding. do you play coding with me?">Intro</button>
										<button id="btnMessageModal" type="button"
											class="btn btn-danger btn-xs btn-update btn-add-card" data-mto="test1">CHATTING</button>
									</div>
								</div>
							</c:forEach>
						</td>
					</tr>
				</table>
				<!-- End container -->
			</div>
		</div>
	</div>
	
	<!-- matchguide 모달 -->
	<div style="z-index: 5000" class="modal fade" id="matchguideModal"
		tabindex="5" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
	
			<div class="container" id="tourpackages-carousel">
				<div class="row">
					<div class="col-lg-12"></div>
					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
						<div class="thumbnail">
							<div class="caption">
								<div class='col-lg-12'>
									<!-- 									<span class="glyphicon glyphicon-credit-card"></span> <span
										class="glyphicon glyphicon-trash pull-right text-primary"></span> -->
								</div>
								<div class='col-lg-12 well well-add-card'>
									<h4>3Team</h4>
								</div>
								<div class='col-lg-12'>
									<img
										src="${pageContext.servletContext.contextPath}/resources/img/bae.jpg"
										style="float: right" class="img-rounded" alt="Cinque Terre"
										width="130" height="130"> <span
										style="font-weight: bold">Name: </span>Jae-Hwan Bae<br /> <span
										style="font-weight: bold">Local: </span>Pusan<br /> <span
										style="font-weight: bold">Tel: </span>010-1234-2501<br /> <span
										style="font-weight: bold">Email: </span>Bziaco@naver.com<br /> <span
										style="font-weight: bold">age: </span>26<br /> <span
										style="font-weight: bold">Sex: </span>Male<br /> <span
										style="font-weight: bold">Matching: </span>2016.12.16<br />
								</div>
								<button type="button"
									class="btn btn-primary btn-xs btn-update btn-add-card"
									title="Introduce" data-toggle="popover" data-trigger="focus"
									data-placement="bottom"
									data-content="Hi, My hobby is coding. do you play coding with me?">
									Intro</button>
								<button type="button"
									class="btn btn-danger btn-xs btn-update btn-add-card"
									data-toggle="modal" data-target="#messageModal">CHATTING
								</button>
							</div>
						</div>
					</div>
					<!-- End row -->
				</div>
				<!-- End container -->
			</div>
		</div>
	</div>
	
	<!-- 메세지 -->
	<div id="messageModal" style="z-index: 8000;" class="modal fade" tabindex="5" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" style="position: absolute; left: 800px; bottom: 100px; width: 2000px;">
			<div class="container">
				<div class="row chat-window col-xs-5 col-md-3" id="chat_window_1" style="margin-left: 10px;">
					<div class="col-xs-12 col-md-12">
						<div class="panel panel-default" style="height:600px;">
							<div class="panel-heading top-bar" style="background-color: orange;">
								<div class="col-md-8 col-xs-8">
									<h3 class="panel-title">
										<span class="glyphicon glyphicon-comment"></span> Message
									</h3>
								</div>
								<div class="col-md-4 col-xs-4" style="text-align: right;">
									<a id="btnMessageModalClose" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span></a>
								</div>
							</div>
							<div class="panel-body" style="height:505px; background-color:#eeeeee; overflow-y:scroll;">
							</div>
							<div class="panel-footer" style="background-color: gray;">
								<div class="input-group">
									<input id="txtMessageInput" type="text" class="input-sm chat_input" placeholder="Write your message here..." style="margin-right: 10px; width:350px;"/>
									<span class="input-group-btn">
										<button class="btn btn-primary btn-sm" id="btnMessageSend">Send</button>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>
