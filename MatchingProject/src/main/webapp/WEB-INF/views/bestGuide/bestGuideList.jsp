<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/style.css" />
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/login.css" />
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/bestGuideList.css" />	
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/custom.js"></script>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/jquery.simple-sidebar.min.js"></script>
</head>
<body id="wrap">

	<!-- 메뉴 -->
	<div id="main-navbar">
		<h1 style="margin-top: 10px; text-align: center; font-size: 25px;">
			<a>MatchingProject</a>
			<div style="float: right; margin-right: 10px;">
				<button id="btnLogin" type="button" class="btn btn-default"
					data-toggle="modal" data-target="#loginModal">Login</button>
				<button id="btnLogout" type="button" class="btn btn-default"
					style="display: none;">Logout</button>
				<button id="btnResist" type="button" class="btn btn-default"
					data-toggle="modal" data-target="#resistModal">Resist</button>

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
	
	
	
	<div class="container">
  <div class="row">
    <div class="col-sm-3 col-md-3">
      <div class="panel-group" id="accordion">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><span class="glyphicon glyphicon-folder-close">
                </span>Content</a>
            </h4>
          </div>
          <div id="collapseOne" class="panel-collapse collapse in">
            <ul class="list-group">
              <li class="list-group-item"><span class="glyphicon glyphicon-pencil text-primary"></span><a href="http://fb.com/moinakbarali">Articles</a></li>

              <li class="list-group-item"><span class="glyphicon glyphicon-flash text-success"></span><a href="http://fb.com/moinakbarali">News</a></li>

              <li class="list-group-item"><span class="glyphicon glyphicon-file text-info"></span><a href="http://fb.com/moinakbarali">Newsletters</a></li>

              <li class="list-group-item"> <span class="glyphicon glyphicon-comment text-success"></span><a href="http://fb.com/moinakbarali">Comments</a><span class="badge">42</span></li>

            </ul>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour"><span class="glyphicon glyphicon-file">
                </span>Reports</a>
            </h4>
          </div>
          <div id="collapseFour" class="panel-collapse collapse">
            <div class="list-group">
              <a href="#" class="list-group-item active">
                Cras justo odio
              </a>
              <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
              <a href="#" class="list-group-item">Morbi leo risus</a>
              <a href="#" class="list-group-item">Porta ac consectetur ac</a>
              <a href="#" class="list-group-item">Vestibulum at eros</a>
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a data-toggle="collapse" data-parent="#accordion" href="#collapseFive"><span class="glyphicon glyphicon-heart">
                </span>Reports</a>
            </h4>
          </div>
          <div id="collapseFive" class="panel-collapse collapse">
            <div class="list-group">
              <a href="#" class="list-group-item">
                <h4 class="list-group-item-heading">List group item heading</h4>
                <p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
              </a>
            </div>
            <div class="list-group">
              <a href="#" class="list-group-item active">
                <h4 class="list-group-item-heading">List group item heading</h4>
                <p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
              </a>
            </div>
            <div class="list-group">
              <a href="#" class="list-group-item">
                <h4 class="list-group-item-heading">List group item heading</h4>
                <p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-sm-9 col-md-9">
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title">Dashboard</h3>
        </div>
        <div class="panel-body">
          Admin Dashboard Accordion List Group Menu
        </div>
      </div>
    </div>
  </div>
</div>

	

</body>
</html>