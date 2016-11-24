<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<link
	href="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/attraction.css" />
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/infoback.css" />
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/js/bootstrap.min.js"></script>
<%-- <script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/infoback.js"></script> --%>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/attraction.js"></script>
</head>
<body>


<!-- -------------------------------sakura------------------------ -->




	<!--원본코드  -->
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<!-- begin panel group -->
				<div class="panel-group" id="accordion" role="tablist"
					aria-multiselectable="true">


					<!-- panel 1 -->
					<div id="attractionList" class="panel panel-default">
						<!--wrap panel heading in span to trigger image change as well as collapse -->
						<span class="side-tab" data-target="#tab1" data-toggle="tab"
							role="tab" aria-expanded="false">
							<div class="panel-heading" role="tab" id="headingOne"
								data-toggle="collapse" data-parent="#accordion"
								href="#collapseOne" aria-expanded="false"
								aria-controls="collapseOne">
								<h4 id="aname" class="panel-title"><a id="btnInfo" href="#" data-location="Seoul">N서울타워</a></h4>
							</div>
						</span>

						<div id="collapseOne" class="panel-collapse collapse in"
							role="tabpanel" aria-labelledby="headingOne">
							<div class="panel-body" id="ainfo">
							${guide.glocal}
							</div>
						</div>
					</div>
					<!-- / panel 1 -->

					<!-- panel 2 -->
					<div class="panel panel-default">
						<!--wrap panel heading in span to trigger image change as well as collapse -->
						<span class="side-tab" data-target="#tab2" data-toggle="tab"
							role="tab" aria-expanded="false">
							<div class="panel-heading" role="tab" id="headingTwo"
								data-toggle="collapse" data-parent="#accordion"
								href="#collapseTwo" aria-expanded="false"
								aria-controls="collapseTwo">
								<h4 class="panel-title">아침고요수목원</h4>
							</div>
						</span>

						<div id="collapseTwo" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingTwo">
							<div class="panel-body">
								<!-- Tab content goes here -->
								아침고요수목원은 경기도 가평군에 위치하여 10만평의 넓이에 총 4,500여종의 식물을 보유하고 있는 원예수목원이다.
								1996년 5월, 삼육대학교 원예학과 교수인 한상경교수가 직접 설계하고 조성하였으며, 경기도 가평군 상면 행현리
								축령산에 위치하고 있다. 넓이는 약 10만평 정도이며 산지형 수목원이다. 이름은 한국이 '고요한 아침의 나라'이라
								불리는 데서 비롯되었는데, 계절별, 주제별로 한국의 미를 느낄 수 있도록 조성되었다.
							</div>
						</div>
					</div>
					<!-- / panel 2 -->

					<!--  panel 3 -->
					<div class="panel panel-default">
						<!--wrap panel heading in span to trigger image change as well as collapse -->
						<span class="side-tab" data-target="#tab3" data-toggle="tab"
							role="tab" aria-expanded="false">
							<div class="panel-heading" role="tab" id="headingThree"
								class="collapsed" data-toggle="collapse"
								data-parent="#accordion" href="#collapseThree"
								aria-expanded="false" aria-controls="collapseThree">
								<h4 class="panel-title">경복궁</h4>
							</div>
						</span>

						<div id="collapseThree" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingThree">
							<div class="panel-body">
								<!-- tab content goes here -->
								경복궁은 대한민국 서울 세종로에 있는 조선 왕조의 법궁이다. 1395년에 창건하였다. ‘경복’은 시경에 나오는 말로
								왕과 그 자손, 온 백성들이 태평성대의 큰 복을 누리기를 축원한다는 의미이다. 풍수지리적으로도 백악산을 뒤로하고
								좌우에는 낙산과 인왕산으로 둘러싸여 있어 길지의 요건을 갖추고 있다. 1592년, 임진왜란으로 인해 불탄 이후 그
								임무를 창덕궁에 넘겨주었다가 1865년에 흥선대원군의 명으로 중건되었다.
							</div>
						</div>
					</div>
					<!--  panel 3 -->

					<!--  panel 4 -->
					<div class="panel panel-default">
						<!--wrap panel heading in span to trigger image change as well as collapse -->
						<span class="side-tab" data-target="#tab4" data-toggle="tab"
							role="tab" aria-expanded="false">
							<div class="panel-heading" role="tab" id="headingFour"
								class="collapsed" data-toggle="collapse"
								data-parent="#accordion" href="#collapseFour"
								aria-expanded="false" aria-controls="collapseFour">
								<h4 class="panel-title">유우니 소금사막</h4>
							</div>
						</span>

						<div id="collapseFour" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingFour">
							<div class="panel-body">
								<!-- tab content goes here -->
								볼리비아는 세계 최장 안데스산맥 7개의 봉우리가 관통하는 고산국가이다. 수도 라파스는 해발 3,800m에 있고,
								히말라야나 티베트와 함께 매우 건조한 기후로 사람이 살기 어려운 지역이다. 라파즈는 스페인이 볼리비아의 광물 자원을
								착취하기 위한 거점도시였다. 스페인이 볼리비아에서 착취한 자원 중 하나가 소금인데, 라파스에서 580㎞ 떨어진 곳에
								있는 우유니는 세계 최대 소금 사막이다. 자동차로 온종일 달려도 보이는 풍경은 끝이 없는 소금 평야뿐이다. 우유니
								사막에서 선글라스는 필수다. 지면에 널린 소금에 반사되는 햇빛으로 자칫 시력이 손상되기 쉽기 때문이다. 과거
								바다였던 우유니는 지각 변동으로 융기, 바다가 솟아 오른 후 거대한 호수로 변했다. 산악 지형인 이곳 호수의 물이
								빠져나가지 못했기 때문이다. 자연스럽게 수분 증발이 반복되면서 거대한 호수는 사막으로 변했다. 크기는 1만
								2000㎢, 두께는 12ｍ, 저장량은 700억t이다. 소금의 농도는 보통 소금의 5배 정도이다.
							</div>
						</div>
					</div>
					<!--  panel 4 -->

					<!--  panel 5 -->
					<div class="panel panel-default">
						<!--wrap panel heading in span to trigger image change as well as collapse -->
						<span class="side-tab" data-target="#tab5" data-toggle="tab"
							role="tab" aria-expanded="false">
							<div class="panel-heading" role="tab" id="headingFive"
								class="collapsed" data-toggle="collapse"
								data-parent="#accordion" href="#collapseFive"
								aria-expanded="false" aria-controls="collapseFive">
								<h4 class="panel-title">빅토리아 폭포</h4>
							</div>
						</span>

						<div id="collapseFive" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingFive">
							<div class="panel-body">
								<!-- tab content goes here -->
								빅토리아 폭포 혹은 Mosi-Oa-Tunya는 잠비아와 짐바브웨사이에 위치한 폭포이다. 빅토리아 폭포는 스코틀랜드인
								탐험가 데이비드 리빙스턴이 영국의 빅토리아 여왕의 이름을 따서 지어졌으며, 이것은 짐바브웨에서 사용 중인 이름이다.
								더 오래된, 토착 이름인 Mosi-Oa-Tunya는 잠비아에서 공식적으로 사용 중이다. 세계 유산 목록은 두 이름
								다 인정한다. 빅토리아 폭포는 너비 1.7 킬로미터와 높이 108 미터의 규모이다.
							</div>
						</div>
					</div>
					<!--  panel 5 -->

					<!--  panel 6 -->
					<div class="panel panel-default">
						<!--wrap panel heading in span to trigger image change as well as collapse -->
						<span class="side-tab" data-target="#tab6" data-toggle="tab"
							role="tab" aria-expanded="false">
							<div class="panel-heading" role="tab" id="headingSix"
								class="collapsed" data-toggle="collapse"
								data-parent="#accordion" href="#collapseSix"
								aria-expanded="false" aria-controls="collapseSix">
								<h4 class="panel-title">슈베린</h4>
							</div>
						</span>

						<div id="collapseSix" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingSix">
							<div class="panel-body">
								<!-- tab content goes here -->
								슈베린은 독일 북부에 있는 도시이다. 메클렌부르크포어포메른 주의 주도로, 인구는 약 10만 명이다. 과거
								메클렌부르크-슈베린 대공국의 수도였다.
							</div>
						</div>
					</div>
					<!--  panel 6 -->

					<!--  panel 7 -->
					<div class="panel panel-default">
						<!--wrap panel heading in span to trigger image change as well as collapse -->
						<span class="side-tab" data-target="#tab7" data-toggle="tab"
							role="tab" aria-expanded="false">
							<div class="panel-heading" role="tab" id="headingSeven"
								class="collapsed" data-toggle="collapse"
								data-parent="#accordion" href="#collapseSeven"
								aria-expanded="false" aria-controls="collapseSeven">
								<h4 class="panel-title">히메지 성</h4>
							</div>
						</span>

						<div id="collapseSeven" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingSeven">
							<div class="panel-body">
								<!-- tab content goes here -->
								히메지 성은 효고 현 히메지 시에 있는 제곽식 평산성이다. 성벽이 불에 타지 않기 위해 백색의 회벽으로 되어 있어
								하쿠로 성이라고도 부르는데, 이를 시라사기 성으로 잘못 읽는 경우도 많이 있다. 일본을 대표하는 근세 성곽이다. 성
								전체는 세계유산이며 국가 사적이다. 천수를 포함하여 여러 건물은 국보로 지정되어 있다.
							</div>
						</div>
					</div>
					<!--  panel 7 -->

					<!--  panel 8 -->
					<div class="panel panel-default">
						<!--wrap panel heading in span to trigger image change as well as collapse -->
						<span class="side-tab" data-target="#tab8" data-toggle="tab"
							role="tab" aria-expanded="false">
							<div class="panel-heading" role="tab" id="headingEight"
								class="collapsed" data-toggle="collapse"
								data-parent="#accordion" href="#collapseEight"
								aria-expanded="false" aria-controls="collapseEight">
								<h4 class="panel-title">에펠 탑</h4>
							</div>
						</span>

						<div id="collapseEight" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingEight">
							<div class="panel-body">
								<!-- tab content goes here -->
								에펠 탑은 1889년 파리 마르스 광장에 지어진 탑이다. 프랑스의 대표 건축물인 이 탑은 격자 구조로 이루어져
								파리에서 가장 높은 건축물이며, 매년 수백만 명이 방문할 만큼 세계적인 유료 관람지이다. 이를 디자인한 귀스타브
								에펠의 이름에서 명칭을 얻었으며, 1889년 프랑스 혁명 100주년 기념 세계 박람회의 출입 관문으로 건축되었다.
								에펠 탑은 그 높이가 324 m이며, 이는 81층 높이의 건물과 맞먹는 높이이다.
							</div>
						</div>
					</div>
					<!--  panel 8 -->

					<!--  panel 9 -->
					<div class="panel panel-default">
						<!--wrap panel heading in span to trigger image change as well as collapse -->
						<span class="side-tab" data-target="#tab9" data-toggle="tab"
							role="tab" aria-expanded="false">
							<div class="panel-heading" role="tab" id="headingNine"
								class="collapsed" data-toggle="collapse"
								data-parent="#accordion" href="#collapseNine"
								aria-expanded="false" aria-controls="collapseNine">
								<h4 class="panel-title">런던 아이</h4>
							</div>
						</span>

						<div id="collapseNine" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingNine">
							<div class="panel-body">
								<!-- tab content goes here -->
								런던 아이 란 영국 런던 템즈 강변에 위치한 대형 대관람차를 말한다. 높이가 135m 에 달하고, 유럽에서 가장
								높은 대관람차이다. 또한 영국의 관광지에서 가장 유명한 장소 중 하나로 꼽히며, 매년 350만 여명의 관광객이
								방문한다. 2011년 1월 20일부터 EDF 에너지 회사가 런던 아이를 3년동안 공식 스폰서로 후원하기 시작한
								것으로 알려져 있다. 2015년 1월 코카콜라가 런던아이의 스폰서가 되었다.
							</div>
						</div>
					</div>
					<!--  panel 9 -->

					<!--  panel 10 -->
					<div class="panel panel-default">
						<!--wrap panel heading in span to trigger image change as well as collapse -->
						<span class="side-tab" data-target="#tab10" data-toggle="tab"
							role="tab" aria-expanded="false">
							<div class="panel-heading" role="tab" id="headingTen"
								class="collapsed" data-toggle="collapse"
								data-parent="#accordion" href="#collapseTen"
								aria-expanded="false" aria-controls="collapseTen">
								<h4 class="panel-title">콜로세움</h4>
							</div>
						</span>

						<div id="collapseTen" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingTen">
							<div class="panel-body">
								<!-- tab content goes here -->
								콜로세움은 고대 로마 시대의 건축물 가운데 하나로 로마 제국 시대에 만들어진 원형 경기장이다. 현재는 로마를
								대표하는 유명한 관광지로 탈바꿈하였다. 콜로세움이라는 이름은 근처에 있었던 네로 황제의 동상에서 유래한다. 원래
								이름은 플라비오 원형 극장이었다.
							</div>
						</div>
					</div>
					<!--  panel 10 -->

				</div>
				<!-- / panel-group -->

			</div>
			<!-- /col-md-4 -->

			<div class="col-md-8">
				<!-- begin macbook pro mockup -->
				<div class="md-macbook-pro md-glare">
					<div class="md-lid">
						<div class="md-camera"></div>
						<div class="md-screen">
							<!-- content goes here -->
							<div class="tab-featured-image">
								<div class="tab-content">

									<div class="tab-pane  in active" id="tab1">
										<img src="../resources/img/info1.png" alt="tab1"
											class="img img-responsive">
									</div>

									<div class="tab-pane fade" id="tab2">
										<img src="../resources/img/info2.jpg" alt="tab1"
											class="img img-responsive">
									</div>

									<div class="tab-pane fade" id="tab3">
										<img src="../resources/img/info3.jpg" alt="tab1"
											class="img img-responsive">
									</div>

									<div class="tab-pane fade" id="tab4">
										<img src="../resources/img/info4.jpg" alt="tab1"
											class="img img-responsive">
									</div>

									<div class="tab-pane fade" id="tab5">
										<img src="../resources/img/info5.jpg" alt="tab1"
											class="img img-responsive">
									</div>

									<div class="tab-pane fade" id="tab6">
										<img src="../resources/img/info6.jpg" alt="tab1"
											class="img img-responsive">
									</div>

									<div class="tab-pane fade" id="tab7">
										<img src="../resources/img/info7.jpg" alt="tab1"
											class="img img-responsive">
									</div>

									<div class="tab-pane fade" id="tab8">
										<img src="../resources/img/info8.jpg" alt="tab1"
											class="img img-responsive">
									</div>

									<div class="tab-pane fade" id="tab9">
										<img src="../resources/img/info9.jpg" alt="tab1"
											class="img img-responsive">
									</div>

									<div class="tab-pane fade" id="tab10">
										<img src="../resources/img/info10.jpg" alt="tab1"
											class="img img-responsive">
									</div>

								</div>
							</div>
						</div>
					</div>
					<div class="md-base"></div>
				</div>
				<!-- end macbook pro mockup -->


				<!-- 페이지 -->
				<div class="page">
					<ul class="pagination">
						<li class="disabled"><a href="#">«</a></li>
						<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">»</a></li>
					</ul>
				</div>


			</div>
			<!-- / .col-md-8 -->
		</div>
		<!--/ .row -->
	</div>
	<!-- end sidetab container -->


<div style="z-index: 10000" class="modal fade" id="infoModal"
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
											<img class="img-thumbnail" id="mphoto" src="" width="130" height="130"></img>
										</div>

										<div class="col-md-9 col-lg-9 hidden-xs hidden-sm">
											<strong id="mname"></strong><br>
											<table class="table table-user-information">
												<tbody>
													<tr>
														<td>Nickname:</td>
														<td id="ainfo"></td>
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




</body>
</html>