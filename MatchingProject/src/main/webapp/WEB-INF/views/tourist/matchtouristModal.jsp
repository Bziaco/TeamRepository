<%@ page contentType="text/html;charset=UTF-8"%>

<div id="matchtouristModal" class="modal fade" tabindex="-1"
	role="dialog" style="z-index: 5000" data-tid="$(tourist.tid)">
	<div class="modal-dialog" role="document"
		style="width: 1175px; height: 650px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
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
