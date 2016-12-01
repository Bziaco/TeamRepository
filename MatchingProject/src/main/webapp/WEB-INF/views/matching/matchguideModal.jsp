<%@ page contentType="text/html;charset=UTF-8"%>

<div id="matchguideModal" class="modal fade" tabindex="-1" role="dialog"
	style="z-index: 5000" data-gid="$(guide.gid)">
	<div class="modal-dialog" role="document"
		style="width: 1175px; height: 750px;">
		<div class="modal-content">
			<div class="modal-header" style="width: 1173px; background-color: #F7B4AB; border-radius: 5px;">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">matchguide</h4>
			</div>
			<div class="modal-body">
				<table>
					<tr>
						<td id="matchguidelist"></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>