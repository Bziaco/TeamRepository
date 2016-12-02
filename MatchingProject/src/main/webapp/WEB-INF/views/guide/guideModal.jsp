<%@ page contentType="text/html;charset=UTF-8"%>

<div id="guideModal" class="modal fade" tabindex="-1" role="dialog"
	style="z-index: 5000">
	<div class="modal-dialog" role="document" style="width: 400px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">가이드 등록</h4>
			</div>
			<div class="modal-body">
				<input type="text" id="guideLocal"
					class="form-control input-sm chat-input" placeholder="지역" />
				</br>
				<textarea id="guideIntro" class="form-control input-sm chat-input"
					placeholder="소개"></textarea>
			</div>
			<div class="modal-footer">
				<button id="btnguideresist" type="button" class="btn btn-primary">확인</button>
			</div>
		</div>
	</div>
</div>