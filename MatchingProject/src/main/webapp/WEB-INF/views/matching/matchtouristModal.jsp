<%@ page contentType="text/html;charset=UTF-8"%>

<div id="matchtouristModal" class="modal fade" tabindex="-1"
	role="dialog" style="z-index: 5000" data-tid="$(tourist.tid)">
	<div class="modal-dialog" role="document"
		style="width: 1175px; height: 750px;">
		<div class="modal-content">
			<div class="modal-header" style="width: 1173px; background-color: #F87575; border-radius: 5px; color: white;">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">관광객 리스트</h4>
			</div>
			<div class="modal-body">
				<table>
					<tr>
						<td id="matchtourlist"></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
