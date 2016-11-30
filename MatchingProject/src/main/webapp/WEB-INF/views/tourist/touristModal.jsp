<%@ page contentType="text/html;charset=UTF-8"%>

<div id="touristModal" class="modal fade" tabindex="-1" role="dialog"
	style="z-index: 5000">
	<div class="modal-dialog" role="document" style="width: 400px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">TOURIST RESIST</h4>
			</div>
			<div class="modal-body">
				<input type="text" id="touristLocal"
					class="form-control input-sm chat-input"
					placeholder="Tourist Local" /> </br>
				<textarea id="touristIntro" class="form-control input-sm chat-input"
					placeholder="Tourlist Introduce"></textarea>
				</br> <input id="toDate" type="date"
					class="form-control input-sm chat-input" placeholder="to" /> ~ <input
					id="fromDate" type="date" class="form-control input-sm chat-input"
					placeholder="from" />
			</div>
			<div class="modal-footer">
				<button id="btnTouristResist" type="button" class="btn btn-primary">Resist</button>
			</div>
		</div>
	</div>
</div>
