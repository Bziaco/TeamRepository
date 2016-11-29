<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
﻿
<!DOCTYPE html >
<html>
<head>
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/style.css" />
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/login.css" />
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/message.css" />
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/matchtourist.css" />
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/common.css" />	
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
					<button id="btnLogin" type="button" class="btn btn-default"
						data-toggle="modal" data-target="#loginModal">Login</button>
					<button id="btnLogout" type="button" class="btn btn-default"
						style="display: none;">Logout</button>
					<button id="btnResist" type="button" class="btn btn-default"
						data-toggle="modal" data-target="#resistModal">Resist</button>
				</c:if>
				<c:if test="${not empty login}">
					<button id="btnLogin" type="button" class="btn btn-default"
						data-toggle="modal" data-target="#loginModal"
						style="display: none;">Login</button>
					<button id="btnLogout" type="button" class="btn btn-default">Logout</button>
					<button id="btnResist" type="button" class="btn btn-default"
						data-toggle="modal" data-target="#resistModal"
						style="display: none;">Resist</button>
				</c:if>
			</div>
		</h1>
		<div  style="margin-top: 10px; text-align: center;" ><a href="http://localhost:8080/mymatch/" style="font-size: 35px; color: white;">TwoPlus+</a></div>
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
						<li><a id="btnwithdraw" href="#" data-toggle="modal"
							data-target="#withdrawModal">withdraw</a></li>
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
						<li><a class="btnMatchingTourist" href="#">Matching
								Tourist</a></li>
						<li><a class="btnMatchingGuide" href="#">Matching Guide</a></li>
					</ul></li>
			</ul>
		</nav>
	</div>

	<iframe src="home" style="width: 100%; height: 98%; overflow: hidden;"></iframe>

	<!-- login 모달 -->
	<div id="loginModal" class="modal fade" tabindex="-1" role="dialog" style="z-index: 5000">
		<div class="modal-dialog" role="document"  style="width:300px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">LOGIN</h4>
				</div>
				<div class="modal-body">
					<input type="text" id="mid"
						class="form-control input-sm chat-input" placeholder="username"
						value="test" /> 
					</br> 
					<input type="password" id="mpassword"
						class="form-control input-sm chat-input" placeholder="password"
						value="123" /> 
					</br>
					<br /> 
					<a href="" style="margin-right: 15px; margin-left: 30px">Find ID</a>
					<a href="">Find Password</a>
				</div>
	      		<div class="modal-footer">
	        		<button id="btnLogin" type="button" class="btn btn-primary">login</button>
	      		</div>
	    	</div>
	  	</div>
	</div>


	<!-- Resist 모달 -->
	<div id="resistModal" class="modal fade" tabindex="-1" role="dialog" style="z-index: 5000">
		<div class="modal-dialog" role="document"  style="width:400px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        		<h4 class="modal-title">RESIST</h4>
	      		</div>
	      		<div class="modal-body">
					<input type="text" id="mid"
						class="form-control input-sm chat-input" placeholder="ID"
						value="test" /> 
					<br/> 
					<input type="password" id="mpassword"
						class="form-control input-sm chat-input" placeholder="Password"
						value="kosa12345" />
						<br/> 
					<input type="text" id="mnickname"
						class="form-control input-sm chat-input" placeholder="Nickname"
						value="테스트" />
					<br/> 
					<input type="text" id="mname"
						class="form-control input-sm chat-input" placeholder="Name"
						value="조옥현" />
					<br/>
					<input type="number" id="mage"
						class="form-control input-sm chat-input" placeholder="Age"
						value="30" />
					<br/> 
					<select
						class="form-control input-sm chat-input" id="msex">
						<option checked value="M">Male</option>
						<option value="F">Female</option>
					</select>
					<br/> 
					<input type="text" id="memail"
						class="form-control input-sm chat-input" placeholder="Email"
						value="test@naver.com" />
					<br/> 
					<input type="text" id="mlocal"
						class="form-control input-sm chat-input" placeholder="Local"
						value="Seoul" />
					<br/> 
					<input type="text" id="mtel"
						class="form-control input-sm chat-input" placeholder="Tel"
						value="010-123-1234" /> 
					<br/> 
					<input type="file" id="mphoto" multiple /> <br/>
				</div>
	      		<div class="modal-footer">
	        		<button id="btnResist" type="button" class="btn btn-primary">Resist</button>
	      		</div>
	    	</div>
	  	</div>
	</div>	

	<!-- modify 패스워드 확인 -->
	<div id="passwordmodifyModal" class="modal fade" tabindex="-1" role="dialog" style="z-index: 5000">
		<div class="modal-dialog" role="document"  style="width:400px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">Password Modification</h4>
				</div>
				<div class="modal-body">
					<input type="password" id="mpassword" class="form-control input-sm chat-input" placeholder="Password" value="kosa12345" />
				</div>
				<div class="modal-footer">
					<button id="inputPassword" type="button" class="btn btn-primary">Input Password</button>
				</div>
			</div>
		</div>
	</div>		
	

	<!-- modify 모달 -->
	<div id="modifyModal" class="modal fade" tabindex="-1" role="dialog" style="z-index: 5000">
		<div class="modal-dialog" role="document"  style="width:400px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">Modification</h4>
				</div>
				<div class="modal-body">
						<input type="file" id="mphoto" multiple /> <br /> <input
							type="password" id="mpassword"
							class="form-control input-sm chat-input" placeholder="Password" />
						</br> <input type="text" id="mnickname"
							class="form-control input-sm chat-input" placeholder="Nickname" />
						</br> <input type="text" id="mname"
							class="form-control input-sm chat-input" placeholder="Name" /> </br>
						<input type="number" id="mage"
							class="form-control input-sm chat-input" placeholder="Age" /> </br> <select
							class="form-control input-sm chat-input" id="msex">
							<option checked value="M">Male</option>
							<option value="F">Female</option>
						</select></br> <input type="text" id="memail"
							class="form-control input-sm chat-input" placeholder="Email" />
						</br> <input type="text" id="mlocal"
							class="form-control input-sm chat-input" placeholder="Local" />
						</br> <input type="text" id="mtel"
							class="form-control input-sm chat-input" placeholder="Tel" /> 
				</div>
				<div class="modal-footer">
					<button id="btnModify" type="button" class="btn btn-primary">modify</button>
				</div>
			</div>
		</div>
	</div>	
	
	<!-- info 모달 -->
	<div id="infoModal" class="modal fade" tabindex="-1" role="dialog" style="z-index: 5000">
		<div class="modal-dialog" role="document"  style="width:600px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">User information</h4>
				</div>
				<div class="modal-body">
						<div class="row">
							<div class="col-md-3 col-lg-3 hidden-xs hidden-sm">
								<img class="img-thumbnail" id="mphoto" src="" width="130"
									height="130"></img>
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
				<!-- <div class="modal-footer">
					<button id="btnModify" type="button" class="btn btn-primary">modify</button>
				</div> -->
			</div>
		</div>
	</div>		

	<!-- withdraw 모달 -->
	<div id="withdrawModal" class="modal fade" tabindex="-1" role="dialog" style="z-index: 5000">
		<div class="modal-dialog" role="document"  style="width:400px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">really want to leave?</h4>
				</div>
				<!-- <div class="modal-body">
						<h4>really want to leave?</h4>
				</div> -->
				<div class="modal-footer">
					<button id="Okwithdraw" type="button" class="btn btn-primary">OK</button>
					<button id="Canclewithdraw" type="button" class="btn btn-primary">Cancle</button>
				</div>
			</div>
		</div>
	</div>		

	<!-- guideresist 모달 -->
	<div id="guideModal" class="modal fade" tabindex="-1" role="dialog" style="z-index: 5000">
		<div class="modal-dialog" role="document"  style="width:400px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">GUIDED RESIST</h4>
				</div>
				<div class="modal-body">
						<input type="text" id="guideLocal"
								class="form-control input-sm chat-input"
								placeholder="Guide Local" /> </br>
						<textarea id="guideIntro"
							class="form-control input-sm chat-input"
							placeholder="Guide Introuce"></textarea>
				</div>
				<div class="modal-footer">
					<button id="btnguideresist" type="button" class="btn btn-primary">Resist</button>
				</div>
			</div>
		</div>
	</div>		

	<!-- touristresist 모달 -->
	<div id="touristModal" class="modal fade" tabindex="-1" role="dialog" style="z-index: 5000">
		<div class="modal-dialog" role="document"  style="width:400px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">TOURIST RESIST</h4>
				</div>
				<div class="modal-body">
						<input type="text" id="touristLocal"
								class="form-control input-sm chat-input"
								placeholder="Tourist Local" /> </br>
						<textarea id="touristIntro"
							class="form-control input-sm chat-input"
							placeholder="Tourlist Introduce"></textarea>
						</br> <input id="toDate" type="date"
							class="form-control input-sm chat-input" placeholder="to" /> ~
						<input id="fromDate" type="date"
							class="form-control input-sm chat-input" placeholder="from" />
				</div>
				<div class="modal-footer">
					<button id="btnTouristResist" type="button" class="btn btn-primary">Resist</button>
				</div>
			</div>
		</div>
	</div>	

	<!-- schedule 모달 -->
	<div id="scheduleModal" class="modal fade" tabindex="-1" role="dialog" style="z-index: 5000">
		<div class="modal-dialog" role="document"  style="width:400px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">schedule</h4>
				</div>
				<div class="modal-body">
						<p>Some text in the modal.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>	


	<!-- matchtourist 모달 -->
 	<div id="matchtouristModal" class="modal fade" tabindex="-1" role="dialog" style="z-index: 5000" data-tid="$(tourist.tid)">
		<div class="modal-dialog" role="document"  style="width:1175px; height: 650px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">matchtourist</h4>
				</div>
				<div class="modal-body">
					<table>
						<tr>
							<td id="matchtourlist"></td>
						</tr>
					</table>
				</div>
				<!-- <div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>  -->
			</div>
		</div>
	</div>	
	
	<!-- matchguide 모달 -->
 	<div id="matchguideModal" class="modal fade" tabindex="-1" role="dialog" style="z-index: 5000" data-gid="$(guide.gid)">
		<div class="modal-dialog" role="document"  style="width:1175px; height: 650px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">matchtourist</h4>
				</div>
				<div class="modal-body">
					<table>
						<tr>
							<td id="matchguidelist"></td>
						</tr>
					</table>
				</div>
				<!-- <div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div> --> 
			</div>
		</div>
	</div>
		

	<!-- 메세지 -->
	<div id="messageModal" style="z-index: 8000;" class="modal fade"
		tabindex="5" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog"
			style="position: absolute; left: 800px; bottom: 100px; width: 2000px;">
			<div class="container">
				<div class="row chat-window col-xs-5 col-md-3" id="chat_window_1"
					style="margin-left: 10px;">
					<div class="col-xs-12 col-md-12">
						<div class="panel panel-default" style="height: 600px;">
							<div class="panel-heading top-bar"
								style="background-color: orange;">
								<div class="col-md-8 col-xs-8">
									<h3 class="panel-title">
										<span class="glyphicon glyphicon-comment"></span> Message
									</h3>
								</div>
								<div class="col-md-4 col-xs-4" style="text-align: right;">
									<a id="btnMessageModalClose" data-dismiss="modal"><span
										class="glyphicon glyphicon-remove"></span></a>
								</div>
							</div>
							<div class="panel-body"
								style="height: 505px; background-color: #eeeeee; overflow-y: scroll;">
							</div>
							<div class="panel-footer" style="background-color: gray;">
								<div class="input-group">
									<input id="txtMessageInput" type="text"
										class="input-sm chat_input"
										placeholder="Write your message here..."
										style="margin-right: 10px; width: 350px;" /> <span
										class="input-group-btn">
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
