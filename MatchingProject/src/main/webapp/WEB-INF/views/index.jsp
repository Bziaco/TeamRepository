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
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/custom.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery.simple-sidebar.min.js"></script>
	
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/home.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/resistModal.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/loginModal.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/passwordmodifyModal.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/modifyModal.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/withdrawModal.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/guideModal.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/touristModal.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/messageModal.js"></script>
</head>
<body>
	<!-- 메뉴 -->
	<div id="main-navbar">
		<h1 style="margin-top: 10px; text-align: center; font-size: 25px;">
			<div style="float: right; margin-right: 10px;">
				<c:if test="${empty login}">
					<button id="btnLogin" type="button" class="btn btn-default">Login</button>
					<button id="btnLogout" type="button" class="btn btn-default" style="display: none;">Logout</button>
					<button id="btnResist" type="button" class="btn btn-default">Resist</button>
				</c:if>
				<c:if test="${not empty login}">
					<button id="btnLogin" type="button" class="btn btn-default" style="display: none;">Login</button>
					<button id="btnLogout" type="button" class="btn btn-default">Logout</button>
					<button id="btnResist" type="button" class="btn btn-default" style="display: none;">Resist</button>
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
				<li id="menu1" class="depth1"><a>내정보</a>
					<ul style="display: none" id="change_me1">
						<li><a data-toggle="modal" data-target="#passwordmodifyModal">수정</a></li>
						<li><a id="btninfo" href="#">보기</a></li>
						<li><a id="btnwithdraw" href="#" data-toggle="modal"
							data-target="#withdrawModal">탈퇴</a></li>
					</ul></li>
				<li id="menu2" class="depth2"><a>등록</a>
					<ul style="display: none" id="change_me2">
						<li><a data-toggle="modal" data-target="#guideModal">가이드 등록</a></li>
						<!-- <li><a data-toggle="modal" data-target="#touristModal"></a></li> -->
					</ul></li>
				<li id="menu3" class="depth3"><a>여행 스케줄</a>
					<ul style="display: none" id="change_me3">
						<li><a data-toggle="modal" data-target="#scheduleModal">스케줄 입력 및 검색</a></li>
						<li><a class="btnMatchingTourist" href="#">매칭 투어리스트</a></li> 
						<li><a class="btnMatchingGuide" href="#">매칭 가이드</a></li>
					</ul></li>
			</ul>
		</nav>
	</div>

	<iframe src="home" style="width: 100%; height: 98%; overflow: hidden;"></iframe>

	<!-- login 모달 -->
	<%@ include file="member/loginModal.jsp" %>
	<!-- Resist 모달 -->
	<%@ include file="member/resistModal.jsp" %>
	<!-- modify 패스워드 확인 -->
	<%@ include file="member/passwordmodifyModal.jsp" %>
	<!-- modify 모달 -->
	<%@ include file="member/modifyModal.jsp" %>
	<!-- info 모달 -->
	<%@ include file="member/infoModal.jsp"%>
	<!-- withdraw 모달 -->
	<%@ include file="member/withdrawModal.jsp"%>
	<!-- guideresist 모달 -->
	<%@ include file="guide/guideModal.jsp"%>
	<!-- touristresist 모달 -->
	<%@ include file="tourist/touristModal.jsp"%>
	<!-- schedule 모달 -->
	<%@ include file="tourist/schedulModal.jsp"%>
	<!-- matchtourist 모달 -->
	<%@ include file="tourist/matchtouristModal.jsp"%>
	<!-- matchguide 모달 -->
	<%@ include file="guide/matchguideModal.jsp"%>
	<!-- 메세지 -->
	<%@ include file="message/messageModal.jsp"%>
 
</body>
</html>
