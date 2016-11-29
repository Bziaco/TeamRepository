<%@ page contentType="text/html;charset=UTF-8"%>

<div id="scheduleModal" class="modal fade" tabindex="-1" role="dialog" style="z-index: 5000">
	<div class="modal-dialog" role="document" style="width: 1200px;">
		<div class="modal-content" style="height:700px;">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">스케쥴</h4>
			</div>
			<div class="modal-body">
				<iframe style="width:1170px; height:530px; background-color: blue; border: 0px;" scrolling="no" src="schedule/boardList"></iframe>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
