<%@ page contentType= "text/html;charset=UTF-8" %>

<div id="passwordmodifyModal" class="modal fade" tabindex="-1" role="dialog" style="z-index: 5000">
	<div class="modal-dialog" role="document"  style="width:400px;">
		<div class="modal-content">
			<div class="modal-header" style=" background-color: #F87575; border-radius: 5px;">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" style=" color: white;">비밀번호 확인</h4>
			</div>
			<div class="modal-body">
				<input type="password" id="mpassword" class="form-control input-sm chat-input" placeholder="Password" value="123" />
			</div>
			<div class="modal-footer">
				<button id="inputPassword" type="button" class="btn btn-primary">확인</button>
			</div>
		</div>
	</div>
</div>	