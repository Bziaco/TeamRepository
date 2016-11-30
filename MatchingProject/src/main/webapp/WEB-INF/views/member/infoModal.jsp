<%@ page contentType= "text/html;charset=UTF-8" %>

<div id="infoModal" class="modal fade" tabindex="-1" role="dialog"
	style="z-index: 5000">
	<div class="modal-dialog" role="document" style="width: 600px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
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