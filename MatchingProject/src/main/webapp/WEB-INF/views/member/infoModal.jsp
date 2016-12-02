<%@ page contentType= "text/html;charset=UTF-8" %>

<div id="infoModal" class="modal fade" tabindex="-1" role="dialog"
	style="z-index: 5000">
	<div class="modal-dialog" role="document" style="width: 600px;">
		<div class="modal-content">
			<div class="modal-header"   style="background-color: #F87575; border-radius: 5px;">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" style="color: white;">유저 정보</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-3 col-lg-3 hidden-xs hidden-sm">
						<img class="img-thumbnail" id="mphoto" src="" width="130"
							height="130"></img>
					</div>

					<div class="col-md-9 col-lg-9 hidden-xs hidden-sm">
						<table class="table table-user-information">
							<tbody>
								<tr>
									<td>이름:</td>
									<td id="mname"></td>
								</tr>
								<tr>
									<td>닉네임:</td>
									<td id="mnickname"></td>
								</tr>
								<tr>
									<td>이메일:</td>
									<td id="memail"></td>
								</tr>
								<tr>
									<td>나이:</td>
									<td id="mage"></td>
								</tr>
								<tr>
									<td>지역:</td>
									<td id="mlocal"></td>
								</tr>
								<tr>
									<td>전화번호:</td>
									<td id="mtel"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>	